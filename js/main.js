// invoking tabs for anime details
$('#anime-interno a').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
})


var 
  section = 1, // variável contadora
  // prefix do episódio que será unica
  // pois será criada com base no nome do anime 
  prefixEpisode = document.getElementById('anime_id_helper').value;
                          

$(function() {
$("a.menuitem").click(function() {
  $('<div>').appendTo('#content_pane');
  var helperId = $('<input type="text" class="col-md-1 ">').appendTo('#content_pane').attr("id", prefixEpisode);
  var helperNome = $('<input type="text" class="col-md-8" name="nomeEpisodio" placeholder="Inserir no do episodio '+ section +'">').appendTo("#content_pane");
  $('<button class="episubmit">Inserir</button></div>').appendTo("#content_pane");

  $('.episubmit').click(function(){

      // pegando valor do campo gerado automaticamente
      var name_episodio = $(helperNome).val();
      var id_episodio = $(helperId).attr("id") + $(helperId).val();
      var id_anime = prefixEpisode;
      

      // para relacionar ao anime em questão
      var id_do_anime = id_anime;
      var id_do_episodio = id_episodio;


      // depurando
      console.log(id_episodio + 'id do episódio');
      console.log('nome do episódio ' + name_episodio);
      console.log(id_do_episodio);
      console.log(id_anime);
      console.log(id_do_anime);


      //syntax - $.post('filename', {data}, function(response){});
      $.post('inc/insertepisode.php',{
          action: "insert", 
          id_episodio:id_episodio, 
          name_episodio:name_episodio, 
          id_anime:id_anime,
          id_do_anime:id_do_anime,
          id_do_episodio:id_do_episodio
      },function(res){
          $('#result').html(res);
  }); 
  return false;
});
});
});




var 
  sectionOst = 1, // variável contadora
  // prefix do episódio que será unica
  // pois será criada com base no nome do anime 
  id_do_anime = document.getElementById('anime_id_helper').value;
                          

$(function() {
$("a.linkost").click(function() {
  $('<div>').appendTo('#content_pane');

  // APPEND ID DA OST
  var id_ost = $('<input type="text" class="col-md-1 ">').appendTo('#content_pane').attr("id", id_do_anime);
  
  // APPEND NOME DA OST
  var nome_ost = $('<input type="text" class="col-md-8" name="nome_ost" placeholder="Inserir nome da OST '+ section +'">').appendTo("#content_pane");
  
  // APPEND IMAGEM DA OST
  var imagem_ost = $('<input type="text" class="col-md-8" name="imagem_ost" placeholder="Inserir imagem da OST '+ section +'">').appendTo("#content_pane");
  
  // APPEND BOTÃO PARA ENVIAR DADOS SOBRE ESSA OST
  $('<button class="episubmit">Inserir</button></div>').appendTo("#content_pane");


  // INICIANDO A FUNÇÃO QUE IRÁ SALVAR OS DADOS NA TABELA OST
  $('.episubmit').click(function(){

      // pegando valor do campo gerado automaticamente
      var env_id_ost = $(id_ost).attr("id") + $(id_ost).val();
      var env_nome_ost = $(nome_ost).val();
      var env_imagem_ost = imagem_ost.val();
      var env_id_anime = id_do_anime;


      // depurando
      console.log(env_id_ost + 'id da OST');
      console.log('nome da OST ' + env_nome_ost);
      console.log('iamgem da ost ' + env_imagem_ost);
      console.log('id do anime ' + env_id_anime);



      //syntax - $.post('filename', {data}, function(response){});
      $.post('inc/insertepisode.php',{
          action: "insertost", 
          id_ost:env_id_ost, 
          nome_ost:env_nome_ost, 
          imagem_ost:env_imagem_ost,
          id_anime:env_id_anime
        },function(res){
          $('#result').html(res);
        }); 
        return false;
      });
    });
});