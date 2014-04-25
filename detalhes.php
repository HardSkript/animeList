      <?php 

        
        include 'inc/database.php';
        include 'inc/animes.php';

        if(isset($_GET["id"])) {
          $anime_id = $_GET["id"];
          $product  = get_anime_single($anime_id);
        } else { echo "Error!"; }

        
        include 'inc/header.php';

        var_dump($product);

      ?>

      <div class="panel panel-default">
        <div class="panel-heading">Navegação</div>
        <div class="panel-body">
          <a href="index.php">Home</a> - <span></span>
        </div>
      </div>

      <!-- BOX LISTANDO OS DETALHES DO ANIME -->
      <div class="ani_detalhes tab-pane active">
        
        <div class="row">
          
          <!-- FOTO DO ANIME -->
          <div class="col-md-3">
            
            <div class="ani-imagem">
              <img src="" alt="">
            </div>
            
            <div class="ani-download">
              <h2>Download here</h2>
              
              
              
            </div>
            
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
                  <h1></h1>
                </div>
                
                <div class="ani-descricao">
                  <p></p>
                </div>

                <div class="ani-generos">

                  <h3>Gêneros</h3>

                </div>
                
                <div class="ani-episodios">
                  <h3>Lista de episódios</h3>
                  
                 

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
      
    </div> <!-- FIM DA PÁGINA DETALHES  -->
    
<?php include 'inc/footer.php'; ?>