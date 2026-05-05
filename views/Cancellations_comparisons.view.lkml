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
      END) AS checkout_refund,

      MAX(CASE
      WHEN bri.context = 'booked'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.anytime_no_show.description'))
      END) AS booked_anytime_no_show,

      MAX(CASE
      WHEN bri.context = 'checkout'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.anytime_no_show.description'))
      END) AS checkout_anytime_no_show,

      MAX(CASE
      WHEN bri.context = 'booked'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.before_departure.description'))
      END) AS booked_before_departure,

      MAX(CASE
      WHEN bri.context = 'checkout'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.before_departure.description'))
      END) AS checkout_before_departure,

      MAX(CASE
      WHEN bri.context = 'booked'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.before_departure_no_show.description'))
      END) AS booked_before_departure_no_show,

      MAX(CASE
      WHEN bri.context = 'checkout'
      THEN JSON_UNQUOTE(JSON_EXTRACT(cancellation_documents.data, '$.before_departure_no_show.description'))
      END) AS checkout_before_departure_no_show

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


  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension: booking_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.booking_id ;;
    hidden:  yes
  }

# ============================================= Anytime =============================================

  dimension: anytime_booked_refund {
    type: string
    sql: ${TABLE}.booked_refund ;;
    group_label: "1. Anytime"
    hidden: yes
  }

  dimension: anytime_checkout_refund {
    type: string
    sql: ${TABLE}.checkout_refund ;;
    group_label: "1. Anytime"
    hidden: yes
  }

  dimension: anytime_refund_mismatch {
    type: yesno
    sql: COALESCE(${anytime_booked_refund}, '') != COALESCE(${anytime_checkout_refund}, '') ;;
    group_label: "1. Anytime"
    hidden: yes
  }

# ============================================= Anytime No Show =============================================
  dimension: anytime_no_show_booked_refund {
    type: string
    sql: ${TABLE}.booked_anytime_no_show ;;
    group_label: "2. Anytime No Show"
    hidden: yes
  }

  dimension: anytime_no_show_checkout_refund{
    type: string
    sql: ${TABLE}.checkout_anytime_no_show ;;
    group_label: "2. Anytime No Show"
    hidden: yes
  }

  dimension: anytime_no_show_mismatch {
    type: yesno
    sql: COALESCE(${anytime_no_show_booked_refund}, '') != COALESCE(${anytime_no_show_checkout_refund}, '') ;;
    group_label: "2. Anytime No Show"
    hidden: yes
  }

# ============================================= Before Departure =============================================

  dimension: before_departure_booked_refund {
    type: string
    sql: ${TABLE}.booked_before_departure ;;
    group_label: "3. Before Departure"
    hidden: yes
  }

  dimension: before_departure_checkout_refund {
    type: string
    sql: ${TABLE}.checkout_before_departure ;;
    group_label: "3. Before Departure"
    hidden: yes
  }

  dimension: before_departure_refund_mismatch {
    type: yesno
    sql: COALESCE(${before_departure_booked_refund}, '') != COALESCE(${before_departure_checkout_refund}, '') ;;
    group_label: "3. Before Departure"
    hidden: yes
  }

# ============================================= Before Departure No Show =============================================

  dimension: before_departure_booked_no_show {
    type: string
    sql: ${TABLE}.booked_before_departure_no_show ;;
    group_label: "4. Before Departure No Show"
    hidden: yes
  }

  dimension: before_departure_checkout_no_show {
    type: string
    sql: ${TABLE}.checkout_before_departure_no_show ;;
    group_label: "4. Before Departure No Show"
    hidden: yes
  }

  dimension: before_departure_no_show_mismatch {
    type: yesno
    sql: COALESCE(${before_departure_booked_no_show}, '') != COALESCE(${before_departure_checkout_no_show}, '') ;;
    group_label: "4. Before Departure No Show"
    hidden: yes
  }

# ============================================= Cross Comparison =============================================

  dimension: booked_before_departure_vs_checkout_anytime_match {
    type: yesno
    sql: COALESCE(${before_departure_booked_refund}, '') = COALESCE(${anytime_checkout_refund}, '') ;;
    group_label: "5. Cross Comparison"
    hidden: yes
  }

  dimension: booked_before_departure_vs_checkout_anytime_mismatch {
    type: yesno
    sql: COALESCE(${before_departure_booked_refund}, '') != COALESCE(${anytime_checkout_refund}, '') ;;
    group_label: "5. Cross Comparison"
    hidden: yes
  }

  measure: booked_before_departure_vs_checkout_anytime_mismatch_count {
    type: count
    filters: [booked_before_departure_vs_checkout_anytime_mismatch: "yes"]
    hidden: yes
  }

  dimension: booked_anytime_vs_checkout_before_departure_match {
    type: yesno
    sql: COALESCE(${anytime_booked_refund}, '') = COALESCE(${before_departure_checkout_refund}, '') ;;
    group_label: "5. Cross Comparison"
    hidden: yes
  }

  dimension: booked_anytime_vs_checkout_before_departure_mismatch {
    type: yesno
    sql: COALESCE(${anytime_booked_refund}, '') != COALESCE(${before_departure_checkout_refund}, '') ;;
    group_label: "5. Cross Comparison"
    hidden: yes
  }

  measure: booked_anytime_vs_checkout_before_departure_mismatch_count {
    type: count
    filters: [booked_anytime_vs_checkout_before_departure_mismatch: "yes"]
    hidden: yes
  }


  # ===========================
  # MEASURES
  # ===========================


  measure: before_departure_no_show_mismatch_count {
    type: count
    filters: [before_departure_no_show_mismatch: "yes"]
    hidden: yes
  }

 measure: before_departure_mismatch_count {
    type: count
    filters: [before_departure_refund_mismatch: "yes"]
  hidden: yes
  }

  measure: anytime_no_show_mismatch_count {
    type: count
    filters: [anytime_no_show_mismatch: "yes"]
    hidden: yes
  }

  measure: anytime_mismatch_count {
    type: count
    filters: [anytime_refund_mismatch: "yes"]
    hidden: yes
  }

}
