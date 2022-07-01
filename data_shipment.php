<?php
  $sql_shipment = "SELECT count(*) as Jumlah, t.Month as Bulan FROM shipmentfact s JOIN time t on s.TimelD = t.TimeD WHERE t.Year = YEAR(CURDATE()) GROUP BY t.Month";
  $result_shipment = $conn->query($sql_shipment);
  $result_shipment = $result_shipment->fetch_all(MYSQLI_ASSOC);

  $data_shipment['Jan'] = 0;
  $data_shipment['Feb'] = 0;
  $data_shipment['Mar'] = 0;
  $data_shipment['Apr'] = 0;
  $data_shipment['Mei'] = 0;
  $data_shipment['Jun'] = 0;
  $data_shipment['Jul'] = 0;
  $data_shipment['Agu'] = 0;
  $data_shipment['Sep'] = 0;
  $data_shipment['Okt'] = 0;
  $data_shipment['Nov'] = 0;
  $data_shipment['Des'] = 0;

  foreach ($result_shipment as $r) {
    switch ($r['Bulan']) {
      case 'Januari':
        $data_shipment['Jan'] = $r['Jumlah'];
        break;

      case 'Februari':
        $data_shipment['Feb'] = $r['Jumlah'];
        break;

      case 'Maret':
        $data_shipment['Mar'] = $r['Jumlah'];
        break;

      case 'April':
        $data_shipment['Apr'] = $r['Jumlah'];
        break;

      case 'Mei':
        $data_shipment['Mei'] = $r['Jumlah'];
        break;

      case 'Juni':
        $data_shipment['Jun'] = $r['Jumlah'];
        break;

      case 'Juli':
        $data_shipment['Jul'] = $r['Jumlah'];
        break;

      case 'Agustus':
        $data_shipment['Agu'] = $r['Jumlah'];
        break;

      case 'September':
        $data_shipment['Sep'] = $r['Jumlah'];
        break;

      case 'Oktober':
        $data_shipment['Okt'] = $r['Jumlah'];
        break;

      case 'November':
        $data_shipment['Nov'] = $r['Jumlah'];
        break;

      case 'Desember':
        $data_shipment['Des'] = $r['Jumlah'];
        break;
    }
  }

  $output = "[";
  foreach ($data_shipment as $dp) {
    $output .= "'$dp',";
  }
  $output_shipment = substr_replace($output ,"]",-1);
?>
