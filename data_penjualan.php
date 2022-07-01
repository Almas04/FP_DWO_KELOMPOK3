<?php
  $sql_penjualan = "SELECT count(*) as Jumlah, t.Month as Bulan FROM salesfact s JOIN time t on s.TimeID = t.TimeD WHERE t.Year = YEAR(CURDATE()) GROUP BY t.Month";
  $result_penjualan = $conn->query($sql_penjualan);
  $result_penjualan = $result_penjualan->fetch_all(MYSQLI_ASSOC);

  $data_penjualan['Jan'] = 0;
  $data_penjualan['Feb'] = 0;
  $data_penjualan['Mar'] = 0;
  $data_penjualan['Apr'] = 0;
  $data_penjualan['Mei'] = 0;
  $data_penjualan['Jun'] = 0;
  $data_penjualan['Jul'] = 0;
  $data_penjualan['Agu'] = 0;
  $data_penjualan['Sep'] = 0;
  $data_penjualan['Okt'] = 0;
  $data_penjualan['Nov'] = 0;
  $data_penjualan['Des'] = 0;

  foreach ($result_penjualan as $r) {
    switch ($r['Bulan']) {
      case 'Januari':
        $data_penjualan['Jan'] = $r['Jumlah'];
        break;

      case 'Februari':
        $data_penjualan['Feb'] = $r['Jumlah'];
        break;

      case 'Maret':
        $data_penjualan['Mar'] = $r['Jumlah'];
        break;

      case 'April':
        $data_penjualan['Apr'] = $r['Jumlah'];
        break;

      case 'Mei':
        $data_penjualan['Mei'] = $r['Jumlah'];
        break;

      case 'Juni':
        $data_penjualan['Jun'] = $r['Jumlah'];
        break;

      case 'Juli':
        $data_penjualan['Jul'] = $r['Jumlah'];
        break;

      case 'Agustus':
        $data_penjualan['Agu'] = $r['Jumlah'];
        break;

      case 'September':
        $data_penjualan['Sep'] = $r['Jumlah'];
        break;

      case 'Oktober':
        $data_penjualan['Okt'] = $r['Jumlah'];
        break;

      case 'November':
        $data_penjualan['Nov'] = $r['Jumlah'];
        break;

      case 'Desember':
        $data_penjualan['Des'] = $r['Jumlah'];
        break;
    }
  }

  $output = "[";
  foreach ($data_penjualan as $dp) {
    $output .= "'$dp',";
  }
  $output_penjualan = substr_replace($output ,"]",-1);
?>
