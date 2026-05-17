#!/bin/bash

# ============================================================
# MÉLIUZ SHOPPING PRODUCT EXPERIMENTATION FRAMEWORK
# Repository Structure Generator
# ============================================================

ROOT="meliuz-shopping-product-experimentation-framework"

mkdir -p "$ROOT"
cd "$ROOT"

# ============================================================
# ROOT FILES
# ============================================================

touch README.md

# ============================================================
# 00_AGENT
# ============================================================

mkdir -p 00_agent

touch 00_agent/system_instructions.md
touch 00_agent/contexto.md
touch 00_agent/enunciado_teste.md
touch 00_agent/operational_architecture.md
touch 00_agent/decision_framework.md
touch 00_agent/validation_rules.md
touch 00_agent/prompting_guidelines.md
touch 00_agent/review_process.md
touch 00_agent/ai_governance.md

# ============================================================
# 01_ANALYTICS
# ============================================================

mkdir -p 01_analytics/notebooks
mkdir -p 01_analytics/outputs
mkdir -p 01_analytics/visualizations
mkdir -p 01_analytics/documentation

touch 01_analytics/notebooks/experiment_analysis.ipynb
touch 01_analytics/notebooks/experiment_analysis.py

touch 01_analytics/outputs/variant_summary.csv
touch 01_analytics/outputs/flow_summary.csv
touch 01_analytics/outputs/variant_flow_summary.csv
touch 01_analytics/outputs/significance_results.csv
touch 01_analytics/outputs/experiment_dataset.csv
touch 01_analytics/outputs/experiment_dataset_sample_small.csv

touch 01_analytics/visualizations/conversion_rate_by_variant.png
touch 01_analytics/visualizations/conversion_rate_by_flow_type.png
touch 01_analytics/visualizations/adoption_vs_conversion_tradeoff.png

touch 01_analytics/documentation/analytical_rules.md
touch 01_analytics/documentation/granularity_mapping.md
touch 01_analytics/documentation/joins_and_cardinality.md
touch 01_analytics/documentation/tracking_mapping.md
touch 01_analytics/documentation/statistical_validation.md
touch 01_analytics/documentation/known_limitations.md

# ============================================================
# 02_EXPERIMENT_ANALYSIS
# ============================================================

mkdir -p 02_experiment_analysis

touch 02_experiment_analysis/experiment_context.md
touch 02_experiment_analysis/product_problem.md
touch 02_experiment_analysis/hypotheses.md
touch 02_experiment_analysis/flow_interpretation.md
touch 02_experiment_analysis/tradeoffs.md
touch 02_experiment_analysis/behavioral_analysis.md
touch 02_experiment_analysis/statistical_analysis.md
touch 02_experiment_analysis/risks_and_limitations.md
touch 02_experiment_analysis/executive_recommendation.md
touch 02_experiment_analysis/next_questions.md
touch 02_experiment_analysis/executive_summary.md

# ============================================================
# 03_PRODUCT
# ============================================================

mkdir -p 03_product/experimentation
mkdir -p 03_product/tracking
mkdir -p 03_product/decisioning

touch 03_product/experimentation/success_metrics.md
touch 03_product/experimentation/guardrails.md
touch 03_product/experimentation/experimentation_framework.md
touch 03_product/experimentation/rollout_criteria.md

touch 03_product/tracking/event_taxonomy.md
touch 03_product/tracking/utm_mapping.md
touch 03_product/tracking/mz_parameter_mapping.md
touch 03_product/tracking/tracking_validation.md

touch 03_product/decisioning/decision_rationale.md
touch 03_product/decisioning/rollout_recommendation.md
touch 03_product/decisioning/operational_considerations.md

# ============================================================
# 04_AI_STUDIO
# ============================================================

mkdir -p 04_ai_studio/prompts
mkdir -p 04_ai_studio/outputs
mkdir -p 04_ai_studio/screenshots

touch 04_ai_studio/prompts/experiment_interpretation_prompt.md
touch 04_ai_studio/prompts/causality_challenge_prompt.md
touch 04_ai_studio/prompts/bias_challenge_prompt.md
touch 04_ai_studio/prompts/significance_prompt.md
touch 04_ai_studio/prompts/recommendation_prompt.md
touch 04_ai_studio/prompts/recommendation_revision_prompt.md

touch 04_ai_studio/outputs/first_experimental_analysis.md
touch 04_ai_studio/outputs/causality_review.md
touch 04_ai_studio/outputs/bias_review.md
touch 04_ai_studio/outputs/significance_interpretation.md
touch 04_ai_studio/outputs/executive_recommendation.md
touch 04_ai_studio/outputs/revised_recommendation.md

touch 04_ai_studio/screenshots/ai_studio_configuration.png
touch 04_ai_studio/screenshots/system_instructions.png
touch 04_ai_studio/screenshots/thinking_budget.png
touch 04_ai_studio/screenshots/workflow_examples.png

# ============================================================
# 05_PRESENTATIONS
# ============================================================

mkdir -p 05_presentations/supporting_visuals
mkdir -p 05_presentations/presentation_assets

touch 05_presentations/executive_summary.pdf
touch 05_presentations/final_case_slides.pdf

touch 05_presentations/supporting_visuals/conversion_rate_by_variant.png
touch 05_presentations/supporting_visuals/conversion_rate_by_flow_type.png
touch 05_presentations/supporting_visuals/adoption_vs_conversion_tradeoff.png

touch 05_presentations/presentation_assets/architecture_diagram.png
touch 05_presentations/presentation_assets/experimentation_flow.png
touch 05_presentations/presentation_assets/ai_governance_framework.png

# ============================================================
# 06_GOVERNANCE
# ============================================================

mkdir -p 06_governance

touch 06_governance/analytical_governance.md
touch 06_governance/ai_usage_guidelines.md
touch 06_governance/reproducibility.md
touch 06_governance/validation_checklist.md
touch 06_governance/risk_reduction_framework.md
touch 06_governance/scalability_principles.md

# ============================================================
# 07_TEMPLATES
# ============================================================

mkdir -p 07_templates

touch 07_templates/experiment_template.md
touch 07_templates/tracking_template.md
touch 07_templates/rollout_template.md
touch 07_templates/experimentation_checklist.md
touch 07_templates/executive_analysis_template.md

# ============================================================
# FINAL MESSAGE
# ============================================================

echo "============================================================"
echo "Repository structure created successfully."
echo "============================================================"
