<?php
defined('BASEPATH') or exit('No direct script access allowed');

$tema = baca_konfig('tema-aktif');
require_once(FCPATH . 'assets/tema/' . $tema . '/footer.php');
