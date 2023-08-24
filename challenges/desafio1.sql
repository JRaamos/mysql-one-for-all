DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
  plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plano VARCHAR(255) NOT NULL,
  valor_plano DECIMAL (5, 2) NOT NULL
)engine = innodb;

INSERT INTO SpotifyClone.plano(plano, valor_plano)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

CREATE TABLE SpotifyClone.usuario (
  usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name_usuario VARCHAR(255) NOT NULL,
  idade_usuario INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
) engine = innodb;


INSERT INTO SpotifyClone.usuario (
    name_usuario,
    idade_usuario,
    plano_id,
    data_assinatura
  )
VALUES ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-04-29'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.artistas(
  artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
) engine = innodb;

INSERT INTO SpotifyClone.artistas(nome)
VALUES ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

CREATE TABLE SpotifyClone.seguindo_artista(
  artista_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = innodb;

INSERT INTO SpotifyClone.seguindo_artista (artista_id, usuario_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(4, 4),
(5, 5),
(6, 5),
(6, 6),
(1, 6),
(6, 7),
(3, 9),
(2, 10);

CREATE TABLE SpotifyClone.album(
  album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  ano_lancamento YEAR NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = innodb;

INSERT INTO SpotifyClone.album (titulo, ano_lancamento, artista_id)
VALUES ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);

CREATE TABLE SpotifyClone.cancoes(
  cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  album_id INTEGER,
  duracao_segundos INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
) engine = innodb;

INSERT INTO SpotifyClone.cancoes(name, album_id, duracao_segundos)
VALUES ('BREAK MY SOUL', 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ('ALIEN SUPERSTAR', 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ('Under Pressure', 3, 152),
  ('Como Nossos Pais', 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
  ('Samba em Paris', 6, 267),
  ("The Bard's Song", 7, 244),
  ('Feeling Good', 8, 100);


CREATE TABLE SpotifyClone.historico(
  data_reproducao DATETIME NOT NULL UNIQUE,
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (cancao_id)
) engine = innodb;

INSERT INTO SpotifyClone.historico(cancao_id, data_reproducao, usuario_id)
VALUES 
  (8, '2022-02-28 10:45:55', 1),
  (2, '2020-05-02 05:30:35', 1),
  (10, '2020-03-06 11:22:33', 1),
  (10, '2022-08-05 08:05:17', 2),
  (7, '2020-01-02 07:40:33', 2),
  (10, '2020-11-13 16:55:13', 3),
  (2, '2020-12-05 18:38:30', 3),
  (8, '2021-08-15 17:10:10', 4),
  (8, '2022-01-09 01:44:33', 5),
  (5, '2020-08-06 15:23:43', 5),
  (7, '2017-01-24 00:31:17', 6),
  (1, '2017-10-12 12:35:20', 6),
  (4, '2011-12-15 22:30:49', 7),
  (4, '2012-03-17 14:56:41', 8),
  (9, '2022-02-24 21:14:22', 9),
  (3, '2015-12-13 08:30:22', 10);

