create database ig_clone

CREATE TABLE users (
    id int IDENTITY PRIMARY KEY,
	--id int AUTO_INCREMENT PRIMARY KEY --> MySQL
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
	-- created_at timestamp default now() --> MySQL
);

CREATE TABLE photos (
    id INTEGER IDENTITY PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    "user_id" INTEGER NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY("user_id") REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER IDENTITY PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY("user_id") REFERENCES users(id)
);

CREATE TABLE likes (
    "user_id" INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY("user_id") REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY("user_id", photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER IDENTITY PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
-- maximum rows value
INSERT INTO users (username, created_at) VALUES ('Kenton_Kirlin', '2017-02-16 18:22:10.846'), ('Andre_Purdy85', '2017-04-02 17:11:21.417'), ('Harley_Lind18', '2017-02-21 11:12:32.574'), ('Arely_Bogan63', '2016-08-13 01:28:43.085'), ('Aniya_Hackett', '2016-12-07 01:04:39.298'), ('Travon.Waters', '2017-04-30 13:26:14.496'), ('Kasandra_Homenick', '2016-12-12 06:50:07.996'), ('Tabitha_Schamberger11', '2016-08-20 02:19:45.512'), ('Gus93', '2016-06-24 19:36:30.978'), ('Presley_McClure', '2016-08-07 16:25:48.561'), ('Justina.Gaylord27', '2017-05-04 16:32:15.577'), ('Dereck65', '2017-01-19 01:34:14.296'), ('Alexandro35', '2017-03-29 17:09:02.344'), ('Jaclyn81', '2017-02-06 23:29:16.394'), ('Billy52', '2016-10-05 14:10:20.453'), ('Annalise.McKenzie16', '2016-08-02 21:32:45.646'), ('Norbert_Carroll35', '2017-02-06 22:05:43.425'), ('Odessa2', '2016-10-21 18:16:56.390'), ('Hailee26', '2017-04-29 18:53:39.650'), ('Delpha.Kihn', '2016-08-31 02:42:30.288'), ('Rocio33', '2017-01-23 11:51:15.467'), ('Kenneth64', '2016-12-27 09:48:17.380'), ('Eveline95', '2017-01-23 23:14:18.569'), ('Maxwell.Halvorson', '2017-04-18 02:32:43.597'), ('Tierra.Trantow', '2016-10-03 12:49:20.774'), ('Josianne.Friesen', '2016-06-07 12:47:00.703'), ('Darwin29', '2017-03-18 03:10:07.047'), ('Dario77', '2016-08-18 07:15:02.823'), ('Jaime53', '2016-09-11 18:51:56.965'), ('Kaley9', '2016-09-23 21:24:20.222'), ('Aiyana_Hoeger', '2016-09-29 20:28:12.457'), ('Irwin.Larson', '2016-08-26 19:36:22.199'), ('Yvette.Gottlieb91', '2016-11-14 12:32:01.405'), ('Pearl7', '2016-07-08 21:42:00.982'), ('Lennie_Hartmann40', '2017-03-30 03:25:21.937'), ('Ollie_Ledner37', '2016-08-04 15:42:20.322'), ('Yazmin_Mills95', '2016-07-27 00:56:44.310'), ('Jordyn.Jacobson2', '2016-05-14 07:56:25.835'), ('Kelsi26', '2016-06-08 17:48:08.478'), ('Rafael.Hickle2', '2016-05-19 09:51:25.779'), ('Mckenna17', '2016-07-17 17:25:44.855'), ('Maya.Farrell', '2016-12-11 18:04:45.344'), ('Janet.Armstrong', '2016-10-06 07:57:44.491'), ('Seth46', '2016-07-07 11:40:26.557'), ('David.Osinski47', '2017-02-05 21:23:37.392'), ('Malinda_Streich', '2016-07-09 21:37:07.610'), ('Harrison.Beatty50', '2016-09-02 03:48:38.340'), ('Granville_Kutch', '2016-06-26 03:10:22.202'), ('Morgan.Kassulke', '2016-10-30 12:42:31.387'), ('Gerard79', '2016-08-23 19:47:44.102'), ('Mariano_Koch3', '2017-04-17 14:14:45.662'), ('Zack_Kemmer93', '2017-01-01 05:58:22.276'), ('Linnea59', '2017-02-07 07:49:33.830'), ('Duane60', '2016-12-21 04:43:37.761'), ('Meggie_Doyle', '2017-04-04 12:17:33.931'), ('Peter.Stehr0', '2016-08-22 18:05:42.167'), ('Julien_Schmidt', '2017-02-02 23:12:48.451'), ('Aurelie71', '2016-05-31 06:20:56.909'), ('Cesar93', '2016-10-18 16:42:43.220'), ('Sam52', '2017-03-30 22:03:45.159'), ('Jayson65', '2016-10-14 19:10:52.564'), ('Ressie_Stanton46', '2016-12-20 15:09:08.721'), ('Elenor88', '2016-05-08 01:30:40.677'), ('Florence99', '2016-10-06 23:08:30.626'), ('Adelle96', '2016-10-01 00:37:57.429'), ('Mike.Auer39', '2016-07-01 17:36:14.714'), ('Emilio_Bernier52', '2016-05-06 13:04:29.960'), ('Franco_Keebler64', '2016-11-13 20:09:26.855'), ('Karley_Bosco', '2016-06-24 23:38:52.138'), ('Erick5', '2017-04-05 23:44:47.060'), ('Nia_Haag', '2016-05-14 15:38:50.230'), ('Kathryn80', '2016-10-11 09:01:56.764'), ('Jaylan.Lakin', '2016-06-10 23:58:52.210'), ('Hulda.Macejkovic', '2017-01-25 17:17:27.717'), ('Leslie67', '2016-09-21 05:14:01.207'), ('Janelle.Nikolaus81', '2016-07-21 09:26:09.466'), ('Donald.Fritsch', '2017-01-07 10:05:41.165'), ('Colten.Harris76', '2016-10-10 02:38:52.941'), ('Katarina.Dibbert', '2016-11-03 13:14:10.647'), ('Darby_Herzog', '2016-05-06 00:14:21.191'), ('Esther.Zulauf61', '2017-01-14 17:02:33.511'), ('Aracely.Johnston98', '2016-07-25 18:49:09.996'), ('Bartholome.Bernhard', '2016-11-06 02:31:23.463'), ('Alysa22', '2017-01-01 17:44:42.980'), ('Milford_Gleichner42', '2017-04-30 07:50:51.280'), ('Delfina_VonRueden68', '2017-03-21 12:02:14.358'), ('Rick29', '2017-02-24 11:25:08.160'), ('Clint27', '2016-06-02 21:40:09.555'), ('Jessyca_West', '2016-09-14 23:47:04.780'), ('Esmeralda.Mraz57', '2017-03-03 11:52:27.469'), ('Bethany20', '2016-06-03 23:31:53.322'), ('Frederik_Rice', '2016-07-06 21:56:28.654'), ('Willie_Leuschke', '2017-02-15 01:40:53.310'), ('Damon35', '2016-10-31 14:44:27.239'), ('Nicole71', '2016-05-09 17:30:22.371'), ('Keenan.Schamberger60', '2016-08-28 14:57:28.221'), ('Tomas.Beatty93', '2017-02-11 11:38:55.026'), ('Imani_Nicolas17', '2017-01-31 22:59:34.108'), ('Alek_Watsica', '2016-12-10 07:43:58.083'), ('Javonte83', '2017-03-27 22:06:37.433');
INSERT INTO photos(image_url, user_id) VALUES ('http://elijah.biz', 1), ('https://shanon.org', 1), ('http://vicky.biz', 1), ('http://oleta.net', 1), ('https://jennings.biz', 1), ('https://quinn.biz', 2), ('https://selina.name', 2), ('http://malvina.org', 2), ('https://branson.biz', 2), ('https://elenor.name', 3), ('https://marcelino.com', 3), ('http://felicity.name', 3), ('https://fred.com', 3), ('https://gerhard.biz', 4), ('https://sherwood.net', 4), ('https://maudie.org', 4), ('http://annamae.name', 6), ('https://mac.org', 6), ('http://miracle.info', 6), ('http://emmet.com', 6), ('https://lisa.com', 6), ('https://brooklyn.name', 8), ('http://madison.net', 8), ('http://annie.name', 8), ('http://darron.info', 8), ('http://saige.com', 9), ('https://reece.net', 9), ('http://vance.org', 9), ('http://ignacio.net', 9), ('http://kenny.com', 10), ('http://remington.name', 10), ('http://kurtis.info', 10), ('https://alisha.com', 11), ('https://henderson.com', 11), ('http://bonnie.info', 11), ('http://kennith.net', 11), ('http://camille.name', 11), ('http://alena.net', 12), ('http://ralph.name', 12), ('https://tyshawn.com', 12), ('https://adella.net', 12), ('https://cielo.info', 13), ('https://easter.net', 13), ('http://golden.org', 13), ('http://kendall.biz', 13), ('https://glenda.info', 13), ('http://dominic.biz', 15), ('http://tressie.info', 15), ('http://estevan.org', 15), ('http://zena.com', 15), ('https://abagail.com', 16), ('https://hershel.com', 16), ('http://collin.com', 16), ('https://clair.com', 16), ('https://deondre.com', 17), ('http://tristin.name', 17), ('http://kirk.org', 17), ('https://modesta.info', 18), ('http://rylan.biz', 19), ('https://noemie.com', 19), ('https://dejon.name', 20), ('https://rigoberto.net', 22), ('http://megane.biz', 23), ('http://emmalee.org', 23), ('http://nathan.net', 23), ('http://lionel.net', 23), ('http://danyka.net', 23), ('https://woodrow.com', 23), ('http://harvey.info', 23), ('http://aiden.org', 23), ('https://tito.name', 23), ('https://julian.net', 23), ('https://mafalda.org', 23), ('http://verner.org', 23), ('https://elmore.org', 26), ('http://kasandra.com', 26), ('https://jarret.info', 26), ('http://einar.net', 26), ('http://terry.info', 26), ('https://holden.com', 27), ('https://jacinto.org', 28), ('https://geoffrey.info', 28), ('http://paxton.com', 28), ('https://trinity.biz', 28), ('http://fabiola.org', 29), ('https://bryce.org', 29), ('http://emery.net', 29), ('https://marian.biz', 29), ('https://kennedi.org', 29), ('https://fanny.net', 29), ('http://lottie.net', 29), ('http://lacy.biz', 29), ('https://jensen.name', 30), ('http://virginia.org', 30), ('https://ariel.net', 31), ('http://roger.info', 32), ('https://carolanne.com', 32), ('https://margarita.info', 32), ('https://kayden.biz', 32), ('https://brook.com', 33), ('https://gust.net', 33), ('http://bridie.name', 33), ('http://barton.name', 33), ('https://karina.biz', 33), ('https://mariam.com', 35), ('https://trycia.com', 35), ('https://everette.biz', 37), ('http://boris.biz', 38), ('http://arthur.name', 38), ('https://cesar.com', 39), ('http://charlie.com', 40), ('https://lina.biz', 42), ('https://darwin.net', 42), ('https://aliyah.biz', 42), ('http://euna.info', 43), ('https://maymie.net', 43), ('http://joanie.name', 43), ('http://whitney.net', 43), ('http://garrison.name', 43), ('https://olga.org', 44), ('https://donavon.org', 44), ('http://moses.biz', 44), ('http://shannon.org', 44), ('http://kendrick.net', 46), ('https://carey.com', 46), ('http://lia.biz', 46), ('https://celestine.name', 46), ('http://laila.info', 47), ('http://buddy.com', 47), ('http://americo.biz', 47), ('http://lurline.info', 47), ('http://kailee.org', 47), ('https://edyth.com', 48), ('https://isaias.biz', 50), ('http://rosetta.net', 50), ('https://marianna.info', 50), ('https://roel.org', 51), ('http://julia.info', 51), ('https://seamus.org', 51), ('https://earline.info', 51), ('http://quinten.info', 51), ('https://dolores.org', 52), ('https://aimee.info', 52), ('https://roderick.name', 52), ('https://jarret.name', 52), ('https://cathrine.com', 52), ('https://adela.com', 55), ('https://demarco.com', 56), ('https://lila.biz', 58), ('http://ruben.net', 58), ('https://alia.name', 58), ('http://rickey.name', 58), ('http://janie.com', 58), ('http://myron.org', 58), ('http://pearl.info', 58), ('http://victoria.biz', 58), ('https://carmella.com', 59), ('http://leo.com', 59), ('http://jedediah.net', 59), ('http://sedrick.net', 59), ('https://clare.org', 59), ('https://malcolm.name', 59), ('https://lesly.com', 59), ('https://roberta.net', 59), ('https://estell.info', 59), ('http://kaleigh.biz', 59), ('http://blanca.org', 60), ('http://delpha.com', 60), ('http://annabelle.org', 61), ('http://ephraim.com', 62), ('https://dameon.name', 62), ('https://julianne.org', 63), ('https://jasmin.biz', 63), ('https://delbert.net', 63), ('https://norval.com', 63), ('https://jessy.name', 64), ('https://nolan.name', 64), ('http://devon.info', 64), ('http://ora.net', 64), ('https://vivien.com', 64), ('https://hilda.info', 65), ('https://dorcas.biz', 65), ('http://hettie.net', 65), ('http://rico.biz', 65), ('http://jody.biz', 65), ('http://sheila.com', 67), ('http://germaine.name', 67), ('https://mariane.org', 67), ('http://reva.com', 69), ('https://llewellyn.info', 70), ('http://ellen.info', 72), ('https://anahi.info', 72), ('https://javonte.org', 72), ('http://florine.org', 72), ('http://marcellus.info', 72), ('http://stan.biz', 73), ('http://jarred.net', 77), ('http://jovanny.net', 77), ('http://linnie.com', 77), ('http://dino.name', 77), ('https://jane.net', 77), ('http://laney.name', 77), ('http://trever.org', 78), ('http://emilie.net', 78), ('http://ted.info', 78), ('http://keshawn.org', 78), ('http://ole.info', 78), ('https://ford.biz', 79), ('https://humberto.org', 82), ('http://penelope.info', 82), ('https://dimitri.info', 84), ('http://cynthia.info', 84), ('http://princess.org', 85), ('https://ruthie.info', 85), ('https://evan.name', 86), ('http://deontae.org', 86), ('https://timmy.info', 86), ('http://susie.info', 86), ('http://hollis.com', 86), ('https://colt.org', 86), ('http://lucio.org', 86), ('http://germaine.org', 86), ('http://howard.net', 86), ('http://helena.name', 87), ('https://celestino.name', 87), ('http://violet.info', 87), ('http://nigel.biz', 87), ('https://noble.net', 88), ('https://emilia.org', 88), ('http://destini.net', 88), ('https://mariano.net', 88), ('https://brittany.org', 88), ('https://madaline.name', 88), ('https://devonte.name', 88), ('https://blanche.net', 88), ('http://cali.net', 88), ('http://mekhi.name', 88), ('http://adela.com', 88), ('https://devan.com', 92), ('https://jarrett.name', 92), ('https://sid.biz', 92), ('https://jadyn.name', 93), ('https://erik.com', 93), ('http://freeda.biz', 94), ('http://ayden.name', 95), ('https://kathleen.biz', 95), ('https://helmer.org', 96), ('https://maggie.info', 96), ('https://cecilia.net', 96), ('http://ayla.org', 97), ('https://elyssa.biz', 97), ('http://jennie.com', 98), ('http://ryleigh.info', 99), ('https://darien.name', 99), ('https://xzavier.org', 99), ('https://kaela.name', 100), ('http://dedrick.info', 100);
--

-- 1. Finding 5 oldest users
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5

SELECT TOP 5 * 
FROM users
ORDER BY created_at

-- 2. Most Popular Registration Date
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

select top 2 datename(weekday, day(created_at)), count(*) from users
group by datename(weekday, day(created_at))
order by count(*) desc

-- 3. Identify Inactive Users (users with no photos)
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

select u.id, u.username, count(p.id) as photo_posted from users u
left join photos p on u.id = p.user_id
group by u.id, u.username
having count(p.id) = 0
order by photo_posted

select u.username, 
	case
	when count(p.id) > 0 then 'active'
	else 'inactive'
	end as membership 
	from users u
left join photos p on u.id = p.user_id
group by u.username
order by count(p.id)

-- 4. Identify most popular photo (and user who created it)
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5. Calculate average number of photos per user
SELECT
(SELECT Count(*) FROM   photos) / (SELECT Count(*) FROM users) 
AS avg;

-- 6. Find the five most popular hashtags
SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- 7. Finding the bots - the users who have liked every single photo
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 