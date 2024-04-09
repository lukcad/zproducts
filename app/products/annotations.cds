using NorthwindSrv as service from '../../srv/service';
using from '../annotations';



annotate service.Products with {
    category @Common.Text : {
        $value : category.CategoryName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Products with {
    supplier @Common.Text : {
        $value : supplier.CompanyName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Products with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ProductID,
        },
        {
            $Type : 'UI.DataField',
            Value : ProductName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Category',
            Value : category_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier',
            Value : supplier_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : QuantityPerUnit,
        },
        {
            $Type : 'UI.DataField',
            Value : UnitPrice,
        },
        {
            $Type : 'UI.DataField',
            Value : UnitsInStock,
        },
        {
            $Type : 'UI.DataField',
            Value : Discontinued,
        },
    ]
);
annotate service.Products with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Details}',
            ID : 'Orders',
            Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            ID : 'Main',
            Label : '{i18n>Details}',
            Target : '@UI.FieldGroup#Main',
        },
                ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items of Orders',
            ID : 'ItemsofOrders',
            Target : 'orderdetails/@UI.LineItem#ItemsofOrders1',
        },
    ]
);
annotate service.Products with @(
    UI.FieldGroup #Orders : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.OrderDetails with @(
    UI.LineItem #ItemsofOrders : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
        },{
            $Type : 'UI.DataField',
            Value : product_ID,
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
        },{
            $Type : 'UI.DataField',
            Value : UnitPrice,
        },]
);
annotate service.OrderDetails with {
    product @Common.Text : {
        $value : product.ProductName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.OrderDetails with {
    product @Common.FieldControl : #ReadOnly
};
annotate service.OrderDetails with {
    order @Common.Text : {
        $value : order.OrderID,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.OrderDetails with {
    order @Common.FieldControl : #ReadOnly
};
annotate service.OrderDetails with @(
    UI.LineItem #ItemsofOrders1 : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
        },{
            $Type : 'UI.DataField',
            Value : product_ID,
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
        },{
            $Type : 'UI.DataField',
            Value : UnitPrice,
        },]
);
