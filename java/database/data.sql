BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO coffee_shops (shop_name, main_image, website_link, price_range, rating, highlights, menu_link)
VALUES ('Third Way Cafe', 'third_way_cafe.png', 'www.thirdwaycafe.org', 1, 4, 'coffee, non-dairy', 'www.thirdwaycafe.org/menu'),
		('Fox in the Snow Cafe', 'foxinthesnow.jpeg', 'www.foxinthesnow.com', 3, 4, 'coffee, food, dessert, bean, alcohol, non-dairy, outdoor seating, dog friendly', 'www.foxinthesnow.com/menus/#menu'),
		('Pistacia Vera', 'pistacia_vera.png', 'https://www.pistaciavera.com/', 4, 4, 'coffee, food, dessert, non-dairy, outdoor seating, dog friendly', 'https://static1.squarespace.com/static/525406e0e4b03949ba5345ea/t/642d8a566dc7e770f0464b5a/1680706135156/FULL+MENU+SPRING+2023+NEW+FINAL+%281%29.pdf'),
		('One Line Coffee - Short North', 'one_line_coffee.jpg', 'https://www.onelinecoffee.com/short-north-location/', 3, 5, 'coffee, dessert, bean, non-dairy', 'https://www.toasttab.com/one-line-coffee-short-north-745-n-high-st/v3'),
		('Brioso Coffee', 'brioso_coffee.png', 'https://briosocoffee.com/', 2, 3, 'coffee, bean, non-dairy, outdoor seating', 'https://briosocoffee.com/pages/high-st'),
		('Kolache Republic', 'kolache_republic.jpg', 'https://kolacherepublic.com/', 4, 2, 'coffee, food, dessert, non-dairy', 'https://kolacherepublic.com/menu/'),
		('Emmetts Cafe', 'emmetts_cafe.png', 'https://www.emmettscafe.com/', 2, 4, 'coffee, food, dessert, non-dairy, outdoor seating, dog friendly', 'https://www.emmettscafe.com/menu-s-high'),
		('Global Gallery', 'global_gallery.png', 'http://www.globalgallerycolumbus.com/', 3, 5, 'coffee, food, dessert, bean, alcohol, non-dairy, outdoor seating, dog friendly', 'http://www.globalgallerycolumbus.com/menu-2'),
		('Staufs Coffee', 'staufs_coffee.png', 'https://www.staufs.com/', 3, 4, 'coffee, food, dessert, non-dairy, outdoor seating, dog friendly', 'https://www.staufs.com/grandviewheightsmenu'),
		('Basic Biscuits, Kindness, and Coffee', 'basic_biscuits.png', 'https://www.getbasicbiscuits.com/', 4, 3, 'coffee, food, alcohol, non-dairy, outdoor seating', 'https://www.getbasicbiscuits.com/home'),
		('Qamaria Yemeni Coffee Co.', 'qamaria_coffee.png', 'https://www.qamariacoffee.com/', 4, 3, 'coffee, dessert, bean, smoothies, non-dairy', 'https://www.clover.com/online-ordering/qamaria-hilliard'),
		('The Roosesvelt Coffeehouse', 'roosevelt_coffee.png', 'https://www.rooseveltcoffee.org/', 3, 3, 'coffee, dessert, food, non-dairy, outdoor seating, dog friendly', 'https://roosevelt.coffee/shop/'),
		('Mission Coffee Company', 'mission_coffee.png', 'https://www.missioncoffeeco.com/', 2, 2, 'coffee, bean', 'https://www.missioncoffeeco.com/collections')
		;
		
INSERT INTO address (address) 
VALUES ('3058 W Broad St, Columbus, OH 43204'),
		('1031 N 4th St, Columbus, OH 43201'),
		('210 Thurman Ave, Columbus, OH 43206'),
		('160 W Main St G, New Albany, OH 43054'),
		('541 S. 3rd St, Columbus, OH 43215'),
		('745 N. High St, Columbus, OH 43215'),
		('53 N. High St, Columbus, OH 43215'),
		('702 S. High St, Columbus, OH 43206'),
		('774 S. High St, Columbus, OH 43206'),
		('3535 N. High Street, Columbus, OH 43214'),
		('1277 Grandview Ave, Columbus, OH 43212'),
		('1160 Goodale Boulevard, Columbus, OH 43212'),
		('3221 Hilliard Rome Rd, Hilliard, OH 43026'),
		('300 E Long St Columbus, OH 43215'),
		('2060 S High St, Columbus, OH 43207')
		;

INSERT INTO hours (shop_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday)
VALUES (1, '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '8a-2p', '8a-2p'),
		(2, '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '8a-3p', '8a-3p'),
		(3, '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p'),
		(4, '7a-7p', '7a-7p', '7a-7p', '7a-7p', '7a-8p', '8a-8p', '8a-7p'),
		(5, '7a-2p', '7a-2p', '7a-2p', '7a-2p', '7a-2p', '8a-2p', 'closed'),
		(6, 'closed', 'closed', '7a-1p', '7a-1p', '7a-1p', '8a-1p', '9a-1p'),
		(7, '7a-2p', '7a-2p', '7a-2p', '7a-2p', '7a-2p', '8a-3p', '8a-3p'),
		(8, '8a-7p', '8a-7p', '8a-7p', '8a-7p', '8a-7p', '8a-8p', '8a-7p'),
		(9, '6:30a-6p', '6:30a-6p', '6:30a-6p', '6:30a-6p', '6:30a-8p', '7a-8p', '8a-6p'),
		(10, 'closed', '7a-12p', '7a-12p', '7a-12p', '7a-12p', '8a-1p', '8a-1p'),
		(11, '7a-2p', '7a-2p', '7a-2p', '7a-2p', '7a-2p', '7a-2p', '7a-2p'),
		(12, '7a-6p', '7a-6p', '7a-6p', '7a-6p', '7a-6p', '8a-6p', '8a-6p'),
		(13, '8:30a-4:30p', '8:30a-4:30p', '8:30a-4:30p', '8:30a-4:30p', '8:30a-4:30p', '8:30a-4:30p', '8:30a-4:30p')
		;

INSERT INTO shop_address (shop_id, address_id)
VALUES (1, 1), (2, 2), (2, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 8), (7, 9), (8, 10), (9, 11), (10, 12), (11, 13), (12, 14), (13, 15);

COMMIT TRANSACTION;
