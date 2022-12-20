using { OrderBookService } from '../../srv/service';

annotate OrderBookService.BookOrders with @odata.draft.enabled;
annotate OrderBookService.BookOrders with @Capabilities : { 
    Deletable, Insertable: true
 };

