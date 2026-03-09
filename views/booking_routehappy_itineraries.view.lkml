view: booking_routehappy_itineraries {
  sql_table_name: booking_routehappy_itineraries ;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension: primary_key{
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${booking_id}, '|', ${routehappy_document_id}, '|', ${context}) ;;
  }

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

  # ===========================
  # MEASURES
  # ===========================

 measure: itinerary_count {
    type: count
    label: "Itinerary Count"
  }

#  =========================== Checked Bag Measures ===========================
  measure: itineraries_with_checked_bag {
    type: count
    filters: [routehappy_documents.has_checked_bag: "yes"]
    label: "With Checked Bag"
    group_label: "Checked Bag"
  }
  measure: itineraries_without_checked_bag {
    type: count
    filters: [routehappy_documents.has_checked_bag: "no"]
    label: "Without Checked Bag"
    group_label: "Checked Bag"
  }
  measure: checked_bag_coverage_ratio {
    type: number
    sql: ${itineraries_with_checked_bag} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Checked Bag Coverage %"
    group_label: "Checked Bag"
  }

#  =========================== Carry On Bag Measures ===========================
  measure: itineraries_with_carry_on_bag {
    type: count
    filters: [routehappy_documents.has_carry_on_bag: "yes"]
    label: "With Carry On Bag"
    group_label: "Carry On Bag"
  }
  measure: itineraries_without_carry_on_bag {
    type: count
    filters: [routehappy_documents.has_checked_bag: "no"]
    label: "Without Carry On Bag"
    group_label: "Carry On Bag"
  }
  measure: carry_on_bag_coverage_ratio {
    type: number
    sql: ${itineraries_with_carry_on_bag} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Carry On Bag Coverage %"
    group_label: "Carry On Bag"
  }

#  =========================== Fare Basis Measures ===========================
  measure: itineraries_with_fare_basis {
    type: count
    filters: [routehappy_documents.has_fare_basis: "yes"]
    label: "With Fare Basis"
    group_label: "Fare Basis"
  }
  measure: itineraries_without_fare_basis {
    type: count
    filters: [routehappy_documents.has_fare_basis: "no"]
    label: "Without Fare Basis"
    group_label: "Fare Basis"
  }
  measure: fare_basis_coverage_ratio {
    type: number
    sql: ${itineraries_with_fare_basis} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Fare Basis Coverage %"
    group_label: "Fare Basis"
  }

#  =========================== Brand Measures ===========================
  measure: itineraries_with_brand {
    type: count
    filters: [routehappy_documents.has_brand: "yes"]
    label: "With Brand"
    group_label: "Brand"
  }
  measure: itineraries_without_brand {
    type: count
    filters: [routehappy_documents.has_brand: "no"]
    label: "Without Brand"
    group_label: "Brand"
  }
  measure: brand_coverage_ratio {
    type: number
    sql: ${itineraries_with_brand} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Brand Coverage %"
    group_label: "Brand"
  }

#  =========================== Error Message Measures ===========================
  measure: itineraries_with_error_message {
    type: count
    filters: [routehappy_documents.has_error_message: "yes"]
    label: "With Error Message"
    group_label: "Error Message"
  }
  measure: itineraries_without_error_message {
    type: count
    filters: [routehappy_documents.has_error_message: "no"]
    label: "Without Error Message"
    group_label: "Error Message"
  }
  measure: error_message_coverage_ratio {
    type: number
    sql: ${itineraries_with_error_message} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Error Message Coverage %"
    group_label: "Error Message"
  }

#  =========================== Unmatched Fares Measures ===========================
  measure: itineraries_with_unmatched_fares {
    type: count
    filters: [routehappy_documents.has_unmatched_fares: "yes"]
    label: "With Unmatched Fares"
    group_label: "Unmatched Fares"
  }
  measure: itineraries_without_unmatched_fares {
    type: count
    filters: [routehappy_documents.has_unmatched_fares: "no"]
    label: "Without Unmatched Fares"
    group_label: "Unmatched Fares"
  }
  measure: unmatched_fares_coverage_ratio {
    type: number
    sql: ${itineraries_with_unmatched_fares} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Unmatched Fares Coverage %"
    group_label: "Unmatched Fares"
  }

#  =========================== Advance Change Measures ===========================
  measure: itineraries_with_advance_change {
    type: count
    filters: [routehappy_documents.has_advance_change: "yes"]
    label: "With Advance Change"
    group_label: "Advance Change"
  }
  measure: itineraries_without_advance_change {
    type: count
    filters: [routehappy_documents.has_advance_change: "no"]
    label: "Without Advance Change"
    group_label: "Advance Change"
  }
  measure: advance_change_coverage_ratio {
    type: number
    sql: ${itineraries_with_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Advance Change Coverage %"
    group_label: "Advance Change"
  }

#  =========================== Cancellation Measures ===========================
  measure: itineraries_with_cancellation {
    type: count
    filters: [routehappy_documents.has_cancellation: "yes"]
    label: "With Cancellation"
    group_label: "Cancellation"
  }
  measure: itineraries_without_cancellation {
    type: count
    filters: [routehappy_documents.has_cancellation: "no"]
    label: "Without Cancellation"
    group_label: "Cancellation"
  }
  measure: cancellation_coverage_ratio {
    type: number
    sql: ${itineraries_with_cancellation} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Cancellation Coverage %"
    group_label: "Cancellation"
  }

#  =========================== Same Day Change Measures ===========================
  measure: itineraries_with_same_day_change {
    type: count
    filters: [routehappy_documents.has_same_day_change: "yes"]
    label: "With Same Day Change"
    group_label: "Same Day Change"
  }
  measure: itineraries_without_same_day_change {
    type: count
    filters: [routehappy_documents.has_same_day_change: "no"]
    label: "Without Same Day Change"
    group_label: "Same Day Change"
  }
  measure: same_day_change_coverage_ratio {
    type: number
    sql: ${itineraries_with_same_day_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Same Day Change Coverage %"
    group_label: "Same Day Change"
  }

}
