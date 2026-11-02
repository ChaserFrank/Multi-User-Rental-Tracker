-- Development/demo seed data only. Passwords are bcrypt hashes; no plaintext credentials are stored.
-- The fixed IDs and INSERT OR IGNORE make this script safe to run repeatedly.

INSERT OR IGNORE INTO users (id, username, password)
VALUES
    (1001, 'Alice', '$2b$10$W8T8blEfiRH9xQ9nNlE/8.ogTRGxp4UQ5kx8rlOiYkaMaSJiYuTzG'),
    (1002, 'Bob', '$2b$10$.1SHAXZ.Ddtda/r8wWhZ5.9ocDyUha0PGTj6hYv8eGXWGWU/8Whni');

INSERT OR IGNORE INTO listed_items (id, owner_id, name, description, cost_per_day, status)
VALUES
    (1101, 1001, 'Camping Tent', 'Four-person waterproof tent', '18.00', 'available'),
    (1102, 1001, 'Mountain Bike', 'Trail-ready mountain bike', '25.00', 'available'),
    (1103, 1001, 'Portable Projector', '1080p portable projector', '30.00', 'available'),
    (1201, 1002, 'Pressure Washer', 'Electric pressure washer', '22.50', 'available'),
    (1202, 1002, 'Power Drill', 'Cordless drill with battery', '12.00', 'available'),
    (1203, 1002, 'Folding Tables', 'Set of two folding tables', '15.00', 'available');
