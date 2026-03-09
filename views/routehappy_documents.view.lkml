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
    group_label: "1. Request"
  }

  dimension: fare_basis {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.rq.segments[0].fbc')) ;;
    group_label: "1. Request"
  }

  dimension: brand {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].brand')) ;;
    group_label: "2. Inclusions"
  }

  dimension: seat {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.seat')) ;;
    group_label: "3. Amenities"
  }

  dimension: wifi {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.wifi')) ;;
    group_label: "3. Amenities"
  }

  dimension: power {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.power')) ;;
    group_label: "3. Amenities"
  }

  dimension: layout {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.layout')) ;;
    group_label: "3. Amenities"
  }

  dimension: aircraft {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.aircraft')) ;;
    group_label: "3. Amenities"
  }

  dimension: beverage {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.beverage')) ;;
    group_label: "3. Amenities"
  }

  dimension: fresh_food {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.fresh_food')) ;;
    group_label: "3. Amenities"
  }

  dimension: entertainment {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.entertainment')) ;;
    group_label: "3. Amenities"
  }

  dimension: checked_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].checked_bag[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: carry_on_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].carry_on_bag[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: lounge_access {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].lounge_access[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: seat_selection {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].seat_selection[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: same_day_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].same_day_change[0][0]')) ;;
    group_label: "4. Flexibility"
  }

  dimension: boarding_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].boarding_priority[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: check_in_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].check_in_priority[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: upgrade_eligibility {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].upgrade_eligibility[0][0]')) ;;
    group_label: "4. Flexibility"
  }

  dimension: cancellation {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].cancellation[0][0]')) ;;
    group_label: "4. Flexibility"
  }

  dimension: advance_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].advance_change[0][0]')) ;;
    group_label: "4. Flexibility"
  }

  dimension: amenity_summary {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].amenity_summary')) ;;
    group_label: "3. Amenities"
  }

  dimension: total_travel_time {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].total_travel_time')) ;;
    group_label: "3. Amenities"
  }

  dimension: messages {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.messages[0]')) ;;
    group_label: "5. Errors"
  }

  dimension: unmatched_fares {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.unmatched_fares[0]')) ;;
    group_label: "5. Errors"
  }


  # ===========================
  # MEASURES
  # ===========================

  measure: document_count {
    type: count_distinct
    sql: ${id} ;;
    label: "Document Count"
  }

}
