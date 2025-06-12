import random

# We'll simulate matching columns between synthetic and standard using similarity
def generate_mapping_script(source_table, source_columns, target_table, target_columns):
    mapping = []
    for tgt_col in target_columns:
        match = next((col for col in source_columns if tgt_col in col or col in tgt_col), None)
        match_expr = match if match else "NULL"
        mapping.append(f"    {match_expr} AS {tgt_col}")
    insert_clause = f"INSERT INTO {target_table} (\n    {', '.join(target_columns)}\n)"
    select_clause = "SELECT\n" + ",\n".join(mapping) + f"\nFROM {source_table};"

    return f"{insert_clause}\n{select_clause}"


# Sample field sets from standard layouts
standard_eligibility_fields = [
    "member_id", "first_name", "last_name", "date_of_birth", "gender",
    "address", "city", "state", "zip_code", "plan_id", "group_number",
    "coverage_start_date", "coverage_end_date", "coverage_level_code",
    "subscriber_indicator", "product_category_code", "plan_type", "market_category_code"
]

standard_claims_fields = [
    "claim_id", "member_id", "service_date", "admission_date", "discharge_date",
    "procedure_code", "diagnosis_code", "billed_amount", "paid_amount",
    "provider_id", "claim_status", "plan_id", "place_of_service",
    "type_of_bill", "admission_type", "discharge_status"
]

standard_rxclaims_fields = [
    "rx_claim_id", "member_id", "pharmacy_id", "fill_date", "drug_code",
    "quantity_dispensed", "days_supply", "billed_amount", "paid_amount",
    "prescriber_id", "plan_id"
]

# Simulate synthetic field names for 20 tables each
def simulate_columns(base_fields):
    return [f"{random.choice(['', 'mem_', 'clm_', 'rx_', 'phm_'])}{field}{random.choice(['', '_id', '_val'])}".lower()
            for field in base_fields]
# Regenerate mapping scripts
mapping_scripts = []

for i in range(20):
    src_table = f"eligibility_payer_{i+1}"
    src_cols = simulate_columns(standard_eligibility_fields)
    mapping_scripts.append(generate_mapping_script(src_table, src_cols, "standard_eligibility", standard_eligibility_fields))

for i in range(20):
    src_table = f"claims_payer_{i+1}"
    src_cols = simulate_columns(standard_claims_fields)
    mapping_scripts.append(generate_mapping_script(src_table, src_cols, "standard_claims", standard_claims_fields))

for i in range(20):
    src_table = f"rxclaims_payer_{i+1}"
    src_cols = simulate_columns(standard_rxclaims_fields)
    mapping_scripts.append(generate_mapping_script(src_table, src_cols, "standard_rxclaims", standard_rxclaims_fields))

# Save to file
mapping_scripts_path = "plsql_mapping_scripts.sql"
with open(mapping_scripts_path, "w") as f:
    for script in mapping_scripts:
        f.write("BEGIN\n" + script + "\nEND;\n/\n\n")

mapping_scripts_path
