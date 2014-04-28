<?php 


// ROTINA PARA SALVAR EPISÓDIOS NA BASE DE DADOS
if($_POST['action'] == 'insert'){

		// RECEBENDO AS VARIÁVEIS ENVIADAS PELO AJAX E TRANSFORMANDO-AS EM VARIÁVEIS POST PARA INSERÇÃO
		$id_episodio = $_POST["id_episodio"];
		$name_episodio = $_POST["name_episodio"];
		$id_anime = $_POST["id_anime"];
		$id_do_anime = $_POST["id_do_anime"];
		$id_do_episodio = $_POST["id_do_episodio"];


		// INICIANDO A CONEXÃO COM O BANCO DE DADOS
	  require('database.php');
	  try { 

	  	// INSERINDO O ANIME NA BASE DE DADOS
	    $insert = $db->prepare('INSERT INTO episodios VALUES(:id_episodio, :name_episodio, :id_anime)');
	    $insert->execute(array(
	      ':id_episodio' => $id_episodio,
	      ':name_episodio' => $name_episodio, 
	      ':id_anime' => $id_anime,
	    ));


	    // INSERINDO A RELAÇÃO 
	    $insert = $db->prepare('INSERT INTO anime_episodios VALUES(:id_do_anime, :id_do_episodio)');
	    $insert->execute(array(
	      ':id_do_anime' => $id_do_anime,
	      ':id_do_episodio' => $id_do_episodio, 
	    ));

	    // EXIBINDO O NÚMERO DE LINHAS QUE FORAM ALTERADAS
	    echo $insert->rowCount(); // 1
	  } catch(PDOException $e) {
	    echo 'Error: ' . $e->getMessage();
	  }
	}


	// ROTINA PARA SALVAR AS OST'S NA BASE DE DADOS
	if($_POST['action'] == 'insertost') {

		// RECEBENDO AS VARIÁVEIS ENVIADAS PELO AJAX E TRANSFORMANDO-AS EM VARIÁVEIS POST PARA INSERÇÃO

		$id_ost = $_POST['id_ost'];
		$nome_ost = $_POST['nome_ost'];
		$imagem_ost = $_POST['imagem_ost'];
		$id_anime = $_POST['id_anime'];


		require('database.php');
		try{
			$insert = $db->prepare('INSERT INTO ost VALUES(:id_ost, :nome_ost, :image_ost, :id_anime)');
			$insert->execute(array(
				':id_ost' => $id_ost,
	      ':nome_ost' => $nome_ost, 
	      ':image_ost' => $imagem_ost,
	      ':id_anime' => $id_anime
			));
		} catch(PDOException $e) {
			echo 'Error:' . $e->getMessage();
		}


	}


?>

