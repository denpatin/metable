CREATE TABLE IF NOT EXISTS `tables` (
  `id` INT AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `fields` (
  `id` INT AUTO_INCREMENT,
  `table_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`table_id`) REFERENCES `tables`(`id`)
);

CREATE TABLE IF NOT EXISTS `relations` (
  `from_id` INT NOT NULL,
  `to_id` INT NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  UNIQUE (`from_id`, `to_id`),
  FOREIGN KEY (`from_id`) REFERENCES `fields`(`id`),
  FOREIGN KEY (`to_id`) REFERENCES `fields`(`id`)
);

CREATE TABLE IF NOT EXISTS `data` (
  `field_id` INT NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`field_id`, `id`),
  FOREIGN KEY (`field_id`) REFERENCES `fields`(`id`)
);
