-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: picksystem.eu    Database: bfarmdb
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `address_type` varchar(1) COLLATE utf8_hungarian_ci NOT NULL,
  `settlement` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `postal_code` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_idx` (`customer_id`),
  CONSTRAINT `fk_address` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `admin_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'teszt@teszt.hu','7c222fb2927d828af22f592134e8932480637c0d',0),(2,'attila@gmail.com','7c222fb2927d828af22f592134e8932480637c0d',0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Szépirodalom'),(2,'Fantasy'),(3,'Ezotéria'),(4,'Történelem'),(5,'Utazás'),(6,'Gasztronómia');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'teszt@teszt.hu','7c222fb2927d828af22f592134e8932480637c0d','Attila','Pál'),(2,'palatila@gmail.com','7c222fb2927d828af22f592134e8932480637c0d','Attila','Pál');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_header` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `payment_option` varchar(3) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_settlement` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_postal_code` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_settlement` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_postal_code` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `order_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipping_option` varchar(3) COLLATE utf8_hungarian_ci NOT NULL,
  `order_status` varchar(1) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_idx` (`customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order` FOREIGN KEY (`id`) REFERENCES `order_item` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES (1,2,'COD','Budapest','1234','Teszt utca 3','Budapest','1234','Teszt utca 3','2023-01-17 11:11:11','GLS','N'),(2,2,'CC','Budapest','1234','Teszt utca 3','Budapest','1234','Teszt utca 3','2023-01-17 15:21:44','GLS','N'),(3,1,'CC','Budapest','3375','Teszt utca 5','Budapest','3375','Teszt utca 5','2023-01-17 19:47:48','GLS','N');
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '1',
  `price` int(10) NOT NULL,
  KEY `fk_product_idx` (`product_id`),
  KEY `fk_order_idx` (`order_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,3,2,2276),(2,5,1,2759),(2,13,1,2548),(0,63,2,2759),(0,62,1,590),(3,61,1,590),(3,62,1,590);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `author` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `price` int(10) NOT NULL,
  `description` text COLLATE utf8_hungarian_ci,
  `book_img` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_idx` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,1,'Molnár Ferenc','A Pál utcai fiúkkkk',1824,'           „És most farkasszemet nézett egymással a két vezér. Életükben először álltak egymással szemtől szemben, négyszemközt. Itt találkoztak, ez előtt a szomorú ház előtt. Az egyiket a szíve hozta ide, a másikat a lelkiismerete.”           ','automata_ontozo_1.png'),(3,3,'Erich Von Daniken','Istenek szemtanúja - Amit évtizedekig titokban tartottam',2276,'Erich Von Daniken\r\nKötési módpuha kötésKiadóIPC KönyvkiadóKiadás éve2020Terjedelme168 oldalDimenzió122 mm x 200 mm x 13 mmVonalkód9789636357153\r\nIstenek szemtanúja - Amit évtizedekig titokban tartottam\r\n\r\nA NAGY SIKERŰ, A JÖVŐ EMLÉKEI CÍMŰ BESTSELLER ÍRÓJÁNAK ÚJ KÖNYVE\r\n\r\nAz „ősi idegenek” teória atyja most előrukkol mindennel, amiről eddig hallgatott. Fél évszázada, mióta ír, Däniken soha nem ingott meg abban a hitében, hogy a prehisztorikus időkben más bolygók lakói idejöttek kapcsolatot teremteni az emberiséggel, és azóta is figyelnek bennünket. Hogy tudta ilyen kitartóan állítani, hogy ufók léteznek és időnként embereket rabolnak el, hogy megvizsgálhassák őket? Miért ismétli újra meg újra ebbéli álláspontját a hivatalosan elfogadott történelemírás ellenében, miközben kritikusai lenéző hangon, igen ellenségesen támadják?\r\nA válasz az: Erich von Däniken azokhoz szól, akik hajlamosak elfogadni az elméleteit. Aki már látott ufót, vagy akit elraboltak, az hisz neki! Még ha a beavatottak kevesen is vannak.\r\nEbben a könyvében a nyolcvannégy éves író olyan szemtanúkat sorakoztat fel, olyan titkokat és történeteket mesél el, amelyeket mind ez idáig megtartott magának, és bemutat olyan beszélgetéseket és összefüggéseket, amiktől tátva marad a szája az olvasónak.','backgraund.jpg'),(4,3,'Nick Vujicic','Nyitott lélekkel /Imák egy varázslatosan jó életért',2207,'Nick Vujicic pontosan tudja, hogy nincs annál nagyobb áldás, mint ha valaki tudja, útján Isten kíséri, és tervei vannak vele. Ez akkor is reményt ad, ha már minden kilátástalannak tűnik. Nick karok és lábak nélkül született, átélte a kétségbeesés pokoli kínjait. Hitéből erőt merítve azonban legyőzte a zordon körülményeket, és túllendült fizikai korlátain. Megértette a szeretet teljességét, Isten végtelen erejét, mellyel minden egyes ember útját figyelemmel kíséri.','nick-vujicic-nyitott-lelekkel-imak-egy-varazslatosan-jo-eletert-200320.jpg'),(5,3,'Tobias Beck','Törj ki! - Irányítsd az életed',2759,'Nyilván te is ismersz „krónikus panaszkodókat”, akik egész nap siránkoznak, akiknek semmi nem felel meg, akik mindig áldozatnak érzik magukat. Hétfő van, rossz az idő, és ha ez még nem volna elég, lyuk van a fánk közepén! Az ő rosszkedvük hatással van a környezetükre, de te fogadd meg Tobias Beck tanácsát, és ne foglalkozz velük. A könyvéből most megtudhatod, hogyan szabadulhatsz meg a krónikus panaszkodóktól, elkerülve, hogy a hatásukra te magad is úgynevezett energiavámpírrá válj.\r\n','tobias-beck-torj-ki--iranyitsd-az-eleted-238208.jpg'),(6,3,'Madocsai Eszter','A belső harmónia útja - DO-IN (3. kiadás)',2919,'Mi is az a Do-in?\r\nEgy japán módszer – a testi egészség megőrzésére, a lelki kiegyenlítettség elérésére, a szellemi fejlődés támogatására szolgál. Magasabb szinten a külső és belső világ harmóniáját, az univerzummal való egységünket segít megvalósítani.\r\nÖngyógyító mozgásgyakorlatok rendszere – légző gyakorlatokból, kitartott mozdulatok, feszítések sorozatából áll, ugyanakkor önmasszázs elemei is vannak. Utóbbiak közül a legfontosabbak az ütögetések, simítások és a pontnyomások.','madocsai-eszter-a-belso-harmonia-utja--do-in-3-kiadas-234054.jpg'),(7,3,'Maaike De Vries, Manon Kerkhof','A legjobb csajok is lesznek ötvenévesek',5092,'Minden, amit tudni szeretnél a változókorról Hőhullámok gyötörnek, nem vagy önmagad, jönnek fel a kilók, nincs kedved a szexhez, és túl fáradt vagy az álmatlan éjszakáktól ahhoz, hogy bármit is csinálj. Mindez egyáltalán nem törvényszerű a változókorban! 45 és 55 éves kor között felborul a hormonegyensúly, és örökre megszűnik a termékenység. Ezeknek az éveknek a legtöbb nő nem örül, ugyanakkor átmenetet jelentenek egy következő életszakaszba. Sajnos az átmenet nem mindig zökkenőmentes. A nők túlnyomó többsége megérzi a változást, amely sokféleképpen jelentkezhet: a még könnyedén vehető éjszakai verejtékezéstől kezdve a normális életet ellehetetlenítő súlyos panaszokig és tünetekig.','maaike-de-vries-a-legjobb-csajok-is-lesznek-otven-evesek-246857.jpg'),(8,3,'Kathleen Mccormack','A megfejtett tarot /Értelmezzük a tarot szimbólumait...',2913,'Fejtse meg a kártyákon lévő szimbolikus ábrázolásokat, és sajátítsa el, hogyan értelmezheti azokat önmagára vonatkozóan.','kathleen-mccormack-a-megfejtett-tarot-ertelmezzuk-a-tarot-szimbolumait--165380.jpg'),(9,3,'Francis Melville','Angyalok könyve /Ha vezetésre, vigasztalásra és ösztönzésre van szükségünk, forduljunk az angyalokhoz',2555,'A könyv több mint harminc angyal tulajdonságait, jellemzőit, sajátosságait mutatja be. Megismerhetjük belőle a legfontosabb arkangyalokat, a bolygók és az állatövek angyalait.\r\nHogyan tudhatjuk meg a saját őrangyalunk nevét?\r\nHogyan léphetünk kapcsolatba vele?\r\nMilyen segítségkérő szertartások és imák kellenek, ha az élet valamilyen területén angyali segítségre van szükségünk - legyen az szerelem, termékenység, védelem, gyógyulás, szellemi növekedés vagy boldogulás?','francis-melville-angyalok-konyve-ha-vezetesre-vigasztalasra-es-osztonzesre-van-szuksegunk-forduljunk-az-angyalokhoz-221004.jpg'),(10,3,'Soma Mamagésa','A harmónia mint döntés',3284,'Soma Mamagésa legújabb, immár 11. kötete egyfajta összegzése eddigi munkáinak. Középpontjában most is korunk egyik legizgalmasabb témája, a szabad akarat megnyilvánulása, a tudatos döntés áll. Nők és férfiak döntései önmagukról és másokról, szerepeik, egymás közötti kommunikációjuk. A nagy kérdés, vajon megteremthető-e életünkben valamiféle egyensúly, azaz harmónia. És ha igen, hogyan. Vajon mi minden segíthet abban, hogy megtanuljuk magunkat szeretni, ezáltal másokat is? Mert ezt nem is olyan könnyű elérni egy elvárásokkal, hasonlítgatásokkal, harcokkal, játszmákkal, végleges ellentétekkel teli világban. Ehhez kell életünk tudatos alakítása, a szüntelen törekvés a belső egyensúlyra, a harmóniára.','soma-mamagesa-a-harmonia-mint-dontes-224929.jpg'),(11,1,'Theresa Caputo','Elengedés - Mindennapos veszteségeink feldolgozása túlvilági bölcsességgel',2919,'\"Állandóan változó világunkban mindennap megélünk kisebb-nagyobb veszteségeket, ám többnyire fel sem figyelünk ezekre, s így el sem gyászoljuk őket. A fel nem dolgozott gyász pedig emészti lelkünket, láthatatlan, szinte beazonosíthatatlan fájdalmat okoz. Theresa Caputo, az ismert amerikai médium sokaknál megtapasztalta már ezt. Akik hozzá fordulnak, többnyire nem is tudatosították még, miből ered fájdalmuk, és fogalmuk sincs, hogyan birkózzanak meg vele.\"','theresa-caputo-elengedes--mindennapos-vesztesegeink-feldolgozasa-tulvilagi-bolcsesseggel-239517.jpg'),(12,2,'Mel Robbins','5 másodperces szabály - Több önbizalom, teljesebb élet, megbecsült munka könnyedén',3643,'Ha tudod már, MIN akarsz változtatni, ez a könyv megmutatja\r\nneked, HOGYAN tedd.\r\nHa komolyan gondolod, hogy változtass az életeden vagy a\r\nmunkádon...\r\nHa készen állsz arra, hogy felhagyj a halogatással...\r\nHa szeretnél egy egyszerű, de bizonyított módszert, hogy\r\negyszer és mindenkorra legyőzd az önmagadban való kételkedést\r\nés a félelmet...','mel-robbins-5-masodperces-szabaly--tobb-onbizalom-teljesebb-elet-megbecsult-munka-konnyeden-224434.jpg'),(13,3,'Laurent Gounelle','A benned rejlő kincs',2548,'Alice, a sikeres párizsi kommunikációs tanácsadó hazamegy Clunybe, ahol találkozik gyerekkori barátjával Jérémie-vel, aki katolikus pap lett. Jérémie lelki válságba kerül, mert napról napra szembesülnie kell azzal, hogy alig járnak templomba az emberek; alig egy tucat hívőnek prédikál. A meggyőződéses ateista Alice elhatározza, hogy segít neki, és saját módszereivel megvizsgálja a szentmise \"marketingjét\". Az ötlet azért vicces, mert ugyanazokat a kérdéseket teszi fel a papnak, mint amiket pl. egy mosogatógép-gyárosnak, de mintha rátapintana, mitől nem sikeres az ügy, és arra jut, hogy változtatni kell a \"branden\".','laurent-gounelle-a-benned-rejlo-kincs-220478.jpg'),(14,1,'Leslie L. Lawrence','Csöd /Dísz',1499,'A békés bhutáni kolostor, Litang nem kerülheti el a sorsát: felbukkan a falai között Leslie L. Lawrence, hogy egy frissiben felfedezett, régi könyvet tanulmányozzon. Ettől a perctől kezdve a rémület napjai köszöntenek Nyömden apátra és a mit sem sejtő szerzete...','leslie-l-lawrence-csod-disz-188181.jpg'),(15,1,'Várnai G. Zsuzsa','Napfényzivatar',3035,'Kegyetlenség, misztikum, megpecsételődött sorsok - generációk sorának története teljesedik ki ebben a családregényben.\r\n\r\nAdott egy család: az apát, Taktakenéz Kövér Emmanuelt - akinek fontos szerep jutott a trianoni békeszerződés aláírásakor is - Horthy lovaggá ütötte, az anya pedig orosz zsidó volt. Ők ketten Párizsban, az éppen a szürrealizmus fénykorát élő bohém nagyvárosban ismerkedtek meg. Egymásra találásukban fontos szerep jutott Dalínak és Bu?uelnek is...','varnai-g-zsuzsa-napfenyzivatar-215046.jpg'),(16,1,'Neogrády Antal','Megfagyott macskavíz',1346,'Szerencsésnek mondhatja magát, aki személyesen ismerheti jelen kötet szerzőjét, ifjabb Neogrády Antal ugyanis a bolygó utolsó reneszánsz embereinek egyike.\r\nA többgenerációs művészcsaládból származó Neogrády nem csak kiváló festőművész és díszlettervező, de genetikai öröksé-gével oly rendkívüli módon sáfárkodott, hogy - mintegy mellesleg - csodálatos költeményekkel is megajándékozta közönségét. (Amúgy, saját bevallása szerint, diszlexiás, nem könnyű dolog számára az olvasás. Ehhez képest lenyűgöző irodalmi műveltségre tett szert.)','neogrady-antal-megfagyott-macskaviz-218564.jpg'),(17,1,'Őszi Róbert','Kétté',990,'Álmodni csak múlt időben érdemes.\r\n\r\nTettárik Tamás sok év elteltével hazalátogat Magyarországra, hogy átvegye örökségét elhunyt nagyanyja után. Ő az egyedüli örökös. Nehezen barátkozik meg ezzel az új helyzettel. Minél előbb szeretne megszabadulni minden értéktől, mely a hagyaték részét képezi és egykori családjához köti.\r\nAnna grafikus, nemrégiben végezte el az egyetemet, egy multinál robotol napi tizenkét órában, és elégedetlen a jelenlegi helyzetével.','oszi-robert-kette-200672.jpg'),(18,1,'Őszi Róbert','Nem múló korszakom',990,'Létezik egy történet. A mitikus ókori szobrászról, Pygmalionról szól. Ez a remek ciprusi merész kőből nőalakot formázott. Olyan szívvel, hévvel és lendülettel tette, hogy a szobor végül szinte élővé nemesedett a keze által. Gyönyörű szép nő tekintett vissza a mesterre a kőalak fogságából. A szobrász azonnal beleszerelmesedett a teremtményébe, nevet is adott neki, Galateának becézve a sziklába álmodott szépséget. ','oszi-robert-nem-mulo-korszakom-209999.jpg'),(19,1,'Szendrői Csaba','A dolgok és amik mögöttem vannak',1821,'Az Elefánt zenekar frontemberének, Szendrői Csaba énekes-szövegírónak (alias dr. Csendrői Szabi) ironikus életbölcsességeiből, fanyar és humoros facebookos megnyilvánulásaiból válogat a kötet, melyet Tar Brigitta illusztrációi tesznek igazán menő és szerethető „kisokossá”.','szendroi-csaba-a-dolgok-es-amik-mogottem-vannak-237965.jpg'),(20,1,'Tisza Kata','a legjobb hely a városban te vagy',2902,'Tisza Kata legfrissebb könyvében ismét újat ad: pszichológiai doktori kutatásait, coaching praxisát és saját élete élményeit gyúrja össze. Az eredmény egy rendhagyó terápiás verseskötet, ami műfajt teremt és hiányt pótol. Az emberi életút egyik legkritikusabb csomópontját járja körül: a válást.','tisza-kata-a-legjobb-hely-a-varosban-te-vagy-222700.jpg'),(21,1,'Temesi Ferenc','A szív böjtje',2919,'„A címadó kisregény tanúsítja, hogy magam is kutya vagyok. A kötetben vannak novellák, tárcák (utóbbiak az 1989–90-es átváltozás környékéről), szövegek, őrültnek tűnő, de megfejthető keresztrejtvény, esszé a Tarot jóskártyáról, angolból visszafordított versek Amerikáról, japán és kínai, nőészeti rockesszé és sok más. A kötetzáró kisregényben kortársaimnak hozzám írott leveleiből rajzolódik ki a pályám, az első megjelent novellámtól a Híd című regényemig. Az Élet és irodalom balhé volt a megjelenéskor, ma már irodalomtörténet.”','temesi-ferenc-a-sziv-bojtje-245376.jpg'),(22,1,'Földvári-Oláh Csaba','Apály',3646,'Földvári-Oláh Csaba rendszerint egy feladvány megfejtése, egy rejtély köré építi fel az írásait. Negyedik regénye, az Apály női főszereplője megmagyarázhatatlan módon hisz abban, hogy volt férje, aki sokat jelentett számára, nem halt meg néhány hónapja a világ másik felén, nem az ő holttestét találták meg. Krisztina elutazik az iraki Kurdisztánba, hogy választ kapjon a kérdéseire.','foldvari-olah-csaba-apaly-248695.jpg'),(23,1,'Temesi Ferenc','Babonáskönyv',3267,'A nagy történetmesélőket mindig is foglalkoztatták a mesék, a legendák vagy épp az álmok trancendens világlátásai. Így van ezzel Temesi Ferenc is, akit korán rabul ejtett a folklór, s mindig is érdekelt a néplélek, illetve a különböző népek hol egymásba fonódó, hol külön mederbe terelődő kultúrhistórája.','temesi-ferenc-babonaskonyv-242755.jpg'),(24,2,'Lian Hearn','A tengu játszmája - Sikanoko meséje 4.',875,'Miközben Nyolcsziget tovább sodródik a pusztulás felé, az országot aszály és békétlenség dúlja, a nagybeteg Aritomón és az időközben a Pók törzs vezetőjévé vált Kikuta mesteren is eluralkodik a hatalomvágy. A trónbitorló, fiatal Daigen anyja szintén aggódik a Lótusztrón sorsa miatt: úgy hírlik, a valódi császár, Josimori életben van...','lian-hearn-a-tengu-jatszmaja--sikanoko-meseje-4-227659.jpg'),(25,2,'Bán Mór','A héttorony ostroma',2189,'A végítélet utáni világ metropolisza, Sztambul fölé hét gigászi torony magasodik. Itt, a fellegek közt él Saraf al Arun szultán, a birodalom ura, s vigyázza a behatolóktól a Yedikule titokzatos tornyait. A szultán hatalma ellen lázadó erők flottája azonban mindent egy lapra feltéve elsöprő támadást intéz a Héttorony oszlopai ellen.','ban-mor-a-hettorony-ostroma-215730.jpg'),(26,2,'Bán Mór','A jég és a vér birodalma',2189,'Kán Morgare, a nomád törzsek futára kockázatos küldetésre indult messzi, északi tartományokba. A világvégfal közvetlen szomszédságában húzódó Ugor Jégbirodalom kagánjához kell eljutnia, titkos megbízatással a tarsolyában.','ban-mor-a-jeg-es-a-ver-birodalma-209720.jpg'),(27,2,'Jay Kristoff','Empire of the Vampire - Vámpírbirodalom',5039,'Huszonhét éve kelt utoljára a nap, így az éj lényei három évtizede prédálnak a halódó nap derengésében. Saját örök birodalmuk építésével a miénk egyre satnyul. Immár csupán néhány kihunyó fénypetty küszködik a sötétség növekvő tengerében. Gabriel de León a birodalom és az egyház védelmére felesküdött rend, az ezüstszentek utolsó tagja. De a nap eltűnésével már az Ezüst Rend sem bír az áradattal. Ősellenségei fogságában az utolsó ezüstszent kénytelen elmesélni a történetét.','jay-kristoff-empire-of-the-vampire--vampirbirodalom--vampirbirodalom-1-249282.jpg'),(28,2,'Moskát Anita','A hazugság tézisei',3278,'Mi történik, ha belenézel a fekete monitorba? Hogyan őrzik meg a hátországban maradó családtagjaikat a háborúba vonuló katonák? Milyen, ha a halott apa tudata az okosház rendszerébe költözik? Hazugságokból felépülő életek és világok jelennek meg ebben a novelláskötetben: fizikai törvényeket szerződésekkel manipuláló jogászok, fénylő istengyereket váró leányanyák, áldozatot követelő tavak és hazugságokból városokat emelő építészek.','moskat-anita-a-hazugsag-tezisei-245799.jpg'),(29,2,'Victoria Aveyard','A kettétört birodalom',4373,'Különös sötétség terjed Vigilia földjén. Még a tengerparti kis faluban élő Corayne an-Amarat is érzi. A sors egy legendákból előlépett halhatatlan és egy könyörtelen bérgyilkos képében toppan be az ajtaján, akik felfedik előtte, hogy egy ősi vérvonal utolsó leszármazottja, és csak az ő hatalmában áll megmenteni a világot a megsemmisüléstől.','victoria-aveyard-a-kettetort-birodalom-245798.jpg'),(30,2,'Andrzej Sapkowski','A megvetés ideje - Vaják IV.',2913,'Hogy megvédje a rábízott Cirit, Ríviai Geraltnak messzire kell küldenie a vajákok otthonától, hogy Yennefer, a varázslónő szárnyai alatt tanuljon. A varázslógyűlésben azonban puccs készül, miközben kitör a háború. Geralt egy súlyos sérülés után az életéért küzd... Ciri pedig, akinek kezében a világ sorsa nyugszik, eltűnik.','andrzej-sapkowski-a-megvetes-ideje--vajak-iv-234465.jpg'),(31,2,'Helene Wecker','A gólem és a dzsinn',2913,'Chavát egy kabbalista mágiát űző rabbi keltette életre a tizenkilencedik század végén egy férfi kívánságára, aki feleségre vágyott – ebbe az agyaggólembe azonban szokatlan módon emberi kíváncsiságot plántáltak. Miután Chava gazdája meghal a tengeren, a gólem egyedül érkezik meg New Yorkba, ahol útmutatás nélkül, önmagának kell boldogulnia.','helene-wecker-a-golem-es-a-dzsinn-206869.jpg'),(32,1,'Maya Motayne','Oculta - Varázshamisítás 2.',2919,'Tolvajból nagyúr. Hercegből ellenség. Halálos játszma a hatalomért. A Nocturna folytatódik! Alfie és Finn, miután összefogtak, hogy megmentsék Castallant az ősi, gonosz varázslattól, elbúcsúztak, és hosszú hónapokig nem is hallottak egymás felől. Alfie trónörökösként most a nemzetközi béketárgyalásokat készíti elő, miközben Finn járja a világot, végre szabadon, hiszen megszabadult Ignaciótól.','maya-motayne-oculta--varazshamisitas-2-242108.jpg'),(33,2,'Art Spiegelman','A teljes Maus - Képregény',4014,'„Ezek nem emberek!” Ha ez a gyűlölettel átitatott mondat egy állam ideológiájává válik, az minden esetben világméretű tragédiához vezet. A náci Németországban a goebbelsi propaganda elhitette az emberekkel, hogy bizonyos embertársaik alsóbbrendűek, akiket el kell pusztítani. E szörnyűséges, egész Európát érintő történelmi bűntett áldozatainak állít emléket Art Spiegelman Pulitzer-díjas képregénye, a Maus. A szereplők antropomorf állatok: egérfejű zsidók, macskafejű németek és kutyafejű amerikaiak. Az ő sorsukon keresztül ismerjük meg a holokauszt megrázó eseményeit és következményeit. A Maus a holokauszt elbeszélésére tett talán legkülönlegesebb kísérlet. ','art-spiegelman-a-teljes-maus--kepregeny-uj-kiadas-244714.jpg'),(34,4,'Azadeh Moaveni','Fiatal özvegyek menedéke - Az Iszlám Állam asszonyai',3173,'„Elképesztő téma, elképesztően jól megírva. Mellbe vágja az olvasót… Rendkívül fontos könyv.” – The Guardian\r\n\r\n\r\nTizenhárom nő története, akik előbb csatlakoztak az Iszlám Államhoz, majd túlélték azt, és akik közül néhányan a végén sikeresen megszöktek – ez a beszámoló a Pulitzer-díjra jelölt szerző több éven át tartó, átfogó kutatómunkájának eredménye.','azadeh-moaveni-fiatal-ozvegyek-menedeke--az-iszlam-allam-asszonyai-235408.jpg'),(35,4,'Adam Higginbotham','Éjfél Csernobilban - A világ legnagyobb nukleáris katasztrófájának (eddig) elmondatlan története',3794,'„Legaszov (…) hátat fordított minden politikai ortodoxiának, amiben tinédzserkora óta hitt, és kijelentette: a szovjet tudomány utat tévesztett. (…) Nem pár nemtörődöm reaktorkezelő, hanem a szovjet szocialista kísérlet alapvető hibája vezetett a négyes blokk katasztrófájához.”\r\n\r\nHigginbotham kimerítő kutatáson alapuló dokumentumregénye részletekben bővelkedő, olvasmányos elbeszélése a csernobili atomkatasztrófának, úgy, ahogy még sohasem olvashattuk.','adam-higginbotham-ejfel-csernobilban--a-vilag-legnagyobb-nuklearis-katasztrofajanak-eddig-elmondatlan-tortenete-232585.jpg'),(36,4,'Susan Nagel','Mária Terézia - Mária Antónia lányának sorsa',3449,'Mária Terézia Sarolta, Magyarország uralkodójának unokája a francia monarchia zűrzavaros utolsó napjaiban eltűnt a nyilvánosság elől. A forradalmárok a kislányt a királlyal, öccsével, a kis Lajos Károly trónörökössel, nagynénjével és édesanyjával együtt börtönbe vetették. Amikor végül 1795 decemberében az akkor tizenhét éves Mária Terézia, XVI. Lajos és Mária Antónia utolsó életben maradt gyermeke kiszabadult, családja sorsáról mit sem tudva bizonytalan jövő elé nézett: egyszerre volt árva, száműzött és különféle politikai tervek önkéntelen főszereplője.','susan-nagel-maria-terezia--maria-antonia-lanyanak-sorsa-220897.jpg'),(37,4,'Margaret Rodenberg','Napóleon nyomában',3794,'\"Napóleon utolsó évei, intrikusok között, fájdalmas veszteségekkel, Rodenberg szemével, aki minden elismerést megérdemel lelkiismeretes kutatóként és tehetséges íróként egyaránt… Megjelenítő erővel láttatja egy lenyűgöző történelmi személyiség életének alkonyát.\"\r\n- KIRKUS REVIEWS','margaret-rodenberg-napoleon-nyomaban-247200.jpg'),(38,4,'Frank McDonough','A GESTAPO - Hitler titkosrendőrsége',3284,'A náci Németország titkosrendőrsége Adolf Hitler 1933-as hatalomra jutását követően jött létre, majd számos szervezeti átalakítás után 1939-ben nyerte el végső formáját. A Gestapót a nürnbergi törvényszék háborús bűnösnek nyilvánította és feloszlatta. A szakmai közönségnek szóló történeti kutatásokon kívül a titkos államrendőrségről alkotott képet a II. világháború befejezése óta eltelt több mint fél évszázad során a populáris kultúra alkotásai, filmek, regények határozták meg. Ezekben az ábrázolásokban a Gestapo általában gonosz, vérszomjas, vadállatias, időnként nem túl okos ügynököket alkalmazó, mindent behálózó szervezetként jelenik meg.','frank-mcdonough-a-gestapo--hitler-titkosrendorsege-248283.jpg'),(39,4,'Adrian Weale','A gonosz serege - Az SS története',3284,'A náci Németországban Schutzstaffelnek nevezték. A világ a rettegett SS-ként ismerte meg – a Harmadik Birodalom leghűségesebb és legkönyörtelenebb erőszakszervezeteként. Kezdetben csak egy politikai verőemberekből álló kis osztag volt. Mégis, 1935 végére az SS magához ragadta Németország összes rendőrségi és belbiztonsági hatáskörét – a kis falvak „csendőreitől” kezdve egészen a politikai titkosrendőrségig és a Gestapóig. Végül pedig a fegyveres ága még Németország hivatalos hadseregének, a Wehrmachtnak is a riválisa lett.','adrian-weale-a-gonosz-serege--az-ss-tortenete-248509.jpg'),(40,4,'Nemere István','A korona kalandjai 3. - A Szent Korona története 1848-tól napjainkig',2554,'A magyar Szent Korona történetének befejező részét tartja kezében az olvasó. A harmadik kötet talán az előző kettőnél is izgalmasabb, noha ez nem a szerző érdeme: a koronával történtek olyan események az utolsó másfél száz évben, amelyek feszültebbek bármely kriminél, tévésorozatnál. 1849 és 1945 között háromszor elásták, a föld alá rejtették, nehogy rátaláljon egy-egy barbár, idegen hódító. Viselte a két utolsó uralkodó, Ferenc József és az első világháború vége felé IV. Károly. Voltak felfelé ívelő, szép szakaszai azokban a korokban, és voltak szégyenteljes bukásai, hiszen a korona mindig együtt haladt a magyar nép történetével.','nemere-istvan-a-korona-kalandjai-3-a-szent-korona-tortenete-1848-tol-napjainkig-235567.jpg'),(41,4,'Drábik János','A magyarok harmadik útja 1956.',1824,'1956 magyar forradalma lépés volt a világ egész jövőjét érintő harmadik út irányába. Ez a korán jött forradalom akkor nem érhette el célját. Az állammonopolista diktatúrán alapuló kommunista reálszocializmus csődje nem jelenti azt, hogy a szervezett pénzhatalom diktatúráján alapuló pénzuralmi rendszer ne lenne maga is zsákutca. Mind az állammonopolista, mind a magánmonopolista uralkodó osztály azt hirdeti, hogy nincs harmadik út.','drabik-janos-a-magyarok-harmadik-utja-1956-135201.jpg'),(42,4,'Hüse Lajos','Álmos haragja - A turul árnyékában',2919,'Kr. u. 880. Az Etel folyó mellett elterülő sztyeppén élő magyari törzsekre egyre nagyobb nyomás nehezedik kelet felől: a besenyők betörései megszaporodnak, és nyilvánvaló, hogy ezek a támadások csak előszelei egy nagyobb viharnak, az összes besenyő törzs nyugat felé vonulásának. A magyarok lassan, de biztosan harapófogóba kerülnek a keleti lovasnépek és a nyugati birodalmak, Bizánc és a Bolgár Cárság között. Mindemellett a magyarok törzsszövetsége is megosztott: Levedi, a kündü csak a megyer és a kürtgyarmat törzsek támogatását bírja, a másik öt törzs a gyulát, Álmost támogatja.','huse-lajos-almos-haragja--a-turul-arnyekaban-235568.jpg'),(43,4,'Nemere István','Árpád és fiai - A Turul nemzetsége',2554,'Nemere István új történelmi regénye a honfoglalástól Árpád fejedelem haláláig terjedő időszakot dolgozza fel, részben a rendelkezésre álló szűkös források, részben az írói képzelet alapján. A X. században a Kárpát-medencébe érkező magyar törzsek előtt két sorsdöntő feladat állt: az új hazában való végleges berendezkedés, illetve a határok biztosítása, különös tekintettel a Keleti Frank Királysággal határos nyugati gyepűre. A szerző árnyaltan és átfogóan örökíti meg a történettudományban sokáig csak a „kalandozások korának” nevezett időszak első évtizedeit.','nemere-istvan-arpad-es-fiai--a-turul-nemzetsege-240118.jpg'),(44,5,'Jasmina Trifoni','A világ legszebb túraútvonalai',4139,'Túrázók nagykönyve könyvsorozatunk legújabb kötete ezúttal a világ száz különleges helyszínére kalauzolja az olvasót. Könyvünkben a gyalog-, a biciklis, a lovas, az autós, illetve a tengeri és édesvízi túrák szerelmesei éppúgy megtalálhatják az ideális úti célt, mint az extrém sportok rajongói. Gyűjteményünkben könnyebb, közepesen nehéz és kifejezetten nehéz, komoly felkészültséget igénylő kalandtúrák is helyet kaptak – bármelyiket válassza is, egyvalami garantált: életre szóló élményben lesz része.','jasmina-trifoni-a-vilag-legszebb-turautvonalai-turazok-nagykonyve-223953.jpg'),(45,5,'Dr. Nagy Balázs','Magyarország legszebb túraútvonalai - Kilátók',4829,'Várak, kastélyok, erdők és mezők mind-mind lélegzetelállító látképpel és kincsekkel örvendeztetnek meg bennünket, de mi fogható ahhoz, amikor egy hosszas kaptató után szemünk elé tárul a várva várt, mesés panoráma? Minden tájegység büszkélkedhet olyan kilátóhellyel, amely párját ritkítja az országban vagy akár a kontinensen. Kötetünkben ezek közül választottuk ki és jártuk be azokat az utakat, amelyek talán hazánk legszebb tájaival gyönyörködtetik az arra kiránduló, szerencsés turistákat.','dr-nagy-balazs-magyarorszag-legszebb-turautvonalai--kilatok-turazok-nagykonyve-243096.jpg'),(46,5,'Simon J. Woolf','Bakancslista: BOR - 1000 kaland a bor jegyében',5833,'A legkiválóbb borok lelkes rajongójaként és a #WineWednesdays kezdeményezés támogatójaként egyaránt örömmel fogjuk majd kézbe a Bakancslista: Bor című kötetet, amely egy olyan világ körüli boros kalandra invitál, amelyre mindig is vágytunk. A legkülönlegesebb rendezvényektől és fesztiváloktól a világ legszebb dűlőinek bejárásán át a legízletesebb borok végigkóstolásáig a kötetben található 1000 kaland során megtapasztalhatjuk mindazt, amit a bor élvezete nyújthat az embernek. ','simon-j-woolf-bakancslista-bor--1000-kaland-a-bor-jegyeben-237895.jpg'),(47,5,'Kath Stathers','Bakancslista: Útinapló - Írjuk meg saját kalandjaink könyvét!',3267,'Készítsük el saját álomutazásaink katalógusát, és jegyezzük fel legcsodásabb úti élményeinket! Ez az igényes kivitelezésű napló gondolatébresztő idézeteket, kedvcsináló listákat és gyönyörű fényképeket tartalmaz, amelyek segítséget nyújthatnak következő kalandjaink kiválasztásához. Az útinaplóban megörökíthetjük kedvenc élményeinket és izgalmas utazásaink legfontosabb mozzanatait.','kath-stathers-bakancslista-utinaplo--irjuk-meg-sajat-kalandjaink-konyvet-237896.jpg'),(48,5,'Balogh Tamás','A Börzsöny és a Cserhát kalandkönyve - Karancs Medves',3212,'\"Folyók ölelte, patakok szabdalta, szép és izgalmas régiókat szeretnék bemutatni a tizedik Kalandkönyvemben. A szigorú, ámde gyönyörű Börzsöny, ahol napokra eltűnhetünk a világ szeme elől, a dimbes-dombos Cserhát apró falvak tucatjaival, bennük a múlt különleges emlékeivel. Aztán ott ágaskodik a Karancs és futnak el tőle meredek gerincek és völgyek szanaszét, hogy aztán a völgy túloldalán a Medves és a testvéri szlovák erdők bazaltjaira épült várak integessenek. Csupa békés falu, bányász emlékek garmadája, kő, erdő és vízcsobogás.','balogh-tamas-a-borzsony-es-a-cserhat-kalandkonyve--karancs-medves-245742.jpg'),(49,5,'Berlitz Útikönyvek','Ausztrália /Berlitz barangoló',2475,'Ismerjük meg a kenguruk és természeti csodák kontinensét, Ausztráliát. Ausztrália óriási. Természeti tájai is ennek megfelelően változatosak: mindent megtalálunk benne a vörös sivatagtól a zöldellő esőerdőkig, a homokfövenyes tengerparttól a hófödte hegycsúcsokig. A festői tájak nagyvárosaiban az élet minden kényelmét élvezhetjük, általában tengerparti strandokkal és nemzeti parkokkal.','berlitz-utikonyvek-ausztralia-berlitz-barangolo-223915.jpg'),(50,5,'Marco Polo Útikönyv','Bécs /Marco Polo',1818,'Naprakész információk, bárhová utazunk! Kalandok és élmények 24 órába sűrítve. Ötletek és javaslatok, hogy kevés pénzből hogyan érezzük jól magunkat és hová menjünk vásárolni. Minden fejezet végén takarékos ajánlat. Új fejezetek: zene, klubok, művészet és építészet, kulturális élet és étkezési szokások, minden fontos esemény, dátum és cím! Hasznos internet oldalak, interaktív térképek, telefonszámok és e-mail címek.','marco-polo-utikonyv-becs-marco-polo-221284.jpg'),(51,5,'Vujity Tvrtko','Aloha - Túl minden határon',3285,'Vujity Tvrtko legizgalmasabb, legszínesebb könyvét tartja kezében a Kedves Olvasó. Körbeutazhatja a világot, megismerheti Hawaii páratlan csodáit, a béke és a nyugalom birodalmát. Tvrtko egyszer csak úgy döntött, hogy - miután megnézte a földi Pokol megannyi bugyrát - elköltözik a Paradicsomba, ahol szabadidejében önkéntes vadőrként teknősökre vigyáz, egész nap ukulelezenét hallgat, és átadja magát az igazi Alohának. Együtt sétálhatnak a riporterrel a Csendes-óceán partján, valamint a Különleges Emberek Temetőjében, és bebarangolhatják Gyuri házidzsungelét is. A magyar asztalos megunta a betondzsungelt, és vett magának egy igazi őserdőt, ahol papagájok, orchideák és vízezések között él a szivárványok szigetén.','vujity-tvrtko-aloha--tul-minden-hataron-243204.jpg'),(52,5,'Erdős László','A Villányi-hegység élővilága - Kalauz természetbarátoknak',2336,'A Villányi-hegység vonzereje régóta lenyűgözi mindazokat, akik fogékonyak a természet szépségeire.\r\nErdős László már gyerekkora óta érdeklődik a természet, az élővilág iránt. Jelenleg a Magyar Tudományos Akadémia Ökológiai Kutatóközpontjának tudományos munkatársa. Első, díjnyertes könyvében (Zöld hősök Assisi Szent Ferenctől Arnold Schwarzeneggerig) a környezet-, természet- és állatvédelem legnagyobb alakjait mutatta be az érdeklődő olvasóknak','erdos-laszlo-a-villanyi-hegyseg-elovilaga--kalauz-termeszetbaratoknak-223759.jpg'),(53,5,'Sediánszky Nóra','A fény felé - Kalandozások Normandiában és Bretagne-ban',2175,'A fény felé Sediánszky Nóra immár harmadik, komoly kulturális és ismeretterjesztő értéket képviselő útleírása, útirajza. Ezúttal nem egy konkrét, ismert várost igyekszik feltérképezni gazdag művelődés- és művészettörténeti adattár, ismertető anyag, személyes élmények, különböző anekdoták, valós és elképzelt séták, kulturális és kulináris csemegék segítségével, hanem Észak-Franciaország műemlékekben és természeti szépségekben két leggazdagabb tájegységét, Normandiát és Bretagne-t.','sedianszky-nora-a-feny-fele--kalandozasok-normandiaban-es-bretagne-ban-225296.jpg'),(54,6,'Válogatás','Cupcake-ek & muffinok - Édes kis könyvek',1299,'Lehetnek gyümölcsösek vagy csokoládésak, készülhetnek alkohollal, rafinált és kreatív módokon, boríthatja őket lágy krém vagy díszes hab - a fenséges cupcake-ek és muffinok egyszerűen ellenálhatatlanok! Még jó, hogy a könyvben több tucatnyi variációjuk megtalálható.','valogatas-cupcake-ek-muffinok--edes-kis-konyvek-237426.jpg'),(55,6,'Sabine Durdel-Hoffmann','Gázgrill - Grillételek gyűjteménye - Alapvető trükkök és a legjobb receptek',2759,'Szaftos steakek, pirosra sült oldalas, ropogós csirkeszárny és ínycsiklandó vegeteriánus BBQ-fogások - egy gázgrillel gyerekjáték lesz a tökéletes grillvacsora. A szerkezeten azok a receptek is sikerülni fognak, amelyeket a profik a faszenes grillen készítenek el. A gázgrillt könnyű kezelni, és egyszerűen szabályozható rajta a hőfok is.','sabine-durdel-hoffmann-gazgrill--grilletelek-gyujtemenye--alapveto-trukkok-es-a-legjobb-receptek-248989.jpg'),(56,6,'Sabine Durdel-Hoffmann','A legtüzesebb grillkönyv - Alapok, technikák és ínycsiklandó fogások a grillrácsról',2759,'Azt szeretnénk, ha önt is megperzselné a füstös érzés, és nagy hévvel vágna bele a grillezésbe! Ehhez felsorakoztatjuk a legjobb recepteket, amelyek garantáltan tűzbe hozzák. Indulhat is a forró nyár!','sabine-durdel-hoffmann-a-legtuzesebb-grillkonyv--alapok-technikak-es-inycsiklando-fogasok-a-grillracsrol-248992.jpg'),(57,6,'Sabine Durdel-Hoffmann','Tiszta Amerika... - Burger a grillről - Hússal és hús nélkül',2759,'A legfinomabb burgerreceptek a klasszikusoktól a vegetáriánus változatokig, a dupla burgertől a tengeri herkentyűs különlegességig; burgerek marhából, sertésből, csirkéből, bárányból, hallal vagy zöldséggel. Ismerd meg az elkészítés minden csínját-bínját, tökéletesítsd a burgermámort házi zsemlével, mennyei köretekkel, szószokkal és salátákkal.','sabine-durdel-hoffmann-tiszta-amerika-burger-a-grillrol--hussal-es-hus-nelkul-248993.jpg'),(58,6,'Csigó László, Hargitai György','A D-vitamin-csoda /A gyógyító szakács',990,'A D-vitamin a Nap vitaminja - mindannyian hallottuk már ezt a kifejezést, abba azonban nem gondolunk bele, hogy a hidegebb, őszi-téli időszakban egyre kevesebb napfény ér bennünket, ezáltal D-vitamin-szintünk jelentősen csökkenhet. Ha nem pótoljuk megfelelően a hiányát, gyermekkorban csontfejlődési zavarok, a felnőtteknél fáradtság, álmatlanság, izomgyengeség, étvágytalanság, fogromlás, mészhiány vagy akár csontlágyulás is jelentkezhet. A gyógyító szakács sorozatunk legújabb kötetében mesterszakácsunk erre a problémára kínál megoldást.','csigo-laszlo-a-d-vitamin-csoda-a-gyogyito-szakacs-205715.jpg'),(59,6,'Csigó Zita, Kocsis Bálint, Szeleczky-Takács Viktória','Gasztroajándékok, minden alkalomra',4139,'Az utóbbi években minket is elért gasztronómiai forradalom méltán legszerethetőbb vívmányai a \"homemade\", azaz otthon készített ehető-iható meglepetések. Legyen szó karácsonyról vagy születésnapról, ballagásról, kerti partiról vagy halloweenról, ajándékot adni és kapni egyaránt öröm. És hogy mi minden kerülhet ki a kamrából? Erre nyújt választ könyvünk édes és sós finomságok kimeríthetetlen tárházát felsorakoztatva az olvasó előtt. Sőt nemcsak főzésre és sütésre invitál, hanem megmutatja azt is, hogy miképp bújtatható egyedi köntösbe az elkészült gasztroajándék. Adjunk a kiválasztott recepthez egy csipetnyi szeretetet, és a hatás garantáltan nem marad el!','valogatas-cupcake-ek-muffinok--edes-kis-konyvek-237426.jpg'),(60,6,'Meng Tünde','Gyomorkímélő ételek /A gyógyító szakács',990,'Mindannyian szeretünk jókat enni, a minőséget azonban sokszor összekeverjük a mennyiséggel. Tendencia, hogy a mai világban egyre kevesebb időt szentelünk a fogások elkészítésére, és egyre kevésbé vagyunk körültekintőek, mikor az alapanyagokat válogatjuk. A helytelen táplálkozásból eredő elhízás, illetve az emésztési zavarok és a szervi megbetegedések növekvő száma súlyos probléma. Ha szeretnénk sokáig és egészségesen élni, nagyon fontos, hogy kiegyensúlyozott életvitelre törekedjünk, és tudatosan változtassunk az étkezési kultúránkon: gyomor- és egészségkímélő ételeket fogyasszunk. ','meng-tunde-gyomorkimelo-etelek-a-gyogyito-szakacs-201766.jpg'),(61,6,'Csigó Zita, Kocsis Bálint','Retro sütemények - újratöltve /Gyerekkorunk ízei és újragondolt változataik egy szakácskönyvben',3794,'\r\n\"Végy 3 rész lisztet, 2 rész zsiradékot, 1 rész cukrot és 1 tojássárgáját. Adj hozzá csipetnyi nosztalgiát, és máris elkészült nagymamáink linzertésztája. Majd keverj mindehhez jókora kanállal a mai süteménytrendekből, így lesz a régiből XXI. századi desszert.\"\r\nSzakácskönyvünk erre az izgalmas kettősségre épül: időutazásra hív, hogy sorra vegye a retro korszak emlékezetes édességeit. A közértekben újra kapható a téli fagyi, a játszótéren a gyerekek sajtos tallért ropogtatnak, és az esti kártyapartihoz magos kockát szórunk a fajanszkínálóba.','csigo-zita-retro-sutemenyek--ujratoltve-gyerekkorunk-izei-es-ujragondolt-valtozataik-egy-szakacskonyvben-209314.jpg'),(62,6,'Kerekes Sándor','33 partisütemény /Lépésről lépésre',590,'Tombol a partidesszert-őrület! Az egész világon mindenki a habkönnyű macaronért, a mókás Cake Popért és a mámorító retró nyalókáért van oda. Nem véletlenül. Aki egyszer is megkóstolja ezeket a különleges desszerteket, rabul esett: ellenállhatatlan ízviláguktól többé nem tud szabadulni. Szakácskönyvsorozatunk legújabb kötetében mestercukrászunk ezúttal a partisütemények rajongóinak kedveskedik az ínycsiklandó desszertek válogatott receptjeivel.','kerekes-sandor-33-partisutemeny-lepesrol-lepesre-201767.jpg'),(63,6,'Meng Tünde','Finom falatok kiránduláshoz - Túrázók szakácskönyve',2759,'Legyen szó túrázásról vagy hangulatos piknikezésről a domboldalban, családunk vagy barátaink körében, a szabadban eltöltött idő nagyban hozzájárul testi és lelki egészségünkhöz. Akár csak néhány órára is érdemes kimenni a természetbe – nem mindegy azonban, ilyenkor mit veszünk magunkhoz.','meng-tunde-finom-falatok-kirandulashoz--turazok-szakacskonyve-227922.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bfarmdb'
--

--
-- Dumping routines for database 'bfarmdb'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STRING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bfarm`@`%` FUNCTION `SPLIT_STRING`(str VARCHAR(255), delim VARCHAR(12), pos INT) RETURNS varchar(255) CHARSET utf8mb4
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos), LENGTH(SUBSTRING_INDEX(str, delim, pos-1)) + 1), delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 22:38:02
