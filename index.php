<?php 

  include 'inc/animes.php';
  include 'inc/header.php'; 

  $products = get_animes_all();


?>      

      <!-- AQUI VEM UMA TABELA COM TODOS OS ITENS -->
      <div class="ani_items">
        
        <table class="table table-striped">
          <thead>
            <th>Imagem</th>
            <th>Nome do anime</th>
            <th>Descrição do anime</th>
            <th>Detalhes</th>
          </thead>
          
          <tbody>
              <?php 
                  foreach($products as $product) { 
                  echo get_list_view_html($product);
                } 
              ?>
            
            
          </tbody>
          
        </table>
        
      </div> <!-- FIM DA LISTAGE PRINCIPAL NA HOME -->
      
<?php include 'inc/footer.php'; ?>