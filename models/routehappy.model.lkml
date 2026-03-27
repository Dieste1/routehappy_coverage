connection: "ota"

include: "/views/**/*.view.lkml"


explore: optimizer_attempt_bookings {

  join: optimizer_candidates {
    type: inner
    relationship: one_to_many
    sql_on: ${optimizer_candidates.attempt_id} = ${optimizer_attempt_bookings.attempt_id} ;;
  }

  join: booking_routehappy_itineraries {
    type: inner
    relationship: one_to_many
    sql_on:
      ${booking_routehappy_itineraries.booking_id} = ${optimizer_attempt_bookings.booking_id}
      AND (
        (
          ${optimizer_candidates.reprice_type} = 'original'
          AND ${booking_routehappy_itineraries.context} = 'checkout'
        )
        OR
        (
          ${optimizer_candidates.id} = ${optimizer_attempt_bookings.candidate_id}
          AND ${booking_routehappy_itineraries.context} = 'booked'
        )
      ) ;;
  }

  join: routehappy_documents {
    type: inner
    relationship: many_to_one
    sql_on:
      ${booking_routehappy_itineraries.routehappy_document_id} = ${routehappy_documents.id}
      AND ${routehappy_documents.schema_name} = 'RespItinerary' ;;
  }

  join: checked_bag_documents {
    from: routehappy_documents
    type: left_outer
    relationship: many_to_one
    view_label: "Checked Bag Payload"
    fields: []
    sql_on:
    ${checked_bag_documents.id} = ${routehappy_documents.checked_bag}
    AND ${checked_bag_documents.schema_name} = 'CheckedBaggage' ;;
  }

  join: carry_on_bag_documents {
    from: routehappy_documents
    type: left_outer
    relationship: many_to_one
    fields: []
    sql_on:
      ${carry_on_bag_documents.id} = ${routehappy_documents.carry_on_bag}
      AND ${carry_on_bag_documents.schema_name} = 'CarryOnBaggage' ;;
  }

  join: brand_documents {
    from: routehappy_documents
    type: left_outer
    relationship: many_to_one
    fields: []
    sql_on:
    ${brand_documents.id} = ${routehappy_documents.brand}
    AND ${brand_documents.schema_name} = 'Brand' ;;
  }

  join: cancellation_documents {
    from: routehappy_documents
    type: left_outer
    relationship: many_to_one
    fields: []
    sql_on:
      ${cancellation_documents.id} = ${routehappy_documents.cancellation}
      AND ${cancellation_documents.schema_name} = 'Cancellation' ;;
  }

  join: advance_change_documents {
    from: routehappy_documents
    type: left_outer
    relationship: many_to_one
    fields: []
    sql_on:
      ${advance_change_documents.id} = ${routehappy_documents.advance_change}
      AND ${advance_change_documents.schema_name} = 'AdvanceChange' ;;
  }

  join: cancellations_comparisons {
    type: left_outer
    sql_on: ${booking_routehappy_itineraries.booking_id} = ${cancellations_comparisons.booking_id} ;;
    relationship: one_to_one
  }

}
