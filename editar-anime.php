      <?php 

        
        include 'inc/animes.php';

        if(isset($_GET["id"])) {
          $anime_id = $_GET["id"];
          $anime  = get_anime_single($anime_id);
        } else { echo "Error!"; }

        
        include 'inc/header.php';

        var_dump($anime);

        $anime_id = $_GET["id"];
        $anime  = get_anime_single($anime_id);
        $anime_id_helper = $anime['anime_id'];


        // PEGANDO OS DADOS DO FORM E PASSANDO PARA VARIÁVEIS
        if($_SERVER["REQUEST_METHOD"] == "POST") {

          //$animeNome = $_POST["animeNome"];
          //$animeJpName = $_POST["animeJpName"];
          $animeDescricao = $_POST["animeDescricao"];
          $animeImage = $_POST["animeImage"];
          $anime_id_helper = $_POST["anime_id_helper"];
          $name_episodio = $_POST["name_episodio"];

          // INSERTING ANIME
          require('inc/database.php');
          try { 

            // ATUALIZANDO ALGUMAS INFORMAÇÕES SOBRE O ANIME
            $insert = $db->prepare('
              UPDATE animes set 
              anime_descricao = :animeDescricao,
              anime_image = :animeImage 
              where anime_id=:anime_id_helper'
            );
            $insert->execute(array(
              //':animeNome' => $animeNome,
              //':animeJpName' => $animeJpName, 
              ':animeDescricao' => $animeDescricao,
              ':animeImage' => $animeImage,
              ':anime_id_helper' => $anime_id_helper
            ));

            header("Location: index.php");

          } catch(PDOException $e) {
            echo 'Error: ' . $e->getMessage();
          }

        }

      ?>

      <div class="panel panel-default">
        <div class="panel-heading">Navegação  </div> 
        <div class="panel-body">
          <a href="index.php">Home</a> - <?php echo $anime['anime_name']; ?>
        </div>
      </div>

      <!-- BOX LISTANDO OS DETALHES DO ANIME -->
      <div class="ani_detalhes tab-pane active">
        
        <form role="form" method="post" action="editar-anime.php">
        <div class="row" >
          
          <!-- HELPER ID FOR EDITING ANIME! -->
          <input type="hidden" name="anime_id_helper" id="anime_id_helper"  id="disabledInput" value="<?php echo $anime_id_helper; ?>" >
          
          
          <!-- FOTO DO ANIME -->
          <div class="col-md-3">
            
            <div class="ani-imagem">
              <img src="<?php echo $anime['anime_image']; ?>" alt="<?php echo $anime['anime_image']; ?>">
            </div>
            
            <label for="animeImage">Imagem</label>
            <input type="text" name="animeImage" id="animeImage" class="form-control" value="<?php echo htmlspecialchars($anime['anime_image']); ?>">
            
            <div class="ani-download">
              <h2>Download here</h2>
            </div>
            
            <input type="submit" value="Terminar edição">
            
          </div>
          
          
          <!-- BOX COM AS INFORMAÇÕES SOBRE O ANIME -->
          <div class="col-md-9">
     
            <!-- TAB NAVIGATION -->       
            <ul class="nav nav-tabs" id="anime-inerno">
              <li class="active"><a href="#home" data-toggle="tab">Sumário</a></li>
              <li><a href="#videos" data-toggle="tab">Vídeos</a></li>
              <li><a href="#ost" data-toggle="tab">OST</a></li>
            </ul>
      
            
            <div class="tab-content">
              
              <!-- PRIMEIRA ABA 'SUMÁRIO' -->
              <div class="tab-pane active" id="home">
                <div class="ani-titulo">
                  <h1><?php echo $anime['anime_name'] .' '. $anime['anime_jpname']; ?></h1>
                </div>
                
                <div class="ani-descricao">
                  <textarea name="animeDescricao" id="animeDescricao" class="form-control" rows="5"><?php echo htmlspecialchars( $anime['anime_descricao']); ?></textarea>
                </div>

                <div class="ani-generos">

                  <h3>Gêneros</h3>

                  <ul>
                    <?php foreach($anime['id_name'] as $animegenre){ ?>
                      <li><?php echo $animegenre; ?></li>  
                    <?php } ?>
                    
                  </ul>

                </div>
                
                <div class="ani-episodios">
                  <h3>Lista de episódios</h3>
                  
                  <label for="name_episodio">1º Episódio</label>
                  <input type="text" name="name_episodio" class="form-control">
                  
                </div>
              </div>
              
              <!-- SEGUNDO BOX 'VIDEOS' -->
              <div class="tab-pane" id="videos">
                <div class="ani-titulo">
                  <h1>Vídeos</h1>
                </div>
              </div>
              
              <!-- TECEIRO BLOCO 'OSTs' -->
              <div class="tab-pane" id="ost">
                <div class="ani-titulo">
                  <h1>OST</h1>
                </div>
              </div>
            </div>
          </div>
          
        </div> <!-- END PRIMEIRA VIEW `BRIEF DETAILS` -->
        
        
        
      </div>
      </form>
      
    </div> <!-- FIM DA PÁGINA DETALHES  -->
    
<?php include 'inc/footer.php'; ?>