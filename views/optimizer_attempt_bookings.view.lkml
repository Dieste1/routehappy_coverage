view: optimizer_attempt_bookings {
  sql_table_name: optimizer_attempt_bookings;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================


  dimension: id {
    primary_key: yes
    type: string
    sql:  ${TABLE}.id;;
    hidden: yes
  }

  dimension: attempt_id {
    type: string
    sql:  ${TABLE}.attempt_id;;
    hidden: yes
    # group_label: "2. Tracking"
  }

  dimension: candidate_id {
    type: string
    sql:  ${TABLE}.candidate_id;;
    hidden: yes
    # group_label: "2. Tracking"
  }

  dimension: booking_id    {
    type: string
    sql: ${TABLE}.booking_id ;;
    link: {
      label: "Booking Id"
      url: "https://reservations.voyagesalacarte.ca/booking/index/{{ value}}"
    }
  }

  # ===========================
  # MEASURES
  # ===========================

  # Volume
  measure: count {
    type: count
    value_format_name: decimal_0
    label: "Booking Count"
  }


}
