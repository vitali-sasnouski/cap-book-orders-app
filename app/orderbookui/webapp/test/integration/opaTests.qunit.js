sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orderbookui/test/integration/FirstJourney',
		'orderbookui/test/integration/pages/BookOrdersList',
		'orderbookui/test/integration/pages/BookOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, BookOrdersList, BookOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orderbookui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBookOrdersList: BookOrdersList,
					onTheBookOrdersObjectPage: BookOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);