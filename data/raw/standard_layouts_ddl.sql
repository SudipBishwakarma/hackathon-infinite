CREATE TABLE standard_eligibility (
    member_id VARCHAR2(50),
    first_name VARCHAR2(35),
    last_name VARCHAR2(60),
    date_of_birth DATE,
    gender CHAR(1),
    address VARCHAR2(100),
    city VARCHAR2(30),
    state CHAR(2),
    zip_code VARCHAR2(9),
    plan_id VARCHAR2(30),
    group_number VARCHAR2(50),
    coverage_start_date DATE,
    coverage_end_date DATE,
    coverage_level_code CHAR(3),
    subscriber_indicator CHAR(1),
    product_category_code CHAR(2),
    plan_type CHAR(3),
    market_category_code VARCHAR2(4)
);

CREATE TABLE standard_claims (
    claim_id VARCHAR2(35),
    member_id VARCHAR2(50),
    service_date DATE,
    admission_date DATE,
    discharge_date DATE,
    procedure_code VARCHAR2(10),
    diagnosis_code VARCHAR2(10),
    billed_amount NUMBER(10, 2),
    paid_amount NUMBER(10, 2),
    provider_id VARCHAR2(35),
    claim_status VARCHAR2(20),
    plan_id VARCHAR2(30),
    place_of_service CHAR(2),
    type_of_bill CHAR(3),
    admission_type CHAR(1),
    discharge_status CHAR(2)
);

CREATE TABLE standard_rxclaims (
    rx_claim_id VARCHAR2(35),
    member_id VARCHAR2(50),
    pharmacy_id VARCHAR2(35),
    fill_date DATE,
    drug_code VARCHAR2(15),
    quantity_dispensed NUMBER(10, 2),
    days_supply NUMBER(3),
    billed_amount NUMBER(10, 2),
    paid_amount NUMBER(10, 2),
    prescriber_id VARCHAR2(35),
    plan_id VARCHAR2(30)
);