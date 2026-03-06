view: booking_routehappy_itineraries {
  sql_table_name: booking_routehappy_itineraries ;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension: booking_id {
    type: string
    sql:  ${TABLE}.booking_id;;
    hidden: yes
  }

  dimension: routehappy_document_id {
    type: string
    sql:  ${TABLE}.routehappy_document_id;;
    hidden: yes
  }

  dimension: context {
    type: string
    sql:  ${TABLE}.context;;
    group_label: "1. Context"
  }

}
