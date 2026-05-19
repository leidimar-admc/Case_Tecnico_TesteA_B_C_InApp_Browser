# Guia de Execução: Workflow de Análise de Experimentos

Este guia orienta o passo a passo para atualizar os dados, processar o dataset no Google Colab e executar a análise avançada no Google AI Studio. O workflow é composto por **quatro fases sequenciais** e produz três outputs documentados ao longo do processo.

---

## Visão Geral do Workflow

```
Fase 1            Fase 2               Fase 3              Fase 4
Preparação   →   Processamento   →   Configuração   →   Execução da Análise
dos Dados         (Colab)             do Agente          (Esteira de Prompts)
   ↓                  ↓                                        ↓
CSVs           5 CSVs de output                     OUTPUT 1: Análise Preliminar
atualizados    prontos para IA                       OUTPUT 2: Análise e Recomendação
                                                     OUTPUT 3: Melhoria Experimental
```

---

## 📅 Fase 1: Preparação dos Dados (Local)

1. **Atualizar os CSVs** com os dados do novo teste na sua pasta local. Certifique-se de que os seguintes arquivos estão presentes e atualizados:

   | Arquivo | Descrição |
   |:--------|:----------|
   | `channels.csv` | Canais de saída registrados |
   | `partners.csv` | Parceiros anonimizados |
   | `transactions.csv` | Compras atribuídas por visita |
   | `url_params.csv` | Parâmetros UTM das tracking URLs |
   | `visit_url_metadata.csv` | JSON com parâmetros `mz_*` customizados |
   | `visits.csv` | Saídas do usuário para loja parceira |

2. **Confirmar** que o arquivo `experiment_analysis.ipynb` está na pasta `Agente - Sistema de trabalho com IA/`.

---

## 🧪 Fase 2: Processamento e Extração (Google Colab)

1. Acesse o [Google Colab](https://colab.research.google.com/).
2. No menu superior, vá em **Arquivo** > **Fazer Upload de Notebook** e selecione `experiment_analysis.ipynb`.
3. No menu lateral esquerdo, clique no ícone de pasta (**Arquivos**).
4. Faça upload de todos os 6 CSVs da Fase 1 para a raiz do ambiente Colab.

> ⚠️ **Atenção:** Aguarde a barra de progresso do upload desaparecer completamente antes de avançar. Upload incompleto causa `ParserError` no Pandas.

5. No menu superior, clique em **Ambiente de Execução** > **Executar Tudo**.
6. Acompanhe a execução e **valide os outputs intermediários** em cada célula — especialmente as seções de profiling, validação de chaves e reconstrução de `flow_type`.
7. Ao final da execução, faça download dos 5 arquivos exportados automaticamente:

   | Arquivo exportado | Conteúdo |
   |:------------------|:---------|
   | `variant_summary.csv` | CVR, conversões e financeiro por variante A/B/C |
   | `flow_summary.csv` | CVR e financeiro por tipo de fluxo (INAPP, EXTERNAL_*) |
   | `variant_flow_summary.csv` | Cruzamento variante × fluxo |
   | `experiment_dataset_sample_small.csv` | Sample de 500 linhas para contexto comportamental |
   | `significance_results.csv` | Z-stat, p-value e significância por comparação |

---

## 🤖 Fase 3: Configuração do Agente (Google AI Studio)

1. Acesse o [Google AI Studio (New Chat)](https://aistudio.google.com/prompts/new_chat).
2. Em *Explore Google models*, clique em **Code and Chat**.
3. No menu lateral direito, configure:

   | Parâmetro | Valor recomendado |
   |:----------|:-----------------|
   | **Model** | `Gemini 2.5 Pro` (ou versão Pro mais recente disponível) |
   | **System Instructions** | Cole o conteúdo de `system_instructions.md` |
   | **Nome do Agente** | `Méliuz Shopping [Agente de Análise de Testes de Produto]` |
   | **Code Execution** | `ON` |
   | **Max Output Tokens** | `32000` |
   | **Temperature** | `0.2` (favorece respostas analíticas e determinísticas) |

> 💼 **Infraestrutura:** Se for a primeira utilização, confirme que sua conta Google está conectada a um projeto do Google Cloud Platform (GCP) com cotas disponíveis.

---

## 📈 Fase 4: Execução da Análise (Esteira de Prompts)

A análise é executada em três passos sequenciais. Cada passo produz um output documentado que alimenta o próximo.

---

### Passo 4.1 — Alinhamento de Contexto (PROMPT 1)

**Objetivo:** fazer o agente compreender o produto, as hipóteses de negócio e os fluxos do experimento *antes* de ver qualquer número. Isso evita que a IA interprete os dados sem âncora conceitual.

**Arquivos a anexar:**

| Arquivo | Papel |
|:--------|:------|
| `contexto_produto.md` | Contexto geral de experimentação em mobile commerce |
| `Enunciado_Teste.md` | Regras, premissas e schema de dados do teste atual |
| `Case PM - Teste A_B_C InApp Browser.pdf` | Fluxo visual das três variantes |

Envie esses arquivos junto com o **`PROMPT_1.md`**.

**Output esperado — Análise Preliminar do Experimento:**

O agente produzirá uma análise qualitativa estruturada contendo:
- Entendimento do problema de produto
- Hipóteses por variante (A, B e C)
- Framework analítico proposto
- Riscos e limitações antecipadas
- Métricas candidatas — *sem ainda analisar dados quantitativos*

> 📄 **Salve este output** como `Análise Preliminar do Experimento: In-App Browser [Contexto].md` na pasta `Analise Teste - In-App Browser/`. Este documento serve como registro de raciocínio pré-dados e referência metodológica para futuras análises do mesmo produto.

---

### Passo 4.2 — Análise Quantitativa e Recomendação (PROMPT 2)

**Objetivo:** com o contexto estabelecido no passo anterior, o agente recebe os dados processados e gera a análise completa com recomendação fundamentada.

**Arquivos a anexar** (outputs do Colab — Fase 2):

| Arquivo | Uso pelo agente |
|:--------|:----------------|
| `variant_summary.csv` | **Fonte primária** para métricas quantitativas e decisão |
| `flow_summary.csv` | **Fonte primária** para diagnóstico por fluxo |
| `variant_flow_summary.csv` | **Fonte primária** para cruzamento variante × fluxo |
| `significance_results.csv` | **Fonte primária** para validação estatística |
| `experiment_dataset_sample_small.csv` | **Contexto apenas** — não usar como base estatística |

> ⚠️ **Regra crítica de reconciliação de dados:** os summaries executivos são a fonte principal para conclusões quantitativas. O sample deve ser usado apenas para interpretação comportamental e validação semântica dos fluxos. Não extrapole estatísticas a partir do sample.

Envie esses arquivos junto com o **`PROMPT_2.md`**.

**Valide a resposta** verificando se o agente:
- Utilizou os summaries (não o sample) como base quantitativa
- Identificou corretamente os flow_types por variante
- Calculou o CPV (Comissão por Visita) como métrica primária
- Separou hipótese de evidência ao discutir causalidade
- Reconheceu o self-selection bias nos fluxos externos

**Output esperado — Análise do Teste e Recomendação:**

> 📄 Salve como `Análise do teste e recomendação.md` na pasta `Analise Teste - In-App Browser/`.

---

### Passo 4.3 — Proposta de Melhoria Experimental (PROMPT 3)

**Objetivo:** com base nos aprendizados da análise anterior, o agente propõe a próxima iteração de produto — incluindo PRD completa, plano de instrumentação e breakdown para engenharia.

Não é necessário anexar novos arquivos. O agente usará o contexto acumulado da conversa.

Envie o **`PROMPT_3.md`** na sequência.

**Output esperado — Melhoria Experimental do In-App Browser:**

> 📄 Salve como `melhoria experimental do In-App Browser.md` na pasta `Analise Teste - In-App Browser/`.

---

## 📁 Estrutura de Outputs Esperada

Ao final do workflow, a pasta `Analise Teste - In-App Browser/` deve conter:

```
Analise Teste - In-App Browser/
├── Análise Preliminar do Experimento: In-App Browser [Contexto].md   ← Output do Passo 4.1
├── Análise do teste e recomendação.md                                 ← Output do Passo 4.2
└── melhoria experimental do In-App Browser.md                        ← Output do Passo 4.3
```

---

## ♻️ Reutilização para Novos Experimentos

Para adaptar este workflow a um novo teste, substitua:

| O que trocar | Onde |
|:-------------|:-----|
| Os 6 CSVs de input | Fase 1 |
| O `Enunciado_Teste.md` | Passo 4.1 — contextualize o novo experimento |
| O material visual (PDF) | Passo 4.1 — fluxo das novas variantes |
| O `contexto_produto.md` | Opcional — atualize se o produto mudou significativamente |

Os arquivos `system_instructions.md`, `PROMPT_1.md`, `PROMPT_2.md` e `PROMPT_3.md` são **reutilizáveis sem alteração** para qualquer experimento de produto com estrutura similar (visitas → transações → variantes via parâmetros de tracking).
