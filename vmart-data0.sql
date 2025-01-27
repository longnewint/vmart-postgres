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
(1, NULL, 'Produce'),
(2, NULL, 'Plant Protein & Tofu'),
(3, NULL, 'Bakery'),
(4, NULL, 'Frozen Food'),
(5, NULL, 'Pantry'),
(6, NULL, 'Plant-based Milk'),
(7, NULL, 'Drinks'),
(8, NULL, 'Snacks, Chips & Candy');

INSERT INTO product_category VALUES
(9, 1, 'Vegetables'),
(10, 1, 'Fruits'),
(11, 2, 'Plant Protein'),
(12, 2, 'Tofu'),
(13, 2, 'Tempeh'),
(14, 3, 'Bread'),
(15, 3, 'Buns & Rolls'),
(16, 3, 'Tortillas & Flat Breads'),
(17, 3, 'Cake'),
(18, 4, 'Frozen Vegetables'),
(19, 4, 'Frozen Fruits'),
(20, 4, 'Frozen Plant Protein'),
(21, 5, 'Rice & Noodles'),
(22, 5, 'Instant Ramen'),
(23, 5, 'Dried Beans, Vegetables & Grains'),
(24, 5, 'Spices & Seasonings'),
(25, 5, 'Condiments & Sauces'),
(26, 5, 'Canned & Pickled'),
(27, 5, 'Syrups & Spreads'),
(28, 5, 'Oil & Vinegar'),
(29, 5, 'Bulk Nuts and Candy'),
(30, 6, 'Soy Milk'),
(31, 6, 'Rice Milk'),
(32, 6, 'Almond Milk'),
(33, 6, 'Cashew Milk'),
(34, 6, 'Oat & Other Plant Milk'),
(35, 7, 'Juice'),
(36, 7, 'Coffee'),
(37, 7, 'Tea'),
(38, 8, 'Crackers & Cookies'),
(39, 8, 'Candy & Chocolate'),
(40, 8, 'Chips & Snacks');

INSERT INTO product_category VALUES
(41, 9, 'Brocoli, Cabbage & Cauliflower'),
(42, 9, 'Green Leefy Vegetables'),
(43, 9, 'Carrots, Radish & Root Vegetables'),
(44, 9, 'Tomatoes, Peppers & Eggplant'),
(45, 9, 'Mushrooms'),
(46, 9, 'Potatoes & Onions'),
(47, 9, 'Squash & Pumpkin'),
(48, 9, 'Cucumber, Celery & Leeks'),
(49, 9, 'Peas, Beans & Corn'),
(50, 9, 'Garlic & Ginger'),
(51, 9, 'Herbs'),
(52, 9, 'International Vegetables');

INSERT INTO product_category VALUES
(53, 10, 'Oranges'),
(54, 10, 'Bananas'),
(55, 10, 'Peach, Plum & Nectarines'),
(56, 10, 'Grapes'),
(57, 10, 'Berries & Cherries'),
(58, 10, 'Mango, Pineapple & Kiwi'),
(59, 10, 'Tropical Fruits'),
(60, 10, 'Apples'),
(61, 10, 'Pears'),
(62, 10, 'Watermelon & Melons'),
(63, 10, 'Lemons & Lime');

INSERT INTO product_category VALUES
(64, 14, 'White & Wheat Bread'),
(65, 14, 'Whole & Multi Grain Bread'),
(66, 14, 'Rye, Sourdough & Pumpernickel Bread'),
(67, 14, 'Baguettes'),
(68, 15, 'Dinner Rolls'),
(69, 15, 'Sandwich & Sub Buns'),
(70, 15, 'Hotdog & Hamburger Buns'),
(71, 16, 'Pita, Naan & Roti'),
(72, 16, 'Tortillas & Wrap'),
(73, 16, 'Flat Bread & Pizza Crust'),
(74, 17, 'Desert Cake'),
(75, 17, 'Cheesecakes'),
(76, 17, 'Celebration Cake'),
(77, 17, 'Single Serve');

INSERT INTO product_category VALUES
(78, 21, 'Rice'),
(79, 21, 'Noodles'),
(80, 21, 'Dry Pasta'),
(81, 23, 'Dried Beans'),
(82, 23, 'Dried Vegetables'),
(83, 23, 'Dried Grains'),
(84, 24, 'Spices'),
(85, 24, 'Seasonings'),
(86, 25, 'Condiments'),
(87, 25, 'Sauces'),
(88, 26, 'Canned Tomatoes & Vegetables'),
(89, 26, 'Canned Fruits'),
(90, 26, 'Canned Beans'),
(91, 26, 'Pickled & Marinated Vegetables'),
(92, 26, 'Canned Olive'),
(93, 27, 'Jams'),
(94, 27, 'Nut Butter & Spreads'),
(95, 27, 'Maple & Other Syrup'),
(96, 28, 'Oils'),
(97, 28, 'Vinegar'),
(98, 29, 'Bulk Nuts'),
(99, 29, 'Bulk Candy');

INSERT INTO product_category VALUES
(101, 35, 'Orange Juices'),
(102, 35, 'Apple Juices'),
(103, 35, 'Cranberry Juices'),
(104, 35, 'Other Juices'),
(105, 35, 'Lemonade'),
(106, 36, 'Ground Coffee'),
(107, 36, 'Whole Bean'),
(108, 36, 'Instant Coffee'),
(109, 36, 'Coffee Pods'),
(110, 37, 'Black Tea'),
(111, 37, 'Green Tea'),
(112, 37, 'Specialty Tea');

INSERT INTO product_category VALUES
(113, 38, 'Crackers'),
(114, 38, 'Cookies'),
(115, 39, 'Chocolate Bars'),
(116, 39, 'Chocolate Candies'),
(117, 39, 'Gummy'),
(118, 39, 'Hard Candies'),
(119, 39, 'Soft Candies'),
(120, 40, 'Potato Chips'),
(121, 40, 'Cheese Puffs'),
(122, 40, 'Corn & Tortillas Chips');


INSERT INTO product VALUES


INSERT INTO item VALUES
