using { NorthwindSrv } from '../srv/service.cds';

annotate NorthwindSrv.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: CategoryID } };
annotate NorthwindSrv.Categories with {
  ID @UI.Hidden @Common.Text: { $value: CategoryID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Categories with @UI.Identification: [{ Value: CategoryID }];
annotate NorthwindSrv.Categories with @UI.DataPoint #CategoryName: {
  Value: CategoryName,
  Title: 'Category Name',
};
annotate NorthwindSrv.Categories with {
  CategoryID @title: 'Category ID';
  CategoryName @title: 'Category Name';
  Description @title: 'Description';
  Picture @title: 'Picture'
};

annotate NorthwindSrv.Categories with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: CategoryID },
    { $Type: 'UI.DataField', Value: CategoryName },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Picture }
];

annotate NorthwindSrv.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: CategoryID },
    { $Type: 'UI.DataField', Value: CategoryName },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Picture }
  ]
};

annotate NorthwindSrv.Categories with {
  products @Common.Label: 'Products';
  suppliers @Common.Label: 'Suppliers'
};

annotate NorthwindSrv.Categories with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#CategoryName' }
];

annotate NorthwindSrv.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Categories with @UI.SelectionFields: [
  CategoryID
];

annotate NorthwindSrv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: ProductID } };
annotate NorthwindSrv.Products with {
  ID @UI.Hidden @Common.Text: { $value: ProductID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Products with @UI.Identification: [{ Value: ProductID }];
annotate NorthwindSrv.Products with {
  category @Common.ValueList: {
    CollectionPath: 'Categories',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CategoryID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CategoryName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Picture'
      },
    ],
  }
};
annotate NorthwindSrv.Products with {
  supplier @Common.ValueList: {
    CollectionPath: 'Suppliers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: supplier_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'SupplierID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CompanyName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ContactName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ContactTitle'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Address'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'City'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Region'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'PostalCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Fax'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'HomePage'
      },
    ],
  }
};
annotate NorthwindSrv.Products with @UI.DataPoint #ProductName: {
  Value: ProductName,
  Title: 'Product Name',
};
annotate NorthwindSrv.Products with {
  ProductID @title: 'Product ID';
  ProductName @title: 'Product Name';
  QuantityPerUnit @title: 'Quantity Per Unit';
  UnitPrice @title: 'Unit Price';
  UnitsInStock @title: 'Units In Stock';
  Discontinued @title: 'Discontinued'
};

annotate NorthwindSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ProductID },
    { $Type: 'UI.DataField', Value: ProductName },
    { $Type: 'UI.DataField', Value: QuantityPerUnit },
    { $Type: 'UI.DataField', Value: UnitPrice },
    { $Type: 'UI.DataField', Value: UnitsInStock },
    { $Type: 'UI.DataField', Value: Discontinued },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Supplier', Value: supplier_ID }
];

annotate NorthwindSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ProductID },
    { $Type: 'UI.DataField', Value: ProductName },
    { $Type: 'UI.DataField', Value: QuantityPerUnit },
    { $Type: 'UI.DataField', Value: UnitPrice },
    { $Type: 'UI.DataField', Value: UnitsInStock },
    { $Type: 'UI.DataField', Value: Discontinued },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Supplier', Value: supplier_ID }
  ]
};

annotate NorthwindSrv.Products with {
  category @Common.Text: { $value: category.CategoryID, ![@UI.TextArrangement]: #TextOnly };
  supplier @Common.Text: { $value: supplier.SupplierID, ![@UI.TextArrangement]: #TextOnly }
};

annotate NorthwindSrv.Products with {
  category @Common.Label: 'Category';
  supplier @Common.Label: 'Supplier'
};

annotate NorthwindSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#ProductName' }
];

annotate NorthwindSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Products with @UI.SelectionFields: [
  category_ID,
  supplier_ID
];

annotate NorthwindSrv.Suppliers with @UI.HeaderInfo: { TypeName: 'Supplier', TypeNamePlural: 'Suppliers', Title: { Value: SupplierID } };
annotate NorthwindSrv.Suppliers with {
  ID @UI.Hidden @Common.Text: { $value: SupplierID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Suppliers with @UI.Identification: [{ Value: SupplierID }];
annotate NorthwindSrv.Suppliers with {
  categories @Common.ValueList: {
    CollectionPath: 'Categories',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: categories_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CategoryID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CategoryName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Picture'
      },
    ],
  }
};
annotate NorthwindSrv.Suppliers with @UI.DataPoint #CompanyName: {
  Value: CompanyName,
  Title: 'Company Name',
};
annotate NorthwindSrv.Suppliers with {
  SupplierID @title: 'Supplier ID';
  CompanyName @title: 'Company Name';
  ContactName @title: 'Contact Name';
  ContactTitle @title: 'Contact Title';
  Address @title: 'Address';
  City @title: 'City';
  Region @title: 'Region';
  PostalCode @title: 'Postal Code';
  Country @title: 'Country';
  Phone @title: 'Phone';
  Fax @title: 'Fax';
  HomePage @title: 'Home Page'
};

annotate NorthwindSrv.Suppliers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: SupplierID },
    { $Type: 'UI.DataField', Value: CompanyName },
    { $Type: 'UI.DataField', Value: ContactName },
    { $Type: 'UI.DataField', Value: ContactTitle },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: Phone },
    { $Type: 'UI.DataField', Value: Fax },
    { $Type: 'UI.DataField', Value: HomePage },
    { $Type: 'UI.DataField', Label: 'Category', Value: categories_ID }
];

annotate NorthwindSrv.Suppliers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: SupplierID },
    { $Type: 'UI.DataField', Value: CompanyName },
    { $Type: 'UI.DataField', Value: ContactName },
    { $Type: 'UI.DataField', Value: ContactTitle },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: Phone },
    { $Type: 'UI.DataField', Value: Fax },
    { $Type: 'UI.DataField', Value: HomePage },
    { $Type: 'UI.DataField', Label: 'Category', Value: categories_ID }
  ]
};

annotate NorthwindSrv.Suppliers with {
  categories @Common.Text: { $value: categories.CategoryID, ![@UI.TextArrangement]: #TextOnly }
};

annotate NorthwindSrv.Suppliers with {
  products @Common.Label: 'Products';
  categories @Common.Label: 'Category'
};

annotate NorthwindSrv.Suppliers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#CompanyName' }
];

annotate NorthwindSrv.Suppliers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Suppliers with @UI.SelectionFields: [
  categories_ID
];

annotate NorthwindSrv.Employees with @UI.HeaderInfo: { TypeName: 'Employee', TypeNamePlural: 'Employees', Title: { Value: EmployeeID } };
annotate NorthwindSrv.Employees with {
  ID @UI.Hidden @Common.Text: { $value: EmployeeID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Employees with @UI.Identification: [{ Value: EmployeeID }];
annotate NorthwindSrv.Employees with @UI.DataPoint #LastName: {
  Value: LastName,
  Title: 'Last Name',
};
annotate NorthwindSrv.Employees with @UI.DataPoint #FirstName: {
  Value: FirstName,
  Title: 'First Name',
};
annotate NorthwindSrv.Employees with {
  EmployeeID @title: 'Employee ID';
  LastName @title: 'Last Name';
  FirstName @title: 'First Name';
  Title @title: 'Title';
  TitleOfCourtesy @title: 'Title Of Courtesy';
  BirthDate @title: 'Birth Date';
  HireDate @title: 'Hire Date';
  Address @title: 'Address';
  City @title: 'City';
  Region @title: 'Region';
  PostalCode @title: 'Postal Code';
  Country @title: 'Country';
  HomePhone @title: 'Home Phone';
  Extension @title: 'Extension';
  Photo @title: 'Photo';
  Notes @title: 'Notes';
  ReportsTo @title: 'Reports To';
  PhotoPath @title: 'Photo Path'
};

annotate NorthwindSrv.Employees with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: EmployeeID },
    { $Type: 'UI.DataField', Value: LastName },
    { $Type: 'UI.DataField', Value: FirstName },
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: TitleOfCourtesy },
    { $Type: 'UI.DataField', Value: BirthDate },
    { $Type: 'UI.DataField', Value: HireDate },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: HomePhone },
    { $Type: 'UI.DataField', Value: Extension },
    { $Type: 'UI.DataField', Value: Photo },
    { $Type: 'UI.DataField', Value: Notes },
    { $Type: 'UI.DataField', Value: ReportsTo },
    { $Type: 'UI.DataField', Value: PhotoPath }
];

annotate NorthwindSrv.Employees with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: EmployeeID },
    { $Type: 'UI.DataField', Value: LastName },
    { $Type: 'UI.DataField', Value: FirstName },
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: TitleOfCourtesy },
    { $Type: 'UI.DataField', Value: BirthDate },
    { $Type: 'UI.DataField', Value: HireDate },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: HomePhone },
    { $Type: 'UI.DataField', Value: Extension },
    { $Type: 'UI.DataField', Value: Photo },
    { $Type: 'UI.DataField', Value: Notes },
    { $Type: 'UI.DataField', Value: ReportsTo },
    { $Type: 'UI.DataField', Value: PhotoPath }
  ]
};

annotate NorthwindSrv.Employees with {
  orders @Common.Label: 'Orders'
};

annotate NorthwindSrv.Employees with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#LastName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#FirstName' }
];

annotate NorthwindSrv.Employees with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Employees with @UI.SelectionFields: [
  EmployeeID
];

annotate NorthwindSrv.Orders with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders', Title: { Value: OrderID } };
annotate NorthwindSrv.Orders with {
  ID @UI.Hidden @Common.Text: { $value: OrderID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Orders with @UI.Identification: [{ Value: OrderID }];
annotate NorthwindSrv.Orders with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CustomerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'CompanyName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ContactName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ContactTitle'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Address'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'City'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Region'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'PostalCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Fax'
      },
    ],
  }
};
annotate NorthwindSrv.Orders with {
  employee @Common.ValueList: {
    CollectionPath: 'Employees',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employee_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'EmployeeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'LastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'FirstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'TitleOfCourtesy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'BirthDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'HireDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Address'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'City'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Region'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'PostalCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'HomePhone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Extension'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Photo'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Notes'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ReportsTo'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'PhotoPath'
      },
    ],
  }
};
annotate NorthwindSrv.Orders with {
  OrderID @title: 'Order ID';
  OrderDate @title: 'Order Date';
  RequiredDate @title: 'Required Date';
  ShippedDate @title: 'Shipped Date';
  ShipVia @title: 'Ship Via';
  Freight @title: 'Freight';
  ShipName @title: 'Ship Name';
  ShipAddress @title: 'Ship Address';
  ShipCity @title: 'Ship City';
  ShipRegion @title: 'Ship Region';
  ShipPostalCode @title: 'Ship Postal Code';
  ShipCountry @title: 'Ship Country'
};

annotate NorthwindSrv.Orders with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: OrderID },
    { $Type: 'UI.DataField', Value: OrderDate },
    { $Type: 'UI.DataField', Value: RequiredDate },
    { $Type: 'UI.DataField', Value: ShippedDate },
    { $Type: 'UI.DataField', Value: ShipVia },
    { $Type: 'UI.DataField', Value: Freight },
    { $Type: 'UI.DataField', Value: ShipName },
    { $Type: 'UI.DataField', Value: ShipAddress },
    { $Type: 'UI.DataField', Value: ShipCity },
    { $Type: 'UI.DataField', Value: ShipRegion },
    { $Type: 'UI.DataField', Value: ShipPostalCode },
    { $Type: 'UI.DataField', Value: ShipCountry },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employee_ID }
];

annotate NorthwindSrv.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: OrderID },
    { $Type: 'UI.DataField', Value: OrderDate },
    { $Type: 'UI.DataField', Value: RequiredDate },
    { $Type: 'UI.DataField', Value: ShippedDate },
    { $Type: 'UI.DataField', Value: ShipVia },
    { $Type: 'UI.DataField', Value: Freight },
    { $Type: 'UI.DataField', Value: ShipName },
    { $Type: 'UI.DataField', Value: ShipAddress },
    { $Type: 'UI.DataField', Value: ShipCity },
    { $Type: 'UI.DataField', Value: ShipRegion },
    { $Type: 'UI.DataField', Value: ShipPostalCode },
    { $Type: 'UI.DataField', Value: ShipCountry },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employee_ID }
  ]
};

annotate NorthwindSrv.Orders with {
  customer @Common.Text: { $value: customer.CustomerID, ![@UI.TextArrangement]: #TextOnly };
  employee @Common.Text: { $value: employee.EmployeeID, ![@UI.TextArrangement]: #TextOnly }
};

annotate NorthwindSrv.Orders with {
  customer @Common.Label: 'Customer';
  employee @Common.Label: 'Employee';
  orderDetails @Common.Label: 'Order Details'
};

annotate NorthwindSrv.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Orders with @UI.SelectionFields: [
  customer_ID,
  employee_ID
];

annotate NorthwindSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: CustomerID } };
annotate NorthwindSrv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: CustomerID, ![@UI.TextArrangement]: #TextOnly }
};
annotate NorthwindSrv.Customers with @UI.Identification: [{ Value: CustomerID }];
annotate NorthwindSrv.Customers with @UI.DataPoint #CompanyName: {
  Value: CompanyName,
  Title: 'Company Name',
};
annotate NorthwindSrv.Customers with {
  CustomerID @title: 'Customer ID';
  CompanyName @title: 'Company Name';
  ContactName @title: 'Contact Name';
  ContactTitle @title: 'Contact Title';
  Address @title: 'Address';
  City @title: 'City';
  Region @title: 'Region';
  PostalCode @title: 'Postal Code';
  Country @title: 'Country';
  Phone @title: 'Phone';
  Fax @title: 'Fax'
};

annotate NorthwindSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: CustomerID },
    { $Type: 'UI.DataField', Value: CompanyName },
    { $Type: 'UI.DataField', Value: ContactName },
    { $Type: 'UI.DataField', Value: ContactTitle },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: Phone },
    { $Type: 'UI.DataField', Value: Fax }
];

annotate NorthwindSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: CustomerID },
    { $Type: 'UI.DataField', Value: CompanyName },
    { $Type: 'UI.DataField', Value: ContactName },
    { $Type: 'UI.DataField', Value: ContactTitle },
    { $Type: 'UI.DataField', Value: Address },
    { $Type: 'UI.DataField', Value: City },
    { $Type: 'UI.DataField', Value: Region },
    { $Type: 'UI.DataField', Value: PostalCode },
    { $Type: 'UI.DataField', Value: Country },
    { $Type: 'UI.DataField', Value: Phone },
    { $Type: 'UI.DataField', Value: Fax }
  ]
};

annotate NorthwindSrv.Customers with {
  orders @Common.Label: 'Orders'
};

annotate NorthwindSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#CompanyName' }
];

annotate NorthwindSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.Customers with @UI.SelectionFields: [
  CustomerID
];

annotate NorthwindSrv.OrderDetails with @UI.HeaderInfo: { TypeName: 'Order Detail', TypeNamePlural: 'Order Details' };
annotate NorthwindSrv.OrderDetails with {
  order @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: order_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'OrderID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'OrderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'RequiredDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShippedDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipVia'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Freight'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipAddress'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipCity'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipRegion'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipPostalCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ShipCountry'
      },
    ],
  }
};
annotate NorthwindSrv.OrderDetails with {
  product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ProductID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ProductName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'QuantityPerUnit'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'UnitPrice'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'UnitsInStock'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Discontinued'
      },
    ],
  }
};
annotate NorthwindSrv.OrderDetails with {
  UnitPrice @title: 'Unit Price';
  Quantity @title: 'Quantity';
  Discount @title: 'Discount'
};

annotate NorthwindSrv.OrderDetails with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: UnitPrice },
    { $Type: 'UI.DataField', Value: Quantity },
    { $Type: 'UI.DataField', Value: Discount },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];

annotate NorthwindSrv.OrderDetails with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: UnitPrice },
    { $Type: 'UI.DataField', Value: Quantity },
    { $Type: 'UI.DataField', Value: Discount },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
  ]
};

annotate NorthwindSrv.OrderDetails with {
  order @Common.Text: { $value: order.OrderID, ![@UI.TextArrangement]: #TextOnly };
  product @Common.Text: { $value: product.ProductID, ![@UI.TextArrangement]: #TextOnly }
};

annotate NorthwindSrv.OrderDetails with {
  order @Common.Label: 'Order';
  product @Common.Label: 'Product'
};

annotate NorthwindSrv.OrderDetails with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate NorthwindSrv.OrderDetails with @UI.SelectionFields: [
  order_ID,
  product_ID
];

