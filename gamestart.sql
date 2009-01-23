BEGIN TRANSACTION;
CREATE TABLE permission (
    id INTEGER PRIMARY KEY,
    permission_name VARCHAR (16) NOT NULL UNIQUE,
    description VARCHAR (255)
);
CREATE TABLE node (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    hex INT NOT NULL UNIQUE,
    text TEXT,
    oneword TEXT,
    quickdesc TEXT,
    deaduntil INT,
    rumorsatonce INT,
    rumorsperday INT, 
    special BOOLEAN, 
    expired BOOLEAN);
INSERT INTO "node" VALUES(1,'Hapu',314,'You are standing in the heart of Thebes commerce: the Great Bazaar.  The hubbub of voices surrounds you; the cry of merchants and hawkers mixes with the rumble of carts and the noises of livestock.  A riotous medley of smells greets your nose, baked dry in the Egyptian heat.  Before you stands a short, grinning man.  "What do you wish to buy?  Anything you want can be yours," he says, gesturing to the many stalls surrounding you.','**CENTER**','Guide to the Bazaar',0,0,0,0,0);
INSERT INTO "node" VALUES(2,'Djeserka',316,'This large brick building is pleasantly cool.  You are surrounded by laborers and peasants drinking wheat beer and discussing the day''s events.  Noticing you, the tavern-keeper asks, "What''ll you have?" ','Tavern','Tavern Keeper',0,4,20,0,0);
INSERT INTO "node" VALUES(3,'Iymeru',318,'This rotund older woman laughs heartily as you approach her.  "Let me tell you, I''ve seen it all, I know it all."  You don''t doubt it.','Gossip','City Gossip',0,5,50,0,0);
INSERT INTO "node" VALUES(4,'Kanakht',215,'This large, dark-skinned man is sitting on a stool, carefully whittling a long wooden spear with his stone knife.  Noticing you, he gestures wordlessly at the rack of honed spears that makes up the front of his stall.','Spears','Shaper of Spears',0,1,4,0,0);
INSERT INTO "node" VALUES(5,'Si-Mut',217,'This man is hooded, despite the hot day.  In a gravelly voice, he describes the many wonderful attributes of his shortblades.','Daggers','Protection for the Discreet Buyer',0,1,4,0,0);
INSERT INTO "node" VALUES(6,'Taharqa',219,'The source of this extraordinarily twitchy man''s quickness becomes apparent when he draws you aside and offers to sell you his special elixir.','+Scratch','the Fastest Man in Thebes',0,1,3,0,0);
INSERT INTO "node" VALUES(7,'Kysen',221,'Refusing to step from the shadows, this mysterious man rumbles, "I got out of the assassination business when Akhenaten died, but I''m willing to sell you what I''ve got."  You don''t want to get too close...','C Poison','Specialist in Irritation Removal',0,1,2,0,0);
INSERT INTO "node" VALUES(8,'Minkhat',222,'This unidentifiable person wears a mask that covers their entire face.  Speaking in a whisper, he exhorts you to purchase his deadly wares.','R Poison','the Viper',0,1,5,0,0);
INSERT INTO "node" VALUES(9,'Heqaib',322,'"Why don''t you step a little closer," rumbles this jovial-looking fat man.  His cheerfulness is at an utter contrast to his reputation -- and to his small stock of deadly venoms.','R Poison','the Nightbringer',0,1,5,0,0);
INSERT INTO "node" VALUES(10,'Manetho',213,'This wiry-looking man has an array of tools and equipment available.  Despite their mundane nature, they look well-made.','Tomb Raid','Supplier to Crafters',0,2,10,0,0);
INSERT INTO "node" VALUES(11,'Padiamun',312,'The heady smell of incense fills your nostrils as you glance at the rotund man behind the stall.  He chuckles as you survey his selection of incense, then whispers, "Not the finest in the city, but certainly the cheapest, eh?"  You certainly can''t argue with his assessment.','C Incense','Purveyor of Finest Incense',0,2,10,0,0);
INSERT INTO "node" VALUES(12,'Kenefer',313,'Chattering brightly, this smiling woman gives you a rapid description of her many herbal ingredients.  She interprets every glance as a potential purchase, which gets annoying rather quickly.','C Herbal','Quality Herbalism Ingredients',0,3,16,0,0);
INSERT INTO "node" VALUES(13,'Netihur',315,'"Warts?" shrieks this unpleasant-looking woman.  "Blisters?"  She peers at you.  "Hives?"  Mutely shaking your head, you cheer up when you notice her stock of considerably more useful elixirs.','C Elixirs','Curatives and Restoratives',0,3,12,0,0);
INSERT INTO "node" VALUES(14,'Neswy',416,'Grinding something quietly behind a table, this older woman disdains the shouting favored by so many in the market.  When you remark on this, she responds, "I prefer to let my wares speak for themselves."','U Elixirs','Brewer of Fine Decoctions',0,1,4,0,0);
INSERT INTO "node" VALUES(15,'Peraha',415,'This snooty young man can''t wait to tell you all about his potion-making skills.  "I''ll be the royal herbalist one day, just you wait!" he says hotly.  With an attitude like that, he''ll be lucky to reach the age of eighteen, let alone the Pharaoh''s court.  He does appear to be skilled, though...','R Elixirs','Maker of Potions Most Wondrous',0,2,6,0,0);
INSERT INTO "node" VALUES(16,'Qenymin',417,'As you approach, this dark-skinned man looks up, carefully setting down a vial of something foul-looking.  "If you''re looking to buy elixirs, you won''t find any better than mine."','R Elixir','Learned in the Herbal Arts',0,1,3,0,0);
INSERT INTO "node" VALUES(17,'Tjenna',419,'This petite, dusky woman has a small stock of tiny bottles arranged before her.  "This little mixture has brought more people back from the brink than a dozen priests," she murmurs.  When you ask what goes into it, she blinks owlishly.  "Oh, a little of this, a little of that."','Heal Elixir','of the Healing Hands',0,1,1,0,0);
INSERT INTO "node" VALUES(18,'Wepmose',412,'This leathery woman barks a bitter laugh as you survey her goods. "Go on, buy something.  Don''t just stand there."','C Herbal','Herbal Supplier to the Great',0,3,12,0,0);
INSERT INTO "node" VALUES(19,'Haankhef',411,'This odd-looking man has arranged a bewildering array of plants on a small table.  Grinning brightly, he tells you that they''re herbal ingredients.  You have no doubt whatsoever that they are.','U Herbal','Exotic Gardener',0,2,4,0,0);
INSERT INTO "node" VALUES(20,'Ha-Nakte',413,'As you study his products, this well-traveled man regales you with stories of the far reaches of the world. "Athens, now, there''s a sight to see..."  Stories aside, his stock is fairly impressive.','U Herbal','Trader in Rare Ingredients',0,4,10,0,0);
INSERT INTO "node" VALUES(21,'Siese',410,'Despite the searing heat, this man is swaddled from head to foot in curious cloth garments.  Without speaking, he gestures towards his curious collection of ingredients.','U Herbal','Supplier of Eclectic Integrants',0,0,0,0,0);
INSERT INTO "node" VALUES(22,'Pabasa',510,'This flustered man hurriedly explains that his shipment of the rarest ingredients was late, thank you very much.  When you press him, he responds, "Well, I might know a man or two who does have those items, but why not consider my fine ingredients instead?"','U Herbal','Procurer of the Rare and Curious',0,1,4,0,0);
INSERT INTO "node" VALUES(23,'Hunefer',508,'The reputation of this tall woman precedes her - she is known for being able to find the rarest of ingredients in the harsh Egyptian desert.  Sure enough, her outstretched hands reveal a small collection.  Looking over her shoulder, she hisses, "Going to buy, or shall I go?" ','R Herbal','the Finder',0,1,5,0,0);
INSERT INTO "node" VALUES(24,'Nimlot',511,'This man''s nose, while impressive, is not the source of his name.  That would be his knack for finding ingredients, exemplified in the carefully-arranged assortment that lies before you.  Your eyes pop as you stare at some of Egypt''s most valuable treasures.','R Herbal','the Nose',0,1,5,0,0);
INSERT INTO "node" VALUES(25,'Hemaka',408,'Wearing a broad-brimmed hat and carrying a complicated apparatus, this woman does not resemble her reputation as the most accomplished handler of venomous creatures in Thebes.  She shows you a collection of tiny cages and small glass bottles, each more deadly than the next.','R Herbal','the Whisperer',0,1,5,0,0);
INSERT INTO "node" VALUES(26,'Iu-Amun',310,'This flowery man is only too eager to have you purchase his incense.  "Ah, it is the finest you shall ever see, my friend?  Could you ever doubt it?"  Doubt it you can.','C Incense','Most Glorious Incense ',0,2,12,0,0);
INSERT INTO "node" VALUES(27,'Gua',308,'"Don''t listen to what Meketre has to say," hisses this thin woman.  "I have the finest incense in all the Nile lands, make no mistake.  Let not his foul lies dissuade you!"','U Incense','Finest Incense in Egypt',0,2,8,0,0);
INSERT INTO "node" VALUES(28,'Meketre',209,'The enormous man before you grumbles, "Gua is a filthy liar and a harridan. Would I sell you anything but the most exquisite incense Egypt has ever seen?"  When you make no reply, he looks upset and continues fiercely, "I most certainly would not!"  Shaking your head, you glance over at his wares.','U Incense','Finest Incense in Egypt',0,2,8,0,0);
INSERT INTO "node" VALUES(29,'Meryawy',208,'"Ssshhh," this emaciated woman whispers.  With one free hand, she slowly unwraps a bundle of cloth containing a small quantity of Egypt''s most valuable incense.','R Incense','the Sage',0,1,5,0,0);
INSERT INTO "node" VALUES(30,'Yii',307,'This man''s skin is so black as to be almost blue.  Ever so carefully, he opens a small sandalwood box to reveal samples of incense so dark it drinks up the light.','R Incense','the Dark-seeker',0,1,5,0,0);
INSERT INTO "node" VALUES(31,'Rekhmire',211,'Gazing sadly at you, this young woman speaks solemnly of her many wares.  "You wouldn''t want your loved one to spend eternity lacking for anything," she says meaningfully, "... would you?" ','Tomb Supply','Funerary Essentials',0,2,14,0,0);
INSERT INTO "node" VALUES(32,'Zazamoukh',212,'This flamboyant foreigner chants praises to his goods in a singsong voice.  "Rare, valuable, ex-citing!  Come see, come buy!"','Exotic Goods','Master of Exotic Rarities',0,2,16,0,0);
INSERT INTO "node" VALUES(33,'Yanhamu',111,'This fat man sits in a heavily guarded brick building.  With a nod to his guards, he shows you his central room, filled with priceless gold and jewels.  "Priceless?" he says, when you ask. "No, not priceless...  Let''s talk."','Luxury Goods','Purveyor of Fantastic Luxury',0,1,6,0,0);
INSERT INTO "node" VALUES(34,'Salatis',214,'An array of finely honed and crafted axes meets your eye.  The scarred, burly man behind the stall rumbles, "Nothing beats an axe for getting what you want, when you want it."  You wonder what keeps him in legitimate business.','Axes','Master Axesmith',0,2,10,0,0);
INSERT INTO "node" VALUES(35,'Khahor',216,'This hefty woman holds your arm in an iron grip as she demonstrates the proper use of a shield.  "They''ll protect you without making you too hot," she promises loudly.','Shields','Shield-Crafter Extraordinaire',0,2,12,0,0);
INSERT INTO "node" VALUES(36,'Baenre',113,'The glitter from these begemmed and bejeweled weapons nearly blinds you.  "Ah, ah, welcome!" flutters the robed merchant, flitting about his shop.  "Do you wish a ruby-hilted sword?  Perhaps an ornamental spear would suit you better?"  He looks at you expectantly, wringing his hands.','Cerem Weapons','Weapons of Ceremony and Grace',0,3,15,0,0);
INSERT INTO "node" VALUES(37,'Khaemhet',115,'This young, muscular man bows shyly to you as you enter his establishment.  His modest smile is a marked contrast to the finely crafted bronze swords that line the walls.','Swords','Most Gifted in Swordcraft',0,1,7,0,0);
INSERT INTO "node" VALUES(38,'Penbuy',112,'Darting from side to side, this elderly man cackles at you.  "Can''t catch me!" he screeches.  When he finally slows down, he opens a pouch to reveal a small stock of defensive elixirs.','+Def','the Untouchable',0,1,10,0,0);
INSERT INTO "node" VALUES(39,'Bakt',114,'This solid-looking man has his feet planted firmly on the ground.  Extending one enormous fist, he grudgingly opens it, revealing a box. Inside lies a cache of glass bottles, the contents of which slosh madly from side to side despite the absolute stillness of their containers.','+Knockout','of the Hammerstroke',0,1,7,0,0);
INSERT INTO "node" VALUES(40,'Siptah',116,'This woman''s veins bulge horrifyingly upon her enormous arms.  Barely managing to hold it still, she presents a tray containing a set of vile-looking elixirs.','+Wound','the Grievous',0,1,6,0,0);
INSERT INTO "node" VALUES(41,'Makhtar',117,'"Greetings," says this quiet man.  "If you have the skill to wield a bow, you won''t find any out there better than mine."','Bows','Master Bowcrafter ',0,2,4,0,0);
INSERT INTO "node" VALUES(42,'Zerrekh',206,'"I found this out in the desert," says this small man. "It''s yours... if you pay me."','*DesertLotus*','Special Goods',0,0,0,1,0);
INSERT INTO "node" VALUES(43,'Okha',305,'"I bought this from a traveling Greek merchant," says this short woman.  "It''s yours... if you pay me."','*StarIris*','Special Goods',0,0,0,1,0);
INSERT INTO "node" VALUES(44,'Salmah',17,'"I made this myself," says this heavily mustachioed man.  "It''s yours... if you pay me."','*DisguiseKit*','Special Goods',0,0,0,1,0);
INSERT INTO "node" VALUES(45,'Rakhmir',11,'"I made this myself," says this thin, pale-faced man.  "It''s yours... if you pay me."','*DisguiseKit*','Special Goods',0,0,0,1,0);
INSERT INTO "node" VALUES(46,'Waddi',506,'"I found this on my last trip to Greece," says this rotund merchant.  "It''s yours... if you pay me."','*StarIris*','Special Goods',0,0,0,1,0);
INSERT INTO "node" VALUES(47,'Borakh',513,'"I found this out in the desert," says this red-faced woman.  "It''s yours... if you pay me."','*DesertLotus*','Special Goods',0,0,0,1,0);
CREATE TABLE node_secret (
hex_id INT NOT NULL,
secret_id INT NOT NULL
);
CREATE TABLE secret (
    id INTEGER PRIMARY KEY,
    password TEXT NOT NULL UNIQUE,
    passtext TEXT,
    moneycost INT,
    othercost TEXT,
    valid BOOLEAN
);
CREATE TABLE character (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    current_node INT,
    points INT,
    wealth INT,
    incomestat INT,
    marketstat INT,
    isdisguised BOOLEAN,
    hasdisguise BOOLEAN
);
INSERT INTO "character" VALUES(1,'The GMs',313,100,100,100,100,0,1);
INSERT INTO "character" VALUES(2,'Akana',314,2,20,20,2,0,1);
INSERT INTO "character" VALUES(3,'Kemnebi',314,1,40,40,1,0,0);
INSERT INTO "character" VALUES(4,'Nefertiti',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(5,'Saini',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(6,'Suten Anu',314,2,20,20,2,0,0);
INSERT INTO "character" VALUES(7,'Meti',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(8,'Seshafu',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(9,'Buikhu',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(10,'Nafrit',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(11,'Amenemhet',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(12,'Metit',314,0,10,10,0,0,0);
INSERT INTO "character" VALUES(13,'Nomti',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(14,'Nebi',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(15,'Manu',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(16,'Shushu',314,2,10,10,2,0,0);
INSERT INTO "character" VALUES(17,'Wakhakshem',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(18,'Sokkwi',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(19,'Itafe',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(20,'Awan',314,2,10,10,2,0,0);
INSERT INTO "character" VALUES(21,'Bai',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(22,'Paniwi',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(23,'Rasui',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(24,'Mshai',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(25,'Nsu',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(26,'Woserit',314,1,20,20,1,0,0);
INSERT INTO "character" VALUES(27,'Baraka',314,1,10,10,1,0,1);
INSERT INTO "character" VALUES(28,'Cecrops',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(29,'Pamphilos',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(30,'Eusebios',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(31,'Helladios',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(32,'Euthymius',314,2,10,10,2,0,0);
INSERT INTO "character" VALUES(33,'Ialu',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(34,'Mhotep',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(35,'Djadao',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(36,'Benipe',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(37,'Djal',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(38,'Kemosiri',314,1,10,10,1,0,1);
INSERT INTO "character" VALUES(39,'Irisi',314,0,20,20,0,0,0);
INSERT INTO "character" VALUES(40,'Talos',314,0,40,40,0,0,0);
INSERT INTO "character" VALUES(41,'Rettimo',314,1,10,10,1,0,1);
INSERT INTO "character" VALUES(42,'Ibbi-Adad',314,1,40,40,1,0,0);
INSERT INTO "character" VALUES(43,'Nidintu',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(44,'Ishtar',314,1,40,40,1,0,0);
INSERT INTO "character" VALUES(45,'Kushi',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(46,'Zannanza',314,1,40,40,1,0,0);
INSERT INTO "character" VALUES(47,'Hantili',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(48,'Oba',314,2,20,20,2,0,0);
INSERT INTO "character" VALUES(49,'Shenti',314,1,10,10,1,0,0);
INSERT INTO "character" VALUES(50,'Shepsit',314,0,0,0,0,0,0);
CREATE TABLE watchtable (
character INT NOT NULL,
node INT NOT NULL
);
CREATE TABLE node_users (
character_id INT NOT NULL,
node_id INT NOT NULL
);
CREATE TABLE interaction (
    id INTEGER PRIMARY KEY,
    character TEXT,
    day INT,
    date TIMESTAMP,
    node INT,
    item TEXT
);
INSERT INTO "interaction" VALUES(1,'DAY',1,'2009-01-17 16:58:01',0,'none');
CREATE TABLE notification (
    id INTEGER PRIMARY KEY,
    charname TEXT,
    text TEXT,
    visible BOOLEAN,
    date TIMESTAMP,
    new BOOLEAN
);
CREATE TABLE item (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    itemcardno INT,
    cost INT,
    avail INT,
    number INT
);
INSERT INTO "item" VALUES(1,'A Pocketknife',100,4,100,0);
INSERT INTO "item" VALUES(3,'A Fat, Healthy Chicken',200,5,100,0);
INSERT INTO "item" VALUES(4,'A Loaf of Fresh Wheat Bread',201,1,100,0);
INSERT INTO "item" VALUES(5,'A Fatted Goat',202,12,100,0);
INSERT INTO "item" VALUES(6,'A Strong, Well-Bred Ox',203,30,100,0);
INSERT INTO "item" VALUES(8,'A Piece of Fine White Chalk',251,2,100,0);
INSERT INTO "item" VALUES(9,'A Torch of Naphtha and Wax',204,2,100,0);
INSERT INTO "item" VALUES(10,'A Clove of the Finest Garlic',9048,2,500,0);
INSERT INTO "item" VALUES(11,'Leaves of the Olive Tree',9041,2,500,0);
INSERT INTO "item" VALUES(12,'Incense of Health',8826,5,30,0);
INSERT INTO "item" VALUES(13,'Incense of Strength',8329,5,30,0);
INSERT INTO "item" VALUES(14,'Incense of Longevity',8989,5,30,0);
INSERT INTO "item" VALUES(15,'Incense of Memory',8774,5,30,0);
INSERT INTO "item" VALUES(16,'Incense of Power',8093,15,20,0);
INSERT INTO "item" VALUES(17,'Incense of Wisdom',8486,15,20,0);
INSERT INTO "item" VALUES(18,'Incense of Time',8598,15,20,0);
INSERT INTO "item" VALUES(19,'Incense of Life',8240,40,15,0);
INSERT INTO "item" VALUES(20,'Incense of Death',8401,40,15,0);
INSERT INTO "item" VALUES(21,'Extract of Leech Blood',9250,4,100,0);
INSERT INTO "item" VALUES(22,'Frog Egg Albumen',9274,4,100,0);
INSERT INTO "item" VALUES(23,'White Water Lily Root Fiber',9104,3,100,0);
INSERT INTO "item" VALUES(24,'Blue Water Lily Stem Pulp',9171,3,100,0);
INSERT INTO "item" VALUES(25,'Fruit Bat Guano',9263,4,100,0);
INSERT INTO "item" VALUES(26,'Shell of the Common Scarab Beetle',9178,2,100,0);
INSERT INTO "item" VALUES(27,'Natron Salts',9026,2,100,0);
INSERT INTO "item" VALUES(28,'Poppy Extract',9332,5,50,0);
INSERT INTO "item" VALUES(29,'Freshwater Snail Slime',9319,5,50,0);
INSERT INTO "item" VALUES(30,'Papyrus Root',9223,5,50,0);
INSERT INTO "item" VALUES(31,'Ibis Egg Yolk',9268,5,50,0);
INSERT INTO "item" VALUES(35,'Exquisite Black River Pearl',9379,15,25,0);
INSERT INTO "item" VALUES(36,'Dried Egg of the Nile Crocodile',9386,15,25,0);
INSERT INTO "item" VALUES(37,'Preserved Tail of the Deathstalker Scorpion',9345,15,25,0);
INSERT INTO "item" VALUES(38,'Crystallized Albino Scarab Beetle',9407,15,10,0);
INSERT INTO "item" VALUES(39,'Bottled Venom of the Asp',9358,15,10,0);
INSERT INTO "item" VALUES(40,'Desert Lotus',9449,50,1000,0);
INSERT INTO "item" VALUES(41,'Star Iris',9426,50,1000,0);
INSERT INTO "item" VALUES(42,'Anubis'' Courage',8815,5,40,0);
INSERT INTO "item" VALUES(43,'Khanakt''s Mental Restorative',8990,5,40,0);
INSERT INTO "item" VALUES(44,'Hetepnebi''s Limb Regenerative',8361,30,8,0);
INSERT INTO "item" VALUES(45,'Vermilion Decoction of Awakening',8113,10,40,0);
INSERT INTO "item" VALUES(46,'Soldier''s Friend',8269,10,40,0);
INSERT INTO "item" VALUES(47,'Bakkenaphi''s Immune Booster',8695,10,40,0);
INSERT INTO "item" VALUES(48,'Respiratory Enhancement Tincture',8536,30,10,0);
INSERT INTO "item" VALUES(49,'Fortificative Draught',8978,30,10,0);
INSERT INTO "item" VALUES(50,'Might of Amen-Ra',8404,30,10,0);
INSERT INTO "item" VALUES(51,'Cordial of the Red Wound',8220,20,15,0);
INSERT INTO "item" VALUES(52,'Oil of the Brute',8357,20,15,0);
INSERT INTO "item" VALUES(53,'Potion of the Viper Strike',8010,20,15,0);
INSERT INTO "item" VALUES(55,'Iawy''s Lesser Purgative',8740,30,40,0);
INSERT INTO "item" VALUES(56,'Tjenna''s Salve of Mending',8325,15,15,0);
INSERT INTO "item" VALUES(57,'Broad Bronze Sword',103,25,10,0);
INSERT INTO "item" VALUES(58,'Bronze-headed Axe',104,15,20,0);
INSERT INTO "item" VALUES(59,'A Thin Dagger',101,15,20,0);
INSERT INTO "item" VALUES(60,'A Narrow Wooden Spear',105,10,30,0);
INSERT INTO "item" VALUES(61,'A Leather Shield',106,20,20,0);
INSERT INTO "item" VALUES(62,'A Shawabti Statue',203,5,50,0);
INSERT INTO "item" VALUES(63,'A Chisel',205,4,100,0);
INSERT INTO "item" VALUES(64,'A Coil of Reinforced Rope',206,6,30,0);
INSERT INTO "item" VALUES(65,'A Well-Made Wooden Ladder',207,5,30,0);
INSERT INTO "item" VALUES(66,'A Shovel',208,3,100,0);
INSERT INTO "item" VALUES(67,'A Small Tin of Olive Oil',108,15,10,0);
INSERT INTO "item" VALUES(68,'A Mug of Strong Beer',109,1,1000,0);
INSERT INTO "item" VALUES(69,'A Heavy Wooden Club',209,3,100,0);
INSERT INTO "item" VALUES(70,'A Wooden Bow and Arrow',107,3,100,0);
INSERT INTO "item" VALUES(71,'Oil of Enduring Might',8120,8,30,0);
INSERT INTO "item" VALUES(72,'Draught of the Stalwart Defender',8140,30,30,0);
INSERT INTO "item" VALUES(73,'Miasmic Blood Venin',8510,40,10,0);
INSERT INTO "item" VALUES(74,'Enfeebling Congelate',8807,20,30,0);
INSERT INTO "item" VALUES(75,'Mind Fog Toxin',8444,20,30,0);
INSERT INTO "item" VALUES(76,'Oil of Asphyxiation',8065,40,10,0);
INSERT INTO "item" VALUES(77,'Mindstab Toxin',8270,40,30,0);
INSERT INTO "item" VALUES(78,'Enfeebling Strike of the Mamba',8483,40,10,0);
INSERT INTO "item" VALUES(79,'Accursed Plague Extract',8635,40,10,0);
INSERT INTO "item" VALUES(83,'Eagle Eye Tincture',8537,18,20,0);
INSERT INTO "item" VALUES(84,'Twitch',8699,12,20,0);
INSERT INTO "item" VALUES(85,'Fetid Unguent',8768,20,30,0);
INSERT INTO "item" VALUES(86,'Oil of the Seeping Wounds',8424,20,30,0);
INSERT INTO "item" VALUES(87,'Gold Nugget',301,20,10,0);
INSERT INTO "item" VALUES(88,'Silver Nugget',302,10,10,0);
INSERT INTO "item" VALUES(89,'Copper Necklace',303,5,10,0);
INSERT INTO "item" VALUES(90,'Amber Necklace',304,15,10,0);
INSERT INTO "item" VALUES(91,'Golden Chalice',305,40,10,0);
INSERT INTO "item" VALUES(92,'Crystal Lens',306,20,10,0);
INSERT INTO "item" VALUES(93,'Polished Silver Plate',307,35,10,0);
INSERT INTO "item" VALUES(94,'Star Ruby',308,40,5,0);
INSERT INTO "item" VALUES(95,'Disguise Kit',7111,40,10000,0);
INSERT INTO "item" VALUES(96,'Ceremonial Dagger',151,30,20,0);
INSERT INTO "item" VALUES(97,'Ceremonial Sword',153,50,20,0);
INSERT INTO "item" VALUES(98,'Ceremonial Axe',154,60,20,0);
CREATE TABLE item_node (
item_id INT NOT NULL,
node_id INT NOT NULL
);
INSERT INTO "item_node" VALUES(1,1);
INSERT INTO "item_node" VALUES(3,1);
INSERT INTO "item_node" VALUES(4,1);
INSERT INTO "item_node" VALUES(5,1);
INSERT INTO "item_node" VALUES(6,1);
INSERT INTO "item_node" VALUES(8,1);
INSERT INTO "item_node" VALUES(9,1);
INSERT INTO "item_node" VALUES(11,1);
INSERT INTO "item_node" VALUES(10,1);
INSERT INTO "item_node" VALUES(63,10);
INSERT INTO "item_node" VALUES(64,10);
INSERT INTO "item_node" VALUES(65,10);
INSERT INTO "item_node" VALUES(66,10);
INSERT INTO "item_node" VALUES(68,2);
INSERT INTO "item_node" VALUES(60,4);
INSERT INTO "item_node" VALUES(53,6);
INSERT INTO "item_node" VALUES(10,12);
INSERT INTO "item_node" VALUES(11,12);
INSERT INTO "item_node" VALUES(21,12);
INSERT INTO "item_node" VALUES(23,12);
INSERT INTO "item_node" VALUES(25,12);
INSERT INTO "item_node" VALUES(27,12);
INSERT INTO "item_node" VALUES(44,14);
INSERT INTO "item_node" VALUES(46,14);
INSERT INTO "item_node" VALUES(47,14);
INSERT INTO "item_node" VALUES(48,14);
INSERT INTO "item_node" VALUES(55,14);
INSERT INTO "item_node" VALUES(42,13);
INSERT INTO "item_node" VALUES(43,13);
INSERT INTO "item_node" VALUES(45,13);
INSERT INTO "item_node" VALUES(46,13);
INSERT INTO "item_node" VALUES(44,15);
INSERT INTO "item_node" VALUES(47,15);
INSERT INTO "item_node" VALUES(48,15);
INSERT INTO "item_node" VALUES(55,15);
INSERT INTO "item_node" VALUES(49,15);
INSERT INTO "item_node" VALUES(43,16);
INSERT INTO "item_node" VALUES(47,16);
INSERT INTO "item_node" VALUES(49,16);
INSERT INTO "item_node" VALUES(50,16);
INSERT INTO "item_node" VALUES(55,16);
INSERT INTO "item_node" VALUES(56,17);
INSERT INTO "item_node" VALUES(21,18);
INSERT INTO "item_node" VALUES(22,18);
INSERT INTO "item_node" VALUES(23,18);
INSERT INTO "item_node" VALUES(24,18);
INSERT INTO "item_node" VALUES(25,18);
INSERT INTO "item_node" VALUES(26,18);
INSERT INTO "item_node" VALUES(27,18);
INSERT INTO "item_node" VALUES(28,18);
INSERT INTO "item_node" VALUES(29,19);
INSERT INTO "item_node" VALUES(31,19);
INSERT INTO "item_node" VALUES(10,19);
INSERT INTO "item_node" VALUES(11,19);
INSERT INTO "item_node" VALUES(23,19);
INSERT INTO "item_node" VALUES(24,19);
INSERT INTO "item_node" VALUES(29,20);
INSERT INTO "item_node" VALUES(31,20);
INSERT INTO "item_node" VALUES(22,20);
INSERT INTO "item_node" VALUES(28,20);
INSERT INTO "item_node" VALUES(33,21);
INSERT INTO "item_node" VALUES(33,22);
INSERT INTO "item_node" VALUES(32,20);
INSERT INTO "item_node" VALUES(32,22);
INSERT INTO "item_node" VALUES(32,25);
INSERT INTO "item_node" VALUES(34,20);
INSERT INTO "item_node" VALUES(34,22);
INSERT INTO "item_node" VALUES(30,19);
INSERT INTO "item_node" VALUES(30,21);
INSERT INTO "item_node" VALUES(38,25);
INSERT INTO "item_node" VALUES(39,25);
INSERT INTO "item_node" VALUES(34,23);
INSERT INTO "item_node" VALUES(35,23);
INSERT INTO "item_node" VALUES(36,23);
INSERT INTO "item_node" VALUES(36,24);
INSERT INTO "item_node" VALUES(37,24);
INSERT INTO "item_node" VALUES(39,24);
INSERT INTO "item_node" VALUES(14,27);
INSERT INTO "item_node" VALUES(15,27);
INSERT INTO "item_node" VALUES(16,27);
INSERT INTO "item_node" VALUES(17,27);
INSERT INTO "item_node" VALUES(12,11);
INSERT INTO "item_node" VALUES(14,11);
INSERT INTO "item_node" VALUES(12,26);
INSERT INTO "item_node" VALUES(13,26);
INSERT INTO "item_node" VALUES(14,26);
INSERT INTO "item_node" VALUES(15,26);
INSERT INTO "item_node" VALUES(13,28);
INSERT INTO "item_node" VALUES(15,28);
INSERT INTO "item_node" VALUES(17,28);
INSERT INTO "item_node" VALUES(18,28);
INSERT INTO "item_node" VALUES(19,29);
INSERT INTO "item_node" VALUES(20,30);
INSERT INTO "item_node" VALUES(62,31);
INSERT INTO "item_node" VALUES(57,37);
INSERT INTO "item_node" VALUES(51,40);
INSERT INTO "item_node" VALUES(52,39);
INSERT INTO "item_node" VALUES(61,35);
INSERT INTO "item_node" VALUES(58,34);
INSERT INTO "item_node" VALUES(1,5);
INSERT INTO "item_node" VALUES(59,5);
INSERT INTO "item_node" VALUES(69,1);
INSERT INTO "item_node" VALUES(69,4);
INSERT INTO "item_node" VALUES(71,39);
INSERT INTO "item_node" VALUES(72,38);
INSERT INTO "item_node" VALUES(84,38);
INSERT INTO "item_node" VALUES(87,33);
INSERT INTO "item_node" VALUES(88,33);
INSERT INTO "item_node" VALUES(89,33);
INSERT INTO "item_node" VALUES(90,33);
INSERT INTO "item_node" VALUES(91,33);
INSERT INTO "item_node" VALUES(92,33);
INSERT INTO "item_node" VALUES(93,33);
INSERT INTO "item_node" VALUES(94,33);
INSERT INTO "item_node" VALUES(67,32);
INSERT INTO "item_node" VALUES(88,32);
INSERT INTO "item_node" VALUES(89,32);
INSERT INTO "item_node" VALUES(90,32);
INSERT INTO "item_node" VALUES(92,32);
INSERT INTO "item_node" VALUES(70,41);
INSERT INTO "item_node" VALUES(40,42);
INSERT INTO "item_node" VALUES(41,43);
INSERT INTO "item_node" VALUES(95,44);
INSERT INTO "item_node" VALUES(95,45);
INSERT INTO "item_node" VALUES(41,46);
INSERT INTO "item_node" VALUES(40,47);
INSERT INTO "item_node" VALUES(96,36);
INSERT INTO "item_node" VALUES(97,36);
INSERT INTO "item_node" VALUES(98,36);
INSERT INTO "item_node" VALUES(77,8);
INSERT INTO "item_node" VALUES(78,8);
INSERT INTO "item_node" VALUES(73,9);
INSERT INTO "item_node" VALUES(79,9);
INSERT INTO "item_node" VALUES(85,7);
INSERT INTO "item_node" VALUES(85,8);
INSERT INTO "item_node" VALUES(74,7);
INSERT INTO "item_node" VALUES(74,9);
INSERT INTO "item_node" VALUES(76,9);
INSERT INTO "item_node" VALUES(83,14);
INSERT INTO "item_node" VALUES(83,15);
INSERT INTO "item_node" VALUES(86,7);
INSERT INTO "item_node" VALUES(86,8);
INSERT INTO "item_node" VALUES(75,7);
CREATE TABLE info (
    id INTEGER PRIMARY KEY,
    subject TEXT,
    text TEXT,
    probability FLOAT,
    valid BOOLEAN,
    visible BOOLEAN,
    cost INT
);
INSERT INTO "info" VALUES(1,'reserved','reserved',0.0,0,0,2);
INSERT INTO "info" VALUES(2,'Talos','I hear that Talos is amazing in bed, though he better be given the number of whore houses he frequents. How his penis hasn''t rotted and fallen off yet is a mystery. He would be a perfect match for Nefertiti.',0.2,1,1,2);
INSERT INTO "info" VALUES(3,'Talos','I hear that Talos is the nephew of some famous inventor.',0.2,1,1,1);
INSERT INTO "info" VALUES(4,'Talos','I''ve heard it said that Talos is looking for some stash of treasure somewhere on the market.',0.2,1,1,3);
INSERT INTO "info" VALUES(5,'Talos','Last time I talked to him, Talos seemed interested in water impermeable, durable substances.  Don''t know what to make of that, honestly.',0.2,1,1,2);
INSERT INTO "info" VALUES(6,'Talos','I hear that the Ambassador is trying to form a secret alliance with the Greeks.',0.2,1,1,3);
INSERT INTO "info" VALUES(7,'Rettimo','I hear Rettimo is a follower of the Egyptian gods.',0.2,1,1,2);
INSERT INTO "info" VALUES(8,'Rettimo','I hear Rettimo is looking for some sort of religious artifact.',0.2,1,1,2);
INSERT INTO "info" VALUES(9,'Rettimo','Someone once told me that Rettimo is a ruthless killer!  Be careful!',0.2,1,1,2);
INSERT INTO "info" VALUES(10,'Rettimo','I hear that Rettimo was planning to raid a tomb!',0.2,1,1,2);
INSERT INTO "info" VALUES(11,'Kemnebi','I hear the Vizier used to be some sort of assassin, but he gave that up a long time ago.',0.2,1,1,2);
INSERT INTO "info" VALUES(12,'Kemnebi','I''ve heard that Kemnebi was devastated by the Pharaoh''s death, and wants to publicly execute whoever''s responsible.',0.2,1,1,2);
INSERT INTO "info" VALUES(13,'Kemnebi','Somone told me that Kemnebi''s an orphan, but it''s a sore subject for him.',0.2,1,1,2);
INSERT INTO "info" VALUES(14,'Kemnebi','I heard a whisper that Kemnebi was having an affair with Nefertiti.',0.2,1,1,2);
INSERT INTO "info" VALUES(15,'Kemnebi','I''ve heard tell that Kemnebi has been the power behind the throne for years.  Maybe he just got sick of pretending to follow the Pharaoh and just got rid of him.',0.2,1,1,2);
INSERT INTO "info" VALUES(16,'Kiya','I''ve seen Kiya come through here fairly regularly.  I think she was the Pharaoh''s and the Vizier''s main agent around here.',0.2,1,1,3);
INSERT INTO "info" VALUES(17,'Kiya','I swear I saw Kiya sacrifice a cat to Ashur down on the banks of the Nile!  Horrifying!',0.2,1,1,3);
INSERT INTO "info" VALUES(18,'Djal','I hear Djal has a grudge against the priesthood of Set.',0.2,1,1,3);
INSERT INTO "info" VALUES(19,'Manu','Manu''s sick -- he''s liable to drop dead any minute',0.2,1,1,2);
INSERT INTO "info" VALUES(20,'Manu','Most everyone already knows this, but Manu is a master at manipulating the economy.',0.2,1,1,2);
INSERT INTO "info" VALUES(21,'Manu','Rumor has it that Manu has a bastard son he''s going to name successor.',0.2,1,1,2);
INSERT INTO "info" VALUES(22,'Manu','If anyone asks, you didn''t hear it from me.  Manu is a traitor, and he''s been negotiating with the Hittites.',0.2,1,1,3);
INSERT INTO "info" VALUES(23,'Manu','I hear that Manu is colluding with Nefertiti to try to take the throne.',0.1,1,1,3);
INSERT INTO "info" VALUES(24,'Wakhakshem','Wakhakshem is a furtive figure.  Nobody knows much about him.',0.2,1,1,1);
INSERT INTO "info" VALUES(25,'Wakhakshem','Wakhakshem hates his brother with a passion.',0.2,1,1,2);
INSERT INTO "info" VALUES(26,'Wakhakshem','Wakhakshem is allying himself with the Babylonians.',0.2,1,1,2);
INSERT INTO "info" VALUES(27,'Wakhakshem','Wakhakshem is going to be the heir of Ament.',0.2,1,1,2);
INSERT INTO "info" VALUES(28,'Sokkwi','Sokkwi is a furtive figure.  Nobody knows much about him.',0.2,1,1,1);
INSERT INTO "info" VALUES(29,'Sokkwi','Sokkwi hates his brother with a passion.',0.2,1,1,2);
INSERT INTO "info" VALUES(30,'Sokkwi','Sokkwi is allying himself with the Assyrians.',0.2,1,1,2);
INSERT INTO "info" VALUES(31,'Sokkwi','Sokkwi is going to be the heir of Ament.',0.2,1,1,2);
INSERT INTO "info" VALUES(32,'Shushu','This is just hearsay, but the word on the street is that Shushu was real close with Akhenaten back in the day.',0.2,1,1,2);
INSERT INTO "info" VALUES(33,'Shushu','A friend of a friend says that Shushu will work for anyone, so long as the pay is good.',0.2,1,1,2);
INSERT INTO "info" VALUES(34,'Shushu','Just between you and me, Shushu has a real good disappearing act coming up soon.',0.2,1,1,2);
INSERT INTO "info" VALUES(35,'Itafe','I hear that Itafe is a bloodthirsty sociopath who killed his entire family to come to power.',0.2,1,1,2);
INSERT INTO "info" VALUES(36,'Itafe','Word on the street is that Itafe is hiring all the assassins he can find.',0.2,1,1,2);
INSERT INTO "info" VALUES(37,'Itafe','Itafe has the entire city on his payroll.',0.2,1,1,2);
INSERT INTO "info" VALUES(38,'Itafe','Don''t let Itafe come near you.  He can kill you with his bare hands.',0.2,1,1,2);
INSERT INTO "info" VALUES(39,'Itafe','If you get on Itafe''s bad side, you''ll disappear in the night, never to be seen again.  At least that''s what I tell my kids.',0.2,1,1,2);
INSERT INTO "info" VALUES(40,'Itafe','The story goes, an assassin sneaks into Itafe''s room at night, and stabs the figure in the bed four times before leaving. He goes back home, thinking of his reward, and falls asleep. He wakes up screaming during the night, with four stab wounds in his body, lying in Itafe''s bed. But don''t listen to me, that''s just a story.  ',0.2,1,1,4);
INSERT INTO "info" VALUES(41,'Amenemhet','Word on the street is that Amenemhet is so righteous he shits bricks of smiting.',0.2,1,1,2);
INSERT INTO "info" VALUES(42,'Amenemhet','Don''t tell anyone that you heard it from me, but I have it on good authority that Amenemhet is colluding with Nefertiti to take the throne.',0.2,1,1,2);
INSERT INTO "info" VALUES(43,'Amenemhet','Maybe you haven''t heard, but Amenemhet wants an heir and he doesn''t want it to be any of the sycophants that crowd around him..',0.2,1,1,2);
INSERT INTO "info" VALUES(44,'Amenemhet','I hear that Amenemhet is infertile and wants an heir more than anything.',0.2,1,1,2);
INSERT INTO "info" VALUES(45,'Anemro','I hear that Anemro can brew you any type of concotion you need.',0.2,1,1,1);
INSERT INTO "info" VALUES(46,'Anemro','Maybe you haven''t heard, but Anemro is a quack.  All his potions are fakes.',0.1,1,1,2);
INSERT INTO "info" VALUES(47,'Anemro','Anemro has contacts everywhere in the market.  You can''t do anything without him hearing about it.  Shh...',0.2,1,1,3);
INSERT INTO "info" VALUES(48,'Nefertiti','Everyone knows Nefertiti''s a power-hungry temptress... more men have beent between her legs than inside the Temple of Amen-Ra.',0.2,1,1,2);
INSERT INTO "info" VALUES(49,'Nefertiti','Some have been saying that Nefertiti was shopping for funerary supplies before her son Tutakhaten even died.',0.1,1,1,2);
INSERT INTO "info" VALUES(50,'Nefertiti','Nobody knows for sure, but there''s talk that Akhenaten was about to name Nefertiti his co-regent before he died.',0.2,1,1,3);
INSERT INTO "info" VALUES(51,'Nefertiti','Don''t tell anybody I told you, but I heard from Akhbar''s boy that Nefertiti was getting very friendly with the Royal Herbalist just before Akhenaten took ill...',0.2,1,1,2);
INSERT INTO "info" VALUES(52,'Saini','I heard that Akhenaten trusted Saini enough to drink whatever he gave him, no questions asked.',0.2,1,1,2);
INSERT INTO "info" VALUES(53,'Saini','Saini would never let on, but they say he was the one who told Akhenaten how to get rid of the temples.',0.2,1,1,2);
INSERT INTO "info" VALUES(54,'Saini','They say Saini can make a potion that''ll make a man loyal to him without question; it''s how the Pharaoh captured the loyalty of his court.',0.2,1,1,2);
INSERT INTO "info" VALUES(55,'Suten','Nobody talks about it, but the word is that Suten was Akhenaten''s right hand man in enforcing his laws against the old gods.',0.2,1,1,2);
INSERT INTO "info" VALUES(56,'Suten','I hear that Suten''s been asking a lot of questions in the wrong parts of town recently...',0.2,1,1,2);
INSERT INTO "info" VALUES(57,'Suten','You didn''t hear it from me, but everyone always said that the young prince Tutankhaten looked a lot more like Suten than like Akhenaten...',0.2,1,1,2);
INSERT INTO "info" VALUES(58,'Meti','Everyone says Meti should have died in a duel a few years back against a Babylonian general, but somehow he managed to win; that''s why he''s a cripple now.',0.2,1,1,2);
INSERT INTO "info" VALUES(59,'Meti','Don''t tell anyone, but I heard Meti hired a man to poison Manu when they were threatening to go to war.',0.2,1,1,2);
INSERT INTO "info" VALUES(60,'Meti','Nobody knows for sure, but some people say that Meti''s wife crippled him with a spell to keep him safely at home.',0.2,1,1,2);
INSERT INTO "info" VALUES(61,'Seshafu','Don''t tell him I told you, but Seshafu''s wise in the spellcrafting ways of Heka.',0.2,1,1,2);
INSERT INTO "info" VALUES(62,'Seshafu','I''ve heard that Seshafu is just as sly as his younger brother Itafe.',0.2,1,1,2);
INSERT INTO "info" VALUES(63,'Seshafu','The word is that Seshafu''s marriage was almost called off due to a scandalous affair in his youth.',0.2,1,1,2);
INSERT INTO "info" VALUES(64,'Nafrit','Nafrit''s maid tells me that she''s been hiding a stack of love letters under her sleeping mat.',0.2,1,1,2);
INSERT INTO "info" VALUES(65,'Nafrit','I hear Nafrit''s prone to fits, where the gods themselves give her visions.',0.2,1,1,2);
INSERT INTO "info" VALUES(66,'Nafrit','The word in the marketplace is that Nafrit''s engaged because she''s gotten herself in a family way...',0.2,1,1,2);
INSERT INTO "info" VALUES(67,'Nomti','Surely you''ve heard that all of the Champions of Amun-Ra get their position through internal corruption and politicking, not actually through their combat prowess.',0.2,1,1,2);
INSERT INTO "info" VALUES(68,'Nomti','Nomti''s favorite pastimes seem to be executing tomb robbers and bashing foreigners.',0.2,1,1,2);
INSERT INTO "info" VALUES(69,'Paniwi','Paniwi''s an outrageous flirt, yes, but she seems to notice more than she lets on.',0.2,1,1,2);
INSERT INTO "info" VALUES(70,'Paniwi','I hear Paniwi''s been seen hanging about with Buikhu-and given her reputation, you''d blush to think what they might be doing together.',0.2,1,1,2);
INSERT INTO "info" VALUES(71,'Paniwi','Paniwi''s servants tell me they''ve seen one of the High Priests sneaking out of her chambers in the early hours of the morning.',0.2,1,1,2);
INSERT INTO "info" VALUES(72,'Mshai','You didn''t hear it from me, but Mshai''s mother''s death was unnatural if I ever heard of one.',0.2,1,1,2);
INSERT INTO "info" VALUES(73,'Mshai','Word is that Mshai''s got a lady friend that he doesn''t talk about-probably a married woman, if I''m any judge.',0.2,1,1,2);
INSERT INTO "info" VALUES(74,'Mshai','Nobody knows why, but it''s said that Mshai''s been spending a lot of time learning how to surreptitiously apply poisons.',0.2,1,1,2);
INSERT INTO "info" VALUES(75,'Nsu',' Everyone knows how jealous Nsu is that his younger, legitimate brother inherited the seat of Nomarch.',0.2,1,1,2);
INSERT INTO "info" VALUES(76,'Nsu','I''d never speak ill of the dead, but the servants all say that Nsu''s stepmother made his life hell while she was alive.',0.2,1,1,2);
INSERT INTO "info" VALUES(77,'Nsu','Nobody knows for sure, but everyone says that Nsu''s mother wasn''t even Egyptian.',0.2,1,1,2);
INSERT INTO "info" VALUES(78,'Euthymius','Euthymius''s only been around for a few days, but anyone can tell he''s looking to stick his Staff of Ra in Woserit''s Chalice of Isis.',0.2,1,1,2);
INSERT INTO "info" VALUES(79,'Euthymius','People have seen Euthymius and Benipe whispering to each other... and given the proclivities of the Greeks, I don''t even want to guess at what they might be saying!',0.2,1,1,2);
INSERT INTO "info" VALUES(80,'Euthymius','You didn''t hear it here, but word is that Euthymius''s looking to seduce all of Egypt''s beautiful women while he''s in Thebes.',0.2,1,1,2);
INSERT INTO "info" VALUES(81,'Ialu','Everyone says that no right-minded noble would leave his daughter''s body with Ialu-at least, not while it was fresh.',0.2,1,1,2);
INSERT INTO "info" VALUES(82,'Djadao','Well, if you must know, I have it on excellent authority that Djadao used to be an assassin for pay until he found religion. ',0.2,1,1,2);
INSERT INTO "info" VALUES(83,'Djadao','I''m not one to spread rumors, but everyone says that Djadao has been getting particularly friendly with some of the foreign ambassadors.',0.2,1,1,2);
INSERT INTO "info" VALUES(84,'Benipe','People have seen Euthymius and Benipe whispering to each other... and given the proclivities of the Greeks, I don''t even want to guess at what they might be saying!',0.2,1,1,2);
INSERT INTO "info" VALUES(85,'Benipe','You didn''t hear it from me, but Benipe seems to be taking an unusual interest in the competitors involved in his temple''s Glorious Combats.',0.2,1,1,2);
INSERT INTO "info" VALUES(86,'Benipe','People say Benipe has always resented Nomti for becoming the Champion of Amun-Ra, but that he''s not good enough to challenge him in direct combat.',0.2,1,1,2);
INSERT INTO "info" VALUES(87,'Irisi','Anyone who''s visited the temple recently can see that there''s a bit of a strained atmosphere between Irisi and Djal.',0.2,1,1,2);
INSERT INTO "info" VALUES(88,'Irisi','Irisi''s been doing some research lately into divine matters, but I have no idea what she''s up to.',0.2,1,1,2);
INSERT INTO "info" VALUES(89,'Irisi','I heard from my brother''s wife that Irisi''s been letting her fields be sowed by someone other than her husband, if you know what I''m saying.',0.2,1,1,2);
INSERT INTO "info" VALUES(90,'Ibbi-Adad','As I''ve heard it, Ibbi-Adad is the brother of a Babylonian general that Meti killed in single combat some years ago.',0.2,1,1,2);
INSERT INTO "info" VALUES(91,'Ibbi-Adad','Don''t tell him I told you, but Ibbi-Adad''s trying to find a nice Egyptian man for his daughter before he leaves Egypt.',0.2,1,1,2);
INSERT INTO "info" VALUES(92,'Ibbi-Adad','I heard Ibbi-Adad''s trying to figure out how to summon some sort of slumbering demon using Egyptian magic.',0.2,1,1,2);
INSERT INTO "info" VALUES(93,'Nidintu','I''d never speak ill of a woman, but Nidintu''s more mannish than her father.',0.2,1,1,2);
INSERT INTO "info" VALUES(94,'Nidintu','I hate to say it, but I suspect that Nidintu''s involved in various underground dealings in Thebes.',0.2,1,1,2);
INSERT INTO "info" VALUES(95,'Nidintu','Hadn''t you heard? Nidintu''s a heka practitioner, and a powerful one at that.',0.2,1,1,2);
INSERT INTO "info" VALUES(96,'Ishtar','I''ve heard tell that the Assyrian ambassador''s poking around asking questions about the correspondance between various gods.',0.2,1,1,2);
INSERT INTO "info" VALUES(97,'Ishtar','Ishtar''s been asking questions about some sort of religious artifact in the market.',0.2,1,1,2);
INSERT INTO "info" VALUES(98,'Ishtar','I heard Ishtar''s trying to improve the power of the Assyrian god in Egypt''s pantheon.',0.2,1,1,2);
INSERT INTO "info" VALUES(99,'Kushi','According to his servants, Kushi bears no love for Ishtar.',0.2,1,1,2);
INSERT INTO "info" VALUES(100,'Kushi','My cousin tells me that Kushi''s been asking a lot of questions about Atenism.',0.2,1,1,2);
INSERT INTO "info" VALUES(101,'Kushi','Word is, Kushi''s looking to make some sort of deal with one of the nomarchs over Hittite territories.',0.2,1,1,2);
INSERT INTO "info" VALUES(102,'Zannanza','Zannanza''s servants seem unusually reticent to talk about his personal characteristics.',0.2,1,1,2);
INSERT INTO "info" VALUES(103,'Zannanza','According to my friend''s cousin, Zannanza''s a pretty approachable fellow for his station in life.',0.2,1,1,2);
INSERT INTO "info" VALUES(104,'Zannanza','Zannanza''s got an unusual liking for beer and companionship-the kind you pay for, I mean. I heard his family sent him here ''cause he was an embarassment back at home.',0.2,1,1,2);
INSERT INTO "info" VALUES(105,'Hantili','What people''re saying is that Hantili is making friends quickly among the Thebesian merchants.',0.2,1,1,2);
INSERT INTO "info" VALUES(106,'Hantili','I heard Hantili''s a pretty shady character, for a politician.',0.2,1,1,2);
INSERT INTO "info" VALUES(107,'Hantili','You didn''t hear it here, but Hantili''s a lot more than an assistant to Zannanza, if you catch my meaning...',0.2,1,1,2);
INSERT INTO "info" VALUES(108,'Woserit','Woserit''s the woman to go to if you find yourself with a problem.',0.2,1,1,2);
INSERT INTO "info" VALUES(109,'Woserit','While Woserit''s not a woman of high stature, everyone knows that she''s got family in high places.',0.2,1,1,2);
INSERT INTO "info" VALUES(110,'Woserit','Everyone says Woserit''s been making good friends with the Babylonians over the past few days...',0.2,1,1,2);
INSERT INTO "info" VALUES(111,'Bai','Bai is a total nutcase. He killed the heir of Atef-Min for insulting his dog.',0.4,1,1,3);
INSERT INTO "info" VALUES(112,'Bai','I hear Bai is tougher than a stone slab. Trying to poison him is a futile gesture.',0.2,1,1,2);
INSERT INTO "info" VALUES(113,'Bai','Bai''s my hero! He was totally in the right when he killed the heir of Atef-Min; he insulted his mother!',0.4,1,1,2);
INSERT INTO "info" VALUES(114,'Nomti','I hear Nomti poisoned the previous champion of Amen-Ra to get his current position.',0.2,1,1,2);
INSERT INTO "info" VALUES(115,'Nomti','Nomti''s insane! He cut off my hand for looking at him askance! Oh shit, I shouldn''t have told you that, now my family''s going to die!',0.2,1,1,2);
INSERT INTO "info" VALUES(116,'Nomti','I tell my children that if they''re naughty, Nomti will cut off their limbs at night.',0.2,1,1,2);
INSERT INTO "info" VALUES(117,'Buikhu','I hear Buikhu engaged in covert operations for Akhenaten.',0.2,1,1,2);
INSERT INTO "info" VALUES(118,'Buikhu','Buikhu is a brilliant general; don''t let anyone tell you otherwise.',0.2,1,1,2);
INSERT INTO "info" VALUES(119,'Awan','Awan, a foreman? I hear he''s actually a secret agent for the priests.',0.2,1,1,2);
INSERT INTO "info" VALUES(120,'Awan','Awan won''t ask you twice. He won''t even ask you once. Either you do what he wants or your successor does.',0.2,1,1,2);
INSERT INTO "info" VALUES(121,'Awan','Everyone knows that Awan is totally harmless. His stern exterior is just a bluff.',0.2,1,1,2);
INSERT INTO "info" VALUES(122,'Baraka','I hear that Baraka is so hopelessly insane, the priests who tried to save him eventually went mad and committed suicide.',0.2,1,1,3);
INSERT INTO "info" VALUES(123,'Oba','Everyone knows Oba is a connoisseur of fine food.',0.2,1,1,2);
INSERT INTO "info" VALUES(124,'Oba','Another priest told me that Hathor is still punishing Oba for his past mistakes.',0.2,1,1,2);
INSERT INTO "info" VALUES(125,'Shenti','The word on the street is that Shenti has a bit of a money problem.',0.2,1,1,2);
INSERT INTO "info" VALUES(126,'the nomarch of Khensu','The Nomarch of Khensu has close ties to the Assyrian Empire and will likely vote as they tell him to.',0.1,1,1,5);
INSERT INTO "info" VALUES(127,'the nomarch of Aneb-Hetch','The Nomarch of Aneb-Hetch has close ties to the Hitite Empire and will likely vote as they tell him to.',0.1,1,1,5);
INSERT INTO "info" VALUES(128,'the nomarch of Sapi-Res','The Nomarch of Sapi-Res has close ties to the Babylonian Empire and will likely vote as they tell him to.',0.1,1,1,5);
INSERT INTO "info" VALUES(129,'the nomarch of Sap-Meh','The Nomarch of Sap-Meh has close ties to the Island of Crete and will likely vote as they tell him to.',0.1,1,1,5);
INSERT INTO "info" VALUES(130,'the nomarch of Khaset','The Nomarch of Khaset has close ties to the Greek Empire and will likely vote as they tell him to.',0.1,1,1,5);
INSERT INTO "info" VALUES(131,'the nomarch of A-Mhant','The Nomarch of A-Mhant has ties to the Nome of Khent Abt.  If Khent Abt is no worse than third in status, they will likely vote with Khent Abt.  Otherwise, they will vote with the Nome with the highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(132,'the nomarch of A-bt','The Nomarch of A-Mhant has ties to the Nome of Khent Abt.  If Khent Abt is no worse than third in status, they will likely vote with Khent Abt.  Otherwise, they will vote with the Nome with the highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(133,'the nomarch of Ka-khem','The Nomarch of Ka-khem has ties to the Nome of Wadkhet.  If Wadkhet is no worse than third in status, they will likely vote with Wadkhet.  Otherwise, they will vote with the Nome with the highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(134,'the nomarch of Ka-heseb','The Nomarch of Ka-heseb has ties to the Nome of Ament.  If Ament is no worse than third in status, they will likely vote with Ament.  Otherwise, they will vote with the Nome with the highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(135,'the nomarch of Theb-ka','The Nomarch of Theb-ka has ties to the Nome of Ta Seti.  If Ta Seti is no worse than third in status, they will likely vote with Ta Seti.  Otherwise, they will vote with the Nome with the highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(136,'the nomarch of Heq-at','The Nomarch of Heq-At seeks only to ingratiate himself with important people. He will vote with the Nome with the highest status. ',0.1,1,1,5);
INSERT INTO "info" VALUES(137,'the nomarch of Tehut','The Nomarch of Tehut fears any one Nomarch becoming too important.  He will vote with the Nome with the second highest status.',0.1,1,1,5);
INSERT INTO "info" VALUES(138,'the nomarch of Kha','The Nomarch of Kha is a devoted follower of Amun-Ra.  He will vote for whomever has the blessing of Amun-Ra and abstain otherwise.',0.1,1,1,5);
INSERT INTO "info" VALUES(139,'the nomarch of Semabehdet','The Nomarch of Semabehdet is a devoted follower of Osiris.  He will vote for whomever has the blessing of Osiris and abstain otherwise.',0.1,1,1,5);
INSERT INTO "info" VALUES(140,'the nomarch of Am-Kehen','The Nomarch of Am-Kehen is a devoted follower of Anubis.  He will vote for whomever has the blessing of Anubis and abstain otherwise.',0.1,1,1,5);
INSERT INTO "info" VALUES(141,'the nomarch of Am-Pehu','The Nomarch of Am-Pehu is a devoted follower of Isis.  He will vote for whomever has the blessing of Isis and abstain otherwise.',0.1,1,1,5);
INSERT INTO "info" VALUES(142,'the nomarch of Sopduis','The Nomarch of Sopduis a devoted follower of Aten.  He will vote for whomever has the blessing of Aten and abstain otherwise.',0.1,1,1,5);
INSERT INTO "info" VALUES(143,'the nomarch of Aa-ta','The Nomarch of Aa-ta feels that the Pharaoh should have the backing of the most powerful of the gods.  He will vote for whomever has the blessing of the most popular god.',0.1,1,1,5);
INSERT INTO "info" VALUES(144,'Kemnebi','Born on the streets, raised on the streets, Kemnebi is one of us.',0.2,1,1,2);
INSERT INTO "info" VALUES(145,'Kemnebi','Kemnebi? He''s a book worm! Buys every rare text he can get his hands on.',0.2,1,1,2);
INSERT INTO "info" VALUES(146,'Kemnebi','I hear that Kemnebi will do anything to keep his power..',0.2,1,1,2);
INSERT INTO "info" VALUES(147,'Kiya','My cousin tells me that Kiya isn''t actually Egyptian.',0.2,1,1,2);
INSERT INTO "info" VALUES(148,'Nefertiti','On my honor, Nefertiti was absolutely enraged the other day because Akhenaten wasn''t favoring her bed anymore.',0.2,1,1,2);
INSERT INTO "info" VALUES(150,'Kiya','I hear Kiya brutally murdered a Mitanni general for treating her poorly in bed.',0.2,1,1,2);
INSERT INTO "info" VALUES(151,'Kiya','Before my old man died, he told me that he had seen Kiya campaigning for a Bast temple to get built.',0.2,1,1,2);
INSERT INTO "info" VALUES(152,'Saini','I have a friend in the royal household who tells me that Akhenaten dropped dead upon drinking a potion Saini gave him.',0.2,1,1,2);
INSERT INTO "info" VALUES(153,'Saini','Everyone knows Saini is the high priest of Aten.',0.2,1,1,2);
INSERT INTO "info" VALUES(154,'Saini','Saini didn''t get to be Akhenaten''s personal herbalist for being second best.',0.2,1,1,2);
INSERT INTO "info" VALUES(155,'Suten Anu','If you look at Suten Anu the wrong way ... you''ll die seven days later of a heart attack. At least, that''s what happened to my friend.',0.2,1,1,2);
INSERT INTO "info" VALUES(156,'Suten Anu','Everyone knows Suten Anu is always buried in his books. He hardly makes the time to eat.',0.2,1,1,2);
INSERT INTO "info" VALUES(157,'Suten Anu','I heard that Suten Anu is working on a library.',0.2,1,1,2);
INSERT INTO "info" VALUES(158,'Nebi','What do you want to know about Nebi? She''s just an old scholar.',0.2,1,1,2);
INSERT INTO "info" VALUES(159,'Rasui','Rasui will do anything for power. Anything.',0.2,1,1,2);
INSERT INTO "info" VALUES(160,'Eusebios','Eusebios is a follower of Poseidon. Or so my ma tells me.',0.2,1,1,2);
INSERT INTO "info" VALUES(161,'Helladios','I hear Helladios doesn''t mind cheating to get what he wants.',0.2,1,1,2);
INSERT INTO "info" VALUES(162,'Pamphilos','I don''t know why Cecrops puts up with Pamphilos. I hear he tried to poison him.',0.2,1,1,2);
INSERT INTO "info" VALUES(163,'Djadao','My cousin tells me Djadao is not nearly as faithful as his office would imply.',0.2,1,1,2);
INSERT INTO "info" VALUES(164,'Djadao','I hear that Djadao is working for the Creteans.',0.2,1,1,2);
INSERT INTO "info" VALUES(165,'Djadao','I hear that Djadao is working for the Hittites.',0.2,1,1,2);
INSERT INTO "info" VALUES(166,'Ialu','Ialu didn''t become high priest by mummifying bodies all day.',0.2,1,1,2);
INSERT INTO "info" VALUES(167,'Mhotep','My friend tells me that Mhotep has a fascination with dead bodies.',0.2,1,1,2);
INSERT INTO "info" VALUES(168,'Djal','A close friend of mine tells me that he often sees Djal entering a brothel. Every day of the week, actually.',0.2,1,1,2);
INSERT INTO "info" VALUES(169,'Kemosiri','I''ve never seen Kemosiri do anything priestly.',0.2,1,1,2);
INSERT INTO "info" VALUES(170,'','',0.2,1,1,2);
INSERT INTO "info" VALUES(171,'','',0.2,1,1,2);
INSERT INTO "info" VALUES(172,'','',0.2,1,1,2);
INSERT INTO "info" VALUES(173,'','',0.2,1,1,2);
INSERT INTO "info" VALUES(174,'','',0.2,1,1,2);
CREATE TABLE info_node (
info_id INT NOT NULL,
node_id INT NOT NULL
);
CREATE TABLE visit (
    id INTEGER PRIMARY KEY,
    visit_key VARCHAR (40) NOT NULL UNIQUE,
    created TIMESTAMP,
    expiry TIMESTAMP
);
INSERT INTO "visit" VALUES(1,'bc1e45ba32745c607edf7abdbf48ff48fb24d3bb','2009-01-23 16:47:20','2009-01-23 18:09:09');
CREATE TABLE visit_identity (
    id INTEGER PRIMARY KEY,
    visit_key VARCHAR (40) NOT NULL UNIQUE,
    user_id INT
);
INSERT INTO "visit_identity" VALUES(1,'bc1e45ba32745c607edf7abdbf48ff48fb24d3bb',1);
CREATE TABLE tg_group (
    id INTEGER PRIMARY KEY,
    group_name VARCHAR (16) NOT NULL UNIQUE,
    display_name VARCHAR (255),
    created TIMESTAMP
);
INSERT INTO "tg_group" VALUES(1,'admin','admin','2009-01-13 00:32:00');
CREATE TABLE user_group (
group_id INT NOT NULL,
user_id INT NOT NULL
);
INSERT INTO "user_group" VALUES(1,1);
CREATE TABLE group_permission (
group_id INT NOT NULL,
permission_id INT NOT NULL
);
CREATE TABLE tg_user (
    id INTEGER PRIMARY KEY,
    user_name VARCHAR (30) NOT NULL UNIQUE,
    email_address VARCHAR (255),
    display_name VARCHAR (255),
    password VARCHAR (40),
    created TIMESTAMP,
    character VARCHAR (100)
);
INSERT INTO "tg_user" VALUES(1,'gm','','Professor','assbarn','2009-01-12 20:32:00','The GMs');
INSERT INTO "tg_user" VALUES(2,'Kiya','','Kiya','pyramid','2009-01-12 20:32:00','Kiya');
INSERT INTO "tg_user" VALUES(3,'Kemnebi','','Kemnebi','sphinx','2009-01-12 20:32:00','Kemnebi');
INSERT INTO "tg_user" VALUES(4,'Nefertiti','','Nefertiti','galena','2009-01-12 20:32:00','Nefertiti');
INSERT INTO "tg_user" VALUES(5,'Saini','','Saini','mummy','2009-01-12 20:32:00','Saini');
INSERT INTO "tg_user" VALUES(6,'Suten Anu','','Suten Anu','tomb','2009-01-12 20:32:00','Suten Anu');
INSERT INTO "tg_user" VALUES(7,'Meti','','Meti','natron','2009-01-12 20:32:00','Meti');
INSERT INTO "tg_user" VALUES(8,'Seshafi','','Seshafi','nome','2009-01-12 20:32:00','Seshafi');
INSERT INTO "tg_user" VALUES(9,'Buikhu','','Buikhu','nile','2009-01-12 20:32:00','Buikhu');
INSERT INTO "tg_user" VALUES(10,'Nafrit','','Nafrit','river','2009-01-12 20:32:00','Nafrit');
INSERT INTO "tg_user" VALUES(11,'Amenemhet','','Amenemhet','statue','2009-01-12 20:32:00','Amenemhet');
INSERT INTO "tg_user" VALUES(12,'Anemro','','Anemro','obelisk','2009-01-12 20:32:00','Anemro');
INSERT INTO "tg_user" VALUES(13,'Nomti','','Nomti','sword','2009-01-12 20:32:00','Nomti');
INSERT INTO "tg_user" VALUES(14,'Nebi','','Nebi','storm','2009-01-12 20:32:00','Nebi');
INSERT INTO "tg_user" VALUES(15,'Manu','','Manu','sand','2009-01-12 20:32:00','Manu');
INSERT INTO "tg_user" VALUES(16,'Shushu','','Shushu','lily','2009-01-12 20:32:00','Shushu');
INSERT INTO "tg_user" VALUES(17,'Wakhakshem','','Wakhakshem','spear','2009-01-12 20:32:00','Wakhakshem');
INSERT INTO "tg_user" VALUES(18,'Sokkwi','','Sokkwi','shield','2009-01-12 20:32:00','Sokkwi');
INSERT INTO "tg_user" VALUES(19,'Itafe','','Itafe','towers','2009-01-12 20:32:00','Itafe');
INSERT INTO "tg_user" VALUES(20,'Awan','','Awan','temple','2009-01-12 20:32:00','Awan');
INSERT INTO "tg_user" VALUES(21,'Bai','','Bai','horus','2009-01-12 20:32:00','Bai');
INSERT INTO "tg_user" VALUES(22,'Paniwi','','Paniwi','elixir','2009-01-12 20:32:00','Paniwi');
INSERT INTO "tg_user" VALUES(23,'Rasui','','Rasui','shadow','2009-01-12 20:32:00','Rasui');
INSERT INTO "tg_user" VALUES(24,'Mshai','','Mshai','hill','2009-01-12 20:32:00','Mshai');
INSERT INTO "tg_user" VALUES(25,'Nsu','','Nsu','sandstorm','2009-01-12 20:32:00','Nsu');
INSERT INTO "tg_user" VALUES(26,'Woserit','','Woserit','sun','2009-01-12 20:32:00','Woserit');
INSERT INTO "tg_user" VALUES(27,'Baraka','','Baraka','stab','2009-01-12 20:32:00','Baraka');
INSERT INTO "tg_user" VALUES(28,'Cecrops','','Cecrops','peeledgrapes','2009-01-12 20:32:00','Cecrops');
INSERT INTO "tg_user" VALUES(29,'Pamphilos','','Pamphilos','lotus','2009-01-12 20:32:00','Pamphilos');
INSERT INTO "tg_user" VALUES(30,'Eusebios','','Eusebios','naval','2009-01-12 20:32:00','Eusebios');
INSERT INTO "tg_user" VALUES(31,'Helladios','','Helladios','corps','2009-01-12 20:32:00','Helladios');
INSERT INTO "tg_user" VALUES(32,'Euthymius','','Euthymius','dark','2009-01-12 20:32:00','Euthymius');
INSERT INTO "tg_user" VALUES(33,'Ialu','','Ialu','crocodile','2009-01-12 20:32:00','Ialu');
INSERT INTO "tg_user" VALUES(34,'Mhotep','','Mhotep','feather','2009-01-12 20:32:00','Mhotep');
INSERT INTO "tg_user" VALUES(35,'Djadao','','Djadao','gold','2009-01-12 20:32:00','Djadao');
INSERT INTO "tg_user" VALUES(36,'Benipe','','Benipe','bright','2009-01-12 20:32:00','Benipe');
INSERT INTO "tg_user" VALUES(37,'Djal','','Djal','stream','2009-01-12 20:32:00','Djal');
INSERT INTO "tg_user" VALUES(38,'Kemosiri','','Kemosiri','horse','2009-01-12 20:32:00','Kemosiri');
INSERT INTO "tg_user" VALUES(39,'Irisi','','Irisi','shimmer','2009-01-12 20:32:00','Irisi');
INSERT INTO "tg_user" VALUES(40,'Talos','','Talos','bovine','2009-01-12 20:32:00','Talos');
INSERT INTO "tg_user" VALUES(41,'Rettimo','','Rettimo','slash','2009-01-12 20:32:00','Rettimo');
INSERT INTO "tg_user" VALUES(42,'Ibbi-Adad','','Ibbi-Adad','mesopotamian','2009-01-12 20:32:00','Ibbi-Adad');
INSERT INTO "tg_user" VALUES(43,'Nidintu','','Nidintu','tigris','2009-01-12 20:32:00','Nidintu');
INSERT INTO "tg_user" VALUES(44,'Ishtar','','Ishtar','erdu','2009-01-12 20:32:00','Ishtar');
INSERT INTO "tg_user" VALUES(45,'Kushi','','Kushi','cattle','2009-01-12 20:32:00','Kushi');
INSERT INTO "tg_user" VALUES(46,'Zannanza','','Zannanza','eyes','2009-01-12 20:32:00','Zannanza');
INSERT INTO "tg_user" VALUES(47,'Hantili','','Hantili','silvery','2009-01-12 20:32:00','Hantili');
INSERT INTO "tg_user" VALUES(48,'Oba','','Oba','lotus','2009-01-12 20:32:00','Oba');
INSERT INTO "tg_user" VALUES(49,'Shenti','','Shenti','brick','2009-01-12 20:32:00','Shenti');
INSERT INTO "tg_user" VALUES(50,'Shepsit','','Shepsit','scarlet','2009-01-12 20:32:00','Shepsit');
COMMIT;
