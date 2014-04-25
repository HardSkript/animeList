<?php 

// GET ALL ANIMES
function get_animes_all() {
  require('inc/database.php');
  try{
      $results = $db->query("SELECT * FROM animes");
  } catch (Exception $e){
      echo "Could not query this query";
      exit;
  }
  $products = $results->fetchAll(PDO::FETCH_ASSOC);
  return $products;
}
	

/* 
* RETURNS A AN ARRAY OF PRODUCTS THAT MATCHES THE SKU
* RETURNS A BOOLEAN FALSE IF NO PRODUCT MATCHES THE SKU
* @param int $sku the sku
* @return mixed array list of production information for the x product */
function get_anime_single($id){
    require('inc/database.php');

    try {
        // criar
        $results = $db->prepare("SELECT  * FROM animes WHERE anime_id = ?");
        $results->bindParam(1,$id); // bind parameter avoiding injection
        $results->execute(); // executes the query
    } catch (Exception $e) {
        echo "Could not query this action";
    }

    $product = $results->fetch(PDO::FETCH_ASSOC);

    if($product === false) return $product;




    $product['genres'] = array();

    try {
    	$results = $db->prepare("
    			select id_name
					from animes_genres
					inner join genres on animes_genres.genre_id = genre_id
					where anime_id = ?
    		");
    	$results->bindParam(1, $id);
    	$results->execute();
    } catch (Exception $e) {
    	echo "Data not retrieved";
    	exit;
    }

     while($row = $results->fetch(PDO::FETCH_ASSOC)){
        $product['id_name'][] = $row["id_name"];
    }


    return $product;
}


	function get_list_view_html($product) {
	    $output = "";
	    $output = $output . '<tr>';
	    $output = $output . '<td><img src="'.$product['anime_image'].'"/></td>';
	    $output = $output . '<td><p>'.$product['anime_name'].'</p></td>';
	    $output = $output . '<td><p>'.$product['anime_descricao'].'<p></td>';
	    $output = $output . '<td><a href="detalhes.php?id='.$product['anime_id'].'">Detalhes</a></td>';
	    return $output;
	}


?>