namespace sampleProject;

entity Products {
    key ID : UUID;
    category: String;
    mainCategory: String;
    taxTarifCode: String;
    supplierName: String;
    weightMeasure: Decimal;
    weightUnit: String;
    description: String;
    name: String;
    productPicUrl: String;
    status: String;
    quantity: Integer;
    uoM: String;
    currencyCode: String;
    price: Decimal;
    width: Decimal;
    depth: Decimal;
    height: Decimal;
    dimUnit: String;    
    rating: Integer;
    isInCart: Boolean default false;
}