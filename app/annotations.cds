using { carrierManagementSrv } from '../srv/service.cds';

annotate carrierManagementSrv.Carrier with @UI.HeaderInfo: { TypeName: 'Carrier', TypeNamePlural: 'Carriers', Title: { Value: carrierId } };
annotate carrierManagementSrv.Carrier with {
  ID @UI.Hidden @Common.Text: { $value: carrierId, ![@UI.TextArrangement]: #TextOnly }
};
annotate carrierManagementSrv.Carrier with @UI.Identification: [{ Value: carrierId }];
annotate carrierManagementSrv.Carrier with @UI.DataPoint #carrierName: {
  Value: carrierName,
  Title: 'Carrier Name',
};
annotate carrierManagementSrv.Carrier with {
  carrierId @title: 'Carrier ID';
  carrierName @title: 'Carrier Name';
  currencyCode @title: 'Currency Code';
  url @title: 'URL'
};

annotate carrierManagementSrv.Carrier with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: carrierId },
    { $Type: 'UI.DataField', Value: carrierName },
    { $Type: 'UI.DataField', Value: currencyCode },
    { $Type: 'UI.DataField', Value: url }
];

annotate carrierManagementSrv.Carrier with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: carrierId },
    { $Type: 'UI.DataField', Value: carrierName },
    { $Type: 'UI.DataField', Value: currencyCode },
    { $Type: 'UI.DataField', Value: url }
  ]
};

annotate carrierManagementSrv.Carrier with {
  connections @Common.Label: 'Connections'
};

annotate carrierManagementSrv.Carrier with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#carrierName' }
];

annotate carrierManagementSrv.Carrier with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate carrierManagementSrv.Carrier with @UI.SelectionFields: [
  carrierId
];

annotate carrierManagementSrv.Connection with @UI.HeaderInfo: { TypeName: 'Connection', TypeNamePlural: 'Connections', Title: { Value: connectionId } };
annotate carrierManagementSrv.Connection with {
  ID @UI.Hidden @Common.Text: { $value: connectionId, ![@UI.TextArrangement]: #TextOnly }
};
annotate carrierManagementSrv.Connection with @UI.Identification: [{ Value: connectionId }];
annotate carrierManagementSrv.Connection with {
  carrier @Common.ValueList: {
    CollectionPath: 'Carrier',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: carrier_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'carrierId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'carrierName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'currencyCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'url'
      },
    ],
  }
};
annotate carrierManagementSrv.Connection with @UI.DataPoint #cityFrom: {
  Value: cityFrom,
  Title: 'City From',
};
annotate carrierManagementSrv.Connection with @UI.DataPoint #cityTo: {
  Value: cityTo,
  Title: 'City To',
};
annotate carrierManagementSrv.Connection with @UI.DataPoint #airportFrom: {
  Value: airportFrom,
  Title: 'Airport From',
};
annotate carrierManagementSrv.Connection with {
  connectionId @title: 'Connection ID';
  cityFrom @title: 'City From';
  cityTo @title: 'City To';
  airportFrom @title: 'Airport From';
  airportTo @title: 'Airport To'
};

annotate carrierManagementSrv.Connection with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: connectionId },
    { $Type: 'UI.DataField', Value: cityFrom },
    { $Type: 'UI.DataField', Value: cityTo },
    { $Type: 'UI.DataField', Value: airportFrom },
    { $Type: 'UI.DataField', Value: airportTo },
    { $Type: 'UI.DataField', Label: 'Carrier', Value: carrier_ID }
];

annotate carrierManagementSrv.Connection with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: connectionId },
    { $Type: 'UI.DataField', Value: cityFrom },
    { $Type: 'UI.DataField', Value: cityTo },
    { $Type: 'UI.DataField', Value: airportFrom },
    { $Type: 'UI.DataField', Value: airportTo },
    { $Type: 'UI.DataField', Label: 'Carrier', Value: carrier_ID }
  ]
};

annotate carrierManagementSrv.Connection with {
  carrier @Common.Text: { $value: carrier.carrierId, ![@UI.TextArrangement]: #TextOnly }
};

annotate carrierManagementSrv.Connection with {
  flights @Common.Label: 'Flights';
  carrier @Common.Label: 'Carrier'
};

annotate carrierManagementSrv.Connection with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cityFrom' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cityTo' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#airportFrom' }
];

annotate carrierManagementSrv.Connection with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate carrierManagementSrv.Connection with @UI.SelectionFields: [
  carrier_ID
];

annotate carrierManagementSrv.Flight with @UI.HeaderInfo: { TypeName: 'Flight', TypeNamePlural: 'Flights', Title: { Value: flightId } };
annotate carrierManagementSrv.Flight with {
  ID @UI.Hidden @Common.Text: { $value: flightId, ![@UI.TextArrangement]: #TextOnly }
};
annotate carrierManagementSrv.Flight with @UI.Identification: [{ Value: flightId }];
annotate carrierManagementSrv.Flight with {
  connection @Common.ValueList: {
    CollectionPath: 'Connection',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: connection_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'connectionId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cityFrom'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cityTo'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'airportFrom'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'airportTo'
      },
    ],
  }
};
annotate carrierManagementSrv.Flight with @UI.DataPoint #date: {
  Value: date,
  Title: 'Date',
};
annotate carrierManagementSrv.Flight with {
  flightId @title: 'Flight ID';
  date @title: 'Date'
};

annotate carrierManagementSrv.Flight with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: flightId },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Label: 'Connection', Value: connection_ID }
];

annotate carrierManagementSrv.Flight with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: flightId },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Label: 'Connection', Value: connection_ID }
  ]
};

annotate carrierManagementSrv.Flight with {
  connection @Common.Text: { $value: connection.connectionId, ![@UI.TextArrangement]: #TextOnly }
};

annotate carrierManagementSrv.Flight with {
  bookings @Common.Label: 'Bookings';
  connection @Common.Label: 'Connection'
};

annotate carrierManagementSrv.Flight with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#date' }
];

annotate carrierManagementSrv.Flight with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate carrierManagementSrv.Flight with @UI.SelectionFields: [
  connection_ID
];

annotate carrierManagementSrv.Booking with @UI.HeaderInfo: { TypeName: 'Booking', TypeNamePlural: 'Bookings', Title: { Value: bookingId } };
annotate carrierManagementSrv.Booking with {
  ID @UI.Hidden @Common.Text: { $value: bookingId, ![@UI.TextArrangement]: #TextOnly }
};
annotate carrierManagementSrv.Booking with @UI.Identification: [{ Value: bookingId }];
annotate carrierManagementSrv.Booking with {
  flight @Common.ValueList: {
    CollectionPath: 'Flight',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: flight_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'carrierId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'flightId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'date'
      },
    ],
  }
};
annotate carrierManagementSrv.Booking with @UI.DataPoint #date: {
  Value: date,
  Title: 'Date',
};
annotate carrierManagementSrv.Booking with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate carrierManagementSrv.Booking with @UI.DataPoint #passengerName: {
  Value: passengerName,
  Title: 'Passenger Name',
};
annotate carrierManagementSrv.Booking with {
  bookingId @title: 'Booking ID';
  date @title: 'Date';
  price @title: 'Price';
  passengerName @title: 'Passenger Name'
};

annotate carrierManagementSrv.Booking with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: bookingId },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: passengerName },
    { $Type: 'UI.DataField', Label: 'Flight', Value: flight_ID }
];

annotate carrierManagementSrv.Booking with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: bookingId },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: passengerName },
    { $Type: 'UI.DataField', Label: 'Flight', Value: flight_ID }
  ]
};

annotate carrierManagementSrv.Booking with {
  flight @Common.Text: { $value: flight.flightId, ![@UI.TextArrangement]: #TextOnly }
};

annotate carrierManagementSrv.Booking with {
  flight @Common.Label: 'Flight'
};

annotate carrierManagementSrv.Booking with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#date' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#passengerName' }
];

annotate carrierManagementSrv.Booking with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate carrierManagementSrv.Booking with @UI.SelectionFields: [
  flight_ID
];

