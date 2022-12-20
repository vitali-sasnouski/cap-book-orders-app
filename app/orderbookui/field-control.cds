using { OrderBookService } from '../../srv/service';

annotate OrderBookService.BookOrders with {
    bookOrderID @mandatory;
};
