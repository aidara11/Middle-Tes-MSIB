-- TASK 2 -> Kembalikan nama item bukan yang paling banyak dibeli atau paling sedikit dibeli.

--- Membuat tabel pembelian
CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

--- Memanggil tabel
SELECT * FROM public."item_bought";

--- Mencari item yang bukan paling banyak dibeli atau paling sedikit dibeli.
SELECT item
FROM (
    SELECT item, COUNT(item) as jumlah_item FROM item_bought GROUP BY item 
    UNION 
    SELECT item, COUNT(item) as jumlah_item FROM item_bought GROUP BY item)
WHERE jumlah_item <> (SELECT MAX(jumlah_item) 
					  FROM (SELECT item, COUNT(item)
							as jumlah_item FROM item_bought GROUP BY item))
AND jumlah_item <> (SELECT MIN(jumlah_item) 
					FROM (SELECT item, COUNT(item)
						  as jumlah_item FROM item_bought GROUP BY item));