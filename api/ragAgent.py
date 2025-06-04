from prompt.templates import template
from chain.chains import guardrail_chain, feature_extractor_chain, auditor_chain, fixer_chain
from utils.config import Config
from utils.logger import Logger

config = Config()
logger = Logger.get_logger(name=config.app_name, level=config.log_level)

# These values should come from RAG based on extracted features
src_dm = """CREATE TABLE eligibility_payer_1 (
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
"""

src_dd = """column_name: sub_member_id
data_type: varchar
column_description: Unique identifier for the subscriber or member

column_name: first_name_code
data_type: varchar
column_description: Encoded or raw value representing member’s first name

column_name: mem_last_name
data_type: varchar
column_description: Member’s last name

column_name: sub_date_of_birth_val
data_type: date
column_description: Subscriber’s date of birth

column_name: mem_gender_val
data_type: char
column_description: Gender of the member (e.g., M, F, U)

column_name: address_id
data_type: varchar
column_description: Raw or standardized address identifier

column_name: city_code
data_type: varchar
column_description: City name or code

column_name: state_nm
data_type: char
column_description: Two-letter U.S. state code

column_name: sub_zip_code_id
data_type: varchar
column_description: ZIP or ZIP+4 postal code for subscriber

column_name: sub_plan_id_code
data_type: varchar
column_description: Plan identifier code assigned to the subscriber

column_name: mem_group_number_code
data_type: varchar
column_description: Group number associated with the member

column_name: coverage_start_date_val
data_type: date
column_description: Raw or source coverage start date

column_name: coverage_end_date_id
data_type: date
column_description: Raw or source coverage end date
"""

tar_dm = """CREATE TABLE standard_eligibility (
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
"""

tar_dd = """column_name: member_id
data_type: varchar
column_description: Unique identifier for the member

column_name: first_name
data_type: varchar
column_description: The member’s first name. If the member is the subscriber, report the subscriber’s first name.

column_name: last_name
data_type: varchar
column_description: The member’s last name. If the member is the subscriber, report the subscriber’s last name.

column_name: date_of_birth
data_type: date
column_description: Date of birth of the member. If the member is the subscriber, report the subscriber’s date of birth. YYYYMMDD.

column_name: gender
data_type: char
column_description: Sex of the member. M=Male; F=Female; U=UNKNOWN. Member sex represents biological or administrative sex. Where available, submitters should provide the sex the member was assigned at birth on their original birth certificate (natal sex). When this is not available, submitters may provide the values they have access to regarding physical or legal sex (e.g., administrative sex as categorized by X12 values). If the member is the subscriber, report the subscriber’s sex.

column_name: address
data_type: varchar
column_description: First line of street address of member’s residence. If the member is the subscriber, report the street address of the subscriber’s residence.

column_name: city
data_type: varchar
column_description: City location of member’s residence. If the member is the subscriber, report the city location of the subscriber’s residence.

column_name: state
data_type: char
column_description: State or province of member’s residence. If the member is the subscriber, report the state or province of the subscriber’s residence. State or Province codes are maintained by the US Postal Service. See Appendix L: External Code Sources, United States Postal Service.

column_name: zip_code
data_type: varchar
column_description: Report the 5 or 9-digit ZIP Code of the member’s residence. If the member is the subscriber, report the Zip Code of the subscriber’s residence. When submitting the 9-digit ZIP Code do not include hyphen. If using 5 digits, do not fill last 4 digits with 0. ZIP Codes are maintained by the US Postal Service. See Appendix L: External Code Sources.

column_name: plan_id
data_type: varchar
column_description: CMS National Plan ID. The National Plan ID is a code assigned by CMS. (PLACEHOLDER)

column_name: group_number
data_type: varchar
column_description: The identification number, or code assigned by the carrier or administrator to identify the group under which the individual is covered. ME006 is not the number that uniquely identifies the subscriber. If no group or policy number is available, leave blank. If the coverage is Medicaid, then report a value of “IND”. If a policy is sold to an individual as a non-group policy, then report with a value of “IND”.

column_name: coverage_start_date
data_type: date
column_description: YYYYMMDD. Effective date of coverage; Date eligibility started for this member under this plan type. The purpose of this data element is to maintain an eligibility span for each member.

column_name: coverage_end_date
data_type: date
column_description: YYYYMMDD. Last continuous day of coverage (date eligibility ended) for this member under this plan. The purpose of this data element is to maintain an eligibility span for each member. For open contracts, leave blank.

column_name: coverage_level_code
data_type: char
column_description: Benefit coverage level selected: CHD=Children Only; DEP=Dependents Only; ECH=Subscriber and Children/Dependents; EMP=Subscriber Only; ESP=Subscriber and Spouse/Life Partner; FAM=Family; SPC=Spouse/Life Partner and Children/Dependents; SPO=Spouse/Life Partner Only.

column_name: subscriber_indicator
data_type: char
column_description: Indicator if the member is the primary subscriber (Y/N)

column_name: product_category_code
data_type: char
column_description: See Appendix J: Insurance/Product Category for codes. Use the most granular choice available.

column_name: plan_type
data_type: char
column_description: This field identifies which entity holds the risk. ASW=Self-funded plans administered by a TPA, where the employer has purchased stop-loss, or group excess insurance coverage; ASO=Self- funded plans administered by a TPA, where the employer has not purchased stop-loss, or group excess insurance coverage; STN=Short-term, non-renewable health insurance (e.g., COBRA); UND=Plans underwritten by the insurer (i.e., fully insured group and individual policies); MEW=Associations/Trusts and Multiple Employer Welfare Arrangements; OTH=Any other plan (e.g., student health plan). States may require prior approval to use OTH.

column_name: market_category_code
data_type: varchar
column_description: Code for identifying market category. See Appendix K: Market Category Codes which defines the market category by size and or association to which the policy is directly sold and issued. Report subscribers (not employees).
"""

def transform_response(feature_extractor: dict, auditor: dict, fixer: dict):
    # feature_message = f"""**Tables:** \n {feature_extractor.get("tables")} \n **Columns:** \n {feature_extractor.get("columns")}"""
    # auditor_message = f"""\n {auditor.get("remarks", "")} \n {auditor.get("issues", "")}"""
    # fixed_message = f"""\n{fixer.get("remarks", "")} \n {fixer.get("correct_script", "")}"""
    # message = f"""{feature_message} \n {auditor_message} \n {fixed_message}"""
    message = f"{feature_extractor.get('markdown', '')} \n {auditor.get('markdown', '')} \n {fixer.get('markdown', '')}"
    return message

def start_chat(question):
    chat_history = []

    logger.debug(f"***Received question:\n{question}")

    ai_message_guardrail = guardrail_chain.invoke({"history": chat_history, "question": question})
    logger.debug(f"***Guardrail AI Message:\n{ai_message_guardrail}")

    ai_message_feature_extractor = feature_extractor_chain.invoke({"history": chat_history, "question": question})
    logger.debug(f"***Feature Extractor AI Message:\n{ai_message_feature_extractor}")

    context = template["context"].invoke({"src_dm": src_dm, "src_dd": src_dd, "tar_dm": tar_dm, "tar_dd": tar_dd})
    logger.debug(f"***Context:\n{context.to_string()}")

    ai_message_auditor = auditor_chain.invoke({"history": chat_history, "context": context, "question": question})
    logger.debug(f"***Auditor AI Message:\n{ai_message_auditor}")

    ai_message_fixer = fixer_chain.invoke({"history": chat_history, "audit": ai_message_auditor, "context": context, "question": question})
    logger.debug(f"***Fixer AI Message:\n{ai_message_fixer}")

    response = transform_response(ai_message_feature_extractor, ai_message_auditor, ai_message_fixer)
    return response
