<?php

  $sql_product = "SELECT p.ProductName as Name, count(*) as jumlah FROM SalesFact s JOIN Product p on s.ProductID = p.ProductID";
  $result_product = $conn->query($sql_product);
  $result_product = $result_product->fetch_all(MYSQLI_ASSOC);
  $output = "[";
  foreach ($result_product as $rp) {
    $output .= "'".$rp['Name']."',";
  }
  $data_nama_product = substr_replace($output ,"]",-1);

  $output = "[";
  foreach ($result_product as $rp) {
    $output .= $rp['jumlah'].",";
  }
  $data_jumlah_product = substr_replace($output ,"]",-1);

  $output = "[";
  foreach ($result_product as $rp) {
    $output .= "'#".dechex(mt_rand(0, 16777215))."',";
  }
  $data_warna_product = substr_replace($output ,"]",-1);
?>
