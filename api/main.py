from typing import List, AsyncGenerator
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse, HTMLResponse
from pydantic import BaseModel
from dotenv import load_dotenv

# from ragService import start_chat
import random

load_dotenv()

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace with frontend URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

responses = [
    """
    To determine if there are any missing required fields in the script, we need to review the provided context and identify the required fields for the file submissions. Based on the context, the following fields are mentioned as part of the header record:

1. **CDLHD001 - Record Type**: This is a required field with a maximum length of 2 characters, and the value should be "HD".
2. **CDLHD002 - Data Submitter Code**: This is a required field with a maximum length of 8 characters, which is an APCD-assigned identifier for the payer submitting the data file.

The context does not provide a complete list of all required fields for the entire file submission, only a partial list for the header record. To fully determine if there are any missing required fields, you would need access to the complete technical specifications or data dictionary that outlines all required fields for each type of record (header, data, trailer) in the file submission.

If you have access to the complete list of required fields and their specifications, you can compare it against the script to ensure all necessary fields are included. If not, you may need to consult the full documentation or data dictionary provided by the APCD to verify compliance.
    """,
    """
    The mapping script for `discharge_status` involves selecting and renaming the relevant column from different tables. In the context provided, `discharge_status` is mapped from:

1. `discharge_status_val` in the first block, which is selected from `claims_payer_13`.
2. `clm_discharge_status` in the second block, which is selected from `claims_payer_20`.
3. `discharge_status_id` in the third block, which is selected from `claims_payer_11`.

The script essentially standardizes the naming of the `discharge_status` field across different data sources, ensuring consistency in how this data is referenced and used in subsequent processes or analyses.
""",
"""
Based on the context provided, there is no explicit mention of null checks for `payer_id` in the table definitions or descriptions. The context primarily focuses on the structure and attributes of the tables related to eligibility, such as member information, coverage details, and medical home identifiers.

To implement null checks for `payer_id`, you would typically include constraints or validation logic in your PL/SQL scripts or database design. This could involve:

1. Adding a `NOT NULL` constraint to the `payer_id` column in the table definition, if applicable.
2. Implementing validation logic in your PL/SQL procedures or functions to check for null values before processing data.

Without specific details on the `payer_id` column or its usage in the provided context, it's not possible to determine if null checks are already in place. You would need to review the relevant scripts or database schema where `payer_id` is defined and used.
""",
"""
Based on the context provided, there are no explicit datatype mismatches mentioned. However, to identify potential datatype mismatches, we can examine the data elements and their types across different sections:

1. **Data Submitter Code**:
   - In all sections (CDLTR, CDLPR, CDLPV), the `Data Submitter Code` is consistently defined as `varchar` with a maximum length of 8.

2. **Payer Code**:
   - Similarly, the `Payer Code` is consistently defined as `varchar` with a maximum length of 8 across all sections.

Given this consistency in the definitions provided, there are no apparent datatype mismatches for the fields described. However, datatype mismatches could occur if:

- The actual data being submitted does not conform to these specified types and lengths.
- There are other parts of the system or database not covered in the provided context where these fields are defined differently.

To ensure there are no datatype mismatches, it is important to verify that all data submissions and database definitions adhere to the specified types and lengths.
""",
"""
Based on the provided context, the following column mappings are missing from the `claims_payer_9` table:

1. **ACO Identifier** (CDLME076) - varchar 30
2. **ACO Name** (CDLME077) - varchar 60
3. **Physician Organization Identifier** (CDLME078) - varchar 30
4. **Rendering Provider Street Address** (CDLMC163) - varchar 55
5. **Medical Record Number** (CDLMC164) - varchar 35

These fields are mentioned in the context but do not have corresponding columns in the `claims_payer_9` table.
""",
"""
# Context format for the model
Source layout:
```
CREATE TABLE eligibility_payer_1 (
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
 
```
Source layout data dictionary: 
```
column_name: sub_member_id
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
 
```
 
Target standard layout: 
```
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
 
```
 
Target standard layout data dictionary: 
```
column_name: member_id
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
 
```
"""
]

class ChatRequest(BaseModel):
    question: str
    history: List[dict]

@app.get("/")
def home():
    return HTMLResponse("<center><h1>API service is running...</h1></center>")

@app.post("/chat")
async def chat_stream(request: ChatRequest):
    def stream_response() -> AsyncGenerator[str, None]:
        # chat_history = request.history
        # user_input = request.question
        # response = start_chat(user_input, chat_history)
        # reply = response.choices[0].message.content
        # # Update chat history
        # chat_history.append({"role": "user", "content": user_input})
        # chat_history.append({"role": "assistant", "content": reply})
        # for chunk in response:
        #     if chunk.choices[0].delta.content:
                # yield chunk.choices[0].delta.content
        response = responses[random.randint(0, len(responses)-1)]
        yield response

    return StreamingResponse(stream_response(), media_type="text/plain")
