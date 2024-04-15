--- Membuat tabel employee
CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

INSERT INTO employee_table (employee, salary) VALUES
('Alice', 11),
('Benn', 43),
('Charles', 33),
('Dorothy', 55),
('Emma', 22),
('Franklin', 33);

--- Memanggil tabel
SELECT * FROM public."employee_table";

--- Membuat rank dengan row_number (agar tidak ada rank yang sama)
SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) as peringkat,* FROM employee_table;

--- Mengambil nilai salary tertinggi ketiga
SELECT salary FROM (SELECT ROW_NUMBER() OVER (ORDER BY salary DESC) as peringkat,*
    FROM employee_table) 
WHERE peringkat = 3;
