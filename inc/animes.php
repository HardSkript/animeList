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
  $animes = $results->fetchAll(PDO::FETCH_ASSOC);
  return $animes;
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

    $anime = $results->fetch(PDO::FETCH_ASSOC);

    if($anime === false) return $anime;


    //CRIANDO A CHAVE GENRES NO OBJETO DA QUERIE
    $anime['genres'] = array();

    try {
    	$results = $db->prepare("
    			select id_name
          from animes_genres
          inner join genres on animes_genres.genre_id = id_genre
          where anime_id = ?
    		");
    	$results->bindParam(1, $id);
    	$results->execute();
    } catch (Exception $e) {
    	echo "Data not retrieved";
    	exit;
    }

    while($row = $results->fetch(PDO::FETCH_ASSOC)){
        $anime['id_name'][] = $row["id_name"];
    }


    //CRIANDO A CHAVE EPISODIOS DENTRO DA QUERIE FEITA PELO PDO
    $anime['anime_episodios'] = array();

    try {
      $results = $db->prepare("
        select id_do_anime, id_do_episodio, name_episodio 
        from episodios
        inner join anime_episodios on episodios.id_episodio = id_do_episodio
        where id_anime = ?
      ");
      $results->bindParam(1, $id);
      $results->execute();
    } catch (Exception $e) {
      echo "Data episodes not retrieved!";
      exit;
    }

    while($row = $results->fetch(PDO::FETCH_ASSOC)){
        $anime['name_episodio'][] = $row["name_episodio"];
        $anime['id_do_episodio'][] = $row["id_do_episodio"];

    }

    //CRIANDO A CHAVE OST NO OBJETO DA QUERIE
    $anime['nome_ost'] = array();

    try{
      $results = $db->prepare("
        select id_ost, nome_ost, image_ost
        from ost
        inner join animes on animes.anime_id= id_anime
        where anime_id = ?;
      ");
      $results->bindParam(1, $id);
      $results->execute();

    } catch(Exception $e) {
      echo "Data no retrieved";
    }
    while($row = $results->fetch(PDO::FETCH_ASSOC)){
        $anime['nome_ost'][] = $row["nome_ost"];
        $anime['image_ost'][] = $row["image_ost"];

    }
    
    return $anime;

}


  //TODO ROTINA PARA ADICIONAR EPISÓDIOS
  /*$insert = $db->prepare('INSERT INTO episodios VALUES(NULL, :name_episodio, :anime_id_helper)');
    $insert->execute(array(
    ':name_episodio' => $name_episodio, 
    ':anime_id_helper' => $anime_id_helper
  )); */


	function get_list_view_html($anime) {
	    $output = "";
	    $output = $output . '<tr>';
	    $output = $output . '<td><img src="'.$anime['anime_image'].'"/></td>';
	    $output = $output . '<td class="col-xs-2"><p>'.$anime['anime_name'].'</p></td>';
	    $output = $output . '<td><p>'.$anime['anime_descricao'].'<p></td>';
	    $output = $output . '<td><a href="detalhes.php?id='.$anime['anime_id'].'">Detalhes</a> <br/>';
      $output = $output . '<a href="episodios.php?id='.$anime['anime_id'].'">Episódios</a><br/>';
      $output = $output . '<a href="osts.php?id='.$anime['anime_id'].'">OSTs</a></td>';
	    return $output;
	}


?>