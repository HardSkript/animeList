<?php 

	include 'inc/animes.php';
	include 'inc/header.php';


		// QUERYING GENRES
	  require('inc/database.php');
	  try{
	      $genrebusca = $db->query("SELECT * FROM genres");
	  } catch (Exception $e){
	      echo "Could not query this query";
	      exit;
	  }
	  
	  while($row = $genrebusca->fetch(PDO::FETCH_ASSOC)){
      $genres['id_name'][] = $row["id_name"];
  	}
			

	// PEGANDO OS DADOS DO FORM E PASSANDO PARA VARIÁVEIS
	if($_SERVER["REQUEST_METHOD"] == "POST") {
		$animeNome = $_POST["animeNome"];
		$animeJpName = $_POST["animeJpName"];
		$animeDescricao = $_POST["animeDescricao"];
		$animeImage = $_POST["animeImage"];

		// INSERTING ANIME
	  require('inc/database.php');
	  try { 

	  	// INSERINDO O ANIME NA BASE DE DADOS
	    $insert = $db->prepare('INSERT INTO animes VALUES(NULL, :animeNome, :animeJpName, :animeDescricao, :animeImage)');
	    $insert->execute(array(
	      ':animeNome' => $animeNome,
	      ':animeJpName' => $animeJpName, 
	      ':animeDescricao' => $animeDescricao,
	      ':animeImage' => $animeImage
	    ));

	    # Affected Rows?
	    echo $insert->rowCount(); // 1
	  } catch(PDOException $e) {
	    echo 'Error: ' . $e->getMessage();
	  }

	}


?>


<div class="ani_insert">

	<div class="row">


		<form role="form" method="post" action="insert-anime.php">

			<!-- INSERTING ANIME NAME -->
			<div class="form-group">
		    <label for="animeNome">Anime name</label>
		    <input type="text" class="form-control" id="animeNome" name="animeNome" placeholder="Insira o nome do anime">
		  </div>


		  <!-- INSERTING ANIME JPNAME -->
		  <div class="form-group">
		  	<label for="animeJpName">Japanese Name</label>
		  	<input type="text" class="form-control" id="animeJpName" name="animeJpName" placeholder="Nome japones do anime">
		  </div>

		  <!-- INSERTING ANIME DESCRIPTION -->
		  <div class="form-group">
		  	<label for="animeDescricao">Anime Description</label>
		  	<textarea class="form-control" rows="3" id="animeDescricao" name="animeDescricao"></textarea>
		  </div>
		  
		  <!-- INSERTING ANIME EPISODES -->
		  <div class="form-group">
		  	<label for="animeImage">Imagem do anime</label>
		  	<input type="text" class="form-control" id="animeImage" name="animeImage" placeholder="Caminho da imagem">
		  </div>

		  <!-- INSERTING ANIME GENRES -->
		  <div class="form-group">
		  	<label for="name_episodio">Nome do episódio</label>
		  	<input type="text" class="form-control" id="name_episodio" name="name_episodio" placeholder="Nome japones do anime">
		  </div>

		 <?php 

		 	foreach($genres['id_name'] as $generoNome){ ?>

		 		<li><?php echo $generoNome; ?></li>

		 	<?php } ?>

		  <input type="submit" class="btn btn-primary btn-lg" value="cadastrar">


		</form>



	</div>



</div>
