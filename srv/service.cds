using { carrierManagement } from '../db/schema.cds';

@path : '/service/carrierManagement'
service carrierManagementSrv
{
    @odata.draft.enabled
    entity Carrier as
        projection on carrierManagement.Carrier;

    @odata.draft.enabled
    entity Connection as
        projection on carrierManagement.Connection;

    @odata.draft.enabled
    entity Flight as
        projection on carrierManagement.Flight;

    @odata.draft.enabled
    entity Booking as
        projection on carrierManagement.Booking;
}

annotate carrierManagementSrv with @requires :
[
    'authenticated-user'
];
