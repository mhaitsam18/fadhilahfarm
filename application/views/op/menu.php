<?php
$menu = array(
	'Produk' => array(
		'icon' => 'fa fa-cube',
		'slug' => 'produk',
		'child' => array(
			'Kategori' => array(
				'icon' => 'fa fa-circle-o',
				'url' => base_url(akses()) . "/produk/kategori",
				'target' => "",
			),
			'Produk' => array(
				'icon' => 'fa fa-circle-o',
				'url' => base_url(akses()) . "/produk/produk",
				'target' => "",
			),
		),
	),
	'Transaksi' => array(
		'icon' => 'fa fa-shopping-cart',
		'slug' => 'transaksi',
		'child' => array(
			'Order' => array(
				'icon' => 'fa fa-circle-o',
				'url' => base_url(akses()) . "/transaksi/orderan",
				'target' => "",
			),
			'Chat' => array(
				'icon' => 'fa fa-comments',
				'url' => base_url(akses()) . "/Chat/member",
				'target' => "",
			),
		),
	),

	'Konten Web' => array(
		'icon' => 'fa fa-globe',
		'slug' => 'cms',
		'child' => array(
			'Semua Halaman' => array(
				'icon' => 'fa fa-circle-o',
				'url' => base_url(akses()) . "/cms/halaman",
				'target' => "",
			),
			'Tambah Halaman' => array(
				'icon' => 'fa fa-circle-o',
				'url' => base_url(akses()) . "/cms/halaman/add",
				'target' => "",
			),
		),
	),
);
