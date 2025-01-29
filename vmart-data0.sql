--
-- vmart database dump
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
(1, 41, 'Brocoli', 3.99, NULL, NULL, NULL),
(2, 41, 'Cabbage', 4.99, NULL, NULL, NULL),
(3, 42, 'Kale', 3.00, NULL, NULL, NULL),
(4, 42, 'Collard Green', 4.99, NULL, NULL, NULL),
(5, 43, 'Carrot', 5.00, NULL, NULL, NULL),
(6, 43, 'Radishes', 2.49, NULL, NULL, NULL),
(7, 44, 'Roma Tomatores', 9.00, NULL, NULL, NULL),
(9, 44, 'Mixed Peppers', 9.00, NULL, NULL, NULL),
(10, 46, 'Sweet Potatoes', 7.00, NULL, NULL, NULL),
(11, 46, 'Yellow Potatoes', 7.00, NULL, NULL, NULL),
(12, 46, 'Yellow Onions', 7.00, NULL, NULL, NULL),
(13, 47, 'Buttercup Squash', 8.30, NULL, NULL, NULL),
(14, 48, 'English Cucumber', 2.00, NULL, NULL, NULL),
(15, 48, 'Celery Stalk', 3.50, NULL, NULL, NULL),
(16, 50, 'Garlic', 7.00, NULL, NULL, NULL),
(17, 51, 'Cilantro', 1.50, NULL, NULL, NULL),
(18, 51, 'Basil', 4.00, NULL, NULL, NULL),
(19, 51, 'Mint', 2.00, NULL, NULL, NULL),
(20, 52, 'Napa Cabbage', 3.30, NULL, NULL, NULL),
(21, 52, 'Bok Choy', 3.50, NULL, NULL, NULL),
(22, 52, 'Choy Sum', 4.50, NULL, NULL, NULL),
(23, 52, 'Gai Lan', 4.50, NULL, NULL, NULL),
(24, 52, 'Bean Sprouts', 2.50, NULL, NULL, NULL),
(25, 52, 'Japanese Yams', 5.40, NULL, NULL, NULL),
(26, 52, 'Flat Cabbage', 3.30, NULL, NULL, NULL),
(27, 52, 'Daikon Radish', 2.70, NULL, NULL, NULL),
(28, 52, 'Purple Eggplants', 4.50, NULL, NULL, NULL),
(29, 52, 'Eddoes', 7.00, NULL, NULL, NULL),
(30, 52, 'Watercress', 2.00, NULL, NULL, NULL);

INSERT INTO product VALUES
(31, 53, 'Navel Oranges', 5.00, NULL, NULL, NULL),
(32, 53, 'Mandarin Oranges', 6.00, NULL, NULL, NULL),
(33, 54, 'Bananas', 1.70, NULL, NULL, NULL),
(34, 57, 'Blueberries', 6.00, NULL, NULL, NULL),
(35, 57, 'Blackberries', 8.00, NULL, NULL, NULL),
(36, 57, 'Strawberries', 6.00, NULL, NULL, NULL),
(37, 58, 'Pineapple', 3.00, NULL, NULL, NULL),
(38, 58, 'Kiwi', 8.00, NULL, NULL, NULL),
(39, 59, 'Papaya', 5.50, NULL, NULL, NULL),
(40, 59, 'Alphonso Mango', 8.00, NULL, NULL, NULL),
(41, 59, 'Fuyu Persimmon', 9.00, NULL, NULL, NULL),
(42, 61, 'Bartlett Pears', 7.00, NULL, NULL, NULL),
(43, 61, 'Ya Pears', 5.00, NULL, NULL, NULL),
(44, 61, 'Yellow Asian Pears', 4.50, NULL, NULL, NULL);

INSERT INTO product VALUES
(45, 11, 'Veggie Ground Round', 5.50, NULL, NULL, NULL),
(46, 11, 'Veggie Ground Round Large', 14.97, NULL, NULL, NULL),
(47, 11, 'Veggie Dog', 6.00, NULL, NULL, NULL),
(48, 12, 'Extra Firm Tofu', 2.50, NULL, NULL, NULL),
(49, 12, 'Firm Tofu', 2.50, NULL, NULL, NULL),
(50, 12, 'Medium Firm Tofu', 2.50, NULL, NULL, NULL);


INSERT INTO item VALUES
