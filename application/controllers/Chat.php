<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Chat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('m_db');
        if (akses() != "member") {
            redirect(base_url());
        }
    }

    public function operator()
    {
        $meta['judul'] = 'Chat | ' . baca_konfig('nama-aplikasi');
        $meta['judulhalaman'] = "Chat Dengan Operator";
        $meta['homepage'] = FALSE;
        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['chat'] = $this->db->query("SELECT * FROM chat 
        	JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
        	WHERE (pengirim_id = $user->user_id AND penerima_id = 1) 
        	OR (penerima_id = $user->user_id AND pengirim_id = 1)
        	ORDER BY created_at ASC
        ")->result();
        $this->load->view('html/header', $meta);
        $this->load->view('html/page/chat', $data);
        $this->load->view('html/footer');
    }


    public function getChat($operator_id = null)
    {

        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['operator'] = $this->db->get_where('userlogin', ['user_id' => 1])->row_array();

        $this->db->where('pengirim_id', 1);
        $this->db->where('penerima_id', $user->user_id);
        $this->db->update('chat', ['is_read' => 1]);

        $data['chat'] = $this->db->query("SELECT * FROM chat 

			JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
			
			WHERE (pengirim_id = $user->user_id AND penerima_id = 1) 
			OR (penerima_id = $user->user_id AND pengirim_id = 1)

			ORDER BY created_at ASC
		")->result();

        return $this->load->view('html/page/pesan', $data);
    }


    public function getChat2($operator_id = null)
    {

        $infologin = $this->session->userdata('infologin');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();
        $data['user'] = $user;
        $data['operator'] = $this->db->get_where('userlogin', ['user_id' => 1])->row_array();

        $this->db->where('pengirim_id', 1);
        $this->db->where('penerima_id', $user->user_id);
        $this->db->update('chat', ['is_read' => 1]);

        $data['chat'] = $this->db->query("
			SELECT * FROM chat 

			JOIN userlogin ON IF(chat.pengirim_id = $user->user_id, chat.penerima_id, chat.pengirim_id) = userlogin.user_id 
			
			WHERE (pengirim_id = $user->user_id AND penerima_id = 1) 
			OR (penerima_id = $user->user_id AND pengirim_id = 1)

			ORDER BY created_at ASC
		")->result();

        return $this->load->view('html/page/pesan-2', $data);
    }


    public function kirimChat()
    {

        $infologin = $this->session->userdata('infologin');
        $pesan = $this->input->post('pesan');
        $user = $this->db->get_where('userlogin', ['username' => $infologin['username']])->row();

        $data['user'] = $user;
        $data['operator'] = $this->db->get_where('userlogin', ['user_id' => 1])->row();

        $this->db->insert('chat', [
            'pengirim_id' => $user->user_id,
            'penerima_id' => 1,
            'pesan' => nl2br($pesan),
            'is_read' => 0
        ]);

        $this->getChat2();
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
