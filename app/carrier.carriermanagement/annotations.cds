using carrierManagementSrv as service from '../../srv/service';
using from '../annotations';


annotate service.Carrier with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : carrierId,
            Label : '{i18n>CarrierId}',
        },
        {
            $Type : 'UI.DataField',
            Value : carrierName,
            Label : '{i18n>CarrierName}',
        },
        {
            $Type : 'UI.DataField',
            Value : currencyCode,
            Label : '{i18n>CurrencyCode}',
        },
        {
            $Type : 'UI.DataField',
            Value : url,
            Label : '{i18n>Url}',
        },
    ]
);


annotate service.Carrier with {
    carrierId @Common.Label : '{i18n>CarrierId}'
};
annotate service.Carrier with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Main',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#Main',
        },
    ],
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : carrierId,
                Label : '{i18n>CarrierId}',
            },
            {
                $Type : 'UI.DataField',
                Value : carrierName,
                Label : '{i18n>CarrierName}',
            },
            {
                $Type : 'UI.DataField',
                Value : currencyCode,
                Label : '{i18n>CurrencyCode}',
            },
            {
                $Type : 'UI.DataField',
                Value : url,
                Label : '{i18n>Url}',
            },
        ],
    },
    UI.DataPoint #carrierName : {
        Value : carrierName,
        Title : '{i18n>CarrierName}',
    },
    UI.HeaderInfo : {
        TypeName : '{i18n>Carrier}',
        TypeNamePlural : '{i18n>Carriers}',
        Title : {
            $Type : 'UI.DataField',
            Value : carrierId,
        },
    }
);
annotate service.Connection with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Main',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#Main',
        },
    ],
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : connectionId,
                Label : '{i18n>ConnectionId}',
            },
            {
                $Type : 'UI.DataField',
                Value : cityFrom,
                Label : '{i18n>CityFrom}',
            },
            {
                $Type : 'UI.DataField',
                Value : cityTo,
                Label : '{i18n>CityTo}',
            },
            {
                $Type : 'UI.DataField',
                Value : airportFrom,
                Label : '{i18n>AirportFrom}',
            },
            {
                $Type : 'UI.DataField',
                Value : airportTo,
                Label : '{i18n>AirportTo}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Carrier}',
                Value : carrier_ID,
            },
        ],
    },
    UI.DataPoint #cityFrom : {
        Value : cityFrom,
        Title : '{i18n>CityFrom}',
    },
    UI.DataPoint #cityTo : {
        Value : cityTo,
        Title : '{i18n>CityTo}',
    },
    UI.DataPoint #airportFrom : {
        Value : airportFrom,
        Title : '{i18n>AirportFrom}',
    },
    UI.HeaderInfo : {
        TypeName : '{i18n>Connection}',
        TypeNamePlural : '{i18n>Connections}',
        Title : {
            $Type : 'UI.DataField',
            Value : connectionId,
        },
    }
);
