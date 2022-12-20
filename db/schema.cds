namespace epam.sap.dev.orderbook;

using { managed } from '@sap/cds/common';
using {
    sap.common.CodeList,
    Currency
} from './common';

entity BookOrders: managed {
    key orderUUID: UUID;
        bookUUID: UUID;
        bookOrderID: Integer;
        bookName: String(60);
        authorUUID: UUID;
        authorfirstName: String(15);
        authorlastName: String(15);
        CurrencyCode: Currency;
        LocalCurrencyCode: Currency;
        price: Decimal(15, 2);
        quantity: Integer;
        status: Association to one Statuses;
        totalPrice: Decimal(15, 2);
        totalLocal: Decimal(15, 2);
}

entity Statuses {
    key ID: String;
        name: String(20);
        criticality: Integer;
}

