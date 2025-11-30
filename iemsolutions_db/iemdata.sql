
USE iemsolutions;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS IEMProduct;
DROP TABLE IF EXISTS IEMTuning;
DROP TABLE IF EXISTS IEMCategory;
DROP TABLE IF EXISTS IEMBrand;

SET FOREIGN_KEY_CHECKS = 1;

-- Create IEMCategory table
CREATE TABLE IEMCategory (
  categoryID int(11) NOT NULL AUTO_INCREMENT,
  categoryName varchar(255) NOT NULL,
  categoryDescription text,
  PRIMARY KEY (categoryID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Create IEMBrand table
CREATE TABLE IEMBrand (
  brandID int(11) NOT NULL AUTO_INCREMENT,
  brandName varchar(255) NOT NULL,
  PRIMARY KEY (brandID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Create IEMTuning table
CREATE TABLE IEMTuning (
  tuningID int(11) NOT NULL AUTO_INCREMENT,
  tuningDetails text,
  PRIMARY KEY (tuningID)
  ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Create IEMProduct table
CREATE TABLE IEMProduct (
  productID int(11) NOT NULL AUTO_INCREMENT,
  productName varchar(255) NOT NULL,
  productDescription text,
  categoryID int(11) DEFAULT NULL,
  price decimal(10,2) NOT NULL,
  brandID int(11) DEFAULT NULL,
  tuningID int(11) DEFAULT NULL,
  PRIMARY KEY (productID),
  CONSTRAINT IEMProductBrandFK FOREIGN KEY (brandID) REFERENCES IEMBrand(brandID) ON DELETE SET NULL,
  CONSTRAINT IEMProductTuningFK FOREIGN KEY (tuningID) REFERENCES IEMTuning (tuningID) ON DELETE SET NULL,
  CONSTRAINT IEMProductCategoryFK FOREIGN KEY (categoryID) REFERENCES IEMCategory (categoryID) ON DELETE SET NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Brands
INSERT INTO IEMBrand (brandName) VALUES
('Dunu'),         -- 1
('Moondrop'),     -- 2
('FiiO'),         -- 3
('Meze'),         -- 4
('Simgot'),       -- 5
('Kiwi Ears'),    -- 6
('TangZu'),       -- 7
('7HZ'),          -- 8
('Tanchjim'),     -- 9
('Letshuoer'),    -- 10
('Crinacle'),     -- 11  (Crin x Truthear collabs sometimes used)
('TinHiFi');      -- 12

-- Tunings
INSERT INTO IEMTuning (tuningID, tuningDetails) VALUES
(1, 'V-shaped sound signature with enhanced bass and treble'),
(2, 'Balanced tuning with emphasis on midrange clarity'),
(3, 'Warm sound signature with smooth highs and rich lows'),
(4, 'Neutral tuning for accurate sound reproduction'),
(5, 'Bass-heavy tuning for energetic listening experience'),
(6, 'Bright tuning with emphasis on high frequencies');

-- Quality Categories
INSERT INTO IEMCategory (categoryName, categoryDescription) VALUES
('Premium', 'Top-tier in-ear monitors'),
('High', 'High-quality in-ear monitors'),
('Medium', 'Affordable, and perfect for everyday listening'),
('Low', 'Good sound on a budget');

-- Products (20 IEMS)
INSERT INTO IEMProduct (productName, productDescription, categoryID, price, brandID, tuningID) VALUES
('Dunu Falcon Ultra', 'Small IEMs with high comfort and quality sound', 2, 186.99, 1, 1),
('Dunu Titan S', 'Durable in-ear monitors with powerful sound', 3, 59.99, 1, 5),
('Moondrop Starfield', 'Balanced sound with clarity and detail', 3, 109.99, 2, 2),
('Moondrop Starfield 2', 'Updated tuning with improved technicalities', 3, 109.00, 2, 2),
('Moondrop Kato', 'High-value IEM with well-balanced tuning', 2, 189.99, 2, 2),
('Moondrop Blessing 2', 'Flagship hybrid IEM with exceptional clarity', 1, 319.99, 2, 4),
('Moondrop CHU II', 'Budget IEM with strong tuning performance', 4, 19.99, 2, 5),
('FiiO FH5', 'Hybrid driver system offering rich sound', 2, 179.99, 3, 2),
('FiiO FD5', 'Dynamic driver with punchy bass', 2, 129.99, 3, 1),
('FiiO FH15', 'Hybrid driver IEM with advanced tuning', 2, 169.99, 3, 2),
('Meze 12 Classics', 'Warm and natural-sounding earphones', 3, 199.99, 4, 3),
('Meze Alba', 'Entry-level IEM with excellent value', 3, 79.99, 4, 3),
('Simgot EM6L', 'Neutral-leaning IEM with strong detail', 2, 199.00, 5, 4),
('Simgot EW200', 'Budget-neutral IEM with clarity', 3, 39.99, 5, 4),
('Kiwi Ears Melody', 'Affordable IEM with smooth tuning', 3, 80.00, 6, 3),
('Kiwi Ears Quartet', 'Fun V-shaped tuning with punchy bass', 2, 109.00, 6, 1),
('TangZu Wu Zetian', 'Planar IEM with warm tuning', 2, 119.00, 7, 3),
('7HZ Timeless', 'Popular planar magnetic IEM', 1, 199.99, 8, 1),
('Tanchjim 4U', 'Entry-level clean-tuned IEM', 4, 79.99, 9, 4),
('TinHiFi T4 Plus', 'Warm, fun single-DD IEM', 2, 120.00, 12, 3);



COMMIT;

-- End of iemdata.sql