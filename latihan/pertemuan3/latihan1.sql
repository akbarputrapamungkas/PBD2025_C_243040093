USE RetailStoreDB;

SELECT * FROM Sales.SalesOrderDetail;


/* 1. Tampilkan ProductID dan total uang yang didapat (LineTotal) dari produk 
tersebut. */
SELECT ProductID, SUM(LineTotal) AS TotalUangYangDidapat
FROM Sales.SalesOrderDetail 
GROUP BY ProductID;
 
 /*2. Hanya hitung transaksi yang OrderQty (jumlah beli) >= 2.*/
SELECT *
FROM Sales.SalesOrderDetail
WHERE OrderQty > 2;

/*3. Kelompokkan berdasarkan ProductID. */
SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

/*4. Filter agar hanya menampilkan produk yang total uangnya (SUM(LineTotal)) 
di atas $50,000*/
SELECT ProductID, SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000;

/*5. Urutkan dari pendapatan tertinggi. */
SELECT ProductID, SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalPendapatan DESC;
  
/*6. Ambil 10 produk teratas saja. */
SELECT TOP 10 ProductID, LineTotal
FROM Sales.SalesOrderDetail
ORDER BY LineTotal DESC;

