--
-- vmart database dump 0
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;

SET default_with_oids = false;
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO vmart_user VALUES
(12345, 'dev@mail.com');

INSERT INTO shopping_cart VALUES
(1234567, 12345);

INSERT INTO store VALUES
(nextval('store_seq'), 'VMart Ottawa', '6134131234'),
(nextval('store_seq'), 'VMart Kanata', '6134132345');

INSERT INTO product_category VALUES
(1, NULL, 'Produce', FALSE),
(2, NULL, 'Plant Protein & Tofu', FALSE),
(3, NULL, 'Bakery', FALSE),
(4, NULL, 'Frozen Food', FALSE),
(5, NULL, 'Pantry', FALSE),
(6, NULL, 'Plant-based Milk', FALSE),
(7, NULL, 'Drinks', FALSE),
(8, NULL, 'Snacks, Chips & Candy', FALSE);

INSERT INTO product_category VALUES
(9, 1, 'Vegetables', FALSE),
(10, 1, 'Fruits', FALSE),
(11, 2, 'Plant Protein', TRUE),
(12, 2, 'Tofu', TRUE),
(13, 2, 'Tempeh', TRUE),
(14, 3, 'Bread', FALSE),
(15, 3, 'Buns & Rolls', FALSE),
(16, 3, 'Tortillas & Flat Breads', FALSE),
(17, 3, 'Cake', FALSE),
(18, 4, 'Frozen Vegetables', TRUE),
(19, 4, 'Frozen Fruits', TRUE),
(20, 4, 'Frozen Plant Protein', TRUE),
(21, 5, 'Rice & Noodles', FALSE),
(22, 5, 'Instant Ramen', TRUE),
(23, 5, 'Dried Beans, Vegetables & Grains', FALSE),
(24, 5, 'Spices & Seasonings', FALSE),
(25, 5, 'Condiments & Sauces', FALSE),
(26, 5, 'Canned & Pickled', FALSE),
(27, 5, 'Syrups & Spreads', FALSE),
(28, 5, 'Oil & Vinegar', FALSE),
(29, 5, 'Bulk Nuts and Candy', FALSE),
(30, 6, 'Soy Milk', TRUE),
(31, 6, 'Rice Milk', TRUE),
(32, 6, 'Almond Milk', TRUE),
(33, 6, 'Cashew Milk', TRUE),
(34, 6, 'Oat & Other Plant Milk', TRUE),
(35, 7, 'Juice', FALSE),
(36, 7, 'Coffee', FALSE),
(37, 7, 'Tea', FALSE),
(38, 8, 'Crackers & Cookies', FALSE),
(39, 8, 'Candy & Chocolate', FALSE),
(40, 8, 'Chips & Snacks', FALSE);

INSERT INTO product_category VALUES
(41, 9, 'Brocoli, Cabbage & Cauliflower', TRUE),
(42, 9, 'Green Leefy Vegetables', TRUE),
(43, 9, 'Carrots, Radish & Root Vegetables', TRUE),
(44, 9, 'Tomatoes, Peppers & Eggplant', TRUE),
(45, 9, 'Mushrooms', TRUE),
(46, 9, 'Potatoes & Onions', TRUE),
(47, 9, 'Squash & Pumpkin', TRUE),
(48, 9, 'Cucumber, Celery & Leeks', TRUE),
(49, 9, 'Peas, Beans & Corn', TRUE),
(50, 9, 'Garlic & Ginger', TRUE),
(51, 9, 'Herbs', TRUE),
(52, 9, 'International Vegetables', TRUE);

INSERT INTO product_category VALUES
(53, 10, 'Oranges', TRUE),
(54, 10, 'Bananas', TRUE),
(55, 10, 'Peach, Plum & Nectarines', TRUE),
(56, 10, 'Grapes', TRUE),
(57, 10, 'Berries & Cherries', TRUE),
(58, 10, 'Mango, Pineapple & Kiwi', TRUE),
(59, 10, 'Tropical Fruits', TRUE),
(60, 10, 'Apples', TRUE),
(61, 10, 'Pears', TRUE),
(62, 10, 'Watermelon & Melons', TRUE),
(63, 10, 'Lemons & Lime', TRUE);

INSERT INTO product_category VALUES
(64, 14, 'White & Wheat Bread', TRUE),
(65, 14, 'Whole & Multi Grain Bread', TRUE),
(66, 14, 'Rye, Sourdough & Pumpernickel Bread', TRUE),
(67, 14, 'Baguettes', TRUE),
(68, 15, 'Dinner Rolls', TRUE),
(69, 15, 'Sandwich & Sub Buns', TRUE),
(70, 15, 'Hotdog & Hamburger Buns', TRUE),
(71, 16, 'Pita, Naan & Roti', TRUE),
(72, 16, 'Tortillas & Wrap', TRUE),
(73, 16, 'Flat Bread & Pizza Crust', TRUE),
(74, 17, 'Desert Cake', TRUE),
(75, 17, 'Cheesecakes', TRUE),
(76, 17, 'Celebration Cake', TRUE),
(77, 17, 'Single Serve', TRUE);

INSERT INTO product_category VALUES
(78, 21, 'Rice', TRUE),
(79, 21, 'Noodles', TRUE),
(80, 21, 'Dry Pasta', TRUE),
(81, 23, 'Dried Beans', TRUE),
(82, 23, 'Dried Vegetables', TRUE),
(83, 23, 'Dried Grains', TRUE),
(84, 24, 'Spices', TRUE),
(85, 24, 'Seasonings', TRUE),
(86, 25, 'Condiments', TRUE),
(87, 25, 'Sauces', TRUE),
(88, 26, 'Canned Tomatoes & Vegetables', TRUE),
(89, 26, 'Canned Fruits', TRUE),
(90, 26, 'Canned Beans', TRUE),
(91, 26, 'Pickled & Marinated Vegetables', TRUE),
(92, 26, 'Canned Olive', TRUE),
(93, 27, 'Jams', TRUE),
(94, 27, 'Nut Butter & Spreads', TRUE),
(95, 27, 'Maple & Other Syrup', TRUE),
(96, 28, 'Oils', TRUE),
(97, 28, 'Vinegar', TRUE),
(98, 29, 'Bulk Nuts', TRUE),
(99, 29, 'Bulk Candy', TRUE);

INSERT INTO product_category VALUES
(101, 35, 'Orange Juices', TRUE),
(102, 35, 'Apple Juices', TRUE),
(103, 35, 'Cranberry Juices', TRUE),
(104, 35, 'Other Juices', TRUE),
(105, 35, 'Lemonade', TRUE),
(106, 36, 'Ground Coffee', TRUE),
(107, 36, 'Whole Bean', TRUE),
(108, 36, 'Instant Coffee', TRUE),
(109, 36, 'Coffee Pods', TRUE),
(110, 37, 'Black Tea', TRUE),
(111, 37, 'Green Tea', TRUE),
(112, 37, 'Specialty Tea', TRUE);

INSERT INTO product_category VALUES
(113, 38, 'Crackers', TRUE),
(114, 38, 'Cookies', TRUE),
(115, 39, 'Chocolate Bars', TRUE),
(116, 39, 'Chocolate Candies', TRUE),
(117, 39, 'Gummy', TRUE),
(118, 39, 'Hard Candies', TRUE),
(119, 39, 'Soft Candies', TRUE),
(120, 40, 'Potato Chips', TRUE),
(121, 40, 'Cheese Puffs', TRUE),
(122, 40, 'Corn & Tortillas Chips', TRUE);


INSERT INTO product VALUES
(nextval('product_seq'), 41, NULL, 'Brocoli', 3.99),
(nextval('product_seq'), 41, NULL, 'Cabbage', 4.99),
(nextval('product_seq'), 42, NULL, 'Kale', 3.00),
(nextval('product_seq'), 42, NULL, 'Collard Green', 4.99),
(nextval('product_seq'), 43, NULL, 'Carrot', 5.00),
(nextval('product_seq'), 43, NULL, 'Radishes', 2.49),
(nextval('product_seq'), 44, NULL, 'Roma Tomatores', 9.00),
(nextval('product_seq'), 44, NULL, 'Mixed Peppers', 9.00),
(nextval('product_seq'), 46, NULL, 'Sweet Potatoes', 7.00),
(nextval('product_seq'), 46, NULL, 'Yellow Potatoes', 7.00),
(nextval('product_seq'), 46, NULL, 'Yellow Onions', 7.00),
(nextval('product_seq'), 47, NULL, 'Buttercup Squash', 8.30),
(nextval('product_seq'), 48, NULL, 'English Cucumber', 2.00),
(nextval('product_seq'), 48, NULL, 'Celery Stalk', 3.50),
(nextval('product_seq'), 50, NULL, 'Garlic', 7.00),
(nextval('product_seq'), 51, NULL, 'Cilantro', 1.50),
(nextval('product_seq'), 51, NULL, 'Basil', 4.00),
(nextval('product_seq'), 51, NULL, 'Mint', 2.00),
(nextval('product_seq'), 52, NULL, 'Napa Cabbage', 3.30),
(nextval('product_seq'), 52, NULL, 'Bok Choy', 3.50),
(nextval('product_seq'), 52, NULL, 'Choy Sum', 4.50),
(nextval('product_seq'), 52, NULL, 'Gai Lan', 4.50),
(nextval('product_seq'), 52, NULL, 'Bean Sprouts', 2.50),
(nextval('product_seq'), 52, NULL, 'Japanese Yams', 5.40),
(nextval('product_seq'), 52, NULL, 'Flat Cabbage', 3.30),
(nextval('product_seq'), 52, NULL, 'Daikon Radish', 2.70),
(nextval('product_seq'), 52, NULL, 'Purple Eggplants', 4.50),
(nextval('product_seq'), 52, NULL, 'Eddoes', 7.00),
(nextval('product_seq'), 52, NULL, 'Watercress', 2.00);

INSERT INTO product VALUES
(nextval('product_seq'), 53, NULL, 'Navel Oranges', 5.00),
(nextval('product_seq'), 53, NULL, 'Mandarin Oranges', 6.00),
(nextval('product_seq'), 54, NULL, 'Bananas', 1.70),
(nextval('product_seq'), 57, NULL, 'Blueberries', 6.00),
(nextval('product_seq'), 57, NULL, 'Blackberries', 8.00),
(nextval('product_seq'), 57, NULL, 'Strawberries', 6.00),
(nextval('product_seq'), 58, NULL, 'Pineapple', 3.00),
(nextval('product_seq'), 58, NULL, 'Kiwi', 8.00),
(nextval('product_seq'), 59, NULL, 'Papaya', 5.50),
(nextval('product_seq'), 59, NULL, 'Alphonso Mango', 8.00),
(nextval('product_seq'), 59, NULL, 'Fuyu Persimmon', 9.00),
(nextval('product_seq'), 61, NULL, 'Bartlett Pears', 7.00),
(nextval('product_seq'), 61, NULL, 'Ya Pears', 5.00),
(nextval('product_seq'), 61, NULL, 'Yellow Asian Pears', 4.50);

INSERT INTO product VALUES
(nextval('product_seq'), 11, NULL, 'Veggie Ground Round', 5.50),
(nextval('product_seq'), 11, NULL, 'Veggie Ground Round Large', 14.97),
(nextval('product_seq'), 11, NULL, 'Veggie Dog', 6.00),
(nextval('product_seq'), 12, NULL, 'Extra Firm Tofu', 2.50),
(nextval('product_seq'), 12, NULL, 'Firm Tofu', 2.50),
(nextval('product_seq'), 12, NULL, 'Medium Firm Tofu', 2.50);

INSERT INTO product VALUES
(nextval('product_seq'), 64, NULL, 'White Bread', 2.50),
(nextval('product_seq'), 64, NULL, 'Whole Wheat Bread', 2.50),
(nextval('product_seq'), 66, NULL, 'Sourdough Bread', 5.00),
(nextval('product_seq'), 66, NULL, 'Pumpernickel Bread', 5.00),
(nextval('product_seq'), 67, NULL, 'White Baguette', 1.89),
(nextval('product_seq'), 68, NULL, 'White Dinner Roll', 3.99),
(nextval('product_seq'), 68, NULL, 'Whole Wheat Dinner Roll', 3.99),
(nextval('product_seq'), 69, NULL, 'Kaiser Rolls White', 4.29),
(nextval('product_seq'), 69, NULL, 'Kaiser Rolls Whole Wheat', 4.29),
(nextval('product_seq'), 69, NULL, 'Submarine Buns', 3.49),
(nextval('product_seq'), 70, NULL, 'Hamburger Buns', 3.29),
(nextval('product_seq'), 70, NULL, 'Hotdog Buns', 3.29),
(nextval('product_seq'), 71, NULL, 'Naan Garlic', 5.00),
(nextval('product_seq'), 71, NULL, 'Naan Original', 5.00);

INSERT INTO product VALUES
(nextval('product_seq'), 18, NULL, 'Whole Kernel Corn', 7.00),
(nextval('product_seq'), 18, NULL, 'Green Peas', 7.00),
(nextval('product_seq'), 18, NULL, 'Sliced Okra', 7.00),
(nextval('product_seq'), 18, NULL, 'Frozen Edamame', 2.50),
(nextval('product_seq'), 18, NULL, 'Green Peas', 7.00),
(nextval('product_seq'), 19, NULL, 'Frozen Blueberries', 14.99),
(nextval('product_seq'), 19, NULL, 'Frozen Strawberries', 14.99),
(nextval('product_seq'), 19, NULL, 'Frozen Mango', 14.99);

INSERT INTO product VALUES
(nextval('product_seq'), 78, NULL, 'Jasmine Rice', 18.00),
(nextval('product_seq'), 78, NULL, 'Brown Rice', 18.00),
(nextval('product_seq'), 79, NULL, 'Rice Vermicelli', 1.85),
(nextval('product_seq'), 79, NULL, 'Thin Rice Noodles', 1.49),
(nextval('product_seq'), 79, NULL, 'Thick Rice Noodles', 1.49),
(nextval('product_seq'), 79, NULL, 'Udon Noodles', 2.99),
(nextval('product_seq'), 80, NULL, 'Macaroni Pasta', 4.00),
(nextval('product_seq'), 80, NULL, 'Penne Rigate Pasta', 4.00),
(nextval('product_seq'), 80, NULL, 'Rotini Pasta', 1.97),
(nextval('product_seq'), 81, NULL, 'Chickpeas', 5.99),
(nextval('product_seq'), 81, NULL, 'Red Kidney Beans', 5.99),
(nextval('product_seq'), 81, NULL, 'Pinto Beans', 6.99),
(nextval('product_seq'), 81, NULL, 'Navy Beans', 6.99),
(nextval('product_seq'), 82, NULL, 'Sushi Nori Seaweed Sheets', 3.49),
(nextval('product_seq'), 82, NULL, 'Dried Mushroom', 12.99),
(nextval('product_seq'), 82, NULL, 'Kombu Dried Kelp', 6.99),
(nextval('product_seq'), 84, NULL, 'Onion Powder', 2.49),
(nextval('product_seq'), 84, NULL, 'Garlic Powder', 2.49),
(nextval('product_seq'), 84, NULL, 'Ground Black Pepper', 2.49),
(nextval('product_seq'), 84, NULL, 'Chilli Powder', 4.29),
(nextval('product_seq'), 84, NULL, 'Ground Ginger', 3.29),
(nextval('product_seq'), 85, NULL, 'Iodized Table Salt', 1.67),
(nextval('product_seq'), 85, NULL, 'Vegetable Food Seasoning', 6.99);
(nextval('product_seq'), 86, NULL, 'Japanese Curry Mix Hot', 3.99);
(nextval('product_seq'), 86, NULL, 'Japanese Curry Mix Medium', 3.99);
(nextval('product_seq'), 86, NULL, 'Thai Green Curry Powder', 3.99);
(nextval('product_seq'), 86, NULL, 'Thai Red Curry Powder', 3.99);
(nextval('product_seq'), 86, NULL, 'Dark Soy Sauce', 2.99);
(nextval('product_seq'), 86, NULL, 'Red Pepper Paste Gochujang', 6.99);
(nextval('product_seq'), 86, NULL, 'Soy Bean Paste', 6.99);
(nextval('product_seq'), 86, NULL, 'Korean Bulgogi Sauce', 7.99);
(nextval('product_seq'), 86, NULL, 'Korean Galbi Sauce', 7.99);
(nextval('product_seq'), 86, NULL, 'Horseradish Paste Wasabi Paste', 2.99);

-- INSERT INTO product VALUES

INSERT INTO store_item VALUES
(nextval('store_item_seq'), 1001, 101, 100, 0),
(nextval('store_item_seq'), 1002, 101, 100, 0),
(nextval('store_item_seq'), 1003, 101, 100, 0),
(nextval('store_item_seq'), 1004, 101, 100, 0),
(nextval('store_item_seq'), 1005, 101, 100, 0),
(nextval('store_item_seq'), 1006, 101, 100, 0),
(nextval('store_item_seq'), 1007, 101, 100, 0),
(nextval('store_item_seq'), 1008, 101, 100, 0),
(nextval('store_item_seq'), 1009, 101, 100, 0),
(nextval('store_item_seq'), 1010, 101, 100, 0),
(nextval('store_item_seq'), 1011, 101, 100, 0),
(nextval('store_item_seq'), 1012, 101, 100, 0),
(nextval('store_item_seq'), 1013, 101, 100, 0),
(nextval('store_item_seq'), 1014, 101, 100, 0),
(nextval('store_item_seq'), 1015, 101, 100, 0),
(nextval('store_item_seq'), 1016, 101, 100, 0),
(nextval('store_item_seq'), 1017, 101, 100, 0),
(nextval('store_item_seq'), 1018, 101, 100, 0),
(nextval('store_item_seq'), 1019, 101, 100, 0),
(nextval('store_item_seq'), 1020, 101, 100, 0),
(nextval('store_item_seq'), 1021, 101, 100, 0),
(nextval('store_item_seq'), 1022, 101, 100, 0),
(nextval('store_item_seq'), 1023, 101, 100, 0),
(nextval('store_item_seq'), 1024, 101, 100, 0),
(nextval('store_item_seq'), 1025, 101, 100, 0),
(nextval('store_item_seq'), 1026, 101, 100, 0),
(nextval('store_item_seq'), 1027, 101, 100, 0),
(nextval('store_item_seq'), 1028, 101, 100, 0),
(nextval('store_item_seq'), 1029, 101, 100, 0),
(nextval('store_item_seq'), 1030, 101, 100, 0),
(nextval('store_item_seq'), 1031, 101, 100, 0),
(nextval('store_item_seq'), 1032, 101, 100, 0),
(nextval('store_item_seq'), 1033, 101, 100, 0),
(nextval('store_item_seq'), 1034, 101, 100, 0),
(nextval('store_item_seq'), 1035, 101, 100, 0),
(nextval('store_item_seq'), 1036, 101, 100, 0),
(nextval('store_item_seq'), 1037, 101, 100, 0),
(nextval('store_item_seq'), 1038, 101, 100, 0),
(nextval('store_item_seq'), 1039, 101, 100, 0),
(nextval('store_item_seq'), 1040, 101, 100, 0),
(nextval('store_item_seq'), 1041, 101, 100, 0),
(nextval('store_item_seq'), 1042, 101, 100, 0),
(nextval('store_item_seq'), 1043, 101, 100, 0),
(nextval('store_item_seq'), 1044, 101, 100, 0),
(nextval('store_item_seq'), 1045, 101, 100, 0),
(nextval('store_item_seq'), 1046, 101, 100, 0),
(nextval('store_item_seq'), 1047, 101, 100, 0),
(nextval('store_item_seq'), 1048, 101, 100, 0),
(nextval('store_item_seq'), 1049, 101, 100, 0),
(nextval('store_item_seq'), 1050, 101, 100, 0),
(nextval('store_item_seq'), 1051, 101, 100, 0),
(nextval('store_item_seq'), 1052, 101, 100, 0),
(nextval('store_item_seq'), 1053, 101, 100, 0),
(nextval('store_item_seq'), 1054, 101, 100, 0),
(nextval('store_item_seq'), 1055, 101, 100, 0),
(nextval('store_item_seq'), 1056, 101, 100, 0),
(nextval('store_item_seq'), 1057, 101, 100, 0),
(nextval('store_item_seq'), 1058, 101, 100, 0),
(nextval('store_item_seq'), 1059, 101, 100, 0),
(nextval('store_item_seq'), 1060, 101, 100, 0),
(nextval('store_item_seq'), 1061, 101, 100, 0),
(nextval('store_item_seq'), 1062, 101, 100, 0),
(nextval('store_item_seq'), 1063, 101, 100, 0),
(nextval('store_item_seq'), 1064, 101, 100, 0),
(nextval('store_item_seq'), 1065, 101, 100, 0),
(nextval('store_item_seq'), 1066, 101, 100, 0),
(nextval('store_item_seq'), 1067, 101, 100, 0),
(nextval('store_item_seq'), 1068, 101, 100, 0),
(nextval('store_item_seq'), 1069, 101, 100, 0),
(nextval('store_item_seq'), 1070, 101, 100, 0),
(nextval('store_item_seq'), 1071, 101, 100, 0),
(nextval('store_item_seq'), 1072, 101, 100, 0),
(nextval('store_item_seq'), 1073, 101, 100, 0),
(nextval('store_item_seq'), 1074, 101, 100, 0),
(nextval('store_item_seq'), 1075, 101, 100, 0),
(nextval('store_item_seq'), 1076, 101, 100, 0),
(nextval('store_item_seq'), 1077, 101, 100, 0),
(nextval('store_item_seq'), 1078, 101, 100, 0),
(nextval('store_item_seq'), 1079, 101, 100, 0),
(nextval('store_item_seq'), 1080, 101, 100, 0),
(nextval('store_item_seq'), 1081, 101, 100, 0),
(nextval('store_item_seq'), 1082, 101, 100, 0),
(nextval('store_item_seq'), 1083, 101, 100, 0),
(nextval('store_item_seq'), 1084, 101, 100, 0),
(nextval('store_item_seq'), 1085, 101, 100, 0),
(nextval('store_item_seq'), 1086, 101, 100, 0),
(nextval('store_item_seq'), 1087, 101, 100, 0),
(nextval('store_item_seq'), 1088, 101, 100, 0),
(nextval('store_item_seq'), 1089, 101, 100, 0),
(nextval('store_item_seq'), 1090, 101, 100, 0),
(nextval('store_item_seq'), 1091, 101, 100, 0),
(nextval('store_item_seq'), 1092, 101, 100, 0);

INSERT INTO shipping_method VALUES
(1, 'Pick up'),
(2, 'Delivery'),
(3, 'Express Delivery');

INSERT INTO payment_type VALUES
(1, 'Visa'),
(2, 'Mastercard'),
(3, 'American Express');

INSERT INTO order_status VALUES
(1, 'Preparing'),
(2, 'Waiting for pick up'),
(3, 'Picked up'),
(4, 'Waiting for delivery'),
(5, 'Delivering'),
(6, 'Delivered to location');
