using { Northwind } from '../db/schema.cds';

@path: '/service/Northwind'
@requires: 'authenticated-user'
service NorthwindSrv {
  @odata.draft.enabled
  entity Categories as projection on Northwind.Categories;
  @odata.draft.enabled
  entity Products as projection on Northwind.Products;
  @odata.draft.enabled
  entity Suppliers as projection on Northwind.Suppliers;
  @odata.draft.enabled
  entity Employees as projection on Northwind.Employees;
  @odata.draft.enabled
  entity Orders as projection on Northwind.Orders;
  @odata.draft.enabled
  entity Customers as projection on Northwind.Customers;
  @odata.draft.enabled
  entity OrderDetails as projection on Northwind.OrderDetails;
}