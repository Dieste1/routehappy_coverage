view: routehappy_documents {
  sql_table_name: routehappy_documents ;;

  # ===========================
  # DIMENSION GROUPS / KEYS
  # ===========================

  dimension: id {
    primary_key: yes
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

  dimension: rbd {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.rq.segments[0].rbd')) ;;
    group_label: "1. Request"
  }

  dimension: brand {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].brand')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: seat {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.seat')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: wifi {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.wifi')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: power {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.power')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: layout {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.layout')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: aircraft {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.aircraft')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: beverage {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.beverage')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: fresh_food {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.fresh_food')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: entertainment {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].amenity.entertainment')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: checked_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].checked_bag[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: carry_on_bag {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].carry_on_bag[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: lounge_access {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].lounge_access[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: seat_selection {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].seat_selection[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: same_day_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].same_day_change[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: boarding_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].boarding_priority[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: check_in_priority {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].check_in_priority[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: upgrade_eligibility {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].segments[0].upgrade_eligibility[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: cancellation {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].cancellation[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: advance_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].advance_change[0][0]')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: amenity_summary {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].amenity_summary')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: total_travel_time {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].total_travel_time')) ;;
    group_label: "2. Inclusion Ids"
  }

  dimension: messages {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.messages[0]')) ;;
    label: "Error messages"
    group_label: "3. Errors"
  }

  dimension: unmatched_fares {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.errors.unmatched_fares[0]')) ;;
    group_label: "3. Errors"
  }

#  ======================================================  Checked Bag Details ======================================================

  dimension: checked_bag_headline {
    type: string
    sql: ${checked_bag_documents.checked_bag_headline_raw} ;;
    label: "Checked Bag Headline"
    group_label: "4. Checked Bag"
  }

  dimension: has_checked_bag_payload_visible {
    type: yesno
    sql: ${checked_bag_documents.has_checked_bag_payload} ;;
    label: "Has Checked Bag Payload"
    group_label: "4. Checked Bag"
  }

  dimension: checked_bag_assessment {
    type: string
    sql: ${checked_bag_documents.checked_bag_assessment_raw} ;;
    label: "Checked Bag Assessment"
    group_label: "4. Checked Bag"
  }

  dimension: checked_free_bag_pieces {
    type: string
    sql: ${checked_bag_documents.checked_free_bag_pieces_raw} ;;
    label: "Checked Free Bag Pieces"
    group_label: "4. Checked Bag"
  }

  dimension: checked_bag_description {
    type: string
    sql: ${checked_bag_documents.checked_bag_description_raw} ;;
    label: "Checked Bag Description"
    group_label: "4. Checked Bag"
  }

  dimension: checked_bag_headline_type {
    type: string
    label: "Checked Bag Headline Type"
    group_label: "4. Checked Bag"
    sql:
    CASE
      WHEN ${checked_bag_headline} LIKE '4 Free'                   THEN '4 Free'
      WHEN ${checked_bag_headline} LIKE '3 Free'                   THEN '3 Free'
      WHEN ${checked_bag_headline} LIKE '2 Free'                   THEN '2 Free'
      WHEN ${checked_bag_headline} LIKE '2 free up to %kg%'        THEN '2 free up to ##kg'
      WHEN ${checked_bag_headline} LIKE '1 free up to %kg% total'  THEN '1 free up to ##kg total'
      WHEN ${checked_bag_headline} LIKE '1 free up to %lb% total'  THEN '1 free up to ##lb total'
      WHEN ${checked_bag_headline} LIKE '1st for % - 2nd for %'    THEN '1st for ## - 2nd for ##'
      WHEN ${checked_bag_headline} LIKE '1st free'                 THEN '1st free'
      WHEN ${checked_bag_headline} LIKE '1st free & 2nd for %'     THEN '1st free & 2nd for ##'
      WHEN ${checked_bag_headline} LIKE 'For a fee'                THEN 'For a fee'
      WHEN ${checked_bag_headline} LIKE 'Up to %kg total'          THEN 'Up to ##kg total'
      WHEN ${checked_bag_headline} LIKE 'Up to %lb total'          THEN 'Up to ##lb total'
      ELSE 'OTHER'
      END ;;
  }

  dimension: raw_data {
    hidden: yes
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: schema_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.schema_name ;;
    label: "Schema Name"
    group_label: "0. Debug"
  }

  dimension: checked_bag_headline_raw {
    hidden:  yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) ;;
  }

  dimension: checked_bag_assessment_raw {
    hidden:  yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.assessment')) ;;
  }

  dimension: checked_free_bag_pieces_raw {
    hidden:  yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.free_bags.pieces')) ;;
  }

  dimension: checked_bag_description_raw {
    hidden:  yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.description')) ;;
  }

  dimension: has_checked_bag_payload {
    hidden:  yes
    type: yesno
    sql:
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) IS NOT NULL
      AND JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) != '' ;;
  }
#  ======================================================  Carry On Bag Details ======================================================

  dimension: carry_on_bag_headline {
    type: string
    sql: ${carry_on_bag_documents.carry_on_bag_headline_raw} ;;
    label: "Carry On Bag Headline"
    group_label: "5. Carry On Bag"
  }

  dimension: carry_on_bag_type {
    type: string
    sql: ${carry_on_bag_documents.carry_on_bag_type_raw} ;;
    label: "Carry On Bag Type"
    group_label: "5. Carry On Bag"
  }

  dimension: carry_on_bag_included_bags {
    type: number
    sql: ${carry_on_bag_documents.carry_on_bag_included_bags_raw} ;;
    label: "Carry On Bag Included Bags"
    group_label: "5. Carry On Bag"
  }

  dimension: has_carry_on_bag_payload {
    type: yesno
    sql: ${carry_on_bag_documents.has_carry_on_bag_payload_raw} ;;
    label: "Has Carry On Bag Payload"
    group_label: "5. Carry On Bag"
  }

  dimension: carry_on_bag_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) ;;
  }

  dimension: carry_on_bag_type_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 personal item%'
          OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free up to 0kg%'
          OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'free up to 0kg%'
          THEN 'carry-on not allowed'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'for a fee%'
      THEN 'carry-on bag for a fee'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free up to%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1st free & personal item%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free & personal item%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'free up to%'
      THEN 'carry-on bag included'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free & personal item%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free up to%'
      THEN '2 carry-on bags included'

      ELSE 'unknown'
      END ;;
  }

  dimension: carry_on_bag_included_bags_raw {
    hidden: yes
    type: number
    sql:
      CASE
        WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free & personal item%'
          OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free up to%'
          THEN 2

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free up to%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1st free & personal item%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free & personal item%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'free up to%'
      THEN 1

      ELSE 0
      END ;;
  }

  dimension: has_carry_on_bag_payload_raw {
    hidden: yes
    type: yesno
    sql:
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) IS NOT NULL
      AND JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) != '' ;;
  }

#  ======================================================  Brand Details ======================================================

  dimension: brand_payload_name {
    type: string
    sql: ${brand_documents.brand_name_raw} ;;
    label: "Brand Name"
    group_label: "6. Brand"
  }

  dimension: brand_payload_code {
    type: string
    sql: ${brand_documents.brand_codes_raw} ;;
    label: "Brand Code"
    group_label: "6. Brand"
  }

  dimension: brand_name_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.brand_name')) ;;
  }

  dimension: brand_codes_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.brand_codes[0]')) ;;
  }

#  ==================================================== Cancellation Refund Method Details ====================================================

  dimension: cancellation_anytime_refund_method {
    type: string
    sql:${cancellation_documents.cancellation_anytime_refund_method_raw};;
    label: "Refund Method"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_refund_method {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_no_show_refund_method_raw} ;;
    label: "Refund Method"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_refund_method {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_refund_method_raw} ;;
    label: "Refund Method"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_refund_method {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_no_show_refund_method_raw} ;;
    label: "Refund Method"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_refund_method {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_refund_method_raw} ;;
    label: "Refund Method"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_refund_method {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_no_show_refund_method_raw} ;;
    label: "Refund Method"
    group_label: "7.6 Cancellation After Departure No Show"
  }

# ===================================== Cancellation Refund Method Raw  =====================================

  dimension: cancellation_anytime_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.refund_method')) ;;
  }

  dimension: cancellation_anytime_no_show_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.refund_method')) ;;
  }

  dimension: cancellation_before_departure_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.refund_method')) ;;
  }

  dimension: cancellation_before_departure_no_show_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.refund_method')) ;;
  }

  dimension: cancellation_after_departure_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.refund_method')) ;;
  }

  dimension: cancellation_after_departure_no_show_refund_method_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.refund_method')) ;;
  }

# ===================================== Cancellation Description Details =====================================

  dimension: cancellation_anytime_description {
    type: string
    sql:${cancellation_documents.cancellation_anytime_description_raw};;
    label: "Refund Description"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_description {
    type: string
    sql:${cancellation_documents.cancellation_anytime_no_show_description_raw};;
    label: "Refund Description"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_description {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_description_raw};;
    label: "Refund Description"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_description {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_no_show_description_raw};;
    label: "Refund Description"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_description {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_description_raw};;
    label: "Refund Description"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_description {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_no_show_description_raw};;
    label: "Refund Description"
    group_label: "7.6 Cancellation After Departure No Show"
  }
# ===================================== Cancellation Description Raw =====================================

  dimension: cancellation_anytime_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.description')) ;;
  }

  dimension: cancellation_anytime_no_show_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.description')) ;;
  }

  dimension: cancellation_before_departure_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.description')) ;;
  }

  dimension: cancellation_before_departure_no_show_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.description')) ;;
  }
  dimension: cancellation_after_departure_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.description')) ;;
  }

  dimension: cancellation_after_departure_no_show_description_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.description')) ;;
  }

# ===================================== Cancellation Assessment Details =====================================

  dimension: cancellation_anytime_assessment {
    type: string
    sql:${cancellation_documents.cancellation_anytime_assessment_raw};;
    label: "Assessment"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_assessment {
    type: string
    sql:${cancellation_documents.cancellation_anytime_no_show_assessment_raw};;
    label: "Assessment"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_assessment {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_assessment_raw};;
    label: "Assessment"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_assessment {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_no_show_assessment_raw};;
    label: "Assessment"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_assessment {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_assessment_raw};;
    label: "Assessment"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_assessment {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_no_show_assessment_raw};;
    label: "Assessment"
    group_label: "7.6 Cancellation After Departure No Show"
  }
# ===================================== Cancellation Assessment Details Raw =====================================

  dimension: cancellation_anytime_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.assessment')) ;;
  }

  dimension: cancellation_anytime_no_show_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.assessment')) ;;
  }

  dimension: cancellation_before_departure_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.assessment')) ;;
  }

   dimension: cancellation_before_departure_no_show_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.assessment')) ;;
  }

  dimension: cancellation_after_departure_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.assessment')) ;;
  }

  dimension: cancellation_after_departure_no_show_assessment_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.assessment')) ;;
  }

# ===================================== Cancellation Higher Lower Details =====================================

  dimension: cancellation_anytime_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_anytime_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_anytime_no_show_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_before_departure_no_show_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_higher_lower {
    type: string
    sql:${cancellation_documents.cancellation_after_departure_no_show_higher_lower_raw};;
    label: "Higher Lower"
    group_label: "7.6 Cancellation After Departure No Show"
  }

# ===================================== Cancellation Higher Lower Details Raw =====================================

  dimension: cancellation_anytime_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.fee.higher_lower')) ;;
  }

  dimension: cancellation_anytime_no_show_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.fee.higher_lower')) ;;
  }

  dimension: cancellation_before_departure_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.fee.higher_lower')) ;;
  }

  dimension: cancellation_before_departure_no_show_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.fee.higher_lower')) ;;
  }

  dimension: cancellation_after_departure_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.fee.higher_lower')) ;;
  }

  dimension: cancellation_after_departure_no_show_higher_lower_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.fee.higher_lower')) ;;
  }

# ===================================== Cancellation Percentage Details =====================================

  dimension: cancellation_anytime_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_anytime_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_anytime_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_anytime_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_anytime_no_show_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_anytime_no_show_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_anytime_no_show_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_before_departure_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_before_departure_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_before_departure_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_before_departure_no_show_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_before_departure_no_show_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_before_departure_no_show_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_after_departure_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_after_departure_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_after_departure_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_fee_percentage {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_after_departure_no_show_fee_percentage_raw} = 0
        OR ${cancellation_documents.cancellation_after_departure_no_show_fee_percentage_raw} IS NULL
      THEN NULL
      ELSE CONCAT(FORMAT(${cancellation_documents.cancellation_after_departure_no_show_fee_percentage_raw}, 2), '%')
    END ;;
    label: "Fee Percentage"
    group_label: "7.6 Cancellation After Departure No Show"
  }

# ===================================== Cancellation Percentage Details Raw =====================================

  dimension: cancellation_anytime_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.fee.percentage')) ;;
  }

  dimension: cancellation_anytime_no_show_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.fee.percentage')) ;;
  }

  dimension: cancellation_before_departure_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.fee.percentage')) ;;
  }

  dimension: cancellation_before_departure_no_show_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.fee.percentage')) ;;
  }

  dimension: cancellation_after_departure_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.fee.percentage')) ;;
  }

  dimension: cancellation_after_departure_no_show_fee_percentage_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.fee.percentage')) ;;
  }

# ===================================== Cancellation Fee Amount Details =====================================

  dimension: cancellation_anytime_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_anytime_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_anytime_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_anytime_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_anytime_no_show_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_anytime_no_show_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_anytime_no_show_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_before_departure_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_before_departure_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_before_departure_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_before_departure_no_show_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_before_departure_no_show_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_before_departure_no_show_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_after_departure_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_after_departure_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_after_departure_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_fee_amount {
    type: string
    sql:
    CASE
      WHEN ${cancellation_documents.cancellation_after_departure_no_show_fee_amount_raw} = 0
        OR ${cancellation_documents.cancellation_after_departure_no_show_fee_amount_raw} IS NULL
      THEN NULL
      ELSE CONCAT('$', FORMAT(${cancellation_documents.cancellation_after_departure_no_show_fee_amount_raw}, 2))
    END ;;
    label: "Fee Amount"
    group_label: "7.6 Cancellation After Departure No Show"
  }
# ===================================== Cancellation Fee Amount Details Raw =====================================

  dimension: cancellation_anytime_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.fee.amount')) ;;
  }

  dimension: cancellation_anytime_no_show_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.fee.amount')) ;;
  }

  dimension: cancellation_before_departure_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.fee.amount')) ;;
  }

  dimension: cancellation_before_departure_no_show_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.fee.amount')) ;;
  }

  dimension: cancellation_after_departure_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.fee.amount')) ;;
  }

  dimension: cancellation_after_departure_no_show_fee_amount_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.fee.amount')) ;;
  }

# ===================================== Cancellation Description Template Details =====================================

  dimension: cancellation_anytime_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_no_show_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_no_show_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_description_template {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_no_show_description_template_raw} ;;
    label: "Refund Description Grouped"
    group_label: "7.6 Cancellation After Departure No Show"
  }

# ===================================== Cancellation Description Template Raw =====================================

  dimension: cancellation_anytime_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_anytime_description_raw} IS NULL OR ${cancellation_anytime_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_anytime_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_anytime_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_anytime_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

  dimension: cancellation_anytime_no_show_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_anytime_no_show_description_raw} IS NULL OR ${cancellation_anytime_no_show_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_anytime_no_show_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

  dimension: cancellation_before_departure_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_before_departure_description_raw} IS NULL OR ${cancellation_before_departure_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_before_departure_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_before_departure_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_before_departure_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

  dimension: cancellation_before_departure_no_show_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_before_departure_no_show_description_raw} IS NULL OR ${cancellation_before_departure_no_show_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_before_departure_no_show_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

  dimension: cancellation_after_departure_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_after_departure_description_raw} IS NULL OR ${cancellation_after_departure_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_after_departure_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_after_departure_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_after_departure_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

  dimension: cancellation_after_departure_no_show_description_template_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${cancellation_after_departure_no_show_description_raw} IS NULL OR ${cancellation_after_departure_no_show_description_raw} = '' THEN NULL

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) = 'fully refundable ticket'
      THEN 'Fully refundable ticket'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) = 'non-refundable'
      THEN 'Non-refundable'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'ticket refund for usd%'
      THEN 'Ticket refund for USD###'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'ticket refund for cad%'
      THEN 'Ticket refund for CAD###'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'ticket refund for eur%'
      THEN 'Ticket refund for EUR###'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'ticket refund for gbp%'
      THEN 'Ticket refund for GBP###'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'refund fee is cad% whichever is higher'
      THEN 'Refund fee is CAD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'refund fee is cad% whichever is lower'
      THEN 'Refund fee is CAD### or ###% whichever is lower'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'refund fee is usd% whichever is higher'
      THEN 'Refund fee is USD### or ###% whichever is higher'

      WHEN LOWER(${cancellation_after_departure_no_show_description_raw}) LIKE 'refund fee is %'
      THEN 'Refund fee is ###%'

      ELSE 'unknown'
      END ;;
  }

# ===================================== Cancellation Headline Details =====================================

  dimension: cancellation_anytime_headline {
    type: string
    sql:${cancellation_documents.cancellation_anytime_headline_raw} ;;
    label: "Headline"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: cancellation_anytime_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_no_show_headline_raw} ;;
    label: "Headline"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: cancellation_before_departure_headline {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_headline_raw} ;;
    label: "Headline"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: cancellation_before_departure_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_no_show_headline_raw} ;;
    label: "Headline"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: cancellation_after_departure_headline {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_headline_raw} ;;
    label: "Headline"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: cancellation_after_departure_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_no_show_headline_raw} ;;
    label: "Headline"
    group_label: "7.6 Cancellation After Departure No Show"
  }

# ===================================== Cancellation Headlines Raw =====================================

  dimension: cancellation_anytime_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')) ;;
  }

  dimension: cancellation_anytime_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline')) ;;
  }

  dimension: cancellation_before_departure_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')) ;;
  }

  dimension: cancellation_before_departure_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline')) ;;
  }

  dimension: cancellation_after_departure_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.headline')) ;;
  }

  dimension: cancellation_after_departure_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.headline')) ;;
  }

# ===================================== Has Cancellation Payload Details =====================================

  dimension: has_cancellation_anytime_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_anytime_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation Anytime Payload"
    group_label: "7.1 Cancellation Anytime"
  }

  dimension: has_cancellation_anytime_no_show_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_anytime_no_show_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation Anytime No Show Payload"
    group_label: "7.2 Cancellation Anytime No Show"
  }

  dimension: has_cancellation_before_departure_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_before_departure_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation Before Departure Payload"
    group_label: "7.3 Cancellation Before Departure"
  }

  dimension: has_cancellation_before_departure_no_show_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_before_departure_no_show_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation Before Departure No Show Payload"
    group_label: "7.4 Cancellation Before Departure No Show"
  }

  dimension: has_cancellation_after_departure_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_after_departure_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation After Departure Payload"
    group_label: "7.5 Cancellation After Departure"
  }

  dimension: has_cancellation_after_departure_no_show_payload {
    type: yesno
    sql: ${cancellation_documents.cancellation_after_departure_no_show_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation After Departure No Show Payload"
    group_label: "7.6 Cancellation After Departure No Show"
  }

#  ====================================================== Advance Change Details ======================================================

  dimension: advance_change_anytime_headline {
    type: string
    sql: ${advance_change_documents.advance_change_anytime_headline_raw} ;;
    label: "Advance Change Anytime Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_anytime_no_show_headline {
    type: string
    sql: ${advance_change_documents.advance_change_anytime_no_show_headline_raw} ;;
    label: "Advance Change Anytime No Show Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_before_departure_headline {
    type: string
    sql: ${advance_change_documents.advance_change_before_departure_headline_raw} ;;
    label: "Advance Change Before Departure Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_before_departure_no_show_headline {
    type: string
    sql: ${advance_change_documents.advance_change_before_departure_no_show_headline_raw} ;;
    label: "Advance Change Before Departure No Show Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_after_departure_headline {
    type: string
    sql: ${advance_change_documents.advance_change_after_departure_headline_raw} ;;
    label: "Advance Change After Departure Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_after_departure_no_show_headline {
    type: string
    sql: ${advance_change_documents.advance_change_after_departure_no_show_headline_raw} ;;
    label: "Advance Change After Departure No Show Headline"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_type {
    type: string
    sql: ${advance_change_documents.advance_change_type_raw} ;;
    label: "Advance Change Type"
    group_label: "8. Advance Change"
  }

  dimension: has_advance_change_payload {
    type: yesno
    sql:
      ${advance_change_documents.advance_change_anytime_headline_raw} IS NOT NULL
      OR ${advance_change_documents.advance_change_anytime_no_show_headline_raw} IS NOT NULL
      OR ${advance_change_documents.advance_change_before_departure_headline_raw} IS NOT NULL
      OR ${advance_change_documents.advance_change_before_departure_no_show_headline_raw} IS NOT NULL
      OR ${advance_change_documents.advance_change_after_departure_headline_raw} IS NOT NULL
      OR ${advance_change_documents.advance_change_after_departure_no_show_headline_raw} IS NOT NULL ;;
    label: "Has Advance Change Payload"
    group_label: "8. Advance Change"
  }

  dimension: advance_change_anytime_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')) ;;
  }

  dimension: advance_change_anytime_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline')) ;;
  }

  dimension: advance_change_before_departure_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')) ;;
  }

  dimension: advance_change_before_departure_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline')) ;;
  }

  dimension: advance_change_after_departure_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.headline')) ;;
  }

  dimension: advance_change_after_departure_no_show_headline_raw {
    hidden: yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.headline')) ;;
  }

  dimension: advance_change_type_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN LOWER(COALESCE(
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline')),
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.headline')),
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.headline'))
        )) LIKE 'not allowed%'
          THEN 'not allowed'

      WHEN LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'for a fee%'
      OR LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'changeable for a fee%'
      THEN 'for a fee'

      WHEN LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'free%'
      OR LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'for free%'
      THEN 'free'

      ELSE 'unknown'
      END ;;
  }


  # ===========================
  # MEASURES
  # ===========================

  measure: document_count {
    type: count
    label: "Document Count"
  }

  dimension: has_brand {
    type: yesno
    sql: ${brand} IS NOT NULL AND ${brand} != '' ;;
    label: "Has Brand"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_checked_bag {
    type: yesno
    sql: ${checked_bag} IS NOT NULL AND ${checked_bag} != '' ;;
    label: "Has Checked Bag"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_carry_on_bag {
    type: yesno
    sql: ${carry_on_bag} IS NOT NULL AND ${carry_on_bag} != '' ;;
    label: "Has Carry On Bag"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_fare_basis {
    type: yesno
    sql: ${fare_basis} IS NOT NULL AND ${fare_basis} != '' ;;
    label: "Has Fare Basis"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_error_message {
    type: yesno
    sql: ${messages} IS NOT NULL AND ${messages} != '' ;;
    label: "Has Error Message"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_unmatched_fares {
    type: yesno
    sql: ${unmatched_fares} IS NOT NULL AND ${unmatched_fares} != '' ;;
    label: "Has Unmatched Fares"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_advance_change {
    type: yesno
    sql: ${advance_change} IS NOT NULL AND ${advance_change} != '' ;;
    label: "Has Advance Change"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_cancellation {
    type: yesno
    sql: ${cancellation} IS NOT NULL AND ${cancellation} != '' ;;
    label: "Has Cancellation"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: has_same_day_change {
    type: yesno
    sql: ${same_day_change} IS NOT NULL AND ${same_day_change} != '' ;;
    label: "Has Same Day Change"
    group_label: "9. Yes/No Inclusions"
  }

  dimension: error_type {
    type: string
    label: "Error Type"
    group_label: "3. Errors"
    sql:
    CASE
      WHEN ${messages} LIKE 'Fare for flight%' THEN 'Fare for flight is not matched'
      WHEN ${messages} LIKE 'Segment #% is not matched%' THEN 'Segment # is not matched'
      ELSE 'Successful'
    END ;;
  }

}
