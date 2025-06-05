from langchain_core.output_parsers import JsonOutputParser
from ..prompt.templates import template
from ..utils.model import llm


# LLM Chains
# 1. Guardrail
guardrail_chain = template["guardrail"] | llm | JsonOutputParser()

# 2. Feature Extractor
feature_extractor_chain = template["feature_extractor"] | llm | JsonOutputParser()

# 3. Auditor
auditor_chain = template["auditor"] | llm | JsonOutputParser()

# 4. Fixer
fixer_chain = template["fixer"] | llm | JsonOutputParser()
