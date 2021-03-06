create database quadrinhos
go
use quadrinhos

use master
drop database quadrinhos


create table titulo (
id					int				    not null primary key,
titulo				varchar(100)		not null,
titulo_alt          varchar(200)		,
autor    			varchar(200)		not null,
)

create table edicao(
id_edicao		 INT				  IDENTITY   NOT NULL,
num_edicao		 INT					NOT NULL,
lancamento		 DATETIME				NOT NULL,
descricao		 VARCHAR(200)			,
titulo_id		 INT					NOT NULL
PRIMARY KEY (id_edicao),
FOREIGN KEY (titulo_id) references titulo (id)
)



CREATE TABLE funcionarios(
id           INT      IDENTITY NOT NULL,
CPF          VARCHAR(11) NOT NULL,
nome         VARCHAR(100)NOT NULL,
telefone     CHAR(8)    NOT NULL,
nascimento   DATE        NOT NULL,
cargo        VARCHAR(50) NOT NULL,
login        VARCHAR(50) NOT NULL,
senha        VARCHAR(50) NOT NULL,
salario      DECIMAL(7,2) NOT NULL
PRIMARY KEY(id)
)



CREATE TABLE clientes(
id         INT   IDENTITY      NOT NULL,
CPF        VARCHAR(11) NOT NULL,
telefone   CHAR(8)     NOT NULL,
email      VARCHAR(50) NOT NULL,
nascimento DATE        NOT NULL,
nome       VARCHAR(100) NOT NULL
PRIMARY KEY(id)
)
use quadrinhos
DROP TABLE venda
CREATE TABLE venda(
id			INT		IDENTITY	NOT NULL,
data_venda	DATE				NOT NULL,
valor_total DECIMAL(7,2)		NOT NULL,
tipo_Pagamento VARCHAR(20)		NOT NULL,
desconto	INT					NOT NULL,
cliente_id	INT					NOT NULL,
func_id		INT					NOT NULL
PRIMARY KEY(id),
FOREIGN KEY (cliente_id) REFERENCES clienteS(id),
FOREIGN KEY	(func_id)	REFERENCES funcionarios(id))


CREATE TABLE  exemplar(
id_exemplar		INT				IDENTITY	NOT NULL,
exemplar		VARCHAR(30)					NOT NULL,
valor_compra	DECIMAL(5,2)				NOT	NULL,
valor_venda		DECIMAL(5,2)				NOT NULL,
id_edicao		INT							NOT NULL,
id_venda		INT							NULL
PRIMARY KEY (id_exemplar),
FOREIGN KEY (id_edicao) REFERENCES	edicao(id_edicao),
FOREIGN KEY	(id_venda)	REFERENCES venda(id))


INSERT INTO titulo VALUES
(1,'One Piece',null,'Eiichiro ODA'),
(2,'Naruto',null,'Masashi KISHIMOTO'),
(3,'Quan Zhi Gao Shou','The Kings Avatar','Hu Dielan'),
(4,'New Game!',null,'Shoutarou TOKUNOU'),
(5,'Tate no Yuusha no Nariagari','The Rising of the Shield Hero','Yusagi ANEKO'),
(6,'Kimetsu no Yaiba','Demon Slayer','Koyoharu GOTOUGE'),
(7,'One-Punch Man',null,'ONE'),
(8,'Vinland Saga',null,'Makoto YUKIMURA'),
(9,'Fairy Tail',null,'Hiro Mashima'),
(10,'Death Note',null,'Tsugumi OHBA')

SELECT * FROM titulo 

INSERT INTO edicao VALUES
(49,'15/05/2015',null,9),
(22,'20/03/2010',null,9),
(23,'20/04/2010',null,9),
(24,'20/05/2010',null,9),
(58,'20/03/2010',null,1),
(90,'14/03/2019',null,1),
(91,'14/04/2019',null,1),
(92,'14/05/2019',null,1),
(93,'14/06/2019',null,1),
(1,'15/04/2005',null,2),
(62,'15/04/2009',null,2),
(68,'15/04/2009',null,2),
(69,'15/04/2009',null,2),
(40,'23/08/2019',null,3),
(25,'23/08/2017',null,3),
(1,'23/08/2015',null,3),
(3,'22/07/2016',null,4),
(4,'22/08/2016',null,4),
(4,'22/07/2016',null,5),
(5,'22/08/2016',null,5),
(2,'22/06/2016',null,5),
(1,'22/06/2016',null,6),
(2,'22/06/2016',null,7),
(3,'22/06/2016',null,8),
(3,'22/06/2016',null,7),
(5,'22/06/2016',null,6),
(6,'22/06/2016',null,4),
(7,'22/06/2016',null,4),
(10,'22/06/2016',null,5),
(9,'22/06/2016',null,7),
(8,'22/06/2016',null,3)

SELECT * FROM edicao

INSERT INTO funcionarios(CPF,nome,telefone,nascimento,cargo,login,senha,salario)VALUES
('34578909290','Pedro luiz','82736541','23/12/2000','Gerente','-------','*********',1200.00),
('25186533710','Jo�o Pedro','87652314','23/06/2000','atendente','-------','*********',1010.00),
('87627315416','Julia Farias','61289012','07/02/2000','repositor de estoque','-------','*********',1010.00)

select*from funcionarios

INSERT INTO clientes(CPF,telefone,email,nascimento,nome)VALUES
(' ','0','0','1/1/2001',' '),
('21986301749','40028922','pedroluiz2000@gmail.com','25/09/2025','Juliiana'),
('43244444222','43444444','pedroluiz@gmail.com','11/11/2005','Alan'),
('39834750365','45364565','rajgodtwostars@gmail.com','03/04/2006','Jo�o Sardinha'),
('93736482156','34564565','darkmaster02@gmail.com','09/09/2009','George'),
('86564866790','24342343','mooncrystal2007@gmail.com','05/05/2005','Lucas'),
('35467674534','34453453','jufarias2000@gmail.com','01/02/2001','Gargamel'),
('65683758495','34324224','tennwolf347@gmail.com','02/03/2002','Rosalina'),
('43765893478','74578457','jonasAmelia@.gmail.com','03/08/2003','Midorya'),
('55645682092','34235345','roostertheefh@gmail.com','04/01/2004','Hatsumi Miko'),
('24345687568','08345739','masterofdarkness@gmail.com','05/07/2005','Tempesta'),
('32435654661','04950449','darksoulsmaster@gmail.com','06/06/2006','Gamamori')

SELECT*FROM clientes


INSERT INTO exemplar VALUES
('21551210-LCAJV',10.269426110237807,13.35025394330915,11,null),
('14686802-THOLT',11.09530785336944,14.423900209380271,18,null),
('68369596-TFKAG',13.998486827715588,18.198032876030265,26,null),
('24144228-YGZIY',24.05879205315878,31.276429669106413,29,null),
('197477-JGEKB',25.99127625293411,33.788659128814345,30,null),
('68871099-TUQZQ',18.488046841575773,24.034460894048507,2,null),
('6568457-FOWXY',14.454873002435171,18.791334903165723,12,null),
('14883088-KFDBU',22.533190838449794,29.293148089984733,19,null),
('36777305-UKLZU',10.298138191090725,13.387579648417944,16,null),
('16638981-WPIBS',14.523235895761434,18.880206664489865,20,null),
('78044629-EQCXG',28.902346323517733,37.57305022057305,15,null),
('18056908-DYOJI',24.61953208685764,32.00539171291493,27,null),
('41884674-YUSXV',24.157439649974897,31.404671544967368,9,null),
('86733710-KRLLZ',13.73483385046877,17.855284005609402,7,null),
('8676248-ROZWZ',24.763908519938717,32.19308107592033,8,null),
('31367422-SEFDW',19.7179939950501,25.633392193565133,24,null),
('80436764-AYDIQ',22.800295796207894,29.640384535070265,9,null),
('52382881-PRPGI',20.804277963855576,27.04556135301225,6,null),
('91799418-WJYSL',24.5563266706406,31.923224671832784,31,null),
('75760462-WVYHK',26.331309536614718,34.23070239759913,27,null),
('29193482-WYQIA',13.631664626582669,17.72116401455747,25,null),
('20067943-JBVYG',24.72063619589533,32.13682705466393,11,null),
('8227731-DZLPL',16.300289524673154,21.1903763820751,14,null),
('46695485-XYJQD',18.724922055767422,24.342398672497648,27,null),
('59276990-XQOIK',19.14050421952665,24.882655485384646,14,null),
('43293741-BGACQ',17.94076581957099,23.32299556544229,9,null),
('71271804-VYEIX',28.930563001769762,37.609731902300695,17,null),
('90415101-VBUAZ',18.58714212765986,24.16328476595782,12,null),
('43691244-OIGKB',24.809928272931035,32.25290675481035,16,null),
('61358043-RCUHC',20.549469126342295,26.714309864244985,11,null),
('96758817-RWIAL',12.706148151615434,16.517992597100065,28,null),
('5214619-CCUXF',11.6893021090067,15.19609274170871,25,null),
('89841523-FAAGS',12.02736290857873,15.63557178115235,2,null),
('63121069-LQCAI',9.41964950414214,12.245544355384782,20,null),
('98052027-KBVTL',24.620435015295406,32.00656551988403,19,null),
('67711558-PROWX',9.545915531590413,12.409690191067538,25,null),
('97053953-VYOZO',15.994702657008478,20.793113454111023,23,null),
('75775028-SXZYC',12.372467887901973,16.084208254272564,31,null),
('6070316-VDXWV',18.811361031597954,24.45476934107734,3,null),
('84115192-QSERR',16.074830013760838,20.89727901788909,20,null),
('39095051-VPIOG',28.638466516884762,37.23000647195019,13,null),
('78613639-ZLKQL',27.33749868853654,35.538748295097506,30,null),
('14307710-IEWFA',21.971565941544306,28.563035724007598,7,null),
('66496077-LHFGW',19.257385908881872,25.034601681546434,1,null),
('71691242-DXFVK',26.51995349282707,34.47593954067519,11,null),
('41801679-PRUDW',26.512886690504107,34.46675269765534,25,null),
('48852923-YYHZD',13.758548555563715,17.886113122232832,17,null),
('34055584-ZAPKW',27.798571153982024,36.138142500176635,25,null),
('65048402-GQWDE',23.74540148600044,30.86902193180057,11,null),
('90144494-QIAIR',25.52550193770994,33.183152519022926,23,null),
('63408875-HOZGB',12.204823297151098,15.866270286296428,18,null),
('39395422-JXPJO',12.787177981050132,16.623331375365172,28,null),
('61371383-FBOHY',9.87614059677054,12.838982775801702,18,null),
('91857546-QZRYS',17.591098270194244,22.86842775125252,26,null),
('59312232-YWYJW',24.12807562893761,31.36649831761889,19,null),
('19787189-TFJOB',14.355959404813655,18.662747226257753,6,null),
('57383545-EUWST',12.838750972212932,16.69037626387681,6,null),
('72335939-FSREJ',12.674467464977592,16.476807704470872,1,null),
('30552936-CDSET',20.541319043383115,26.70371475639805,19,null),
('73441879-WKRVF',13.341785188976331,17.344320745669233,12,null),
('11846295-CALAI',26.835218045919106,34.88578345969484,15,null),
('52923948-JYSQT',21.649595835597918,28.144474586277294,5,null),
('33793730-FXVRV',17.06305093588159,22.18196621664607,11,null),
('60779430-LCCEG',27.945798184984852,36.32953764048031,7,null),
('78078598-UWIUE',25.25309023649413,32.82901730744237,5,null),
('14684556-LAPDW',25.45982180022299,33.09776834028989,26,null),
('83389696-OIVVR',19.327409148418777,25.125631892944412,1,null),
('30698245-THADZ',15.393570745301362,20.011641968891773,20,null),
('61476535-ZDDLY',18.575634038351083,24.148324249856408,28,null),
('87168971-VFAJR',9.277990544036479,12.061387707247423,9,null),
('71407788-RSATL',13.394327693665955,17.412626001765744,19,null),
('71844736-RIIUA',18.595260615135295,24.173838799675885,8,null),
('2032815-YCARV',17.291990379104185,22.479587492835442,9,null),
('62186183-OZQEV',21.66661114031558,28.166594482410257,5,null),
('12646354-CPZAA',21.159693149625987,27.507601094513785,12,null),
('88882839-GJKUI',17.80576689868104,23.147496968285353,1,null),
('81856310-CXIRX',19.80733105146774,25.749530366908065,23,null),
('32572468-QJBGT',18.7380125539216,24.35941632009808,8,null),
('14654680-GUZJQ',20.765502320878056,26.995153017141472,14,null),
('3763559-PVSAH',27.2848875899775,35.470353866970754,14,null),
('57691595-AKAZU',25.35301521966088,32.95891978555915,25,null),
('55960936-BURPJ',13.314500911389176,17.30885118480593,3,null),
('72752503-FQXOG',12.010015802003082,15.613020542604007,18,null),
('81994494-ZGYHI',16.95747479408771,22.04471723231402,30,null),
('18438464-TWVUH',11.896745404271673,15.465769025553175,1,null),
('43551059-QWBHR',9.088512673196234,11.815066475155104,17,null),
('90049564-LRBDH',26.757916979932947,34.785292073912835,28,null),
('83909369-CPQAS',19.073590618830657,24.795667804479855,6,null),
('67671477-YPBLZ',19.052723541627024,24.76854060411513,6,null),
('73878196-HYESI',19.782775033097092,25.717607543026222,15,null),
('22465124-AXWKC',24.35046574638755,31.655605470303815,21,null),
('40937566-OHLOJ',19.868664929158307,25.8292644079058,7,null),
('31159483-BBQYZ',15.991807713714863,20.78935002782932,2,null),
('31583132-QFLRK',13.310458941380768,17.303596623795,15,null),
('48747499-TYWSZ',12.01565675516596,15.620353781715748,19,null),
('56873654-XCJOW',16.223649599759696,21.090744479687604,2,null),
('89385147-WYZLB',14.35166776051919,18.657168088674947,5,null),
('71181605-TVOWP',20.93533756705314,27.21593883716908,3,null),
('65493594-ZPBBO',10.278374475687977,13.361886818394371,7,null)

select * from exemplar


SELECT t.titulo AS titulo,
	   t.autor AS autor,
	   e.num_edicao AS num_edicao,
	   e.lancamento AS lancamento
FROM titulo t, edicao e
WHERE t.id = e.titulo_id
GROUP BY t.titulo , t.autor , e.num_edicao , e.lancamento
ORDER BY (t.titulo) ASC


DELETE e
FROM edicao e, titulo t
WHERE t.id = e.titulo_id AND
t.titulo = 'Kimetsu no Yaiba' AND e.num_edicao = 1

DELETE e FROM edicao e, titulo t WHERE t.id = e.titulo_id AND t.titulo = 'Naruto' AND e.num_edicao = 1

SELECT * FROM edicao e , titulo t
WHERE t.id = e.titulo_id AND
num_edicao LIKE 3 AND T.titulo LIKE 'New Game!'


-------------Select's funcionarios---------
SELECT id AS ID,
SUBSTRING(CPF,2,9)+'-'+SUBSTRING(CPF,9,2) AS CPF,
nome,SUBSTRING(telefone,4,4)+'-'+SUBSTRING(telefone,4,4) AS telefone,nascimento,cargo,login,senha,salario 
FROM funcionarios





-----------------------select's clientes-------------
SELECT id AS ID,nome AS Nome,
SUBSTRING(CPF,2,9)+'-'+SUBSTRING(CPF,9,2) AS CPF,
SUBSTRING(telefone,4,4)+'-'+SUBsTRING(telefone,4,4),email,nascimento FROM clientes