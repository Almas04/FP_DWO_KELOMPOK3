<?php
  $sql_shipment_all = "SELECT ShipName FROM ShipmentMethod";
  $result_shipment_method = $conn->query($sql_shipment_all);
  $result_shipment_method = $result_shipment_method->fetch_all(MYSQLI_ASSOC);
  $sql_shipment = "SELECT sp.ShipName as Shipping, t.Month as Bulan, count(*) as Jumlah FROM shipmentfact s JOIN time t on s.TimelD = t.TimeD JOIN shipmentmethod sp on s.ShiplD = sp.ShiplD WHERE t.Year = YEAR(CURDATE()) GROUP BY t.Month, sp.ShiplD;";
  $result_shipment = $conn->query($sql_shipment);
  $result_shipment = $result_shipment->fetch_all(MYSQLI_ASSOC);
  $count = 0;
  foreach ($result_shipment_method as $rsm) {
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
    $output_shipment_name = substr_replace($output ,"]",-1);
    $data_shipment_name_bulan[$count]['name'] = $rsm['ShipName'];
    $data_shipment_name_bulan[$count]['data'] = $output_shipment_name;
    $count++;
  }

?>
