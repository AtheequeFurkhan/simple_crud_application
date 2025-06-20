-- Create the database schema
CREATE SCHEMA IF NOT EXISTS `user_db`;

-- Select the schema for use
USE `user_db`;

-- Create the users table
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL UNIQUE,
  `mobile` VARCHAR(15) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Populate the users table with sample data
-- Note: The email addresses and names are fictional and for demonstration purposes only.
INSERT INTO `users` (`name`, `email`, `mobile`, `address`) VALUES
('Alice Silva', 'alice.silva@example.com', '1234567890', '123 Main St, Springfield'),
('Bob Fernando', 'bob.fernando@example.com', '0987654321', '456 Elm St, Springfield'),
('Charlie Brown', 'charlie.brown@example.com', '5551234567', '789 Oak Ave, Springfield'),
('Diana Prince', 'diana.prince@example.com', '4449876543', '101 Pine Rd, Metropolis'),
('Ethan Hunt', 'ethan.hunt@example.com', '7778889999', '202 Maple Ln, Gotham'),
('Fiona Apple', 'fiona.apple@example.com', '3332221111', '303 Cedar Dr, Gotham'),
('George Lucas', 'george.lucas@example.com', '6665554444', '404 Birch St, Metropolis'),
('Hannah Montana', 'hannah.montana@example.com', '2223334444', '505 Walnut Ave, Springfield'),
('Ian Fleming', 'ian.fleming@example.com', '9998887777', '606 Spruce Rd, Gotham'),
('Julia Roberts', 'julia.roberts@example.com', '1112223333', '707 Cherry Ln, Metropolis'),
('Kevin Hart', 'kevin.hart@example.com', '4445556666', '808 Pine St, Springfield'),
('Laura Croft', 'laura.croft@example.com', '7776665555', '909 Oak Dr, Gotham'),
('Michael Jordan', 'michael.jordan@example.com', '3334445555', '1010 Elm Ave, Metropolis'),
('Nancy Drew', 'nancy.drew@example.com', '6667778888', '1111 Maple Rd, Springfield'),
('Oliver Queen', 'oliver.queen@example.com', '9990001111', '1212 Cedar St, Gotham'),
('Paula Abdul', 'paula.abdul@example.com', '2221110000', '1313 Birch Ln, Metropolis'),
('Quentin Tarantino', 'quentin.tarantino@example.com', '5556667777', '1414 Walnut Dr, Springfield'),
('Rachel Green', 'rachel.green@example.com', '8889990000', '1515 Oak St, Gotham'),
('Steve Jobs', 'steve.jobs@example.com', '1110002222', '1616 Pine Ave, Metropolis'),
('Tina Turner', 'tina.turner@example.com', '4443332222', '1717 Elm Rd, Springfield'),
('Uma Thurman', 'uma.thurman@example.com', '7772223333', '1818 Maple Ln, Gotham'),
('Victor Hugo', 'victor.hugo@example.com', '9993334444', '1919 Cedar Dr, Metropolis'),
('Wendy Williams', 'wendy.williams@example.com', '2224445555', '2020 Birch St, Springfield'),
('Xavier Smith', 'xavier.smith@example.com', '5556667777', '2121 Walnut Ave, Gotham'),
('Yvonne Strahovski', 'yvonne.strahovski@example.com', '8887776666', '2222 Oak Rd, Metropolis'),
('Zack Snyder', 'zack.snyder@example.com', '1115556666', '2323 Pine Ln, Springfield'),
('Abigail Johnson', 'abigail.johnson@example.com', '4442223333', '2424 Elm St, Gotham'),
('Benjamin Franklin', 'benjamin.franklin@example.com', '7773334444', '2525 Maple Dr, Metropolis'),
('Clara Oswald', 'clara.oswald@example.com', '9994445555', '2626 Cedar Ave, Springfield'),
('David Beckham', 'david.beckham@example.com', '2225556666', '2727 Birch Rd, Gotham'),
('Emma Watson', 'emma.watson@example.com', '5557778888', '2828 Walnut St, Metropolis'),
('Freddie Mercury', 'freddie.mercury@example.com', '8882223333', '2929 Oak Ln, Springfield'),
('Grace Kelly', 'grace.kelly@example.com', '1113334444', '3030 Pine Dr, Gotham'),
('Harry Potter', 'harry.potter@example.com', '4445556666', '3131 Elm Ave, Metropolis'),
('Isabella Rossellini', 'isabella.rossellini@example.com', '7778889999', '3232 Maple Rd, Springfield'),
('Jack Sparrow', 'jack.sparrow@example.com', '9991112222', '3333 Cedar St, Gotham'),
('Katherine Hepburn', 'katherine.hepburn@example.com', '2223334444', '3434 Birch Ln, Metropolis'),
('Liam Neeson', 'liam.neeson@example.com', '5554443333', '3535 Walnut Dr, Springfield'),
('Mia Farrow', 'mia.farrow@example.com', '8886665555', '3636 Oak Ave, Gotham'),
('Noah Centineo', 'noah.centineo@example.com', '1117778888', '3737 Pine Rd, Metropolis'),
('Oprah Winfrey', 'oprah.winfrey@example.com', '4448889999', '3838 Elm St, Springfield'),
('Peter Parker', 'peter.parker@example.com', '7779990000', '3939 Maple Ln, Gotham'),
('Queen Elizabeth', 'queen.elizabeth@example.com', '2220001111', '4040 Cedar Dr, Metropolis'),
('Robert Downey', 'robert.downey@example.com', '5551112222', '4141 Birch St, Springfield'),
('Sarah Connor', 'sarah.connor@example.com', '8882223333', '4242 Walnut Ave, Gotham'),
('Tom Hanks', 'tom.hanks@example.com', '1114445555', '4343 Oak Rd, Metropolis'),
('Umair Khan', 'umair.khan@example.com', '7775554444', '4444 Pine Ln, Springfield'),
('Violet Evergarden', 'violet.evergarden@example.com', '9996667777', '4545 Elm Dr, Gotham'),
('Walter White', 'walter.white@example.com', '2228889999', '4646 Maple St, Metropolis');