# hackathon-inf
Hackathon 2025 Infinite

🧠 Overall System Architecture
1. Knowledge Base (Vector Store)
Inputs:

✅ Source Data Dictionaries (PDFs, Excels, CSVs)

✅ Standard Layout Definition

✅ PL/SQL Mapping Scripts

Fallback Handling: For missing dictionaries, extract schema from:

Column names in the import DB (use information_schema for metadata)

Sample data (via profiling using pandas or SQL queries)

2. Chunking + Embedding
Use text splitters optimized for code and tabular data.

Embed with a model trained for tabular/code semantics (e.g., OpenAI text-embedding-3-large or local Instructor-XL).

3. Retriever
Use Hybrid Search (vector + keyword) for high recall.

Prefer source layout-specific indexing to reduce noise.

4. LLM Agent Capabilities
Primary Tasks:

Analyze PL/SQL script logic.

Compare with both source & standard layout definitions.

Flag mismatches, null-handling issues, datatype mismatches, hardcoded values, etc.

Chat-based Q&A: Serve as a knowledgeable assistant using retrieved context.

🛠️ Implementation Plan
✅ Step 1: Preprocess & Index Knowledge Base
Extract structured data from:

Source/standard dictionaries (use pandas + tabulate for Excel/CSV, PyMuPDF or pdfplumber for PDFs).

PL/SQL scripts (split by logical blocks: declarations, cursors, transformations).

Store embeddings in FAISS, Weaviate, or Qdrant.

✅ Step 2: Analyze PL/SQL Script
Build a parser using sqlparse or custom regex to identify:

Input/output mapping

Transformation logic

Use of hardcoded values or conditions

Create a validator module that:

Matches mappings with data dictionaries

Uses inferred schema when dictionary is missing

Uses profiling summaries from imported data tables

✅ Step 3: Build RAG Agent
Chain components:

Embed context → Retrieve relevant chunks → Answer or analyze using LLM.

Use LangChain, LlamaIndex, or Haystack.

✅ Step 4: Add Chat UI (Optional)
Web interface: Use React + FastAPI backend.

Let user:

Upload scripts/layouts

Ask questions in natural language

🔍 Example Use Cases Your Agent Should Handle
Logical Check:
"This column is mapped to a wrong code set – ICD10 instead of CPT."

Type Mismatch:
"PL/SQL assigns a VARCHAR2 source to a DATE target without conversion."

Missing Mapping:
"Script skips mapping the 'discharge_status' column required in standard layout."

Null Handling Issue:
"NULL values are not handled for 'payer_id' which is marked NOT NULL in the standard schema."

User Q&A Examples:

“Which source layouts map to version 3.2 of the standard format?”

“What is the datatype mismatch found in this script?”

“Does the mapping script handle NULLs for all required fields?”


