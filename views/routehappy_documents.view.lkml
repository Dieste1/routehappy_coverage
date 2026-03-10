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
    group_label: "2. Inclusions"
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
    group_label: "2. Inclusions"
  }

  dimension: cancellation {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].cancellation[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: advance_change {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].fares[0].advance_change[0][0]')) ;;
    group_label: "2. Inclusions"
  }

  dimension: amenity_summary {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].amenity_summary')) ;;
    group_label: "2. Inclusions"
  }

  dimension: total_travel_time {
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.data.legs[0].total_travel_time')) ;;
    group_label: "2. Inclusions"
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

  dimension: checked_bag_headline_payload {
    type: string
    sql: ${checked_bag_documents.checked_bag_headline} ;;
    label: "Checked Bag Headline"
    group_label: "4. Checked Bag Inclusions"
  }

  dimension: checked_bag_type_payload {
    type: string
    sql: ${checked_bag_documents.checked_bag_type} ;;
    label: "Checked Bag Type"
    group_label: "4. Checked Bag Inclusions"
  }

  dimension: checked_bag_included_bags_payload {
    type: number
    sql: ${checked_bag_documents.checked_bag_included_bags} ;;
    label: "Checked Bag Included Bags"
    group_label: "4. Checked Bag Inclusions"
  }

  dimension: has_checked_bag_payload_visible {
    type: yesno
    sql: ${checked_bag_documents.has_checked_bag_payload} ;;
    label: "Has Checked Bag Payload"
    group_label: "4. Checked Bag Inclusions"
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

  dimension: checked_bag_headline {
    hidden:  yes
    type: string
    sql: JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline')) ;;
  }

  dimension: checked_bag_type {
    hidden:  yes
    type: string
    sql:
    CASE
      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free up to%'
        OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'up to 0kg%'
        THEN 'checked bag not available'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'for a fee%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1st for%'
      THEN 'checked bag for a fee'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free up to%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1st free%'
      OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE 'up to%'
      THEN '1st checked bag included'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free%'
      THEN '2 checked bags included'

      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '3 free%'
      THEN '3 checked bags included'

      ELSE 'unknown'
      END ;;
  }

dimension: checked_bag_included_bags {
  hidden:  yes
  type: number
  sql:
    CASE
      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '3 free%' THEN 3
      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '2 free%' THEN 2
      WHEN LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1 free%'
        OR LOWER(JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.headline'))) LIKE '1st free%' THEN 1
      ELSE 0
    END ;;
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
    group_label: "5. Carry On Bag Description"
  }

  dimension: carry_on_bag_type {
    type: string
    sql: ${carry_on_bag_documents.carry_on_bag_type_raw} ;;
    label: "Carry On Bag Type"
    group_label: "5. Carry On Bag Description"
  }

  dimension: carry_on_bag_included_bags {
    type: number
    sql: ${carry_on_bag_documents.carry_on_bag_included_bags_raw} ;;
    label: "Carry On Bag Included Bags"
    group_label: "5. Carry On Bag Description"
  }

  dimension: has_carry_on_bag_payload {
    type: yesno
    sql: ${carry_on_bag_documents.has_carry_on_bag_payload_raw} ;;
    label: "Has Carry On Bag Payload"
    group_label: "5. Carry On Bag Description"
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

#  ======================================================  Cancellation Details ======================================================

  dimension: cancellation_anytime_headline {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_headline_raw} ;;
    label: "Cancellation Anytime Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_anytime_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_anytime_no_show_headline_raw} ;;
    label: "Cancellation Anytime No Show Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_before_departure_headline {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_headline_raw} ;;
    label: "Cancellation Before Departure Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_before_departure_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_before_departure_no_show_headline_raw} ;;
    label: "Cancellation Before Departure No Show Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_after_departure_headline {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_headline_raw} ;;
    label: "Cancellation After Departure Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_after_departure_no_show_headline {
    type: string
    sql: ${cancellation_documents.cancellation_after_departure_no_show_headline_raw} ;;
    label: "Cancellation After Departure No Show Headline"
    group_label: "7. Cancellation"
  }

  dimension: cancellation_type {
    type: string
    sql: ${cancellation_documents.cancellation_type_raw} ;;
    label: "Cancellation Type"
    group_label: "7. Cancellation"
  }

  dimension: has_cancellation_payload {
    type: yesno
    sql:
      ${cancellation_documents.cancellation_anytime_headline_raw} IS NOT NULL
      OR ${cancellation_documents.cancellation_anytime_no_show_headline_raw} IS NOT NULL
      OR ${cancellation_documents.cancellation_before_departure_headline_raw} IS NOT NULL
      OR ${cancellation_documents.cancellation_before_departure_no_show_headline_raw} IS NOT NULL
      OR ${cancellation_documents.cancellation_after_departure_headline_raw} IS NOT NULL
      OR ${cancellation_documents.cancellation_after_departure_no_show_headline_raw} IS NOT NULL ;;
    label: "Has Cancellation Payload"
    group_label: "7. Cancellation"
  }

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

  dimension: cancellation_type_raw {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN LOWER(COALESCE(
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
          JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline'))
        )) LIKE 'fully refundable%'
          OR LOWER(COALESCE(
            JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
            JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline'))
          )) LIKE 'refundable%'
          THEN 'Fully Refundable'

      WHEN LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'refundable for a fee%'
      OR LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.before_departure_no_show.headline'))
      )) LIKE 'refund for a fee%'
      THEN 'Refundable for a fee'

      WHEN LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline'))
      )) LIKE 'non-refundable%'
      OR LOWER(COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.after_departure_no_show.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime.headline')),
      JSON_UNQUOTE(JSON_EXTRACT(${TABLE}.data, '$.anytime_no_show.headline'))
      )) LIKE 'non refundable%'
      THEN 'Non Refundable'

      ELSE 'unknown'
      END ;;
  }

#  ======================================================  Advance Change Details ======================================================

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
    group_label: "5. Errors"
    sql:
    CASE
      WHEN ${messages} LIKE 'Fare for flight%' THEN 'Fare for flight is not matched'
      WHEN ${messages} LIKE 'Segment #% is not matched%' THEN 'Segment # is not matched'
      ELSE 'Successful'
    END ;;
  }

}
