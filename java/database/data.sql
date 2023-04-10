BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO coffee_shops (shop_name, main_image, website_link, price_range, rating, highlights, menu_link)
VALUES ('Third Way Cafe', 'third way cafe_1611697786.webp', 'www.thirdwaycafe.org', 1, 4, 'coffee', 'www.thirdwaycafe.org/menu'),
		('Fox in the Snow Cafe', 'foxinthesnow.jpeg', 'www.foxinthesnow.com', 3, 4, 'coffee, food, desserts, beans, alcohol', 'www.foxinthesnow.com/menus/#menu');
		
INSERT INTO address (address) 
VALUES ('3058 W Broad St, Columbus, OH 43204'),
		('1031 N 4th St, Columbus, OH 43201'),
		('210 Thurman Ave, Columbus, OH 43206'),
		('160 W Main St G, New Albany, OH 43054');

INSERT INTO hours (shop_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday)
VALUES (1, '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '8a-2p', '8a-2p'),
		(2, '7a-3p', '7a-3p', '7a-3p', '7a-3p', '7a-3p', '8a-3p', '8a-3p');

INSERT INTO shop_address (shop_id, address_id)
VALUES (1, 1), (2, 2), (2, 3), (2, 4);

COMMIT TRANSACTION;
