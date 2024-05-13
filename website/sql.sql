CREATE TABLE TeamMembers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT,
    cgpa DECIMAL(3, 1),
    photo VARCHAR(255)
);
INSERT INTO TeamMembers (name, id, age, cgpa, photo)
VALUES 
    ('Abdelrahman Wael', '22010137', 19, 2.8, 'images/AbdelrahmanWael.jpg'),
    ('Saeed Alaa', '22010109', 20, 3.4, 'images/SaeedAlaa.jpg'),
    ('Abdelrahman Alaa', '22010132', 20, 2.8, 'images/AbdelrahmanAlaa.jpg'),
    ('Ahmed Fathy', '22010003', 20, 3.2, 'images/AhmedFathy.jpg'),
    ('Ahmed Samy', '22010020', 20, 2.7, 'images/AhmedSamy.jpg');
SELECT * FROM TeamMembers;
