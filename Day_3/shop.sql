use shop;
create table Items (
    Item_Identifier VARCHAR(20),
    Item_Weight DECIMAL(6,2),   
    Item_Fat_Content VARCHAR(20),
    Item_Type VARCHAR(50),
    Item_MRP DECIMAL(8,2)        
);
select * from Items;
create table Sales (
    Item_Identifier VARCHAR(20),
    Outlet_Identifier VARCHAR(20),
	Item_Visibility DECIMAL(6,4),   
    Item_Outlet_Sales DECIMAL(8,4)        
);
select * from sales;
select Item_Type, avg(Item_MRP) as Avg_MRP from items group by Item_Type order by Avg_MRP desc;
select * from items where Item_Fat_Content='Regular' and Item_MRP < 100;
select Item_Type, count(*) as Count_Items from items group by Item_Type;
select * from items where Item_Type='Dairy' and Item_MRP > 100 order by Item_MRP desc;
select Outlet_Identifier, avg(Item_Outlet_Sales) as Avg_Outlet_Sales from Sales group by Outlet_Identifier;
select i.Item_Type, s.outlet_Identifier, s.Item_Outlet_Sales from Items as i inner join Sales as s on i.Item_Identifier=s.Item_Identifier; 
select * from Items left join Sales on Items.Item_Identifier=Sales.Item_Identifier;
select * from sales right join items on sales.Item_Identifier=items.Item_Identifier;
select i.Item_Identifier, i.Item_Type, i.Item_MRP, s.Item_Outlet_Sales from Items i inner join sales s on i.Item_Identifier=s.Item_Identifier;
select i.Item_Identifier,i.Item_Weight,i.Item_Fat_Content,i.Item_Type, i.Item_MRP, s.Item_Outlet_Sales from items i left join sales s on i.Item_Identifier=s.Item_Identifier;
select s.Item_Identifier, i.Item_Type, i.Item_MRP, s.Item_Outlet_Sales from items i right join sales s on i.Item_Identifier=s.Item_Identifier;
select * from Items where Item_MRP > (select avg(Item_MRP) as Avg_MRP from Items);
select Outlet_Identifier, Item_Outlet_Sales from sales where Item_Outlet_Sales > (select avg(Item_Outlet_Sales) from sales);
select Item_Identifier, Item_Outlet_sales from sales where Item_Outlet_sales in (select max(Item_Outlet_sales) from sales);
select i.Item_Type, avg(s.Item_Outlet_Sales) as Avg_Sales, sum(s.Item_Outlet_Sales) as total_Sales from items i join sales s on i.Item_Identifier=s.Item_Identifier group by i.Item_Type;
select i.Item_Type, sum(s.Item_Outlet_sales) as total_sales from sales s join items i on i.Item_Identifier=s.Item_Identifier group by Item_Type;
select i.Item_Type, avg(s.Item_Visibility) as Avg_Item_Visibility from items i join sales s on i.Item_Identifier=s.Item_Identifier group by i.Item_Type;
create view Item_sales as select i.Item_Identifier, i.Item_Type, sum(s.Item_Outlet_Sales) as Total_Sales from items i join sales s on i.Item_Identifier=s.Item_Identifier group by i.Item_Identifier, i.Item_Type;
create view Item_avalability as select i.Item_MRP, s.Item_Visibility from items i join sales s on i.Item_Identifier=s.Item_Identifier where i.Item_MRP > 150 and s.Item_Visibility < 0.02;
create view ItemSalesSummary as select i.Item_Identifier, i.Item_Type, i.Item_MRP, s.Item_Outlet_Sales from items i join sales s on i.Item_Identifier=s.Item_Identifier;
create index idx_Item on items(Item_Identifier,Item_Type);
create index idx_Sale on sales(Outlet_Identifier);
create index idx_Item_type_MRP on items(Item_Type,Item_MRP);