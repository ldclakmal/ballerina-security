type ElectronicItem record {|
    readonly string code;
    string brand;
    string model;
    string price;
    int qty;
|};

table<ElectronicItem> key(code) electronicsTable = table [
    {
        "code": "APMBA132021",
        "brand": "Apple",
        "model": "Mac Book AIR M1 (13-inch 2021)",
        "price": "$1249.00",
        "qty": 32
    },
    {
        "code": "SOWH1000XM4",
        "brand": "Sony",
        "model": "WH-1000XM4",
        "price": "$349.99",
        "qty": 75
    }
];

type BookItem record {|
    readonly string code;
    string title;
    string authors;
    string price;
    int qty;
|};

table<BookItem> key(code) booksTable = table [
    {
        "code": "978-1617295959",
        "title": "Microservices Security in Action",
        "authors": "Prabath Siriwardena and Nuwan Dias",
        "price": "$50.99",
        "qty": 10
    },
    {
        "code": "978-1484220498",
        "title": "Advanced API Security",
        "authors": "Prabath Siriwardena",
        "price": "$15.39",
        "qty": 10
    }
];

type InventoryItem ElectronicItem|BookItem;

map<table<InventoryItem>> inventory = {
    electronics: electronicsTable,
    books: booksTable
};
