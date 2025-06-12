import random

def generate_column_variations(base_fields, num_variants=20):
    """Generate variants of field names for synthetic payer-specific layouts"""
    payer_layouts = {}
    for i in range(num_variants):
        payer_name = f"claims_payer_{i+1}" if "claim_id" in base_fields else f"rxclaims_payer_{i+1}"
        table_name = f"{payer_name}"
        columns = []
        for field in base_fields:
            prefix = random.choice(["", "mem_", "sub_", "clm_", "rx_", "drg_", "phm_"])
            suffix = random.choice(["", "_code", "_id", "_val", "_nm"])
            col_name = f"{prefix}{field}{suffix}".lower()
            dtype = base_fields[field]
            columns.append(f"    {col_name} {dtype}")
        payer_layouts[table_name] = "CREATE TABLE " + table_name + " (\n" + ",\n".join(columns) + "\n);"
    return payer_layouts

# Define base fields
claims_fields = {
    "claim_id": "VARCHAR2(35)",
    "member_id": "VARCHAR2(50)",
    "service_date": "DATE",
    "admission_date": "DATE",
    "discharge_date": "DATE",
    "procedure_code": "VARCHAR2(10)",
    "diagnosis_code": "VARCHAR2(10)",
    "billed_amount": "NUMBER(10, 2)",
    "paid_amount": "NUMBER(10, 2)",
    "provider_id": "VARCHAR2(35)",
    "claim_status": "VARCHAR2(20)"
}

rxclaims_fields = {
    "rx_claim_id": "VARCHAR2(35)",
    "member_id": "VARCHAR2(50)",
    "pharmacy_id": "VARCHAR2(35)",
    "fill_date": "DATE",
    "drug_code": "VARCHAR2(15)",
    "quantity_dispensed": "NUMBER(10, 2)",
    "days_supply": "NUMBER(3)",
    "billed_amount": "NUMBER(10, 2)",
    "paid_amount": "NUMBER(10, 2)",
    "prescriber_id": "VARCHAR2(35)"
}

# Generate synthetic layouts
claims_variants = generate_column_variations(claims_fields, 20)
rxclaims_variants = generate_column_variations(rxclaims_fields, 20)

# Write claims layouts to file
claims_layouts_path = "/mnt/data/source_layouts_claims.sql"
with open(claims_layouts_path, "w") as f:
    for ddl in claims_variants.values():
        f.write(ddl + "\n\n")

# Write rxclaims layouts to file
rxclaims_layouts_path = "/mnt/data/source_layouts_rxclaims.sql"
with open(rxclaims_layouts_path, "w") as f:
    for ddl in rxclaims_variants.values():
        f.write(ddl + "\n\n")

claims_layouts_path, rxclaims_layouts_path
