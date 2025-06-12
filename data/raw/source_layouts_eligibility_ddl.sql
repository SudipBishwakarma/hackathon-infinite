CREATE TABLE eligibility_uhc (
    sub_member_id VARCHAR2(50),
    first_name_code VARCHAR2(35),
    mem_last_name VARCHAR2(60),
    sub_date_of_birth_val DATE,
    mem_gender_val CHAR(1),
    address_id VARCHAR2(100),
    city_code VARCHAR2(30),
    state_nm CHAR(2),
    sub_zip_code_id VARCHAR2(9),
    sub_plan_id_code VARCHAR2(30),
    mem_group_number_code VARCHAR2(50),
    coverage_start_date_val DATE,
    coverage_end_date_id DATE
);

CREATE TABLE eligibility_antm (
    mem_member_id_nm VARCHAR2(50),
    first_name_code VARCHAR2(35),
    last_name_nm VARCHAR2(60),
    date_of_birth DATE,
    sub_gender_val CHAR(1),
    address_val VARCHAR2(100),
    city VARCHAR2(30),
    state_nm CHAR(2),
    zip_code_code VARCHAR2(9),
    plan_id_code VARCHAR2(30),
    group_number_val VARCHAR2(50),
    coverage_start_date_val DATE,
    mem_coverage_end_date_val DATE
);

CREATE TABLE eligibility_aet (
    mem_member_id_nm VARCHAR2(50),
    first_name_id VARCHAR2(35),
    last_name VARCHAR2(60),
    sub_date_of_birth_code DATE,
    gender_val CHAR(1),
    mem_address VARCHAR2(100),
    city VARCHAR2(30),
    mem_state_val CHAR(2),
    zip_code_id VARCHAR2(9),
    plan_id_nm VARCHAR2(30),
    mem_group_number_code VARCHAR2(50),
    sub_coverage_start_date_nm DATE,
    coverage_end_date_nm DATE
);

CREATE TABLE eligibility_ci (
    member_id_val VARCHAR2(50),
    mem_first_name_val VARCHAR2(35),
    last_name_code VARCHAR2(60),
    date_of_birth DATE,
    gender_id CHAR(1),
    address VARCHAR2(100),
    city_val VARCHAR2(30),
    state_val CHAR(2),
    mem_zip_code_code VARCHAR2(9),
    plan_id_val VARCHAR2(30),
    mem_group_number VARCHAR2(50),
    mem_coverage_start_date_val DATE,
    coverage_end_date_nm DATE
);

CREATE TABLE eligibility_hum (
    mem_member_id_id VARCHAR2(50),
    first_name_id VARCHAR2(35),
    mem_last_name_val VARCHAR2(60),
    date_of_birth DATE,
    gender_code CHAR(1),
    sub_address_nm VARCHAR2(100),
    sub_city_nm VARCHAR2(30),
    sub_state CHAR(2),
    mem_zip_code VARCHAR2(9),
    plan_id VARCHAR2(30),
    group_number VARCHAR2(50),
    mem_coverage_start_date_val DATE,
    sub_coverage_end_date_id DATE
);

CREATE TABLE eligibility_kp (
    mem_member_id VARCHAR2(50),
    mem_first_name_nm VARCHAR2(35),
    last_name_code VARCHAR2(60),
    mem_date_of_birth_code DATE,
    sub_gender_code CHAR(1),
    mem_address_id VARCHAR2(100),
    sub_city_id VARCHAR2(30),
    state_code CHAR(2),
    mem_zip_code_id VARCHAR2(9),
    plan_id_nm VARCHAR2(30),
    group_number_code VARCHAR2(50),
    sub_coverage_start_date_nm DATE,
    sub_coverage_end_date_code DATE
);

CREATE TABLE eligibility_cnc (
    member_id_nm VARCHAR2(50),
    first_name_val VARCHAR2(35),
    sub_last_name_val VARCHAR2(60),
    date_of_birth_code DATE,
    gender CHAR(1),
    address_val VARCHAR2(100),
    mem_city_nm VARCHAR2(30),
    state_val CHAR(2),
    zip_code_id VARCHAR2(9),
    plan_id VARCHAR2(30),
    group_number_id VARCHAR2(50),
    coverage_start_date DATE,
    coverage_end_date_code DATE
);

CREATE TABLE eligibility_moh (
    member_id VARCHAR2(50),
    mem_first_name_nm VARCHAR2(35),
    mem_last_name VARCHAR2(60),
    mem_date_of_birth_val DATE,
    gender_id CHAR(1),
    address_nm VARCHAR2(100),
    mem_city_id VARCHAR2(30),
    state_nm CHAR(2),
    sub_zip_code_id VARCHAR2(9),
    plan_id VARCHAR2(30),
    group_number VARCHAR2(50),
    sub_coverage_start_date DATE,
    sub_coverage_end_date_nm DATE
);

CREATE TABLE eligibility_bcbsa (
    sub_member_id_nm VARCHAR2(50),
    first_name_nm VARCHAR2(35),
    last_name_nm VARCHAR2(60),
    date_of_birth_nm DATE,
    gender CHAR(1),
    address VARCHAR2(100),
    mem_city_id VARCHAR2(30),
    state_code CHAR(2),
    zip_code VARCHAR2(9),
    mem_plan_id VARCHAR2(30),
    group_number_code VARCHAR2(50),
    mem_coverage_start_date_code DATE,
    sub_coverage_end_date DATE
);

CREATE TABLE eligibility_hcsc (
    sub_member_id_id VARCHAR2(50),
    sub_first_name_code VARCHAR2(35),
    last_name_id VARCHAR2(60),
    date_of_birth DATE,
    mem_gender_code CHAR(1),
    address_nm VARCHAR2(100),
    city VARCHAR2(30),
    sub_state_val CHAR(2),
    mem_zip_code_id VARCHAR2(9),
    sub_plan_id_code VARCHAR2(30),
    sub_group_number_nm VARCHAR2(50),
    mem_coverage_start_date DATE,
    coverage_end_date_id DATE
);

CREATE TABLE eligibility_hmi (
    mem_member_id_val VARCHAR2(50),
    mem_first_name_val VARCHAR2(35),
    last_name_id VARCHAR2(60),
    sub_date_of_birth_id DATE,
    sub_gender_val CHAR(1),
    mem_address VARCHAR2(100),
    city_val VARCHAR2(30),
    state CHAR(2),
    zip_code_nm VARCHAR2(9),
    plan_id_code VARCHAR2(30),
    group_number_code VARCHAR2(50),
    coverage_start_date_nm DATE,
    coverage_end_date_code DATE
);

CREATE TABLE eligibility_ghp (
    mem_member_id_id VARCHAR2(50),
    first_name_code VARCHAR2(35),
    last_name_code VARCHAR2(60),
    mem_date_of_birth_id DATE,
    mem_gender_nm CHAR(1),
    sub_address_id VARCHAR2(100),
    sub_city VARCHAR2(30),
    sub_state_id CHAR(2),
    zip_code_code VARCHAR2(9),
    plan_id VARCHAR2(30),
    group_number_code VARCHAR2(50),
    coverage_start_date DATE,
    coverage_end_date DATE
);

CREATE TABLE eligibility_upmc (
    mem_member_id_code VARCHAR2(50),
    mem_first_name_code VARCHAR2(35),
    last_name_val VARCHAR2(60),
    date_of_birth DATE,
    mem_gender_id CHAR(1),
    mem_address VARCHAR2(100),
    city VARCHAR2(30),
    sub_state_id CHAR(2),
    zip_code_nm VARCHAR2(9),
    plan_id_code VARCHAR2(30),
    group_number VARCHAR2(50),
    coverage_start_date_id DATE,
    mem_coverage_end_date_nm DATE
);

CREATE TABLE eligibility_ibc (
    sub_member_id_id VARCHAR2(50),
    first_name_nm VARCHAR2(35),
    last_name VARCHAR2(60),
    date_of_birth DATE,
    sub_gender_nm CHAR(1),
    address_val VARCHAR2(100),
    city_code VARCHAR2(30),
    state_val CHAR(2),
    zip_code_id VARCHAR2(9),
    mem_plan_id_val VARCHAR2(30),
    mem_group_number VARCHAR2(50),
    mem_coverage_start_date_nm DATE,
    mem_coverage_end_date_code DATE
);

CREATE TABLE eligibility_hphc (
    member_id_val VARCHAR2(50),
    sub_first_name_val VARCHAR2(35),
    last_name VARCHAR2(60),
    mem_date_of_birth DATE,
    gender_val CHAR(1),
    address_code VARCHAR2(100),
    sub_city_nm VARCHAR2(30),
    state_nm CHAR(2),
    mem_zip_code VARCHAR2(9),
    mem_plan_id VARCHAR2(30),
    group_number_nm VARCHAR2(50),
    coverage_start_date_nm DATE,
    mem_coverage_end_date DATE
);

CREATE TABLE eligibility_thp (
    member_id_val VARCHAR2(50),
    first_name_val VARCHAR2(35),
    mem_last_name_nm VARCHAR2(60),
    mem_date_of_birth_code DATE,
    sub_gender_val CHAR(1),
    mem_address_nm VARCHAR2(100),
    sub_city_id VARCHAR2(30),
    state_val CHAR(2),
    zip_code VARCHAR2(9),
    mem_plan_id_id VARCHAR2(30),
    sub_group_number_id VARCHAR2(50),
    coverage_start_date_id DATE,
    coverage_end_date_id DATE
);

CREATE TABLE eligibility_wcg (
    member_id_id VARCHAR2(50),
    sub_first_name_code VARCHAR2(35),
    last_name_id VARCHAR2(60),
    date_of_birth_nm DATE,
    mem_gender CHAR(1),
    address VARCHAR2(100),
    city VARCHAR2(30),
    sub_state CHAR(2),
    zip_code VARCHAR2(9),
    mem_plan_id_code VARCHAR2(30),
    group_number VARCHAR2(50),
    coverage_start_date_val DATE,
    sub_coverage_end_date_val DATE
);

CREATE TABLE eligibility_tri (
    mem_member_id_nm VARCHAR2(50),
    mem_first_name VARCHAR2(35),
    last_name_code VARCHAR2(60),
    mem_date_of_birth DATE,
    gender_nm CHAR(1),
    address_val VARCHAR2(100),
    mem_city VARCHAR2(30),
    state_nm CHAR(2),
    mem_zip_code_val VARCHAR2(9),
    plan_id_nm VARCHAR2(30),
    group_number_code VARCHAR2(50),
    coverage_start_date_val DATE,
    sub_coverage_end_date_code DATE
);

CREATE TABLE eligibility_mcr (
    sub_member_id_nm VARCHAR2(50),
    mem_first_name_nm VARCHAR2(35),
    last_name_val VARCHAR2(60),
    date_of_birth_nm DATE,
    sub_gender_val CHAR(1),
    address_id VARCHAR2(100),
    mem_city_nm VARCHAR2(30),
    state_val CHAR(2),
    sub_zip_code_val VARCHAR2(9),
    mem_plan_id_id VARCHAR2(30),
    group_number_code VARCHAR2(50),
    sub_coverage_start_date_val DATE,
    coverage_end_date_val DATE
);

CREATE TABLE eligibility_mcd (
    sub_member_id_code VARCHAR2(50),
    first_name VARCHAR2(35),
    mem_last_name_code VARCHAR2(60),
    date_of_birth_nm DATE,
    sub_gender CHAR(1),
    address_val VARCHAR2(100),
    city_code VARCHAR2(30),
    state_val CHAR(2),
    sub_zip_code_id VARCHAR2(9),
    sub_plan_id_val VARCHAR2(30),
    mem_group_number_val VARCHAR2(50),
    mem_coverage_start_date DATE,
    sub_coverage_end_date_code DATE
);

