view: optimizer_candidate_routehappy_itineraries {
  sql_table_name: optimizer_candidate_routehappy_itineraries ;;

  # ===========================
  # KEYS / FKs
  # ===========================

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attempt_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.attempt_id ;;
  }

  dimension: candidate_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: routehappy_document_id {
    type: number
    hidden: yes
    sql: ${TABLE}.routehappy_document_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  # ===========================
  # rq_overrides (JSON)
  # ===========================

  dimension: pcc {
    type: string
    label: "PCC"
    description: "rq_overrides.pcc - PCC used to fetch the RouteHappy document for this candidate."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.rq_overrides, '$.pcc')) ;;
  }

  dimension: rq_itinerary_id {
    type: string
    label: "RQ Itinerary ID"
    description: "rq_overrides.itinerary_id - RouteHappy itinerary identifier used in the request."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.rq_overrides, '$.itinerary_id')) ;;
    hidden: yes
  }

  # ===========================
  # comparison_report (JSON) - per-section decisions
  # ===========================

  dimension: cancellation_decision {
    type: string
    group_label: "Comparison Report"
    label: "Cancellation Decision"
    description: "comparison_report.cancellation.decision."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.comparison_report, '$.cancellation.decision')) ;;
  }

  dimension: advance_change_decision {
    type: string
    group_label: "Comparison Report"
    label: "Advance Change Decision"
    description: "comparison_report.advance_change.decision."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.comparison_report, '$.advance_change.decision')) ;;
  }

  dimension: checked_baggage_decision {
    type: string
    group_label: "Comparison Report"
    label: "Checked Baggage Decision"
    description: "comparison_report.checked_baggage.decision."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.comparison_report, '$.checked_baggage.decision')) ;;
  }

  dimension: carry_on_baggage_decision {
    type: string
    group_label: "Comparison Report"
    label: "Carry On Baggage Decision"
    description: "comparison_report.carry_on_baggage.decision."
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.comparison_report, '$.carry_on_baggage.decision')) ;;
  }

  # ===========================
  # MEASURES
  # ===========================

  measure: itinerary_count {
    type: count
    label: "Candidate Itinerary Count"
  }

  # =========================== Checked Bag Measures ===========================
  measure: itineraries_with_checked_bag {
    type: count
    filters: [candidate_routehappy_documents.has_checked_bag: "yes"]
    label: "With Checked Bag"
    group_label: "Checked Bag"
    hidden: yes
  }
  measure: itineraries_without_checked_bag {
    type: count
    filters: [candidate_routehappy_documents.has_checked_bag: "no"]
    label: "Without Checked Bag"
    group_label: "Checked Bag"
    hidden: yes
  }
  measure: checked_bag_coverage_ratio {
    type: number
    sql: ${itineraries_with_checked_bag} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Checked Bag Coverage %"
  }

  # =========================== Carry On Bag Measures ===========================
  measure: itineraries_with_carry_on_bag {
    type: count
    filters: [candidate_routehappy_documents.has_carry_on_bag: "yes"]
    label: "With Carry On Bag"
    group_label: "Carry On Bag"
    hidden: yes
  }
  measure: itineraries_without_carry_on_bag {
    type: count
    filters: [candidate_routehappy_documents.has_carry_on_bag: "no"]
    label: "Without Carry On Bag"
    group_label: "Carry On Bag"
    hidden: yes
  }
  measure: carry_on_bag_coverage_ratio {
    type: number
    sql: ${itineraries_with_carry_on_bag} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Carry On Bag Coverage %"
  }

  # =========================== Fare Basis Measures ===========================
  measure: itineraries_with_fare_basis {
    type: count
    filters: [candidate_routehappy_documents.has_fare_basis: "yes"]
    label: "With Fare Basis"
    group_label: "Fare Basis"
    hidden: yes
  }
  measure: itineraries_without_fare_basis {
    type: count
    filters: [candidate_routehappy_documents.has_fare_basis: "no"]
    label: "Without Fare Basis"
    group_label: "Fare Basis"
    hidden: yes
  }
  measure: fare_basis_coverage_ratio {
    type: number
    sql: ${itineraries_with_fare_basis} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Fare Basis Coverage %"
  }

  # =========================== Brand Measures ===========================
  measure: itineraries_with_brand {
    type: count
    filters: [candidate_routehappy_documents.has_brand: "yes"]
    label: "With Brand"
    group_label: "Brand"
    hidden: yes
  }
  measure: itineraries_without_brand {
    type: count
    filters: [candidate_routehappy_documents.has_brand: "no"]
    label: "Without Brand"
    group_label: "Brand"
    hidden: yes
  }
  measure: brand_coverage_ratio {
    type: number
    sql: ${itineraries_with_brand} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Brand Coverage %"
  }

  # =========================== Error Message Measures ===========================
  measure: itineraries_with_error_message {
    type: count
    filters: [candidate_routehappy_documents.has_error_message: "yes"]
    label: "With Error Message"
    group_label: "Error Message"
    hidden: yes
  }
  measure: itineraries_without_error_message {
    type: count
    filters: [candidate_routehappy_documents.has_error_message: "no"]
    label: "Without Error Message"
    group_label: "Error Message"
    hidden: yes
  }
  measure: error_message_coverage_ratio {
    type: number
    sql: ${itineraries_with_error_message} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Error Message Coverage %"
  }

  # =========================== Unmatched Fares Measures ===========================
  measure: itineraries_with_unmatched_fares {
    type: count
    filters: [candidate_routehappy_documents.has_unmatched_fares: "yes"]
    label: "With Unmatched Fares"
    group_label: "Unmatched Fares"
    hidden: yes
  }
  measure: itineraries_without_unmatched_fares {
    type: count
    filters: [candidate_routehappy_documents.has_unmatched_fares: "no"]
    label: "Without Unmatched Fares"
    group_label: "Unmatched Fares"
    hidden: yes
  }
  measure: unmatched_fares_coverage_ratio {
    type: number
    sql: ${itineraries_with_unmatched_fares} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Unmatched Fares Coverage %"
  }

  # =========================== Advance Change Measures ===========================
  measure: itineraries_with_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change: "yes"]
    label: "With Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change: "no"]
    label: "Without Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: advance_change_coverage_ratio {
    type: number
    sql: ${itineraries_with_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Advance Change Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_anytime_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_anytime_payload: "yes"]
    label: "With Anytime Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_anytime_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_anytime_payload: "no"]
    label: "Without Anytime Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: anytime_coverage_ratio {
    type: number
    sql: ${itineraries_with_anytime_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Anytime Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_anytime_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_anytime_no_show_payload: "yes"]
    label: "With Anytime No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_anytime_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_anytime_no_show_payload: "no"]
    label: "Without Anytime No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: anytime_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_anytime_no_show_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Anytime No Show Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_before_departure_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_before_departure_payload: "yes"]
    label: "With Before Departure Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_before_departure_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_before_departure_payload: "no"]
    label: "Without Before Departure Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: before_departure_coverage_ratio {
    type: number
    sql: ${itineraries_with_before_departure_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Before Departure Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_before_departure_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_before_departure_no_show_payload: "yes"]
    label: "With Before Departure No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_before_departure_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_before_departure_no_show_payload: "no"]
    label: "Without Before Departure No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: before_departure_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_before_departure_no_show_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Before Departure No Show Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_after_departure_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_after_departure_payload: "yes"]
    label: "With After Departure Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_after_departure_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_after_departure_payload: "no"]
    label: "Without After Departure Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: after_departure_coverage_ratio {
    type: number
    sql: ${itineraries_with_after_departure_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "After Departure Coverage %"
    group_label: "Advance Change"
  }

  measure: itineraries_with_after_departure_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_after_departure_no_show_payload: "yes"]
    label: "With After Departure No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: itineraries_without_after_departure_no_show_advance_change {
    type: count
    filters: [candidate_routehappy_documents.has_advance_change_after_departure_no_show_payload: "no"]
    label: "Without After Departure No Show Advance Change"
    group_label: "Advance Change"
    hidden: yes
  }
  measure: after_departure_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_after_departure_no_show_advance_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "After Departure No Show Coverage %"
    group_label: "Advance Change"
  }

  # =========================== Cancellation Measures ===========================
  measure: itineraries_with_cancellation {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation: "yes"]
    label: "With Cancellation"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_cancellation {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation: "no"]
    label: "Without Cancellation"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_coverage_ratio {
    type: number
    sql: ${itineraries_with_cancellation} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Cancellation Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_after_departure {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_after_departure_payload: "yes"]
    label: "With After Departure"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_after_departure {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_after_departure_payload: "no"]
    label: "Without After Departure"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_after_departure_coverage_ratio {
    type: number
    sql: ${itineraries_with_after_departure} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "After Departure Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_after_departure_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_no_show_payload: "yes"]
    label: "With After Departure No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_after_departure_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_no_show_payload: "no"]
    label: "Without After Departure No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_after_departure_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_after_departure_no_show} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "After Departure No Show Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_anytime {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_anytime_payload: "yes"]
    label: "With Anytime"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_anytime {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_anytime_payload: "no"]
    label: "Without Anytime"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_anytime_coverage_ratio {
    type: number
    sql: ${itineraries_with_anytime} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Anytime Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_anytime_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_anytime_no_show_payload: "yes"]
    label: "With Anytime No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_anytime_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_anytime_no_show_payload: "no"]
    label: "Without Anytime No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_anytime_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_anytime_no_show} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Anytime No Show Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_before_departure {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_payload: "yes"]
    label: "With Before Departure"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_before_departure {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_payload: "no"]
    label: "Without Before Departure"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_before_departure_coverage_ratio {
    type: number
    sql: ${itineraries_with_before_departure} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Before Departure Coverage %"
    group_label: "Cancellation"
  }

  measure: itineraries_with_before_departure_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_no_show_payload: "yes"]
    label: "With Before Departure No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: itineraries_without_before_departure_no_show {
    type: count
    filters: [candidate_routehappy_documents.has_cancellation_before_departure_no_show_payload: "no"]
    label: "Without Before Departure No Show"
    group_label: "Cancellation"
    hidden: yes
  }
  measure: cancellation_before_departure_no_show_coverage_ratio {
    type: number
    sql: ${itineraries_with_before_departure_no_show} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Before Departure No Show Coverage %"
    group_label: "Cancellation"
  }

  # =========================== Same Day Change Measures ===========================
  measure: itineraries_with_same_day_change {
    type: count
    filters: [candidate_routehappy_documents.has_same_day_change: "yes"]
    label: "With Same Day Change"
    group_label: "Same Day Change"
    hidden: yes
  }
  measure: itineraries_without_same_day_change {
    type: count
    filters: [candidate_routehappy_documents.has_same_day_change: "no"]
    label: "Without Same Day Change"
    group_label: "Same Day Change"
    hidden: yes
  }
  measure: same_day_change_coverage_ratio {
    type: number
    sql: ${itineraries_with_same_day_change} / NULLIF(${itinerary_count}, 0) ;;
    value_format_name: percent_2
    label: "Same Day Change Coverage %"
  }

  # =========================== Comparison Report Decision Counts ===========================
  measure: cancellation_errors {
    type: count
    filters: [cancellation_decision: "error"]
    label: "Cancellation Decision = error"
    group_label: "Comparison Report"
  }
  measure: advance_change_errors {
    type: count
    filters: [advance_change_decision: "error"]
    label: "Advance Change Decision = error"
    group_label: "Comparison Report"
  }
  measure: checked_baggage_errors {
    type: count
    filters: [checked_baggage_decision: "error"]
    label: "Checked Baggage Decision = error"
    group_label: "Comparison Report"
  }
  measure: carry_on_baggage_errors {
    type: count
    filters: [carry_on_baggage_decision: "error"]
    label: "Carry On Baggage Decision = error"
    group_label: "Comparison Report"
  }
}
