<?php
echo asset_datatables();
?>
<div>
	<a href="<?= base_url(akses() . '/produk/produk/add'); ?>" class="btn btn-primary btn-flat"><i class="fa fa-plus"></i> Tambah Produk</a>
</div>
<p>&nbsp;</p>
<table class="table table-bordered">
	<thead>
		<th scope="col">No.</th>
		<th scope="col">Nama Produk</th>
		<th scope="col">Harga</th>
		<th scope="col">Berat</th>
		<th scope="col">Deskripsi</th>
		<th scope="col">Aksi</th>
	</thead>
	<tbody>
		<?php
		if (!empty($data)) {
			$no = 1;
			foreach ($data as $row) {
				$id = $row->produk_id;
				$nama = $row->kode_produk . "-" . $row->nama_produk;
				$kategori = field_value('produk_kategori', 'kategori_id', $row->kategori_id, 'nama_kategori');

		?>
				<tr>
					<th scope="row"><?= $no++; ?></th>
					<!-- <td><?= $nama; ?></td> -->
					<td><?= $nama; ?></td>
					<td>Rp <?= number_format($row->harga, 0); ?></td>
					<td><?= $row->berat; ?> Kg</td>
					<td><?= $row->deskripsi; ?></td>
					<td>
						<a href="<?= base_url(akses() . '/produk/produk/edit') . '?id=' . $id; ?>" class="btn btn-md btn-info"><i class="fa fa-pencil"></i></a>
						<a onclick="return confirm('Yakin ingin menghapus produk ini?');" href="<?= base_url(akses() . '/produk/produk/delete') . '?id=' . $id; ?>" class="btn btn-md btn-danger"><i class="fa fa-trash"></i></a>
					</td>
				</tr>
		<?php
			}
		}
		?>
	</tbody>
</table>