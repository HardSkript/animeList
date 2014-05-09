/* INSERTS NA TABELA ANIMES */
insert into animes(
  anime_name, anime_jpname, anime_descricao, anime_image
) values (
  "Mobile Suit Gundam", "機動戦士ガンダム", "In the year Universal Century 0079, humanity lives in space colonies called Sides. Side 3, the Principality of Zeon, has declared war on the Earth Federation. After the intial fighting, an 8-month stalemate occured. However that stalemate breaks when Amuro Ray stumbles into the Gundam, the Earth Federation's secret weapon. Now Amuro and the crew of White Base must stand up to Zeon in order to end the war.", "http://cdn.myanimelist.net/images/anime/5/12462.jpg"
);

insert into animes(
  anime_name, anime_jpname, anime_descricao, anime_image
) values (
  "Mobile Suit Zeta Gundam", "機動戦士Zガンダム", "The year is Universal Century 0087. Seven years have passed since the end of the One Year War. In its zeal to stamp out any remaining opposition, the Earth Federation has organized the Titans, an elite fighting force. However, the Titans soon get out of hand, committing atrocities on par with the worst the Principality of Zeon had to offer during the war. In response, dissatisified citizens, former Zeon soldiers, and even members of the Earth Federal Forces form a resistance group known as the Anti-Earth Union Group, or AEUG. As the next war is brewing, a small AEUG group arrives at Side 7 to investigate the new Gundam Mk. II...", "http://cdn.myanimelist.net/images/anime/6/11153.jpg");


insert into animes(
  anime_name, anime_jpname, anime_descricao, anime_image
) values (
  "Mobile Suit Zeta Gundam", "機動戦士Zガンダム", "The year is Universal Century 0087. Seven years have passed since the end of the One Year War. In its zeal to stamp out any remaining opposition, the Earth Federation has organized the Titans, an elite fighting force. However, the Titans soon get out of hand, committing atrocities on par with the worst the Principality of Zeon had to offer during the war. In response, dissatisified citizens, former Zeon soldiers, and even members of the Earth Federal Forces form a resistance group known as the Anti-Earth Union Group, or AEUG. As the next war is brewing, a small AEUG group arrives at Side 7 to investigate the new Gundam Mk. II...", "http://cdn.myanimelist.net/images/anime/6/11153.jpg");


/* FAZENDO O UPDATE DE UM REGISTRO */
update animes 
set anime_descricao ="U.C. 0093 - Char Aznable, the infamous 'Red Comet' of the One Year War, has come out of hiding to lead the Neo-Zeon Army and wage war against the Earth Federation. Only his greatest rival, Gundam pilot Amuro Ray, can stop him from dropping the Axis asteroid on Earth and causing a major global catastrophe." where anime_id =4;



/*  INSERINDO DUMMY DATA NA TABELA DE GENEROS */
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(1, 'Mecha');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(2, 'Action');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(3, 'Drama');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(4, 'Shoujo');

/* INSERINDO DUMMY DATA NA TABELA EPISODIOS*/
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(1, 'Black Gundam', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(2, 'Departure', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(3, 'Within the Capsule', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(4, 'Emma`s Desertion', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(5, 'Father, Son and...', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(6, 'To the Earth Sphere', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(7, 'Escape from Side 1', 2);
INSERT INTO `episodios` (`id_episodio`, `name_episodio`, id_anime) VALUES(8, 'The Dark Side Of The Moon', 2);


/*  CRIANDO A TABELA anime_genres QUE IRÁ SERVIR COMO RELAÇÃO ENTRE ANIMES E GENEROS */
CREATE TABLE `animes_genres` (
  `anime_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


/* CRIANDO A TABELA QUE IRA SERVIR COMO RELAÇÃO ENTRE ANIME X EPISODIO*/
CREATE TABLE anime_episodios (
  `id_do_anime` int(11) NOT NULL,
  `id_do_episodio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


create table episodios (
  id_episodio int(11) NOT NULL AUTO_INCREMENT,
  name_episodio varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  id_anime int(11) NOT NULL,
  primary key (id_episodio)
) ENGINE=InnoDB DEFAULT charset=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;





/* CRIANDO A TABELA DE GENEROS */
CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `id_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5;


insert into videos (name_video, id_anime) values("時をこえて", 1);
insert into relaciona_video (id_do_video, id_do_anime) values (1, 1);

/* querie que irá buscar todos os vídeos referentes ao anime 1 */
select * 
from videos
inner join relaciona_video on videos.id_anime = id_do_anime
where id_anime = 1;


/*  INSERINDO DATA NA TABLE anime_genres referenciando tando anime_id quando genero_id */
INSERT INTO animes_genres (anime_id, genre_id) VALUES(1, 1), (1, 2), (1, 3); /* unicorn mecha*/
INSERT INTO animes_genres (anime_id, genre_id) VALUES(2, 1), (2, 2), (2, 3); /* unicorn mecha*/
INSERT INTO animes_genres (anime_id, genre_id) VALUES(3, 1), (3, 2), (3, 3); /* unicorn mecha*/
INSERT INTO animes_genres (anime_id, genre_id) VALUES(4, 1), (4, 2), (4, 3); /* unicorn mecha*/
INSERT INTO animes_genres (anime_id, genre_id) VALUES(5, 1), (5, 2), (5, 3); /* unicorn mecha*/
INSERT INTO animes_genres (anime_id, genre_id) VALUES(6, 1), (6, 2), (6, 3); /* unicorn mecha*/


INSERT INTO anime_episodios (id_do_anime, id_do_episodio) VALUES(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8);

delete from anime_episodios;

/* QUERY RESPONSAVEL POR MOSTRAR A RELAÇÃO ANIMExEPISODIOS */
select id_do_anime, id_do_episodio, name_episodio
from episodios
inner join anime_episodios on episodios.id_episodio = id_do_episodio
where id_anime = 2;



/* QUERY RESPONSAVEL POR MOSTRAR A RELAÇÃO ANIMExGENEROS */
select id_name
from animes_genres
inner join genres on animes_genres.genre_id = id_genre
where anime_id = 1;





select * from animes_genres;
select * from episodios;
select * from anime_episodios;

delete from anime_episodios;
delete from episodios;

delete from animes where anime_id = 12;
delete from episodios where id_anime= 2;
delete from animes_genres where anime_id = 4;

select * from animes;

select * from episodios;

select * from genres;

select * from anime_episodios;

/* DESABILITANDO SAFE-MODE */
SET SQL_SAFE_UPDATES = 0;
