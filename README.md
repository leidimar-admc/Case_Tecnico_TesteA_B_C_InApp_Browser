<div align="center">

<!-- BANNER SVG -->
<svg width="900" height="180" viewBox="0 0 900 180" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#111113;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#1C1C1E;stop-opacity:1" />
    </linearGradient>
    <radialGradient id="glow1" cx="85%" cy="20%" r="40%">
      <stop offset="0%" style="stop-color:#F72585;stop-opacity:0.25" />
      <stop offset="100%" style="stop-color:#F72585;stop-opacity:0" />
    </radialGradient>
    <radialGradient id="glow2" cx="10%" cy="90%" r="30%">
      <stop offset="0%" style="stop-color:#F72585;stop-opacity:0.12" />
      <stop offset="100%" style="stop-color:#F72585;stop-opacity:0" />
    </radialGradient>
  </defs>
  <rect width="900" height="180" rx="16" fill="url(#bg)"/>
  <rect width="900" height="180" rx="16" fill="url(#glow1)"/>
  <rect width="900" height="180" rx="16" fill="url(#glow2)"/>
  <rect x="0" y="0" width="900" height="5" rx="0" fill="#F72585"/>
  <text x="48" y="62" font-family="Georgia,serif" font-size="28" font-style="italic" font-weight="bold" fill="#F72585">Mar</text>
  <text x="138" y="62" font-family="Georgia,serif" font-size="28" fill="#FFFFFF">Shopping</text>
  <rect x="48" y="78" width="60" height="4" rx="2" fill="#F72585"/>
  <text x="48" y="108" font-family="Arial,sans-serif" font-size="15" fill="#9999AA">Experimentation &amp; Analytics Framework</text>
  <text x="48" y="132" font-family="Arial,sans-serif" font-size="13" fill="#666677">Case Técnico · PM Pleno · Análise de Experimento A/B/C: In-App Browser</text>
  <rect x="620" y="30" width="240" height="118" rx="10" fill="#242428" opacity="0.9"/>
  <rect x="620" y="30" width="240" height="4" rx="0" fill="#F72585" opacity="0.8"/>
  <text x="740" y="64" font-family="Arial,sans-serif" font-size="11" fill="#9999AA" text-anchor="middle">RESULTADO DO EXPERIMENTO</text>
  <text x="700" y="100" font-family="Arial,sans-serif" font-size="28" font-weight="bold" fill="#00C896" text-anchor="middle">A ✓</text>
  <text x="700" y="122" font-family="Arial,sans-serif" font-size="10" fill="#9999AA" text-anchor="middle">Controle mantido</text>
  <text x="832" y="100" font-family="Arial,sans-serif" font-size="28" font-weight="bold" fill="#F72585" text-anchor="middle">-2%</text>
  <text x="832" y="122" font-family="Arial,sans-serif" font-size="10" fill="#9999AA" text-anchor="middle">CVR em B (sig.)</text>
  <rect x="763" y="78" width="1" height="52" fill="#2E2E35"/>
  <rect x="48" y="152" width="90" height="20" rx="10" fill="#2E2E35"/>
  <text x="93" y="166" font-family="Arial,sans-serif" font-size="10" fill="#9999AA" text-anchor="middle">Maio 2026</text>
  <rect x="146" y="152" width="96" height="20" rx="10" fill="#2E2E35"/>
  <text x="194" y="166" font-family="Arial,sans-serif" font-size="10" fill="#9999AA" text-anchor="middle">CONFIDENCIAL</text>
</svg>

<br/><br/>

![Python](https://img.shields.io/badge/Python-3.10+-1C1C1E?style=for-the-badge&logo=python&logoColor=F72585)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Layer-1C1C1E?style=for-the-badge&logo=pandas&logoColor=F72585)
![Statsmodels](https://img.shields.io/badge/Statsmodels-Z--Test-1C1C1E?style=for-the-badge&logoColor=F72585)
![Gemini](https://img.shields.io/badge/Gemini%202.5%20Pro-AI%20Layer-1C1C1E?style=for-the-badge&logo=google&logoColor=F72585)
![Colab](https://img.shields.io/badge/Google%20Colab-Notebook-1C1C1E?style=for-the-badge&logo=googlecolab&logoColor=F72585)
![Status](https://img.shields.io/badge/Status-Entregue-00C896?style=for-the-badge)

</div>

---

## Navegação rápida

| | Seção | O que você encontra |
|:-:|:------|:--------------------|
| 🤖 | [`Agente - Sistema de trabalho com IA/`](#-agente--sistema-de-trabalho-com-ia) | Framework reutilizável: prompts, notebook, outputs analíticos |
| 📊 | [`Analise Teste - In-App Browser/`](#-analise-teste--in-app-browser) | Análise completa, PRD e apresentação executiva |
| 🔢 | [Resultados em números](#-resultados-do-experimento) | CVR, CPV e significância estatística por variante |
| ▶️ | [Como rodar](#%EF%B8%8F-como-executar-a-análise) | Passo a passo para reproduzir a análise |
| ♻️ | [Como reutilizar](#%EF%B8%8F-reutilização-para-novos-experimentos) | Adaptar o framework para outro teste |

---

## 🏷️ Contexto do Experimento

A Méliuz usa um **In-App Browser** (WebView) para preservar os parâmetros de tracking (`utm_*`, `mz_*`) que garantem a atribuição de cashback. O problema: usuários não têm sessões ativas, senhas salvas ou dados de pagamento preenchidos no WebView — ao contrário de seus navegadores externos (Chrome, Safari). Essa fricção pode gerar abandono.

O experimento testou três versões para quantificar o trade-off entre **UX fluida** e **preservação de atribuição**.

| Variante | Nome | Fluxos disponíveis | Hipótese testada |
|:--------:|:-----|:-------------------|:----------------|
| **A** | Controle | `INAPP_DEFAULT` | A fricção é custo aceitável para preservar o modelo de negócio |
| **B** | Header | `INAPP_DEFAULT` + `EXTERNAL_HEADER` + `EXTERNAL_LOGIN` | Compras desbloqueadas superam a perda de atribuição |
| **C** | Config | `INAPP_DEFAULT` + `EXTERNAL_CONFIG` + `EXTERNAL_LOGIN` | Válvula de escape discreta gera ganho com risco controlado |

---

## 🔢 Resultados do Experimento

### Performance por Variante

<div align="center">

| Variante | Visitas | CVR | CPV | Comissão Total | Δ CPV vs A | Decisão |
|:--------:|--------:|:---:|:---:|---------------:|:----------:|:-------:|
| **A — Controle** | 377.716 | **12,87%** | **R$ 5,56** | R$ 2.100.035 | — | ✅ **MANTER** |
| B — Header | 385.757 | 12,61% | R$ 5,22 | R$ 2.012.812 | **-6,1%** | ❌ REJEITAR |
| C — Config | 383.870 | 12,73% | R$ 5,50 | R$ 2.112.918 | -1,1% | ⚠️ NEUTRO |

</div>

> **CPV (Comissão por Visita)** = `SUM(total_expected_commission) / COUNT(visit_id)` — métrica primária que combina conversão, valor e integridade do tracking. Fonte: `variant_summary.csv`.

### Significância Estatística

<div align="center">

| Comparação | Uplift | Z-Stat | P-Value | Significativo (α = 0,05)? |
|:----------:|:------:|:------:|:-------:|:-------------------------:|
| **A vs. B** | -2,03% | 3,43 | 0,0006 | ✅ Sim |
| A vs. C | -1,05% | 1,77 | 0,0763 | ❌ Não |

</div>

*Teste Z de proporções — `statsmodels.stats.proportion.proportions_ztest`. Fonte: `significance_results.csv`.*

### Diagnóstico: CVR por Fluxo de Navegação

<div align="center">

| Fluxo | Visitas | CVR | Δ vs INAPP_DEFAULT |
|:------|--------:|:---:|:-----------------:|
| 🔵 INAPP_DEFAULT | 1.180.701 | **12,84%** | — |
| 🔴 EXTERNAL_CONFIG | 3.896 | 11,81% | -1,03 p.p. |
| 🔴 EXTERNAL_HEADER | 5.872 | 11,60% | -1,24 p.p. |
| 🔴 EXTERNAL_LOGIN | 6.996 | 10,68% | -2,16 p.p. |

</div>

> **💡 Insight central:** usuários que optam por sair têm alta intenção de compra e deveriam converter *mais* que a média. O fato de converterem *menos* é forte evidência de **tracking loss** — a compra ocorre, mas não é atribuída à Méliuz.

---

## 📁 Estrutura do Repositório

```
case_meliuz_PM_TesteA_B_C_InApp_Browser/
│
├── 🤖 Agente - Sistema de trabalho com IA/
│   │
│   ├── system_instructions.md              ← Identidade, regras e fluxo operacional do agente
│   ├── PROMPT_1.md                         ← Alinhamento de contexto (pré-dados)
│   ├── PROMPT_2.md                         ← Análise quantitativa e recomendação
│   ├── PROMPT_3.md                         ← Proposta de melhoria experimental (PRD)
│   │
│   ├── contexto_produto.md                 ← Contexto de experimentação em mobile commerce
│   ├── Enunciado_Teste.md                  ← Regras, schema e premissas do case
│   ├── Guia_Passo_a_Passo.md               ← Como executar o workflow completo
│   ├── Organização.md                      ← Processo analítico, governança e reutilização
│   │
│   ├── experiment_analysis.ipynb           ← Notebook Colab — processamento principal
│   ├── experiment_analysis.py              ← Versão .py do notebook (referência)
│   ├── Case PM - Teste A_B_C InApp Browser.pdf   ← Material visual das variantes
│   │
│   ├── variant_summary.csv                 ← CVR, conversões e financeiro por variante
│   ├── flow_summary.csv                    ← CVR e financeiro por tipo de fluxo
│   ├── variant_flow_summary.csv            ← Cruzamento variante × fluxo
│   ├── significance_results.csv            ← Z-stat, p-value e significância
│   └── experiment_dataset_sample_small.csv ← Sample comportamental (500 linhas)
│
├── 📊 Analise Teste - In-App Browser/
│   ├── Análise Preliminar [Contexto].md    ← Output PROMPT 1 (raciocínio pré-dados)
│   ├── Análise do teste e recomendação.md  ← Output PROMPT 2 (análise quantitativa)
│   ├── melhoria experimental.md            ← Output PROMPT 3 (PRD completa)
│   └── Meliuz_InAppBrowser_Executive.pptx  ← Apresentação executiva (9 slides)
│
└── README.md
```

---

## 🤖 Agente — Sistema de trabalho com IA

### Arquitetura em duas camadas

```
┌─────────────────────────────────┐    ┌────────────────────────────────────┐
│       ANALYTICS LAYER           │    │         COGNITIVE LAYER            │
│                                 │    │                                    │
│  Google Colab + Python          │───▶│  Google AI Studio (Gemini 2.5 Pro) │
│                                 │    │                                    │
│  • Joins e validações           │    │  • Interpretação experimental      │
│  • Agregações com grão correto  │    │  • Challenge analítico             │
│  • Teste Z de proporções        │    │  • Separação hipótese ↔ evidência  │
│  • Exporta summaries validados  │    │  • Recomendação fundamentada       │
└─────────────────────────────────┘    └────────────────────────────────────┘
         ↑ dados brutos                          ↑ summaries validados
         6 CSVs de input                         5 CSVs de output do Colab
```

### Esteira de Prompts

```
   PROMPT 1                      PROMPT 2                    PROMPT 3
  ──────────                    ──────────                  ──────────
  Contexto &              →    Análise &              →    PRD &
  Hipóteses                    Recomendação                Melhoria
  (sem dados)                  (com summaries)             (sem novos dados)
       │                             │                          │
       ▼                             ▼                          ▼
  Análise Preliminar         Análise do teste e         Melhoria experimental
  [Contexto].md              recomendação.md            do In-App Browser.md
```

### Validações implementadas no notebook

| Validação | Onde | Por quê |
|:----------|:-----|:--------|
| Profiling de schema | Início do notebook | Detecta missing values, duplicados e tipos incorretos |
| Cardinalidade dos joins | Antes de cada merge | Garante que o grão não seja inflado por dupla contagem |
| Parsing seguro do JSON | `safe_json_parser()` | Evita que registros malformados quebrem o pipeline |
| Reconstrução de `flow_type` | Via `utm_content` + `utm_term` | Separação correta de INAPP vs EXTERNAL |
| Grão correto em transactions | `groupby visit_id` antes do merge | Múltiplas compras por visita não inflam CVR |
| Documentação de `None` variants | Inline no notebook | Registros sem variante são identificados e documentados |

### Princípios de governança

> *"A IA atua como camada supervisionada de interpretação — não como fonte autônoma de verdade."*

- **Temperature `0.2`** — respostas analíticas e determinísticas
- **Summaries como fonte primária** — o sample é usado apenas para contexto semântico
- **Separação explícita** hipótese ↔ fato em todos os prompts
- **Revisão humana** dos outputs antes de incorporar à análise final

---

## 📊 Analise Teste — In-App Browser

### O que cada arquivo entrega

| Arquivo | Origem | Conteúdo |
|:--------|:------:|:---------|
| `Análise Preliminar [Contexto].md` | PROMPT 1 | Raciocínio pré-dados: hipóteses, riscos antecipados, framework analítico |
| `Análise do teste e recomendação.md` | PROMPT 2 | CVR, CPV, z-test, diagnóstico de tracking loss, recomendação fundamentada |
| `melhoria experimental do In-App Browser.md` | PROMPT 3 | PRD completa: Seamless Authentication (iOS Keychain + Android Autofill) |
| `Meliuz_InAppBrowser_Executive.pptx` | Manual | 9 slides executivos com identidade visual Méliuz, para gestores e stakeholders |

### Próxima melhoria proposta: Seamless Authentication

O experimento validou que o problema não é "usuário quer sair" — é que não consegue se autenticar no WebView. A solução proposta ataca a causa raiz:

```
Problema validado               Solução proposta
─────────────────          →    ─────────────────────────────────
~6.996 saídas via               iOS Keychain / Android Autofill
EXTERNAL_LOGIN                  integrado nativamente no WebView

Usuário com alta intenção  →    Login com biometria (Face ID,
abandona no ponto de login      Touch ID) em 1 toque

Tracking loss = -2,16 p.p. →   Zero impacto no tracking —
CVR no fluxo externo            jornada 100% no In-App Browser
```

**Critério de sucesso:** uplift > 2% no CPV | **Guardrail:** crash rate < 0,5% | **Rollout:** 1% → 10% → 50% → 100%

---

## ▶️ Como executar a análise

**① Preparação** — Tenha os 6 CSVs de input disponíveis: `visits.csv`, `transactions.csv`, `url_params.csv`, `visit_url_metadata.csv`, `partners.csv`, `channels.csv`

**② Colab** — Upload do `experiment_analysis.ipynb` → import dos 6 CSVs → *Executar Tudo* → download dos 5 CSVs de output

> Os CSVs desta execução já estão incluídos no repositório para fins de auditabilidade. Os resultados são reproduzíveis.

**③ AI Studio** — Configure o agente:

| Parâmetro | Valor |
|:----------|:------|
| Model | `Gemini 2.5 Pro` |
| System Instructions | Conteúdo de `system_instructions.md` |
| Temperature | `0.2` |
| Max Output Tokens | `32000` |
| Code Execution | `ON` |

**④ Prompts** — Execute na sequência:

| Passo | Prompt | Arquivos a anexar | Output esperado |
|:-----:|:-------|:-----------------|:----------------|
| 4.1 | `PROMPT_1.md` | `contexto_produto.md` + `Enunciado_Teste.md` + PDF visual | Análise Preliminar |
| 4.2 | `PROMPT_2.md` | 5 CSVs do Colab | Análise e Recomendação |
| 4.3 | `PROMPT_3.md` | *(sem novos arquivos)* | PRD de Melhoria |

📖 Guia detalhado com prints e validações: [`Guia_Passo_a_Passo.md`](Agente%20-%20Sistema%20de%20trabalho%20com%20IA/Guia_Passo_a_Passo.md)

---

## ♻️ Reutilização para novos experimentos

O framework suporta qualquer teste com estrutura `visitas → transações → variantes via parâmetros de tracking`.

**Substituir para um novo teste:**

| Arquivo | O que mudar |
|:--------|:------------|
| CSVs de input (6 arquivos) | Dados do novo experimento |
| `Enunciado_Teste.md` | Regras e premissas específicas |
| Material visual (PDF) | Fluxo das novas variantes |
| `contexto_produto.md` | Opcional — só se o produto mudou significativamente |

**Reutilizar sem alterar:**
`system_instructions.md` · `PROMPT_1.md` · `PROMPT_2.md` · `PROMPT_3.md` · `experiment_analysis.ipynb` · `Guia_Passo_a_Passo.md`

---

## 🛠️ Ferramentas utilizadas

| Ferramenta | Camada | Papel |
|:-----------|:------:|:------|
| **Google Colab** | Analytics | Processamento, validações, joins e agregações |
| **Python / Pandas** | Analytics | Transformação de dados e modelagem do dataset |
| **Statsmodels** | Analytics | Teste Z de proporções para validação estatística |
| **Matplotlib** | Analytics | Visualizações analíticas geradas no notebook |
| **Google AI Studio** | Cognitiva | Interpretação experimental, challenge analítico, PRD |
| **Gemini 2.5 Pro** | Cognitiva | Modelo LLM como agente analítico supervisionado |
| **GitHub** | Governança | Versionamento, reprodutibilidade e auditabilidade |

---

## 🔜 Backlog de melhorias do framework

- [ ] Análise segmentada por `partner_id` — impacto pode não ser uniforme entre parceiros
- [ ] Cálculo de poder estatístico e sample size pré-experimento no notebook
- [ ] Análise de cohort: comportamento histórico de usuários que saíram vs. que ficaram
- [ ] Tratamento formal dos registros sem variante atribuída (`None`)
- [ ] Análise de impacto por OS (iOS vs. Android) — relevante para a PRD de Seamless Authentication
- [ ] Intervalo de confiança (95%) na tabela de `significance_results.csv`

---

<div align="center">

<sub>*Case Técnico · PM Pleno Shopping · Méliuz · Maio 2026*</sub>

</div>
