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



        require('inc/database.php');


      ?>


      <!-- BOX LISTANDO OS DETALHES DO ANIME -->
      <div class="ani_episodios">
        
          
          <!-- HELPER ID FOR EDITING ANIME! -->
          <input name="anime_id_helper" id="anime_id_helper"  value="<?php echo $anime_id_helper; ?>" >
      
          
          <a class="menuitem" href="#">Click here</a>
          
          <div id="content_pane">
            
            <h1>Episódios já cadastrados</h1>
              <?php 
              foreach($anime['id_do_episodio'] as $episodeID) { ?>
                <div id="<?php echo $episodeID; ?>"><?php echo $episodeID; ?></div>
              <?php }?>
              
              <?php 
              foreach($anime['name_episodio'] as $episodeNome) { ?>
                <div id="<?php echo $episodeNome; ?>"><?php echo $episodeNome; ?></div>
              <?php }?>
            
          </div>
        
          <div id="depurador"></div>
        
        
      
    </div> <!-- FIM DA PÁGINA DETALHES  -->
    
<?php include 'inc/footer.php'; ?>