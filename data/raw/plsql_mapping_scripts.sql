BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id AS member_id,
    first_name_id AS first_name,
    mem_last_name AS last_name,
    date_of_birth AS date_of_birth,
    phm_gender_val AS gender,
    clm_address AS address,
    city AS city,
    rx_state_val AS state,
    phm_zip_code_val AS zip_code,
    mem_plan_id AS plan_id,
    clm_group_number AS group_number,
    clm_coverage_start_date AS coverage_start_date,
    phm_coverage_end_date AS coverage_end_date,
    mem_coverage_level_code AS coverage_level_code,
    clm_subscriber_indicator AS subscriber_indicator,
    rx_product_category_code_val AS product_category_code,
    rx_plan_type AS plan_type,
    rx_market_category_code_val AS market_category_code
FROM eligibility_uhc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    rx_member_id_val AS member_id,
    first_name_id AS first_name,
    last_name AS last_name,
    clm_date_of_birth AS date_of_birth,
    gender_val AS gender,
    rx_address AS address,
    clm_city_id AS city,
    mem_state_val AS state,
    zip_code_val AS zip_code,
    plan_id_val AS plan_id,
    rx_group_number_val AS group_number,
    coverage_start_date_val AS coverage_start_date,
    mem_coverage_end_date_val AS coverage_end_date,
    phm_coverage_level_code_val AS coverage_level_code,
    rx_subscriber_indicator_val AS subscriber_indicator,
    mem_product_category_code_val AS product_category_code,
    rx_plan_type AS plan_type,
    clm_market_category_code_val AS market_category_code
FROM eligibility_antm;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    member_id_val AS member_id,
    clm_first_name AS first_name,
    clm_last_name AS last_name,
    phm_date_of_birth_val AS date_of_birth,
    phm_gender_id AS gender,
    phm_address_val AS address,
    clm_city_id AS city,
    mem_state_id AS state,
    zip_code_id AS zip_code,
    rx_plan_id_id AS plan_id,
    phm_group_number_val AS group_number,
    phm_coverage_start_date AS coverage_start_date,
    mem_coverage_end_date_id AS coverage_end_date,
    coverage_level_code AS coverage_level_code,
    clm_subscriber_indicator_id AS subscriber_indicator,
    rx_product_category_code AS product_category_code,
    clm_plan_type AS plan_type,
    clm_market_category_code_val AS market_category_code
FROM eligibility_aet;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    clm_member_id_val AS member_id,
    phm_first_name_val AS first_name,
    rx_last_name_id AS last_name,
    date_of_birth AS date_of_birth,
    clm_gender AS gender,
    mem_address_val AS address,
    mem_city_val AS city,
    clm_state AS state,
    mem_zip_code AS zip_code,
    mem_plan_id AS plan_id,
    phm_group_number_id AS group_number,
    clm_coverage_start_date AS coverage_start_date,
    phm_coverage_end_date AS coverage_end_date,
    rx_coverage_level_code AS coverage_level_code,
    rx_subscriber_indicator_val AS subscriber_indicator,
    clm_product_category_code_id AS product_category_code,
    clm_plan_type_id AS plan_type,
    rx_market_category_code_id AS market_category_code
FROM eligibility_ci;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    phm_member_id AS member_id,
    mem_first_name_val AS first_name,
    clm_last_name_val AS last_name,
    clm_date_of_birth_val AS date_of_birth,
    gender_id AS gender,
    mem_address_id AS address,
    mem_city AS city,
    state_val AS state,
    mem_zip_code_id AS zip_code,
    phm_plan_id_val AS plan_id,
    group_number_val AS group_number,
    rx_coverage_start_date_id AS coverage_start_date,
    clm_coverage_end_date AS coverage_end_date,
    rx_coverage_level_code_val AS coverage_level_code,
    mem_subscriber_indicator_val AS subscriber_indicator,
    product_category_code AS product_category_code,
    rx_plan_type_id AS plan_type,
    clm_market_category_code_val AS market_category_code
FROM eligibility_hum;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    rx_member_id_id AS member_id,
    rx_first_name_val AS first_name,
    rx_last_name AS last_name,
    mem_date_of_birth AS date_of_birth,
    clm_gender_val AS gender,
    mem_address AS address,
    mem_city_id AS city,
    phm_state AS state,
    zip_code_id AS zip_code,
    mem_plan_id AS plan_id,
    mem_group_number_val AS group_number,
    rx_coverage_start_date_id AS coverage_start_date,
    coverage_end_date_val AS coverage_end_date,
    phm_coverage_level_code AS coverage_level_code,
    subscriber_indicator AS subscriber_indicator,
    product_category_code_val AS product_category_code,
    plan_type AS plan_type,
    clm_market_category_code_id AS market_category_code
FROM eligibility_kp;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    clm_member_id_id AS member_id,
    phm_first_name AS first_name,
    rx_last_name_id AS last_name,
    date_of_birth_val AS date_of_birth,
    gender_val AS gender,
    mem_address AS address,
    city_id AS city,
    phm_state_val AS state,
    rx_zip_code AS zip_code,
    rx_plan_id_id AS plan_id,
    rx_group_number_val AS group_number,
    mem_coverage_start_date_id AS coverage_start_date,
    clm_coverage_end_date_val AS coverage_end_date,
    phm_coverage_level_code AS coverage_level_code,
    rx_subscriber_indicator_id AS subscriber_indicator,
    phm_product_category_code AS product_category_code,
    plan_type AS plan_type,
    market_category_code_val AS market_category_code
FROM eligibility_cnc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    rx_member_id_id AS member_id,
    first_name_val AS first_name,
    last_name_id AS last_name,
    rx_date_of_birth_val AS date_of_birth,
    gender AS gender,
    rx_address AS address,
    clm_city_val AS city,
    mem_state_val AS state,
    clm_zip_code_val AS zip_code,
    mem_plan_id_val AS plan_id,
    clm_group_number_id AS group_number,
    coverage_start_date_val AS coverage_start_date,
    clm_coverage_end_date_id AS coverage_end_date,
    mem_coverage_level_code_val AS coverage_level_code,
    clm_subscriber_indicator_val AS subscriber_indicator,
    phm_product_category_code_id AS product_category_code,
    rx_plan_type AS plan_type,
    rx_market_category_code_id AS market_category_code
FROM eligibility_moh;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    phm_member_id_val AS member_id,
    clm_first_name_val AS first_name,
    mem_last_name AS last_name,
    date_of_birth AS date_of_birth,
    clm_gender_id AS gender,
    phm_address_id AS address,
    mem_city AS city,
    state_id AS state,
    clm_zip_code AS zip_code,
    mem_plan_id AS plan_id,
    clm_group_number AS group_number,
    mem_coverage_start_date_id AS coverage_start_date,
    mem_coverage_end_date AS coverage_end_date,
    rx_coverage_level_code_id AS coverage_level_code,
    mem_subscriber_indicator AS subscriber_indicator,
    mem_product_category_code_id AS product_category_code,
    phm_plan_type AS plan_type,
    mem_market_category_code_val AS market_category_code
FROM eligibility_bcbsa;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id AS member_id,
    first_name_id AS first_name,
    last_name_id AS last_name,
    rx_date_of_birth_id AS date_of_birth,
    gender_val AS gender,
    phm_address_id AS address,
    clm_city_id AS city,
    clm_state_id AS state,
    zip_code AS zip_code,
    phm_plan_id_val AS plan_id,
    mem_group_number_id AS group_number,
    coverage_start_date_id AS coverage_start_date,
    coverage_end_date AS coverage_end_date,
    mem_coverage_level_code_val AS coverage_level_code,
    subscriber_indicator_val AS subscriber_indicator,
    phm_product_category_code AS product_category_code,
    mem_plan_type_id AS plan_type,
    clm_market_category_code_id AS market_category_code
FROM eligibility_hcsc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id_val AS member_id,
    mem_first_name AS first_name,
    phm_last_name_id AS last_name,
    rx_date_of_birth AS date_of_birth,
    mem_gender_id AS gender,
    rx_address AS address,
    city_val AS city,
    state_id AS state,
    rx_zip_code AS zip_code,
    mem_plan_id_val AS plan_id,
    mem_group_number_val AS group_number,
    rx_coverage_start_date_val AS coverage_start_date,
    rx_coverage_end_date_id AS coverage_end_date,
    mem_coverage_level_code AS coverage_level_code,
    mem_subscriber_indicator_val AS subscriber_indicator,
    rx_product_category_code_val AS product_category_code,
    rx_plan_type_val AS plan_type,
    clm_market_category_code_val AS market_category_code
FROM eligibility_hmi;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    member_id_id AS member_id,
    rx_first_name_val AS first_name,
    last_name_val AS last_name,
    clm_date_of_birth_id AS date_of_birth,
    clm_gender AS gender,
    address_val AS address,
    mem_city_val AS city,
    mem_state_val AS state,
    clm_zip_code_val AS zip_code,
    rx_plan_id AS plan_id,
    mem_group_number_val AS group_number,
    rx_coverage_start_date_id AS coverage_start_date,
    coverage_end_date_id AS coverage_end_date,
    rx_coverage_level_code AS coverage_level_code,
    rx_subscriber_indicator_id AS subscriber_indicator,
    product_category_code AS product_category_code,
    phm_plan_type_val AS plan_type,
    market_category_code_val AS market_category_code
FROM eligibility_ghp;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id_val AS member_id,
    clm_first_name_id AS first_name,
    rx_last_name_id AS last_name,
    rx_date_of_birth_id AS date_of_birth,
    phm_gender AS gender,
    mem_address AS address,
    phm_city AS city,
    phm_state_id AS state,
    mem_zip_code_id AS zip_code,
    mem_plan_id AS plan_id,
    group_number_val AS group_number,
    mem_coverage_start_date_val AS coverage_start_date,
    phm_coverage_end_date AS coverage_end_date,
    mem_coverage_level_code AS coverage_level_code,
    rx_subscriber_indicator AS subscriber_indicator,
    clm_product_category_code_val AS product_category_code,
    plan_type_id AS plan_type,
    rx_market_category_code_id AS market_category_code
FROM eligibility_upmc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id AS member_id,
    first_name_id AS first_name,
    rx_last_name AS last_name,
    date_of_birth AS date_of_birth,
    mem_gender_val AS gender,
    clm_address AS address,
    mem_city_id AS city,
    rx_state AS state,
    clm_zip_code AS zip_code,
    clm_plan_id_val AS plan_id,
    group_number_id AS group_number,
    clm_coverage_start_date_id AS coverage_start_date,
    mem_coverage_end_date_val AS coverage_end_date,
    phm_coverage_level_code AS coverage_level_code,
    phm_subscriber_indicator AS subscriber_indicator,
    mem_product_category_code_val AS product_category_code,
    plan_type_val AS plan_type,
    mem_market_category_code AS market_category_code
FROM eligibility_ibc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    phm_member_id_val AS member_id,
    first_name_val AS first_name,
    phm_last_name AS last_name,
    phm_date_of_birth AS date_of_birth,
    clm_gender AS gender,
    clm_address_val AS address,
    rx_city AS city,
    mem_state AS state,
    rx_zip_code_id AS zip_code,
    rx_plan_id_val AS plan_id,
    mem_group_number_id AS group_number,
    coverage_start_date_val AS coverage_start_date,
    phm_coverage_end_date AS coverage_end_date,
    mem_coverage_level_code AS coverage_level_code,
    phm_subscriber_indicator_id AS subscriber_indicator,
    mem_product_category_code_val AS product_category_code,
    rx_plan_type_val AS plan_type,
    market_category_code_val AS market_category_code
FROM eligibility_hphc;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    member_id AS member_id,
    clm_first_name_val AS first_name,
    rx_last_name AS last_name,
    date_of_birth_val AS date_of_birth,
    gender_val AS gender,
    phm_address_id AS address,
    city AS city,
    rx_state AS state,
    clm_zip_code_val AS zip_code,
    phm_plan_id AS plan_id,
    mem_group_number_val AS group_number,
    clm_coverage_start_date_val AS coverage_start_date,
    coverage_end_date AS coverage_end_date,
    mem_coverage_level_code_val AS coverage_level_code,
    rx_subscriber_indicator_id AS subscriber_indicator,
    phm_product_category_code AS product_category_code,
    phm_plan_type_val AS plan_type,
    market_category_code AS market_category_code
FROM eligibility_thp;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    rx_member_id_id AS member_id,
    first_name AS first_name,
    mem_last_name_id AS last_name,
    clm_date_of_birth AS date_of_birth,
    gender AS gender,
    phm_address_val AS address,
    phm_city_val AS city,
    state_val AS state,
    mem_zip_code_val AS zip_code,
    plan_id AS plan_id,
    rx_group_number AS group_number,
    clm_coverage_start_date_val AS coverage_start_date,
    mem_coverage_end_date_val AS coverage_end_date,
    rx_coverage_level_code AS coverage_level_code,
    clm_subscriber_indicator AS subscriber_indicator,
    product_category_code_val AS product_category_code,
    plan_type_val AS plan_type,
    rx_market_category_code_val AS market_category_code
FROM eligibility_wcg;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    phm_member_id_val AS member_id,
    first_name AS first_name,
    phm_last_name AS last_name,
    phm_date_of_birth_val AS date_of_birth,
    clm_gender_val AS gender,
    clm_address_id AS address,
    city AS city,
    clm_state_val AS state,
    clm_zip_code_id AS zip_code,
    rx_plan_id_id AS plan_id,
    mem_group_number AS group_number,
    mem_coverage_start_date_val AS coverage_start_date,
    phm_coverage_end_date_val AS coverage_end_date,
    clm_coverage_level_code_id AS coverage_level_code,
    clm_subscriber_indicator_val AS subscriber_indicator,
    product_category_code AS product_category_code,
    plan_type_id AS plan_type,
    rx_market_category_code_val AS market_category_code
FROM eligibility_tri;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    rx_member_id_val AS member_id,
    first_name AS first_name,
    rx_last_name_val AS last_name,
    mem_date_of_birth_val AS date_of_birth,
    mem_gender_val AS gender,
    phm_address AS address,
    phm_city AS city,
    state_id AS state,
    rx_zip_code_id AS zip_code,
    mem_plan_id AS plan_id,
    phm_group_number_id AS group_number,
    phm_coverage_start_date_id AS coverage_start_date,
    coverage_end_date_val AS coverage_end_date,
    rx_coverage_level_code_val AS coverage_level_code,
    mem_subscriber_indicator_val AS subscriber_indicator,
    rx_product_category_code_val AS product_category_code,
    rx_plan_type AS plan_type,
    rx_market_category_code AS market_category_code
FROM eligibility_mcr;
END;
/

BEGIN
INSERT INTO standard_eligibility (
    member_id, first_name, last_name, date_of_birth, gender, address, city, state, zip_code, plan_id, group_number, coverage_start_date, coverage_end_date, coverage_level_code, subscriber_indicator, product_category_code, plan_type, market_category_code
)
SELECT
    mem_member_id AS member_id,
    first_name_val AS first_name,
    last_name_id AS last_name,
    date_of_birth AS date_of_birth,
    phm_gender_id AS gender,
    mem_address_id AS address,
    phm_city_val AS city,
    rx_state_id AS state,
    phm_zip_code_val AS zip_code,
    clm_plan_id_val AS plan_id,
    mem_group_number_id AS group_number,
    coverage_start_date_id AS coverage_start_date,
    rx_coverage_end_date AS coverage_end_date,
    mem_coverage_level_code_id AS coverage_level_code,
    rx_subscriber_indicator_val AS subscriber_indicator,
    product_category_code AS product_category_code,
    mem_plan_type_val AS plan_type,
    mem_market_category_code AS market_category_code
FROM eligibility_mcd;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id AS claim_id,
    clm_member_id_id AS member_id,
    clm_service_date_id AS service_date,
    mem_admission_date_val AS admission_date,
    phm_discharge_date_id AS discharge_date,
    clm_procedure_code AS procedure_code,
    clm_diagnosis_code_val AS diagnosis_code,
    phm_billed_amount_val AS billed_amount,
    clm_paid_amount_id AS paid_amount,
    rx_provider_id AS provider_id,
    phm_claim_status AS claim_status,
    mem_plan_id_val AS plan_id,
    phm_place_of_service AS place_of_service,
    rx_type_of_bill_id AS type_of_bill,
    rx_admission_type AS admission_type,
    rx_discharge_status AS discharge_status
FROM claims_uhc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    mem_claim_id_id AS claim_id,
    mem_member_id AS member_id,
    service_date AS service_date,
    phm_admission_date_id AS admission_date,
    clm_discharge_date AS discharge_date,
    procedure_code AS procedure_code,
    clm_diagnosis_code_val AS diagnosis_code,
    mem_billed_amount AS billed_amount,
    clm_paid_amount AS paid_amount,
    provider_id_id AS provider_id,
    mem_claim_status_id AS claim_status,
    rx_plan_id_val AS plan_id,
    phm_place_of_service AS place_of_service,
    phm_type_of_bill_id AS type_of_bill,
    rx_admission_type_val AS admission_type,
    discharge_status_val AS discharge_status
FROM claims_antm;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    rx_claim_id_id AS claim_id,
    mem_member_id_id AS member_id,
    rx_service_date_id AS service_date,
    mem_admission_date_val AS admission_date,
    phm_discharge_date AS discharge_date,
    clm_procedure_code_val AS procedure_code,
    diagnosis_code_id AS diagnosis_code,
    phm_billed_amount AS billed_amount,
    phm_paid_amount_id AS paid_amount,
    rx_provider_id_id AS provider_id,
    clm_claim_status AS claim_status,
    clm_plan_id AS plan_id,
    phm_place_of_service AS place_of_service,
    rx_type_of_bill AS type_of_bill,
    phm_admission_type AS admission_type,
    rx_discharge_status_id AS discharge_status
FROM claims_aet;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id AS claim_id,
    rx_member_id_val AS member_id,
    phm_service_date AS service_date,
    phm_admission_date_id AS admission_date,
    clm_discharge_date AS discharge_date,
    clm_procedure_code AS procedure_code,
    clm_diagnosis_code_val AS diagnosis_code,
    mem_billed_amount AS billed_amount,
    mem_paid_amount_id AS paid_amount,
    phm_provider_id_val AS provider_id,
    claim_status_id AS claim_status,
    phm_plan_id_id AS plan_id,
    place_of_service_val AS place_of_service,
    clm_type_of_bill_id AS type_of_bill,
    mem_admission_type_val AS admission_type,
    clm_discharge_status_id AS discharge_status
FROM claims_ci;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    phm_claim_id AS claim_id,
    rx_member_id_id AS member_id,
    phm_service_date AS service_date,
    mem_admission_date_id AS admission_date,
    mem_discharge_date_id AS discharge_date,
    phm_procedure_code_id AS procedure_code,
    clm_diagnosis_code AS diagnosis_code,
    rx_billed_amount_id AS billed_amount,
    paid_amount_id AS paid_amount,
    clm_provider_id AS provider_id,
    clm_claim_status_val AS claim_status,
    clm_plan_id_id AS plan_id,
    clm_place_of_service_id AS place_of_service,
    phm_type_of_bill AS type_of_bill,
    mem_admission_type_id AS admission_type,
    rx_discharge_status_val AS discharge_status
FROM claims_hum;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    mem_claim_id_id AS claim_id,
    phm_member_id_id AS member_id,
    clm_service_date AS service_date,
    clm_admission_date_val AS admission_date,
    rx_discharge_date_val AS discharge_date,
    mem_procedure_code AS procedure_code,
    rx_diagnosis_code AS diagnosis_code,
    phm_billed_amount_val AS billed_amount,
    paid_amount_id AS paid_amount,
    mem_provider_id_id AS provider_id,
    mem_claim_status AS claim_status,
    mem_plan_id_val AS plan_id,
    rx_place_of_service_id AS place_of_service,
    clm_type_of_bill_val AS type_of_bill,
    clm_admission_type_id AS admission_type,
    rx_discharge_status_id AS discharge_status
FROM claims_kp;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    rx_claim_id_val AS claim_id,
    clm_member_id AS member_id,
    clm_service_date_id AS service_date,
    phm_admission_date_val AS admission_date,
    clm_discharge_date_id AS discharge_date,
    clm_procedure_code_id AS procedure_code,
    clm_diagnosis_code AS diagnosis_code,
    clm_billed_amount AS billed_amount,
    mem_paid_amount AS paid_amount,
    rx_provider_id AS provider_id,
    mem_claim_status_id AS claim_status,
    clm_plan_id AS plan_id,
    phm_place_of_service AS place_of_service,
    rx_type_of_bill AS type_of_bill,
    rx_admission_type_id AS admission_type,
    mem_discharge_status_val AS discharge_status
FROM claims_cnc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    phm_claim_id AS claim_id,
    mem_member_id_id AS member_id,
    service_date AS service_date,
    admission_date AS admission_date,
    rx_discharge_date_val AS discharge_date,
    mem_procedure_code AS procedure_code,
    mem_diagnosis_code AS diagnosis_code,
    clm_billed_amount_id AS billed_amount,
    clm_paid_amount AS paid_amount,
    phm_provider_id_id AS provider_id,
    claim_status_id AS claim_status,
    plan_id_val AS plan_id,
    phm_place_of_service AS place_of_service,
    rx_type_of_bill_val AS type_of_bill,
    clm_admission_type_val AS admission_type,
    clm_discharge_status_val AS discharge_status
FROM claims_moh;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    rx_claim_id AS claim_id,
    member_id AS member_id,
    rx_service_date AS service_date,
    phm_admission_date_val AS admission_date,
    rx_discharge_date AS discharge_date,
    procedure_code_id AS procedure_code,
    clm_diagnosis_code_val AS diagnosis_code,
    clm_billed_amount_val AS billed_amount,
    mem_paid_amount AS paid_amount,
    mem_provider_id_val AS provider_id,
    phm_claim_status_id AS claim_status,
    rx_plan_id_val AS plan_id,
    mem_place_of_service AS place_of_service,
    clm_type_of_bill AS type_of_bill,
    admission_type_val AS admission_type,
    discharge_status_val AS discharge_status
FROM claims_bcbsa;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id_id AS claim_id,
    member_id_val AS member_id,
    rx_service_date_id AS service_date,
    mem_admission_date AS admission_date,
    phm_discharge_date_val AS discharge_date,
    rx_procedure_code_val AS procedure_code,
    mem_diagnosis_code_id AS diagnosis_code,
    phm_billed_amount_id AS billed_amount,
    paid_amount_id AS paid_amount,
    clm_provider_id_val AS provider_id,
    phm_claim_status_id AS claim_status,
    phm_plan_id AS plan_id,
    mem_place_of_service AS place_of_service,
    clm_type_of_bill_id AS type_of_bill,
    phm_admission_type AS admission_type,
    discharge_status AS discharge_status
FROM claims_hcsc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    claim_id_id AS claim_id,
    clm_member_id_id AS member_id,
    service_date AS service_date,
    phm_admission_date_val AS admission_date,
    clm_discharge_date_id AS discharge_date,
    rx_procedure_code_id AS procedure_code,
    clm_diagnosis_code_id AS diagnosis_code,
    clm_billed_amount_id AS billed_amount,
    phm_paid_amount_val AS paid_amount,
    clm_provider_id_val AS provider_id,
    mem_claim_status_val AS claim_status,
    phm_plan_id_val AS plan_id,
    mem_place_of_service AS place_of_service,
    clm_type_of_bill AS type_of_bill,
    mem_admission_type_val AS admission_type,
    discharge_status_id AS discharge_status
FROM claims_hmi;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id_val AS claim_id,
    phm_member_id AS member_id,
    mem_service_date_val AS service_date,
    phm_admission_date AS admission_date,
    mem_discharge_date_id AS discharge_date,
    phm_procedure_code_val AS procedure_code,
    phm_diagnosis_code_val AS diagnosis_code,
    clm_billed_amount_id AS billed_amount,
    paid_amount_id AS paid_amount,
    mem_provider_id_val AS provider_id,
    rx_claim_status AS claim_status,
    rx_plan_id AS plan_id,
    place_of_service_id AS place_of_service,
    clm_type_of_bill AS type_of_bill,
    mem_admission_type_id AS admission_type,
    clm_discharge_status AS discharge_status
FROM claims_ghp;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    mem_claim_id_val AS claim_id,
    member_id AS member_id,
    mem_service_date AS service_date,
    mem_admission_date_val AS admission_date,
    clm_discharge_date_id AS discharge_date,
    rx_procedure_code_id AS procedure_code,
    diagnosis_code_val AS diagnosis_code,
    phm_billed_amount_id AS billed_amount,
    rx_paid_amount AS paid_amount,
    provider_id_id AS provider_id,
    mem_claim_status_val AS claim_status,
    plan_id_val AS plan_id,
    place_of_service_val AS place_of_service,
    type_of_bill_id AS type_of_bill,
    rx_admission_type_val AS admission_type,
    clm_discharge_status AS discharge_status
FROM claims_upmc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    phm_claim_id AS claim_id,
    phm_member_id_val AS member_id,
    clm_service_date AS service_date,
    rx_admission_date_id AS admission_date,
    rx_discharge_date AS discharge_date,
    procedure_code_val AS procedure_code,
    clm_diagnosis_code_id AS diagnosis_code,
    phm_billed_amount_val AS billed_amount,
    clm_paid_amount_val AS paid_amount,
    mem_provider_id AS provider_id,
    phm_claim_status_id AS claim_status,
    mem_plan_id AS plan_id,
    rx_place_of_service AS place_of_service,
    mem_type_of_bill AS type_of_bill,
    rx_admission_type AS admission_type,
    phm_discharge_status_val AS discharge_status
FROM claims_ibc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    phm_claim_id_id AS claim_id,
    rx_member_id_id AS member_id,
    phm_service_date_id AS service_date,
    clm_admission_date AS admission_date,
    discharge_date_val AS discharge_date,
    mem_procedure_code_val AS procedure_code,
    diagnosis_code AS diagnosis_code,
    rx_billed_amount_id AS billed_amount,
    rx_paid_amount_val AS paid_amount,
    provider_id_val AS provider_id,
    clm_claim_status_id AS claim_status,
    phm_plan_id_id AS plan_id,
    rx_place_of_service_val AS place_of_service,
    rx_type_of_bill_val AS type_of_bill,
    admission_type AS admission_type,
    phm_discharge_status AS discharge_status
FROM claims_hphc;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id_val AS claim_id,
    mem_member_id_val AS member_id,
    phm_service_date_id AS service_date,
    mem_admission_date AS admission_date,
    clm_discharge_date_id AS discharge_date,
    rx_procedure_code_val AS procedure_code,
    clm_diagnosis_code_id AS diagnosis_code,
    rx_billed_amount_id AS billed_amount,
    rx_paid_amount_val AS paid_amount,
    rx_provider_id_id AS provider_id,
    phm_claim_status_id AS claim_status,
    plan_id_id AS plan_id,
    place_of_service_id AS place_of_service,
    phm_type_of_bill_val AS type_of_bill,
    mem_admission_type_id AS admission_type,
    phm_discharge_status_val AS discharge_status
FROM claims_thp;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    rx_claim_id AS claim_id,
    phm_member_id_id AS member_id,
    clm_service_date_id AS service_date,
    admission_date AS admission_date,
    rx_discharge_date_id AS discharge_date,
    clm_procedure_code_id AS procedure_code,
    mem_diagnosis_code_val AS diagnosis_code,
    mem_billed_amount AS billed_amount,
    paid_amount_val AS paid_amount,
    mem_provider_id_id AS provider_id,
    phm_claim_status_id AS claim_status,
    mem_plan_id AS plan_id,
    phm_place_of_service_id AS place_of_service,
    rx_type_of_bill AS type_of_bill,
    admission_type AS admission_type,
    phm_discharge_status_id AS discharge_status
FROM claims_wcg;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    phm_claim_id_id AS claim_id,
    rx_member_id_id AS member_id,
    mem_service_date_id AS service_date,
    mem_admission_date_val AS admission_date,
    rx_discharge_date AS discharge_date,
    clm_procedure_code_val AS procedure_code,
    mem_diagnosis_code_val AS diagnosis_code,
    mem_billed_amount AS billed_amount,
    clm_paid_amount AS paid_amount,
    clm_provider_id_val AS provider_id,
    phm_claim_status_val AS claim_status,
    rx_plan_id AS plan_id,
    place_of_service AS place_of_service,
    type_of_bill AS type_of_bill,
    rx_admission_type AS admission_type,
    rx_discharge_status AS discharge_status
FROM claims_tri;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    clm_claim_id_val AS claim_id,
    rx_member_id AS member_id,
    mem_service_date AS service_date,
    phm_admission_date_val AS admission_date,
    rx_discharge_date AS discharge_date,
    procedure_code AS procedure_code,
    mem_diagnosis_code_id AS diagnosis_code,
    clm_billed_amount_val AS billed_amount,
    mem_paid_amount_id AS paid_amount,
    clm_provider_id AS provider_id,
    rx_claim_status_id AS claim_status,
    plan_id AS plan_id,
    phm_place_of_service AS place_of_service,
    clm_type_of_bill AS type_of_bill,
    phm_admission_type AS admission_type,
    discharge_status AS discharge_status
FROM claims_mcr;
END;
/

BEGIN
INSERT INTO standard_claims (
    claim_id, member_id, service_date, admission_date, discharge_date, procedure_code, diagnosis_code, billed_amount, paid_amount, provider_id, claim_status, plan_id, place_of_service, type_of_bill, admission_type, discharge_status
)
SELECT
    mem_claim_id_id AS claim_id,
    phm_member_id_val AS member_id,
    mem_service_date_val AS service_date,
    clm_admission_date_id AS admission_date,
    mem_discharge_date AS discharge_date,
    procedure_code AS procedure_code,
    phm_diagnosis_code AS diagnosis_code,
    billed_amount AS billed_amount,
    phm_paid_amount AS paid_amount,
    phm_provider_id_id AS provider_id,
    mem_claim_status AS claim_status,
    rx_plan_id AS plan_id,
    rx_place_of_service_id AS place_of_service,
    mem_type_of_bill_id AS type_of_bill,
    rx_admission_type AS admission_type,
    discharge_status AS discharge_status
FROM claims_mcd;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    clm_rx_claim_id AS rx_claim_id,
    clm_member_id_val AS member_id,
    clm_pharmacy_id AS pharmacy_id,
    mem_fill_date_val AS fill_date,
    clm_drug_code_val AS drug_code,
    quantity_dispensed_id AS quantity_dispensed,
    mem_days_supply_val AS days_supply,
    mem_billed_amount_id AS billed_amount,
    rx_paid_amount AS paid_amount,
    mem_prescriber_id AS prescriber_id,
    mem_plan_id_val AS plan_id
FROM rxclaims_uhc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_claim_id_id AS rx_claim_id,
    mem_member_id AS member_id,
    phm_pharmacy_id_id AS pharmacy_id,
    rx_fill_date_val AS fill_date,
    drug_code AS drug_code,
    clm_quantity_dispensed_id AS quantity_dispensed,
    clm_days_supply_val AS days_supply,
    billed_amount_id AS billed_amount,
    paid_amount AS paid_amount,
    phm_prescriber_id_id AS prescriber_id,
    clm_plan_id_val AS plan_id
FROM rxclaims_antm;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_rx_claim_id AS rx_claim_id,
    member_id_id AS member_id,
    mem_pharmacy_id_val AS pharmacy_id,
    phm_fill_date AS fill_date,
    rx_drug_code AS drug_code,
    clm_quantity_dispensed_id AS quantity_dispensed,
    mem_days_supply_val AS days_supply,
    mem_billed_amount_val AS billed_amount,
    clm_paid_amount_id AS paid_amount,
    mem_prescriber_id_id AS prescriber_id,
    plan_id_val AS plan_id
FROM rxclaims_aet;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_rx_claim_id AS rx_claim_id,
    member_id AS member_id,
    phm_pharmacy_id_val AS pharmacy_id,
    fill_date AS fill_date,
    phm_drug_code AS drug_code,
    clm_quantity_dispensed_val AS quantity_dispensed,
    phm_days_supply_val AS days_supply,
    rx_billed_amount_id AS billed_amount,
    paid_amount_id AS paid_amount,
    clm_prescriber_id AS prescriber_id,
    clm_plan_id_id AS plan_id
FROM rxclaims_ci;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    clm_rx_claim_id AS rx_claim_id,
    rx_member_id_id AS member_id,
    pharmacy_id_val AS pharmacy_id,
    rx_fill_date AS fill_date,
    drug_code AS drug_code,
    mem_quantity_dispensed AS quantity_dispensed,
    clm_days_supply AS days_supply,
    mem_billed_amount_val AS billed_amount,
    mem_paid_amount_val AS paid_amount,
    phm_prescriber_id_val AS prescriber_id,
    mem_plan_id_id AS plan_id
FROM rxclaims_hum;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    mem_rx_claim_id_id AS rx_claim_id,
    rx_member_id AS member_id,
    mem_pharmacy_id_val AS pharmacy_id,
    fill_date_val AS fill_date,
    clm_drug_code_val AS drug_code,
    phm_quantity_dispensed AS quantity_dispensed,
    mem_days_supply_id AS days_supply,
    clm_billed_amount_id AS billed_amount,
    phm_paid_amount AS paid_amount,
    mem_prescriber_id AS prescriber_id,
    clm_plan_id AS plan_id
FROM rxclaims_kp;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_rx_claim_id AS rx_claim_id,
    phm_member_id AS member_id,
    rx_pharmacy_id AS pharmacy_id,
    clm_fill_date_id AS fill_date,
    phm_drug_code_val AS drug_code,
    phm_quantity_dispensed_val AS quantity_dispensed,
    phm_days_supply_val AS days_supply,
    phm_billed_amount AS billed_amount,
    rx_paid_amount AS paid_amount,
    prescriber_id AS prescriber_id,
    mem_plan_id_val AS plan_id
FROM rxclaims_cnc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    mem_rx_claim_id AS rx_claim_id,
    mem_member_id_val AS member_id,
    rx_pharmacy_id_id AS pharmacy_id,
    clm_fill_date_val AS fill_date,
    clm_drug_code AS drug_code,
    phm_quantity_dispensed AS quantity_dispensed,
    days_supply_val AS days_supply,
    clm_billed_amount AS billed_amount,
    rx_paid_amount AS paid_amount,
    mem_prescriber_id AS prescriber_id,
    plan_id AS plan_id
FROM rxclaims_moh;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    mem_rx_claim_id AS rx_claim_id,
    member_id_id AS member_id,
    pharmacy_id_id AS pharmacy_id,
    mem_fill_date AS fill_date,
    clm_drug_code_id AS drug_code,
    rx_quantity_dispensed AS quantity_dispensed,
    rx_days_supply_id AS days_supply,
    mem_billed_amount_val AS billed_amount,
    mem_paid_amount_id AS paid_amount,
    phm_prescriber_id AS prescriber_id,
    clm_plan_id_val AS plan_id
FROM rxclaims_bcbsa;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    phm_rx_claim_id_id AS rx_claim_id,
    member_id_val AS member_id,
    phm_pharmacy_id AS pharmacy_id,
    clm_fill_date_id AS fill_date,
    drug_code_id AS drug_code,
    quantity_dispensed_id AS quantity_dispensed,
    mem_days_supply_id AS days_supply,
    rx_billed_amount_val AS billed_amount,
    phm_paid_amount AS paid_amount,
    mem_prescriber_id AS prescriber_id,
    plan_id_val AS plan_id
FROM rxclaims_hcsc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    phm_rx_claim_id_val AS rx_claim_id,
    rx_member_id_id AS member_id,
    phm_pharmacy_id_val AS pharmacy_id,
    rx_fill_date AS fill_date,
    mem_drug_code_val AS drug_code,
    quantity_dispensed AS quantity_dispensed,
    clm_days_supply_val AS days_supply,
    rx_billed_amount AS billed_amount,
    paid_amount AS paid_amount,
    rx_prescriber_id_id AS prescriber_id,
    clm_plan_id_val AS plan_id
FROM rxclaims_hmi;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_claim_id_id AS rx_claim_id,
    member_id_id AS member_id,
    phm_pharmacy_id_val AS pharmacy_id,
    clm_fill_date_val AS fill_date,
    mem_drug_code AS drug_code,
    clm_quantity_dispensed_id AS quantity_dispensed,
    clm_days_supply_id AS days_supply,
    rx_billed_amount_val AS billed_amount,
    rx_paid_amount_id AS paid_amount,
    phm_prescriber_id_id AS prescriber_id,
    clm_plan_id_val AS plan_id
FROM rxclaims_ghp;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_claim_id AS rx_claim_id,
    rx_member_id_val AS member_id,
    mem_pharmacy_id_id AS pharmacy_id,
    rx_fill_date_id AS fill_date,
    rx_drug_code_val AS drug_code,
    rx_quantity_dispensed AS quantity_dispensed,
    rx_days_supply_val AS days_supply,
    billed_amount AS billed_amount,
    paid_amount_id AS paid_amount,
    phm_prescriber_id AS prescriber_id,
    plan_id_id AS plan_id
FROM rxclaims_upmc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    phm_rx_claim_id AS rx_claim_id,
    rx_member_id_id AS member_id,
    pharmacy_id_id AS pharmacy_id,
    clm_fill_date_id AS fill_date,
    phm_drug_code_id AS drug_code,
    phm_quantity_dispensed_val AS quantity_dispensed,
    phm_days_supply_id AS days_supply,
    billed_amount_val AS billed_amount,
    mem_paid_amount_id AS paid_amount,
    phm_prescriber_id_val AS prescriber_id,
    clm_plan_id_id AS plan_id
FROM rxclaims_ibc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_rx_claim_id_val AS rx_claim_id,
    rx_member_id AS member_id,
    rx_pharmacy_id AS pharmacy_id,
    clm_fill_date_val AS fill_date,
    clm_drug_code_val AS drug_code,
    rx_quantity_dispensed AS quantity_dispensed,
    days_supply_val AS days_supply,
    clm_billed_amount_val AS billed_amount,
    mem_paid_amount AS paid_amount,
    clm_prescriber_id_val AS prescriber_id,
    plan_id_val AS plan_id
FROM rxclaims_hphc;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    clm_rx_claim_id_id AS rx_claim_id,
    mem_member_id_val AS member_id,
    pharmacy_id_val AS pharmacy_id,
    mem_fill_date AS fill_date,
    phm_drug_code_val AS drug_code,
    clm_quantity_dispensed AS quantity_dispensed,
    days_supply_id AS days_supply,
    phm_billed_amount AS billed_amount,
    mem_paid_amount_val AS paid_amount,
    clm_prescriber_id AS prescriber_id,
    plan_id_id AS plan_id
FROM rxclaims_thp;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_claim_id_val AS rx_claim_id,
    rx_member_id_id AS member_id,
    mem_pharmacy_id_val AS pharmacy_id,
    mem_fill_date_val AS fill_date,
    drug_code_id AS drug_code,
    quantity_dispensed_val AS quantity_dispensed,
    phm_days_supply AS days_supply,
    clm_billed_amount_val AS billed_amount,
    clm_paid_amount_val AS paid_amount,
    rx_prescriber_id AS prescriber_id,
    mem_plan_id_val AS plan_id
FROM rxclaims_wcg;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    rx_rx_claim_id_val AS rx_claim_id,
    mem_member_id_val AS member_id,
    rx_pharmacy_id_id AS pharmacy_id,
    mem_fill_date_val AS fill_date,
    rx_drug_code_id AS drug_code,
    clm_quantity_dispensed_id AS quantity_dispensed,
    days_supply AS days_supply,
    phm_billed_amount AS billed_amount,
    clm_paid_amount_val AS paid_amount,
    rx_prescriber_id_id AS prescriber_id,
    phm_plan_id_id AS plan_id
FROM rxclaims_tri;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    mem_rx_claim_id_id AS rx_claim_id,
    clm_member_id_val AS member_id,
    rx_pharmacy_id AS pharmacy_id,
    mem_fill_date AS fill_date,
    clm_drug_code_id AS drug_code,
    clm_quantity_dispensed_id AS quantity_dispensed,
    days_supply AS days_supply,
    billed_amount AS billed_amount,
    paid_amount AS paid_amount,
    clm_prescriber_id_id AS prescriber_id,
    plan_id_id AS plan_id
FROM rxclaims_mcr;
END;
/

BEGIN
INSERT INTO standard_rxclaims (
    rx_claim_id, member_id, pharmacy_id, fill_date, drug_code, quantity_dispensed, days_supply, billed_amount, paid_amount, prescriber_id, plan_id
)
SELECT
    mem_rx_claim_id_val AS rx_claim_id,
    phm_member_id_val AS member_id,
    pharmacy_id_val AS pharmacy_id,
    phm_fill_date_id AS fill_date,
    mem_drug_code_val AS drug_code,
    rx_quantity_dispensed_val AS quantity_dispensed,
    rx_days_supply_val AS days_supply,
    billed_amount AS billed_amount,
    phm_paid_amount_val AS paid_amount,
    rx_prescriber_id_id AS prescriber_id,
    rx_plan_id_id AS plan_id
FROM rxclaims_mcd;
END;
/

