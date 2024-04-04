sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'carrier/carriermanagement/test/integration/FirstJourney',
		'carrier/carriermanagement/test/integration/pages/CarrierList',
		'carrier/carriermanagement/test/integration/pages/CarrierObjectPage',
		'carrier/carriermanagement/test/integration/pages/ConnectionObjectPage'
    ],
    function(JourneyRunner, opaJourney, CarrierList, CarrierObjectPage, ConnectionObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('carrier/carriermanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCarrierList: CarrierList,
					onTheCarrierObjectPage: CarrierObjectPage,
					onTheConnectionObjectPage: ConnectionObjectPage
                }
            },
            opaJourney.run
        );
    }
);