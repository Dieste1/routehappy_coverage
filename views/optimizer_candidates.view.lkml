view: optimizer_candidates {
  sql_table_name: optimizer_candidates  ;;


  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension: id {
    primary_key: yes
    type: string
    sql:  ${TABLE}.id;;
    hidden: yes
  }

  dimension_group: day {
    type:  time
    timeframes: [raw,hour,date,week,month,quarter,year]
    sql: ${TABLE}.created_at;;
    group_label: "1. Time"
  }

  dimension: attempt_id {
    type: string
    sql:  ${TABLE}.attempt_id;;
    hidden:  yes

  }

  dimension: gds {
    type: string
    sql:  ${TABLE}.gds;;
    group_label: "2. Tracking"
  }

  dimension: gds_account_id {
    type: string
    sql:  ${TABLE}.gds_account_id;;
    group_label: "2. Tracking"
  }

  dimension: validating_carrier {
    type: string
    sql:  ${TABLE}.validating_carrier;;
    group_label: "2. Tracking"
  }

  dimension: currency {
    type: string
    sql:  ${TABLE}.currency;;
    group_label: "2. Tracking"
  }

  dimension: fare_type {
    type: string
    sql:  ${TABLE}.fare_type;;
    group_label: "2. Tracking"
  }

  dimension: flight_numbers {
    type: string
    sql:  ${TABLE}.flight_numbers;;
    group_label: "2. Tracking"
  }

  dimension: booking_classes {
    type: string
    sql:  ${TABLE}.booking_classes;;
    group_label: "2. Tracking"
  }

  dimension: cabin_codes {
    type: string
    sql:  ${TABLE}.cabin_codes;;
    group_label: "2. Tracking"
  }

  dimension: fare_basis {
    type: string
    sql:  ${TABLE}.fare_bases;;
    group_label: "2. Tracking"
  }

  dimension: fare_families {
    type: string
    sql:  ${TABLE}.fare_families;;
    group_label: "2. Tracking"
  }

  dimension: reprice_type {
    type: string
    sql:  ${TABLE}.reprice_type;;
    group_label: "3. Optimizer"
  }

  dimension: candidacy {
    type: string
    sql:  ${TABLE}.candidacy;;
    group_label: "3. Optimizer"
  }

  dimension: revenue {
    type: number
    sql:  ${TABLE}.revenue;;
    group_label: "4. Fare Components"
  }

}
