view: routehappy_documents {
  sql_table_name: routehappy_documents ;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================


  dimension: id {
    type: string
    sql:  ${TABLE}.id;;
    hidden: yes
  }

  dimension: currency {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.rq.currency')) ;;
  }

  dimension: fare_basis {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.rq.segments[0].fbc')) ;;
  }

  dimension: brand {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].brand')) ;;
  }

  dimension: seat {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.seat')) ;;
  }

  dimension: wifi {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.wifi')) ;;
  }

  dimension: power {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.power')) ;;
  }

  dimension: layout {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.layout')) ;;
  }

  dimension: aircraft {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.aircraft')) ;;
  }

  dimension: beverage {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.beverage')) ;;
  }

  dimension: fresh_food {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.fresh_food')) ;;
  }

  dimension: entertainment {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.entertainment')) ;;
  }

  dimension: checked_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].checked_bag[0][0]')) ;;
  }

  dimension: carry_on_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].carry_on_bag[0][0]')) ;;
  }

  dimension: lounge_access {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].lounge_access[0][0]')) ;;
  }

  dimension: seat_selection {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].seat_selection[0][0]')) ;;
  }

  dimension: same_day_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].same_day_change[0][0]')) ;;
  }

  dimension: boarding_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].boarding_priority[0][0]')) ;;
  }

  dimension: check_in_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].check_in_priority[0][0]')) ;;
  }

  dimension: upgrade_eligibility {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].upgrade_eligibility[0][0]')) ;;
  }

  dimension: cancellation {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].cancellation[0][0]')) ;;
  }

  dimension: advance_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].advance_change[0][0]')) ;;
  }

  dimension: amenity_summary {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].amenity_summary')) ;;
  }

  dimension: total_travel_time {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].total_travel_time')) ;;
  }

  dimension: messages {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.messages[0]')) ;;
  }

  dimension: unmatched_fares {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.unmatched_fares[0]')) ;;
  }










}
