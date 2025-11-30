
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

-- Create IEMProduct table
CREATE TABLE IEMProduct (
  productID int(11) NOT NULL AUTO_INCREMENT,
  productName varchar(255) NOT NULL,
  productDescription text,
  categoryID int(11) DEFAULT NULL,
  price decimal(10,2) NOT NULL,
  brandID int(11) DEFAULT NULL,
  PRIMARY KEY (productID),
  FOREIGN KEY (categoryID) REFERENCES
  IEMCategory(categoryID) ON DELETE SET NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Create IEMTuning table
CREATE TABLE IEMTuning (
  tuningID int(11) NOT NULL AUTO_INCREMENT,
  productID int(11) NOT NULL,
  tuningDetails text,
  PRIMARY KEY (tuningID),
  FOREIGN KEY (productID) REFERENCES
  IEMProduct(productID) ON DELETE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Quality Categories
INSERT INTO IEMCategory (categoryName, categoryDescription) VALUES
('Premium', 'Top-tier in-ear monitors'),
('High', 'High-quality in-ear monitors'),
('Medium', 'Affordable, and perfect for everyday listening'),
('Low', 'Good sound on a budget');

-- Brands
INSERT INTO IEMBrand (brandName) VALUES
('Dunu'),
('Moondrop'),
('FiiO'),
('Meze');

-- Products
INSERT INTO IEMProduct (productName, productDescription, categoryID, price, brandID) VALUES
('Dunu Falcon Ultra', 'Small IEMs with high comfort and quality sound', 1, 199.99, 1),
('Moondrop Starfield', 'Balanced sound with a focus on clarity and detail', 2, 149.99, 2),
('FiiO FH5', 'Hybrid drivers for a rich and immersive listening experience', 2, 199.99, 3),
('Meze 12 Classics', 'Classic design with warm and natural sound signature', 3, 99.99, 4),
('Meze Alba', 'Entry-level in-ear monitors with great value for money', 4, 199.99, 4),
('FiiO FD5', 'Dynamic driver with punchy bass and clear highs', 3, 129.99, 3),
('Moondrop Kato', 'Affordable in-ear monitors with impressive sound quality', 4, 79.99, 2),
('Dunu Glacier', 'High-fidelity sound with a focus on detail and accuracy', 1, 1099.99, 1),
('Dunu Titan S', 'Durable in-ear monitors with powerful sound', 2, 79.99, 1),
('Moondrop Blessing 2', 'Flagship hybrid in-ear monitors with exceptional clarity', 1, 319.99, 2);

-- Tunings
INSERT INTO IEMTuning (productID, tuningDetails) VALUES
(1, 'V-shaped sound signature with enhanced bass and treble'),
(2, 'Neutral tuning with emphasis on midrange clarity'),
(3, 'Balanced tuning with slight bass boost for added impact'),
(4, 'Warm tuning with smooth mids and controlled highs');

COMMIT;

-- End of iemdata.sql