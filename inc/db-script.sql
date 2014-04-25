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


select * from animes;


/* FAZENDO O UPDATE DE UM REGISTRO */
update animes 
set anime_descricao ="U.C. 0093 - Char Aznable, the infamous 'Red Comet' of the One Year War, has come out of hiding to lead the Neo-Zeon Army and wage war against the Earth Federation. Only his greatest rival, Gundam pilot Amuro Ray, can stop him from dropping the Axis asteroid on Earth and causing a major global catastrophe." where anime_id =4;



/* CRIANDO A TABELA DE GENEROS */
CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `id_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5;


/*  INSERINDO DUMMY DATA NA TABELA DE GENEROS */
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(1, 'Mecha');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(2, 'Action');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(3, 'Drama');
INSERT INTO `genres` (`id_genre`, `id_name`) VALUES(4, 'Shoujo');

/* VISUALIZANDO OS REGISTROS DA TABELA GENEROS */
select * from genres;


/*  CRIANDO A TABELA anime_genres QUE IRÁ SERVIR COMO RELAÇÃO ENTRE ANIMES E GENEROS */
CREATE TABLE `animes_genres` (
  `anime_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


delete from animes_genres where anime_id = 4;

select * from animes_genres;

/*  INSERINDO DATA NA TABLE anime_genres referenciando tando anime_id quando genero_id */
INSERT INTO animes_genres (anime_id, genre_id) VALUES(4, 1); /* unicorn mecha*/


/* QUERY RESPONSAVEL POR MOSTRAR A RELAÇÃO ANIMExGENEROS */
select id_name
from animes_genres
inner join genres on animes_genres.genre_id = id_genre
where anime_id = 4;





CREATE TABLE `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

INSERT INTO `sizes` (`id`, `size`, `order`) VALUES(1, 'Small', 10);
INSERT INTO `sizes` (`id`, `size`, `order`) VALUES(2, 'Medium', 20);
INSERT INTO `sizes` (`id`, `size`, `order`) VALUES(3, 'Large', 30);
INSERT INTO `sizes` (`id`, `size`, `order`) VALUES(4, 'X-Large', 40);

CREATE TABLE `products_sizes` (
  `product_sku` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(101, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(101, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(101, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(101, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(102, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(102, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(102, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(102, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(103, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(103, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(103, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(103, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(104, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(104, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(104, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(104, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(105, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(105, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(105, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(105, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(106, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(106, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(106, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(106, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(107, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(107, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(107, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(107, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(108, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(108, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(108, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(108, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(109, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(109, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(109, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(109, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(110, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(110, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(110, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(110, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(111, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(111, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(111, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(111, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(112, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(112, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(112, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(112, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(113, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(113, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(113, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(113, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(114, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(114, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(114, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(114, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(115, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(115, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(115, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(115, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(116, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(116, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(116, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(116, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(117, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(117, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(117, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(117, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(118, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(118, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(118, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(118, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(119, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(119, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(119, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(119, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(120, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(120, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(120, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(120, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(121, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(121, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(121, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(121, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(122, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(122, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(122, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(122, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(123, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(123, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(123, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(123, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(124, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(124, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(124, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(124, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(125, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(125, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(125, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(125, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(126, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(126, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(126, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(126, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(127, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(127, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(127, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(127, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(128, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(128, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(128, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(128, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(129, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(129, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(129, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(129, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(130, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(130, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(130, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(130, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(131, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(131, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(131, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(131, 4);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(132, 1);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(132, 2);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(132, 3);
INSERT INTO `products_sizes` (`product_sku`, `size_id`) VALUES(132, 4);

select product_sku, size_id, size
from products_sizes
inner join sizes on products_sizes.size_id = size_id
where product_sku = 108
order by 'order';