# Generate 20 synthetic eligibility source layouts with variations

import random

def generate_column_variations(base_fields, num_variants=20):
    """Generate variants of field names for synthetic payer-specific layouts"""
    payer_layouts = {}
    for i in range(num_variants):
        payer_name = f"eligibility_payer_{i+1}"
        table_name = f"{payer_name}"
        columns = []
        for field in base_fields:
            prefix = random.choice(["", "mem_", "sub_", ""])
            suffix = random.choice(["", "_code", "_id", "_val", "_nm"])
            col_name = f"{prefix}{field}{suffix}".lower()
            dtype = base_fields[field]
            columns.append(f"    {col_name} {dtype}")
        payer_layouts[table_name] = "CREATE TABLE " + table_name + " (\n" + ",\n".join(columns) + "\n);"
    return payer_layouts

# Representative fields from the standard_eligibility table
eligibility_fields = {
    "member_id": "VARCHAR2(50)",
    "first_name": "VARCHAR2(35)",
    "last_name": "VARCHAR2(60)",
    "date_of_birth": "DATE",
    "gender": "CHAR(1)",
    "address": "VARCHAR2(100)",
    "city": "VARCHAR2(30)",
    "state": "CHAR(2)",
    "zip_code": "VARCHAR2(9)",
    "plan_id": "VARCHAR2(30)",
    "group_number": "VARCHAR2(50)",
    "coverage_start_date": "DATE",
    "coverage_end_date": "DATE"
}

# Generate 20 variants
eligibility_variants = generate_column_variations(eligibility_fields, 20)

# Write to file
source_layouts_path = "/mnt/data/source_layouts_eligibility.sql"
with open(source_layouts_path, "w") as f:
    for ddl in eligibility_variants.values():
        f.write(ddl + "\n\n")

source_layouts_path
