using OrderBookService as service from '../../srv/service';

annotate service.BookOrders with @(
    UI        : {
        SelectionFields     : [status_ID],
        Identification      : [
            {Value : orderUUID},
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrderBookService.sendBook',
                Label  : '{i18n>sendBook}'
            },
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrderBookService.approveBook',
                Label  : '{i18n>approveBook}'
            },
        ],

        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : bookOrderID,
                ![@UI.Importance] : #High,
                Label             : '{i18n>bookTitle}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High,
                Label             : '{i18n>status}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : bookName,
                ![@UI.Importance] : #High,
                Label             : '{i18n>bookname}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : authorfirstName,
                ![@UI.Importance] : #High,
                Label             : '{i18n>firstname}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : authorlastName,
                ![@UI.Importance] : #High,
                Label             : '{i18n>lastname}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : price,
                ![@UI.Importance] : #High,
                Label             : '{i18n>price}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High,
                Label             : '{i18n>quantity}'
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalPrice,
                ![@UI.Importance] : #High,
                Label             : '{i18n>totalprice}'
            },

        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : bookOrderID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Order',
            TypeNamePlural : 'Orders',
            Title          : {Value : bookName},
            Description    : {
                Value       : status_ID,
                Criticality : status.criticality
            }
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : '{i18n>quantity}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : '{i18n>totalprice}'
            }
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : bookOrderID,
                Label : '{i18n>bookTitle}'
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality,
                Label : '{i18n>status}'
            },
            {
                $Type : 'UI.DataField',
                Value : bookName,
                Label : '{i18n>bookname}'
            },
            {
                $Type : 'UI.DataField',
                Value : authorfirstName,
                Label : '{i18n>firstname}'
            },
            {
                $Type : 'UI.DataField',
                Value : authorlastName,
                Label : '{i18n>lastname}'
            },
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : '{i18n>price}'
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : '{i18n>quantity}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : '{i18n>totalprice}'
            },
            {
                $Type : 'UI.DataField',
                Value : totalLocal,
                Label : '{i18n>localtotalprice}'
            },
        ]},
        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'PODetails',
            Label  : '{i18n>orderInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>orderinfo}',
                Target : '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);
