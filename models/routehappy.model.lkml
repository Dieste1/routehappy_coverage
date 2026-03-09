connection: "ota"

include: "/views/**/*.view.lkml"

explore: bookings {

  join: booking_routehappy_itineraries {
    type: inner
    relationship: one_to_many
    sql_on: ${booking_routehappy_itineraries.booking_id} = ${bookings.id} ;;
  }

  join: routehappy_documents {
    type: inner
    relationship: many_to_one
    required_joins: [booking_routehappy_itineraries]
    sql_on: ${booking_routehappy_itineraries.routehappy_document_id} = ${routehappy_documents.id} ;;
  }
}
