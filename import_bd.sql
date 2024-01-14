use kaggle
GO
---En caso no exista la tabla crear tabla
IF not exists (select *from sys.tables where object_id=object_id(N'dbo.starbucks')and type='U')
create table dbo.starbucks (
Beverage_category varchar(50)
,Beverage varchar (100)
,Beverage_prep varchar (50)
,Calories decimal (6,3)
, Total_Fat_g varchar (10)
,Trans_Fat_g decimal (6,3) 
,Saturated_Fat_g decimal (6,3)
, Sodium_mg decimal (6,3)
, Total_Carbohydrates_g decimal (6,3)
,Cholesterol_mg decimal (6,3)
, Dietary_Fibre_g decimal (6,3)
, Sugars_g decimal (6,3)
, Protein_g decimal (6,3)
,Vitamin_A_pct varchar (10)
,Vitamin_C_pct varchar (10)
, Calcium_pct  varchar (10)
,Iron_pct  varchar (10)
,Caffeine_mg varchar (10)
)
GO
---si ya existe la tabla LIMPIAR TABLA
TRUNCATE TABLE dbo.starbucks;
GO



---importar data desde archivo
bulk insert dbo.starbucks
from 'C:\Users\Rafo\proyecto_parcial_ops\dataset\starbucks.csv'
with
(
firstrow=2, ---empieza en la 2da fila, ya que la 1era es la cabecera
fieldterminator=',',---indicamos separador de columnas
rowterminator='0x0a' ---hace referencia a un salto de linea
)
GO
