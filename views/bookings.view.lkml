view: bookings {
  sql_table_name: bookings ;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension_group: dayd {
    type:  time
    timeframes: [raw,hour,date,week,month,quarter,year]
    sql: ${TABLE}.booking_date;;
    group_label: "1. Time"
  }

  dimension: gds {
    type: string
    sql:  ${TABLE}.gds;;
    group_label: "2. Content"
  }

  dimension: gds_account_id {
    type: string
    sql:  ${TABLE}.gds_account_id;;
    group_label: "2. Content"
  }

  dimension: validating_carrier {
    type: string
    sql:  ${TABLE}.validating_carrier;;
    group_label: "2. Content"
  }

  dimension: id {
    type: string
    label: "booking_id"
    sql:  ${TABLE}.id;;
    group_label: "2. Tracking"
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
