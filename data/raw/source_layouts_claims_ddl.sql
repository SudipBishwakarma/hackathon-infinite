CREATE TABLE claims_uhc (
    drg_claim_id_id VARCHAR2(35),
    mem_member_id_id VARCHAR2(50),
    sub_service_date_code DATE,
    phm_admission_date_nm DATE,
    mem_discharge_date_val DATE,
    mem_procedure_code_val VARCHAR2(10),
    diagnosis_code VARCHAR2(10),
    clm_billed_amount_nm NUMBER(10, 2),
    drg_paid_amount NUMBER(10, 2),
    sub_provider_id_val VARCHAR2(35),
    phm_claim_status_code VARCHAR2(20)
);

CREATE TABLE claims_antm (
    rx_claim_id_id VARCHAR2(35),
    clm_member_id_val VARCHAR2(50),
    mem_service_date DATE,
    phm_admission_date_code DATE,
    drg_discharge_date_val DATE,
    procedure_code_id VARCHAR2(10),
    diagnosis_code_nm VARCHAR2(10),
    billed_amount_nm NUMBER(10, 2),
    clm_paid_amount_nm NUMBER(10, 2),
    sub_provider_id_val VARCHAR2(35),
    drg_claim_status_nm VARCHAR2(20)
);

CREATE TABLE claims_aet (
    clm_claim_id_id VARCHAR2(35),
    member_id_code VARCHAR2(50),
    clm_service_date DATE,
    mem_admission_date DATE,
    drg_discharge_date_id DATE,
    mem_procedure_code_val VARCHAR2(10),
    clm_diagnosis_code_id VARCHAR2(10),
    rx_billed_amount_val NUMBER(10, 2),
    paid_amount_val NUMBER(10, 2),
    provider_id_val VARCHAR2(35),
    rx_claim_status_id VARCHAR2(20)
);

CREATE TABLE claims_ci (
    mem_claim_id VARCHAR2(35),
    member_id_val VARCHAR2(50),
    sub_service_date_id DATE,
    drg_admission_date_code DATE,
    clm_discharge_date_id DATE,
    phm_procedure_code_nm VARCHAR2(10),
    phm_diagnosis_code_nm VARCHAR2(10),
    mem_billed_amount_id NUMBER(10, 2),
    clm_paid_amount_code NUMBER(10, 2),
    sub_provider_id_val VARCHAR2(35),
    rx_claim_status_code VARCHAR2(20)
);

CREATE TABLE claims_hum (
    mem_claim_id_id VARCHAR2(35),
    rx_member_id_id VARCHAR2(50),
    rx_service_date DATE,
    phm_admission_date DATE,
    discharge_date_val DATE,
    phm_procedure_code_val VARCHAR2(10),
    phm_diagnosis_code VARCHAR2(10),
    drg_billed_amount_id NUMBER(10, 2),
    paid_amount NUMBER(10, 2),
    rx_provider_id_code VARCHAR2(35),
    clm_claim_status VARCHAR2(20)
);

CREATE TABLE claims_kp (
    clm_claim_id VARCHAR2(35),
    mem_member_id_val VARCHAR2(50),
    sub_service_date DATE,
    phm_admission_date DATE,
    phm_discharge_date DATE,
    rx_procedure_code_nm VARCHAR2(10),
    diagnosis_code_nm VARCHAR2(10),
    mem_billed_amount_val NUMBER(10, 2),
    rx_paid_amount_code NUMBER(10, 2),
    drg_provider_id_code VARCHAR2(35),
    sub_claim_status_id VARCHAR2(20)
);

CREATE TABLE claims_cnc (
    sub_claim_id_val VARCHAR2(35),
    rx_member_id_id VARCHAR2(50),
    service_date_nm DATE,
    clm_admission_date_id DATE,
    phm_discharge_date_val DATE,
    rx_procedure_code_id VARCHAR2(10),
    rx_diagnosis_code_val VARCHAR2(10),
    sub_billed_amount_id NUMBER(10, 2),
    sub_paid_amount_val NUMBER(10, 2),
    phm_provider_id VARCHAR2(35),
    claim_status_id VARCHAR2(20)
);

CREATE TABLE claims_moh (
    claim_id_nm VARCHAR2(35),
    clm_member_id_val VARCHAR2(50),
    drg_service_date_val DATE,
    sub_admission_date DATE,
    discharge_date_val DATE,
    phm_procedure_code_code VARCHAR2(10),
    rx_diagnosis_code VARCHAR2(10),
    clm_billed_amount_nm NUMBER(10, 2),
    rx_paid_amount NUMBER(10, 2),
    mem_provider_id VARCHAR2(35),
    rx_claim_status_val VARCHAR2(20)
);

CREATE TABLE claims_bcbsa (
    sub_claim_id VARCHAR2(35),
    mem_member_id_nm VARCHAR2(50),
    clm_service_date_val DATE,
    mem_admission_date DATE,
    drg_discharge_date_nm DATE,
    clm_procedure_code_val VARCHAR2(10),
    clm_diagnosis_code_nm VARCHAR2(10),
    phm_billed_amount_val NUMBER(10, 2),
    phm_paid_amount_val NUMBER(10, 2),
    sub_provider_id_code VARCHAR2(35),
    phm_claim_status_code VARCHAR2(20)
);

CREATE TABLE claims_hcsc (
    drg_claim_id_nm VARCHAR2(35),
    rx_member_id VARCHAR2(50),
    sub_service_date_val DATE,
    rx_admission_date_val DATE,
    sub_discharge_date_code DATE,
    clm_procedure_code_code VARCHAR2(10),
    sub_diagnosis_code VARCHAR2(10),
    sub_billed_amount_code NUMBER(10, 2),
    paid_amount_nm NUMBER(10, 2),
    drg_provider_id_code VARCHAR2(35),
    rx_claim_status VARCHAR2(20)
);

CREATE TABLE claims_hmi (
    claim_id_val VARCHAR2(35),
    clm_member_id_nm VARCHAR2(50),
    sub_service_date_val DATE,
    mem_admission_date_nm DATE,
    clm_discharge_date_val DATE,
    clm_procedure_code_val VARCHAR2(10),
    sub_diagnosis_code_id VARCHAR2(10),
    billed_amount NUMBER(10, 2),
    sub_paid_amount_code NUMBER(10, 2),
    sub_provider_id_code VARCHAR2(35),
    claim_status_val VARCHAR2(20)
);

CREATE TABLE claims_ghp (
    sub_claim_id_val VARCHAR2(35),
    sub_member_id_nm VARCHAR2(50),
    rx_service_date_id DATE,
    drg_admission_date DATE,
    sub_discharge_date_val DATE,
    rx_procedure_code_nm VARCHAR2(10),
    phm_diagnosis_code VARCHAR2(10),
    mem_billed_amount_id NUMBER(10, 2),
    paid_amount_id NUMBER(10, 2),
    provider_id_code VARCHAR2(35),
    sub_claim_status_nm VARCHAR2(20)
);

CREATE TABLE claims_upmc (
    mem_claim_id_nm VARCHAR2(35),
    phm_member_id_code VARCHAR2(50),
    phm_service_date_nm DATE,
    phm_admission_date_val DATE,
    drg_discharge_date_nm DATE,
    mem_procedure_code VARCHAR2(10),
    drg_diagnosis_code_id VARCHAR2(10),
    mem_billed_amount NUMBER(10, 2),
    rx_paid_amount_val NUMBER(10, 2),
    mem_provider_id_val VARCHAR2(35),
    drg_claim_status VARCHAR2(20)
);

CREATE TABLE claims_ibc (
    sub_claim_id_code VARCHAR2(35),
    member_id_code VARCHAR2(50),
    rx_service_date DATE,
    phm_admission_date_id DATE,
    mem_discharge_date_code DATE,
    procedure_code_id VARCHAR2(10),
    mem_diagnosis_code_val VARCHAR2(10),
    drg_billed_amount_id NUMBER(10, 2),
    paid_amount_nm NUMBER(10, 2),
    sub_provider_id_val VARCHAR2(35),
    phm_claim_status_code VARCHAR2(20)
);

CREATE TABLE claims_hphc (
    sub_claim_id_val VARCHAR2(35),
    phm_member_id VARCHAR2(50),
    mem_service_date_nm DATE,
    admission_date DATE,
    clm_discharge_date DATE,
    procedure_code VARCHAR2(10),
    diagnosis_code_id VARCHAR2(10),
    drg_billed_amount_val NUMBER(10, 2),
    paid_amount_id NUMBER(10, 2),
    provider_id_code VARCHAR2(35),
    rx_claim_status_nm VARCHAR2(20)
);

CREATE TABLE claims_thp (
    drg_claim_id_id VARCHAR2(35),
    phm_member_id_code VARCHAR2(50),
    service_date_nm DATE,
    rx_admission_date_nm DATE,
    discharge_date_id DATE,
    phm_procedure_code_val VARCHAR2(10),
    mem_diagnosis_code_nm VARCHAR2(10),
    billed_amount_nm NUMBER(10, 2),
    paid_amount_val NUMBER(10, 2),
    mem_provider_id_nm VARCHAR2(35),
    drg_claim_status_id VARCHAR2(20)
);

CREATE TABLE claims_wcg (
    mem_claim_id VARCHAR2(35),
    phm_member_id_code VARCHAR2(50),
    rx_service_date_code DATE,
    phm_admission_date_val DATE,
    drg_discharge_date DATE,
    phm_procedure_code VARCHAR2(10),
    phm_diagnosis_code_code VARCHAR2(10),
    rx_billed_amount NUMBER(10, 2),
    rx_paid_amount_val NUMBER(10, 2),
    rx_provider_id VARCHAR2(35),
    claim_status_val VARCHAR2(20)
);

CREATE TABLE claims_tri (
    clm_claim_id_id VARCHAR2(35),
    drg_member_id_val VARCHAR2(50),
    phm_service_date_val DATE,
    admission_date_code DATE,
    clm_discharge_date DATE,
    rx_procedure_code_id VARCHAR2(10),
    mem_diagnosis_code_code VARCHAR2(10),
    billed_amount NUMBER(10, 2),
    mem_paid_amount NUMBER(10, 2),
    mem_provider_id VARCHAR2(35),
    sub_claim_status_code VARCHAR2(20)
);

CREATE TABLE claims_mcr (
    phm_claim_id_code VARCHAR2(35),
    rx_member_id_nm VARCHAR2(50),
    drg_service_date_val DATE,
    sub_admission_date DATE,
    rx_discharge_date_nm DATE,
    clm_procedure_code_nm VARCHAR2(10),
    rx_diagnosis_code_nm VARCHAR2(10),
    sub_billed_amount_id NUMBER(10, 2),
    sub_paid_amount_id NUMBER(10, 2),
    sub_provider_id VARCHAR2(35),
    rx_claim_status_val VARCHAR2(20)
);

CREATE TABLE claims_mcd (
    sub_claim_id_nm VARCHAR2(35),
    sub_member_id_code VARCHAR2(50),
    phm_service_date_nm DATE,
    sub_admission_date_val DATE,
    phm_discharge_date_id DATE,
    procedure_code_id VARCHAR2(10),
    rx_diagnosis_code_code VARCHAR2(10),
    rx_billed_amount NUMBER(10, 2),
    mem_paid_amount_code NUMBER(10, 2),
    mem_provider_id VARCHAR2(35),
    clm_claim_status VARCHAR2(20)
);

