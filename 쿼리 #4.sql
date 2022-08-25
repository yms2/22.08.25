#SELECT * FROM Customer WHERE name = '박지성'
#SELECT * FROM Customer WHERE name = '김연아'

#SELECT phone FROM Customer WHERE NAME = '추신수'
#SELECT bookname,publisher,price FROM Book

#SELECT bookid,bookname,publisher,price FROM Book
#SELECT * FROM Book
#둘은 같은 것이다.

#SELECT publisher FROM Book
#SELECT DISTINCT publisher FROM Book
#중복을 제거한다.

#SELECT price FROM Book
#SELECT DISTINCT price FROM Book

#북테이블에서 책의제목과 가격만 표시하시오
#SELECT bookname,price FROM Book

#book테이블에서 모든 정보를 표시하시오
#select * FROM Book

#가격이 20000원 미만인 도서를 표시하시오
#SELECT * FROM Book a WHERE a.price < 20000

#가격이 10000이상이고 20000이하인 도서를 푯시하시오
#SELECT * FROM Book WHERE 10000 <= price AND price <= 20000
#SELECT * FROM Book WHERE price BETWEEN 10000 AND 20000 

#가격이 1000이상이고 15000이하인 도서를 표시하시오
#SELECT * FROM Book WHERE price BETWEEN 1000 AND 15000 

#가격이 7000인 도서와 13000인 도서를 표시하시오
#SELECT * FROM Book WHERE price = 7000 OR price = 13000
#SELECT * FROM Book WHERE price IN(7000,13000)

#출판사가 '굿스포츠' 또는 '대한미디어'도서를 표시하시오
#SELECT * FROM Book WHERE publisher IN('굿스포츠','대한미디어')
#SELECT * FROM Book WHERE publisher = '굿스포츠' OR publisher = '대한미디어'

#SELECT * FROM Book WHERE bookname LIKE '축구의 역사'
#유사한 것 찾아낸다.

#축구의 이해라는 책의 이름을 찾아보세요
#SELECT * FROM Book WHERE bookname LIKE '축구의 이해'

#야구가 포함되어있는 책을 찾아보세요
#SELECT * FROM Book WHERE bookname LIKE '%야구%'OR bookname LIKE '%축구%'

#SELECT * FROM Book WHERE publisher LIKE '_미디어'

#도서이름의 두번째 위치에 구라는 문자열을 갖는 도서를 표시하시오
#SELECT * FROM Book WHERE bookname LIKE '_구%'  

#도서이름에 역사가 있는 도서를 표시하시오
#SELECT * FROM Book WHERE bookname LIKE '%역사%'

#책이름에 여자가 있는 도서를 표시하시오
#SELECT * FROM Book WHERE bookname LIKE '%여자'

#책이름에 두번째 글자가 '겨'로 시작되는 책을 표시하시오
#SELECT * FROM Book WHERE bookname LIKE '_겨%'

#SELECT * FROM 
#(SELECT * FROM Book WHERE bookname LIKE '%축구%' AND price >= 20000
#)a,
#(SELECT * FROM Book WHERE bookname LIKE '%야구%' AND price >= 20000
#)b

#SELECT * FROM Book WHERE bookname LIKE '%축구%' AND price >= 20000
#union
#SELECT * FROM Book WHERE bookname LIKE '%야구%' AND price >= 20000

#골프라는 내용이 있는 책의 가격이 30000이상인 도서를 표시하시오
#SELECT * FROM Book WHERE bookname LIKE '%골프%' AND price >=30000

#SELECT * FROM Book LIMIT 0,5

#SELECT * FROM employees WHERE gender = 'F'

#SELECT * FROM Book ORDER BY bookname DESC

#SELECT * FROM Book ORDER BY price desc

#SELECT * FROM Book ORDER BY bookname DESC , price DESC

#SELECT * FROM Book ORDER BY publisher DESC, price DESC
#SELECT a.*,b.* FROM 
#(SELECT SUM(price) AS 총원가 FROM Book
#)a,
#(SELECT SUM(saleprice) AS 판매가 FROM Orders
#)b

#SELECT SUM(saleprice),AVG(saleprice),MIN(saleprice),MAX(saleprice)
#FROM Orders

#SELECT COUNT(*) FROM Orders
#SELECT COUNT(*) FROM employees

#SELECT COUNT(*) FROM Orders WHERE custid=1

#SELECT custid,COUNT(*)
#FROM Orders
#WHERE saleprice >= 8000
#GROUP BY custid
#HAVING COUNT(*) >=2

#SELECT a.name,sum(b.saleprice) AS LIST
#FROM Customer a,Orders b 
#WHERE a.custid = b.custid
#GROUP BY a.name
#HAVING list>30000
#ORDER BY a.custid

#SELECT * FROM Orders a,Customer b,Book c
#WHERE a.custid = b.custid
#AND a.bookid = c.bookid

#가격이20000원인 도서를 주문한 고객의 이름과 도서의 이름을 표시하시오
#SELECT b.name,c.bookname FROM Orders a,Customer b,Book c
#WHERE a.custid = b.custid
#AND a.bookid = c.bookid
#AND c.price =20000

#SELECT * FROM Customer a LEFT OUTER JOIN Orders b ON a.custid=b.custid

#가장 비싼 도서의 이름을 표시하시오
#SELECT * FROM Book a 
#WHERE a.price = (SELECT MAX(price) FROM Book) 

#도서를 구매한 적 있는 고객의 이름을 검색하시오
#SELECT NAME
#FROM Customer a
#WHERE a.custid IN (SELECT custid FROM Orders)



#대한미디어에서 출판한 도서/를 구매한 고객/의 이름/을 표시하시오
#SELECT * 
#FROM Customer 
#	WHERE custid IN (
#			SELECT custid FROM Orders WHERE bookid IN(
#				SELECT bookid FROM Book WHERE publisher ='대한미디어'
#		)
#	)

#출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 표시하시오
#SELECT b1.bookname
#FROM Book b1
#WHERE b1.price >
#(SELECT AVG(b2.price) FROM Book b2
#WHERE b2.publisher = b1.publisher)

#대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름을 표시하시오
