namespace carrierManagement;

entity Carrier {
  key ID: UUID;
  carrierId: String(10) @assert.unique @mandatory;
  carrierName: String(100);
  currencyCode: String(3);
  url: String(200);
  connections: Association to many Connection on connections.carrier = $self;
}

entity Connection {
  key ID: UUID;
  connectionId: String(10) @assert.unique @mandatory;
  cityFrom: String(100);
  cityTo: String(100);
  airportFrom: String(100);
  airportTo: String(100);
  flights: Association to many Flight on flights.connection = $self;
  carrier: Association to Carrier;
}

entity Flight {
  key ID: UUID;
  carrierId: String(10);
  flightId: String(10) @assert.unique @mandatory;
  date: Date;
  bookings: Association to many Booking on bookings.flight = $self;
  connection: Association to Connection;
}

entity Booking {
  key ID: UUID;
  carrierId: String(10);
  connectionId: String(10);
  bookingId: String(10) @assert.unique @mandatory;
  date: Date;
  price: Decimal(10,2);
  passengerName: String(100);
  flight: Association to Flight;
}

