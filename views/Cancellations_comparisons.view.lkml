view: cancellations_comparisons {


  derived_table: {
    sql:
    SELECT
      bri.booking_id,

      MAX(CASE
      WHEN bri.context = 'booked'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.anytime.description'))
      END) AS booked_refund,

      MAX(CASE
      WHEN bri.context = 'checkout'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.anytime.description'))
      END) AS checkout_refund

      FROM booking_routehappy_itineraries bri

      INNER JOIN routehappy_documents itinerary_documents
      ON bri.routehappy_document_id = itinerary_documents.id
      AND itinerary_documents.schema_name = 'RespItinerary'

      LEFT JOIN routehappy_documents cancellation_documents
      ON cancellation_documents.id = JSON_UNQUOTE(
      JSON_EXTRACT(itinerary_documents.data, '$.data.legs[0].fares[0].cancellation[0][0]')
      )
      AND cancellation_documents.schema_name = 'Cancellation'

      GROUP BY bri.booking_id ;;
  }


  dimension: booking_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.booking_id ;;
    hidden:  yes
  }

  dimension: anytime_booked_refund {
    type: string
    sql: ${TABLE}.booked_refund ;;
    group_label: "1. Anytime"
  }

  dimension: anytime_checkout_refund {
    type: string
    sql: ${TABLE}.checkout_refund ;;
    group_label: "1. Anytime"
  }

  dimension: anytime_refund_mismatch {
    type: yesno
    sql: COALESCE(${anytime_booked_refund}, '') != COALESCE(${anytime_checkout_refund}, '') ;;
    group_label: "1. Anytime"
  }


  measure: anytime_mismatch_count {
    type: count
    filters: [anytime_refund_mismatch: "yes"]
  }

}
