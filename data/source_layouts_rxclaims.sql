CREATE TABLE rxclaims_payer_1 (
    rx_claim_id VARCHAR2(35),
    sub_member_id_val VARCHAR2(50),
    rx_pharmacy_id_code VARCHAR2(35),
    sub_fill_date DATE,
    rx_drug_code_id VARCHAR2(15),
    drg_quantity_dispensed_nm NUMBER(10, 2),
    rx_days_supply_code NUMBER(3),
    rx_billed_amount_code NUMBER(10, 2),
    clm_paid_amount NUMBER(10, 2),
    phm_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_2 (
    sub_rx_claim_id VARCHAR2(35),
    mem_member_id_id VARCHAR2(50),
    pharmacy_id_val VARCHAR2(35),
    clm_fill_date_val DATE,
    clm_drug_code_code VARCHAR2(15),
    sub_quantity_dispensed_id NUMBER(10, 2),
    clm_days_supply NUMBER(3),
    drg_billed_amount NUMBER(10, 2),
    phm_paid_amount_code NUMBER(10, 2),
    sub_prescriber_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_3 (
    rx_rx_claim_id_code VARCHAR2(35),
    phm_member_id VARCHAR2(50),
    clm_pharmacy_id_nm VARCHAR2(35),
    rx_fill_date_id DATE,
    drug_code VARCHAR2(15),
    mem_quantity_dispensed_id NUMBER(10, 2),
    mem_days_supply NUMBER(3),
    phm_billed_amount_id NUMBER(10, 2),
    clm_paid_amount_code NUMBER(10, 2),
    drg_prescriber_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_4 (
    rx_claim_id_nm VARCHAR2(35),
    phm_member_id_val VARCHAR2(50),
    sub_pharmacy_id_code VARCHAR2(35),
    mem_fill_date_val DATE,
    phm_drug_code VARCHAR2(15),
    mem_quantity_dispensed_id NUMBER(10, 2),
    clm_days_supply_id NUMBER(3),
    rx_billed_amount_nm NUMBER(10, 2),
    mem_paid_amount_code NUMBER(10, 2),
    mem_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_5 (
    sub_rx_claim_id_code VARCHAR2(35),
    rx_member_id VARCHAR2(50),
    drg_pharmacy_id_code VARCHAR2(35),
    phm_fill_date_nm DATE,
    sub_drug_code_nm VARCHAR2(15),
    rx_quantity_dispensed_nm NUMBER(10, 2),
    mem_days_supply_val NUMBER(3),
    billed_amount_id NUMBER(10, 2),
    phm_paid_amount_nm NUMBER(10, 2),
    prescriber_id_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_6 (
    sub_rx_claim_id_code VARCHAR2(35),
    mem_member_id_nm VARCHAR2(50),
    clm_pharmacy_id_nm VARCHAR2(35),
    rx_fill_date_val DATE,
    drg_drug_code_code VARCHAR2(15),
    phm_quantity_dispensed NUMBER(10, 2),
    mem_days_supply_code NUMBER(3),
    mem_billed_amount_val NUMBER(10, 2),
    mem_paid_amount_val NUMBER(10, 2),
    prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_7 (
    rx_rx_claim_id_nm VARCHAR2(35),
    rx_member_id_id VARCHAR2(50),
    phm_pharmacy_id_id VARCHAR2(35),
    drg_fill_date_id DATE,
    drg_drug_code VARCHAR2(15),
    sub_quantity_dispensed NUMBER(10, 2),
    mem_days_supply_id NUMBER(3),
    mem_billed_amount_code NUMBER(10, 2),
    sub_paid_amount_id NUMBER(10, 2),
    rx_prescriber_id_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_8 (
    mem_rx_claim_id_val VARCHAR2(35),
    clm_member_id_code VARCHAR2(50),
    clm_pharmacy_id_id VARCHAR2(35),
    rx_fill_date_val DATE,
    drg_drug_code VARCHAR2(15),
    mem_quantity_dispensed_code NUMBER(10, 2),
    drg_days_supply NUMBER(3),
    drg_billed_amount_nm NUMBER(10, 2),
    sub_paid_amount_nm NUMBER(10, 2),
    rx_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_9 (
    rx_claim_id_id VARCHAR2(35),
    sub_member_id VARCHAR2(50),
    clm_pharmacy_id VARCHAR2(35),
    fill_date_val DATE,
    drg_drug_code_val VARCHAR2(15),
    rx_quantity_dispensed_val NUMBER(10, 2),
    mem_days_supply_code NUMBER(3),
    billed_amount_nm NUMBER(10, 2),
    rx_paid_amount_val NUMBER(10, 2),
    drg_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_10 (
    drg_rx_claim_id_id VARCHAR2(35),
    member_id_code VARCHAR2(50),
    phm_pharmacy_id VARCHAR2(35),
    sub_fill_date_nm DATE,
    mem_drug_code_nm VARCHAR2(15),
    rx_quantity_dispensed_nm NUMBER(10, 2),
    drg_days_supply_id NUMBER(3),
    mem_billed_amount_id NUMBER(10, 2),
    paid_amount_val NUMBER(10, 2),
    mem_prescriber_id_val VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_11 (
    sub_rx_claim_id_nm VARCHAR2(35),
    member_id_nm VARCHAR2(50),
    drg_pharmacy_id_code VARCHAR2(35),
    drg_fill_date_id DATE,
    drug_code_code VARCHAR2(15),
    sub_quantity_dispensed_val NUMBER(10, 2),
    sub_days_supply NUMBER(3),
    drg_billed_amount_nm NUMBER(10, 2),
    paid_amount NUMBER(10, 2),
    rx_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_12 (
    clm_rx_claim_id_val VARCHAR2(35),
    phm_member_id_id VARCHAR2(50),
    sub_pharmacy_id VARCHAR2(35),
    drg_fill_date DATE,
    sub_drug_code_id VARCHAR2(15),
    phm_quantity_dispensed_nm NUMBER(10, 2),
    rx_days_supply NUMBER(3),
    drg_billed_amount_code NUMBER(10, 2),
    sub_paid_amount_nm NUMBER(10, 2),
    drg_prescriber_id_nm VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_13 (
    drg_rx_claim_id_nm VARCHAR2(35),
    clm_member_id VARCHAR2(50),
    rx_pharmacy_id_id VARCHAR2(35),
    clm_fill_date_val DATE,
    rx_drug_code_code VARCHAR2(15),
    mem_quantity_dispensed NUMBER(10, 2),
    drg_days_supply_val NUMBER(3),
    clm_billed_amount_code NUMBER(10, 2),
    clm_paid_amount_val NUMBER(10, 2),
    phm_prescriber_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_14 (
    drg_rx_claim_id_nm VARCHAR2(35),
    phm_member_id_code VARCHAR2(50),
    sub_pharmacy_id_nm VARCHAR2(35),
    mem_fill_date_id DATE,
    phm_drug_code_code VARCHAR2(15),
    mem_quantity_dispensed_code NUMBER(10, 2),
    drg_days_supply_id NUMBER(3),
    billed_amount_id NUMBER(10, 2),
    mem_paid_amount_nm NUMBER(10, 2),
    rx_prescriber_id_code VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_15 (
    clm_rx_claim_id_val VARCHAR2(35),
    sub_member_id_val VARCHAR2(50),
    drg_pharmacy_id_nm VARCHAR2(35),
    rx_fill_date_nm DATE,
    drg_drug_code VARCHAR2(15),
    sub_quantity_dispensed_val NUMBER(10, 2),
    clm_days_supply_id NUMBER(3),
    drg_billed_amount_nm NUMBER(10, 2),
    paid_amount_nm NUMBER(10, 2),
    mem_prescriber_id_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_16 (
    phm_rx_claim_id_nm VARCHAR2(35),
    clm_member_id_id VARCHAR2(50),
    mem_pharmacy_id_val VARCHAR2(35),
    phm_fill_date_id DATE,
    drg_drug_code VARCHAR2(15),
    rx_quantity_dispensed_nm NUMBER(10, 2),
    days_supply_nm NUMBER(3),
    clm_billed_amount_nm NUMBER(10, 2),
    phm_paid_amount_id NUMBER(10, 2),
    mem_prescriber_id_val VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_17 (
    drg_rx_claim_id VARCHAR2(35),
    sub_member_id_val VARCHAR2(50),
    pharmacy_id_val VARCHAR2(35),
    fill_date_id DATE,
    phm_drug_code_nm VARCHAR2(15),
    sub_quantity_dispensed_nm NUMBER(10, 2),
    rx_days_supply_code NUMBER(3),
    mem_billed_amount_nm NUMBER(10, 2),
    clm_paid_amount_val NUMBER(10, 2),
    sub_prescriber_id_code VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_18 (
    clm_rx_claim_id_nm VARCHAR2(35),
    mem_member_id_id VARCHAR2(50),
    mem_pharmacy_id_id VARCHAR2(35),
    rx_fill_date DATE,
    sub_drug_code_val VARCHAR2(15),
    phm_quantity_dispensed NUMBER(10, 2),
    sub_days_supply_id NUMBER(3),
    rx_billed_amount_id NUMBER(10, 2),
    phm_paid_amount_id NUMBER(10, 2),
    sub_prescriber_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_19 (
    sub_rx_claim_id_val VARCHAR2(35),
    member_id_val VARCHAR2(50),
    pharmacy_id_nm VARCHAR2(35),
    phm_fill_date_id DATE,
    phm_drug_code VARCHAR2(15),
    quantity_dispensed_val NUMBER(10, 2),
    sub_days_supply_id NUMBER(3),
    mem_billed_amount_id NUMBER(10, 2),
    paid_amount NUMBER(10, 2),
    drg_prescriber_id_id VARCHAR2(35)
);

CREATE TABLE rxclaims_payer_20 (
    drg_rx_claim_id_code VARCHAR2(35),
    sub_member_id VARCHAR2(50),
    rx_pharmacy_id_val VARCHAR2(35),
    sub_fill_date DATE,
    drg_drug_code VARCHAR2(15),
    phm_quantity_dispensed_nm NUMBER(10, 2),
    days_supply_val NUMBER(3),
    drg_billed_amount_nm NUMBER(10, 2),
    paid_amount_val NUMBER(10, 2),
    clm_prescriber_id VARCHAR2(35)
);

