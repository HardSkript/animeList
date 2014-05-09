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
      <div class="ani_ost">
        
          
          <!-- HELPER ID FOR EDITING ANIME! -->
          <input name="anime_id_helper" type="hidden" id="anime_id_helper"  value="<?php echo $anime_id_helper; ?>" >
      
          
          <a class="linkost" href="#">Click here</a>
          
          <div id="content_pane">
            
            
            
            
          </div>
        
          <div id="depurador"></div>
        
        
      
    </div> <!-- FIM DA PÁGINA DETALHES  -->
    
<?php include 'inc/footer.php'; ?>