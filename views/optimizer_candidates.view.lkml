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
    # group_label: "1. Time"
  }

  dimension: attempt_id {
    type: string
    sql:  ${TABLE}.attempt_id;;
    # group_label: "2. Tracking"
  }

  dimension: gds {
    type: string
    sql:  ${TABLE}.gds;;
    # group_label: "2. Tracking"
  }

  dimension: gds_account_id {
    type: string
    sql:  ${TABLE}.gds_account_id;;
    # group_label: "2. Tracking"
  }

  dimension: validating_carrier {
    type: string
    sql:  ${TABLE}.validating_carrier;;
    # group_label: "2. Tracking"
  }

  dimension: reprice_type {
    type: string
    sql:  ${TABLE}.reprice_type;;
    # group_label: "2. Tracking"
  }




}
