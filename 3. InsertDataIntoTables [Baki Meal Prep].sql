CREATE DATABASE [Baki Meal Prep]
USE [Baki Meal Prep]

INSERT INTO MsCustomer VALUES
('CS001' , 'Tony Sturk'		,'Male'		, 'tonysturk@rocketmail.com', '0813191717494'	, 'Becek Street'),
('CS002' , 'Amel Paulin'	,'Female'	, 'amelpaulin@gmail.com'	, '0863689843578'	, 'Rusak  Street'),	
('CS003' , 'Piter Parkir'	,'Male'		, 'piterparkir@gmail.com'	, '0831668746856'	, 'Macet Street'),
('CS004' , 'Duen Jonson'	,'Male'		, 'duenjonson@gmail.com'	, '0813427949853'	, 'Mastrip Street'),
('CS005' , 'Kepin Hurt'		,'Male'		, 'kepinhurt@rocketmail.com', '0833470967844'	, 'Wonokromo Street'),
('CS006' , 'Tom Cus'		,'Male'		, 'tomcus@rocketmail.com'	, '0894562285847'	, 'Pondok Kelapa Street'),
('CS007' , 'Dapit Wasington','Male'		, 'dapitwasington@gmail.com', '0816537539776'	, 'Galaxy Street'	),
('CS008' , 'Pin Disel'		,'Male'		, 'pindisel@rocketmail.com'	, '0812272115889'	, 'Kemang Street'),
('CS009' , 'Gal Dodot'		,'Female'	, 'galdodot@rocketmail.com'	, '0832335590809'	, 'Kemanggisan Street'	),
('CS010' , 'Wall Smit'		,'Male'		, 'wallsmit@gmail.com'		, '0875445653218'	, 'Tomang Street'	)


INSERT INTO MsStaff VALUES 
('ST001' , 'Mikel Jordan'	, 'Male'	, 'mikeljord@gmail.com'		, '0887766093557' , '2000400'),
('ST002' , 'Kelpin Durent'	, 'Male'	, 'kelpindurent@gmail.com'	, '0855639773546' , '2100400'),
('ST003' , 'Antun Depis'	, 'Female'	, 'antundepis@gmail.com'	, '0833463995774' , '1940000'),
('ST004' , 'Setepen Kuri'	, 'Male'	, 'setepenkuri@gmail.com'	, '0857442498673' , '1950000'),
('ST005' , 'Majik Jonson'	, 'Male'	, 'majikjonson@gmail.com'	, '0866844456325' , '1870000'),
('ST006' , 'Lerik bert'		, 'Male'	, 'leribert@gmail.com'		, '0844736619486' , '2200000'),
('ST007' , 'Karim Jabar'	, 'Male'	, 'karimjabar@gmail.com'	, '0855312156638' , '1900000'),
('ST008' , 'Tem Dunkan'		, 'Female'	, 'temdunken@gmail.com'		, '0877894040335' , '1780000'),
('ST009' , 'Hakim Olajuwon'	, 'Male'	, 'hakimola13@gmail.com'	, '0899934112145' , '2420000'),
('ST010' , 'Labrun Jem'		, 'Female'	, 'labrunjem@gmail.com'		, '0877567743015' , '1900000')


INSERT INTO MsRegionalBranch VALUES
('RB001' , 'Kotcak'		,'kotcakrb@gmail.com'		, '0822546890443'	, 'BlokM Street'),
('RB002' , 'Kippak'		,'kipakrb@gmail.com'		, '0836678334354'	, 'BlokA Street' ),
('RB003' , 'Punclod'	,'punclodrb@gmail.com'		, '0833439098675'	, 'Menteng Street'),
('RB004' , 'Lumbang'	,'lumbangrb@gmail.com'		, '0835532657255'	, 'Kurame Street'),
('RB005' , 'Tuseno'		,'tusenorb@gmail.com'		, '0833567534463'	, 'Turu Street'),
('RB006' , 'Roksis'		,'roksisrb@gmail.com'		, '0888672254253'	, 'trobas Street'),
('RB007' , 'Trapik'		,'trapikrb@gmail.com'		, '0867558633906'	, 'probo Street'),
('RB008' , 'Asapek'		,'asapekrb@gmail.com'		, '0877645447378'	, 'Tupak Street'),
('RB009' , 'Torisa'		,'torisarb@gmail.com'		, '0880876612905'	, 'Bigie Street'),
('RB010' , 'Clausza'	,'clauszarb@gmail.com'		, '0866545082674'	, 'Snup Street')


INSERT INTO MsMealPrep VALUES
('PM001'	,'Yellow Sweat'			,'2023-09-22'	, '54000'	,'30000'	,'50'),
('PM002'	,'Chicken Tika Masala'	,'2023-11-22'	, '60000'	,'38000'	,'44'),
('PM003'	,'Chicken Parmesan'		,'2024-02-11'	, '70000'	,'47000'	,'46'),
('PM004'	,'Pepes Chicken'		,'2023-07-25'	, '52000'	,'20000'	,'50'),
('PM005'	,'Fried Rice'			,'2023-09-14'	, '52000'	,'20000'	,'60'),
('PM006'	,'Beef Welington'		,'2023-09-18'	, '80000'	,'48000'	,'34'),
('PM007'	,'Chicken Steak'		,'2024-03-24'	, '62000'	,'34000'	,'34'),
('PM008'	,'Spagheti Carbonara'	,'2024-02-17'	, '60000'	,'30000'	,'44'),
('PM009'	,'Spagheti Aglio E Olio','2023-09-08'	, '56000'	,'28000'	,'44'),
('PM010'	,'Wagyu Steak'			,'2023-08-03'	, '95000'	,'52000'	,'34')


INSERT INTO PurchaseHeader VALUES
('PC001'    ,'ST010'    ,'RB001'    , '2022-06-21'),
('PC002'    ,'ST008'    ,'RB002'    , '2022-04-02'),
('PC003'    ,'ST010'    ,'RB003'    , '2022-09-04'),
('PC004'    ,'ST003'    ,'RB008'    , '2022-02-02'),
('PC005'    ,'ST009'    ,'RB004'    , '2022-01-05'),
('PC006'    ,'ST007'    ,'RB007'    , '2022-06-08'),
('PC007'    ,'ST010'    ,'RB009'    , '2022-08-06'),
('PC008'    ,'ST008'    ,'RB002'    , '2022-09-09'),
('PC009'    ,'ST010'    ,'RB007'    , '2022-02-10'),
('PC010'    ,'ST008'    ,'RB002'    , '2022-03-25'),
('PC011'    ,'ST009'    ,'RB001'    , '2022-05-22'),
('PC012'    ,'ST003'    ,'RB008'    , '2022-06-12'),
('PC013'    ,'ST005'    ,'RB003'    , '2022-09-30'),
('PC014'    ,'ST007'    ,'RB004'    , '2022-03-05'),
('PC015'    ,'ST010'    ,'RB007'    , '2022-01-13')


INSERT INTO SalesHeader VALUES
('SS001'	,'ST002'	,'CS004'	, '2022-07-09'),
('SS002'	,'ST003'	,'CS002'	, '2022-03-08'),
('SS003'	,'ST008'	,'CS005'	, '2022-06-29'),
('SS004'	,'ST007'	,'CS002'	, '2022-02-16'),
('SS005'	,'ST004'	,'CS002'	, '2022-06-27'),
('SS006'	,'ST001'	,'CS005'	, '2022-07-19'),
('SS007'	,'ST006'	,'CS009'	, '2022-10-11'),
('SS008'	,'ST002'	,'CS007'	, '2022-02-18'),
('SS009'	,'ST001'	,'CS006'	, '2022-04-19'),
('SS010'	,'ST005'	,'CS008'	, '2022-06-22'),
('SS011'	,'ST008'	,'CS010'	, '2022-08-27'),
('SS012'	,'ST009'	,'CS002'	, '2022-03-16'),
('SS013'	,'ST010'	,'CS006'	, '2022-11-28'),
('SS014'	,'ST004'	,'CS003'	, '2022-12-02'),
('SS015'	,'ST007'	,'CS003'	, '2022-02-09')


INSERT INTO SalesDetail VALUES 
('SS001','PM001', '6' ),
('SS001','PM003', '7' ),
('SS002','PM007', '5' ),
('SS002','PM002', '4' ),
('SS002','PM003', '5' ),
('SS003','PM010', '3' ),
('SS003','PM004', '2' ),
('SS004','PM008', '5' ),
('SS004','PM005', '7' ),
('SS005','PM008', '3' ),
('SS005','PM006', '5' ),
('SS005','PM001', '6' ),
('SS006','PM010', '7' ),
('SS006','PM008', '1' ),
('SS006','PM009', '3' ),
('SS007','PM004', '3' ),
('SS007','PM003', '5' ),
('SS008','PM001', '9' ),
('SS009','PM004', '2' ),
('SS010','PM010', '3' ),
('SS011','PM005', '1' ),
('SS012','PM005', '5' ),
('SS013','PM003', '2' ),
('SS014','PM008', '4' ),
('SS015','PM006', '5' )

INSERT INTO PurchaseDetail VALUES 
('PC001','PM001', '5' ),
('PC002','PM003', '11'),
('PC002','PM002', '14'),
('PC003','PM005', '17'),
('PC003','PM004', '22'),
('PC004','PM006', '34'),
('PC005','PM008', '40'),
('PC005','PM007', '65'),
('PC006','PM001', '62'),
('PC007','PM004', '77'),
('PC007','PM005', '80'),
('PC008','PM010', '99'),
('PC008','PM009', '89'),
('PC009','PM006', '69'),
('PC009','PM008', '21'),
('PC010','PM002', '12'),
('PC010','PM004', '23'),
('PC011','PM009', '25'),
('PC011','PM010', '98'),
('PC012','PM001', '30'),
('PC012','PM002', '16'),
('PC013','PM005', '29'),
('PC014','PM007', '76'),
('PC014','PM004', '3') ,
('PC015','PM009', '49')

SELECT DateName(day,'2022-08-09')

exec sp_MSforeachtable 'SELECT * FROM ?'