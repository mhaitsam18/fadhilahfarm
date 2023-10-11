<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Orderan extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->library('m_db');
		if (akses() != "op") {
			$this->login_model->user_logout();
		}
		$this->load->model('transaksi_model', 'mod_transaksi');
	}


	function index()
	{
		$status = $this->input->get('status') ? $this->input->get('status') : "draft";
		$s = array(
			'status' => $status,
		);
		$meta['judul'] = "Data Order";
		$this->load->view('tema/header', $meta);
		$d['data'] = $this->m_db->get_data('penjualan', $s);
		$this->load->view(akses() . '/transaksi/orderan/orderview', $d);
		$this->load->view('tema/footer');
	}

	function detail()
	{
		$id = $this->input->get('id');
		$s = array(
			'penjualan_id' => $id,
		);
		$meta['judul'] = "Detail Order";
		$this->load->view('tema/header', $meta);
		$d['data'] = $this->m_db->get_data('penjualan', $s);
		$this->load->view(akses() . '/transaksi/orderan/detailview', $d);
		$this->load->view('tema/footer');
	}

	function approve()
	{
		$id = $this->input->get('id');

		$s = array(
			'penjualan_id' => $id,
			'status' => 'konfirmasi',
		);
		$this->form_validation->set_rules('penjualanid', 'ID Penjualan', 'required');
		$this->form_validation->set_rules('invoice', 'Invoice Penjualan', 'required');
		if ($this->form_validation->run() == TRUE) {
			$penjualanid = $this->input->post('penjualanid');
			$invoice = $this->input->post('invoice');
			$status = $this->input->post('status');
			if ($this->mod_transaksi->konfirmasi_pembayaran($penjualanid, $invoice, $status) == TRUE) {
				$konfirmasi = $this->db->get_where('penjualan_konfirmasi', [
					'penjualan_id' => $penjualanid,
					'status_bukti' => 'pending'
				])->row();
				if ($status == 'lunas') {
					$this->db->where('konfirmasi_id', $konfirmasi->konfirmasi_id);
					$this->db->update('penjualan_konfirmasi', ['status_bukti' => 'diterima']);
				} elseif ($status == 'draft') {
					$this->db->where('konfirmasi_id', $konfirmasi->konfirmasi_id);
					$this->db->update('penjualan_konfirmasi', ['status_bukti' => 'ditolak']);
				} else {
					// $this->db->where('konfirmasi_id', $konfirmasi->konfirmasi_id);
					// $this->db->update('penjualan_konfirmasi', ['status_bukti' => 'pending']);
				}
				set_header_message('success', "Konfirmasi Pembayaran", 'Berhasil menerima pembayaran order');
				redirect(base_url(akses() . '/transaksi/orderan'));
			} else {
				set_header_message('danger', "Konfirmasi Pembayaran", 'Gagal menerima pembayaran order');
				redirect(base_url(akses() . '/transaksi/orderan'));
			}
		} else {
			$meta['judul'] = "Konfirmasi Pembayaran";
			$this->load->view('tema/header', $meta);
			$d['data'] = $this->m_db->get_data('penjualan', $s);
			$this->load->view(akses() . '/transaksi/orderan/approveview', $d);
			$this->load->view('tema/footer');
		}
	}

	function delete()
	{
		$id = $this->input->get('id');
		$s = array(
			'penjualan_id' => $id,
			'status' => 'draft',
		);
		if ($this->m_db->delete_row('penjualan', $s) == TRUE) {
			set_header_message('success', "Hapus Order", 'Berhasil Hapus Order');
			redirect(base_url(akses() . '/transaksi/orderan'));
		} else {
			set_header_message('danger', "Hapus Order", 'Gagal Hapus Order');
			redirect(base_url(akses() . '/transaksi/orderan'));
		}
	}
}
