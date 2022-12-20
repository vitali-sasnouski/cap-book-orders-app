using {epam.sap.dev.orderbook as order} from '../../db/schema';

annotate order.BookOrders with @title : '{i18n>bookTitle}' {
    orderUUID       @UI.Hidden;
    bookName        @title            : '{i18n>bookname}';
    bookOrderID     @title            : '{i18n>bookID}';
    authorfirstName @title            : '{i18n>firstname}';
    authorlastName  @title            : '{i18n>lastname}';
    quantity        @title            : '{i18n>quantity}';
    price           @title            : '{i18n>price}'  @Measures.ISOCurrency      : CurrencyCode_code;
    status          @title            : '{i18n>status}'  @Common.Text              : status.name  @Common.TextArrangement : #TextFirst;
    totalPrice      @title            : '{i18n>totalprice}'  @Measures.ISOCurrency : CurrencyCode_code;
    totalLocal      @title            : '{i18n>totallocal}'  @Measures.ISOCurrency : LocalCurrencyCode_code;
}
