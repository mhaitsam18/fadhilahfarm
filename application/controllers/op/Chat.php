<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Chat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('m_db');
        if (akses() != "op") {
            $this->login_model->user_logout();
        }
    }

    public function member($member_id = null)
    {
        $meta['judul'] = "Chat Member";
        $meta['judulhalaman'] = "Chat Dengan Member";
        $meta['homepage'] = FALSE;
        $search = $this->input->get('search');
        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['list_chat'] = $this->db->query("SELECT *, MAX(created_at) as max_time 
            FROM chat 
            
            JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
			
			WHERE (pengirim_id = $user->user_id OR penerima_id = $user->user_id) AND userlogin.user_id != $user->user_id 
			-- AND chat.created_at = (SELECT MAX(c2.created_at) FROM chat c2 WHERE c2.pengirim_id = chat.pengirim_id OR c2.penerima_id = chat.penerima_id)

			AND nama LIKE '%$search%'

			GROUP BY IF(penerima_id = $user->user_id, pengirim_id, penerima_id) ORDER BY chat.chat_id DESC
		")->result();
        // $data['chat'] = $this->db->query("SELECT * FROM chat 
        // 	JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
        // 	WHERE (pengirim_id = $user->user_id AND penerima_id = 1) 
        // 	OR (penerima_id = $user->user_id AND pengirim_id = 1)
        // 	ORDER BY created_at ASC
        // ")->result();
        $this->load->view('tema/header', $meta);
        $this->load->view(akses() . '/chat', $data);
        $this->load->view('tema/footer');
    }


    public function getChat()
    {
        $member_id = $this->input->post('member_id');
        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['member'] = $this->db->get_where('userlogin', ['user_id' => $member_id])->row();

        $this->db->where('pengirim_id', $member_id);
        $this->db->where('penerima_id', $user->user_id);
        $this->db->update('chat', ['is_read' => $member_id]);

        $data['chat'] = $this->db->query("SELECT * FROM chat 

			JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
			
			WHERE (pengirim_id = $user->user_id AND penerima_id = $member_id) 
			OR (penerima_id = $user->user_id AND pengirim_id = $member_id)

			ORDER BY created_at ASC
		")->result();

        return $this->load->view(akses() . '/pesan', $data);
    }


    public function getChat2($member_id = null)
    {

        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['member'] = $this->db->get_where('userlogin', ['user_id' => $member_id])->row();

        $this->db->where('pengirim_id', $member_id);
        $this->db->where('penerima_id', $user->user_id);
        $this->db->update('chat', ['is_read' => $member_id]);

        $data['chat'] = $this->db->query("
			SELECT * FROM chat 

			JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
			
			WHERE (pengirim_id = $user->user_id AND penerima_id = $member_id) 
			OR (penerima_id = $user->user_id AND pengirim_id = $member_id)

			ORDER BY created_at ASC
		")->result();

        return $this->load->view(akses() . '/pesan-2', $data);
    }


    public function kirimChat($member_id = null)
    {

        $infologin = $this->session->userdata('infologin');
        $pesan = $this->input->post('pesan');
        $member_id = $this->input->post('member_id');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();

        $data['user'] = $user;
        $data['member'] = $this->db->get_where('userlogin', ['user_id' => $member_id])->row();

        $this->db->insert('chat', [
            'pengirim_id' => $user->user_id,
            'penerima_id' => $member_id,
            'pesan' => nl2br($pesan),
            'is_read' => 0
        ]);

        $this->getChat2($member_id);
    }

    public function kirimPesan()
    {

        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $pesan = $this->input->post('pesan');
        $penerima_id = $this->input->post('penerima_id');
        $this->db->insert('chat', [
            'pengirim_id' => $user->user_id,
            'penerima_id' => $penerima_id,
            'pesan' => nl2br($pesan),
            'is_read' => 0
        ]);

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Pesan telah terkirim!</div>');
        redirect($_SERVER['HTTP_REFERER']);
    }
}
