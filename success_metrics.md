# Success Metrics & Experimental Decision Framework

## Objetivo

Este documento define as métricas utilizadas para avaliação do experimento relacionado ao In-App Browser e navegação externa.

O objetivo do framework é garantir:
- consistência metodológica
- clareza de decisão
- reprodutibilidade analítica
- comparabilidade entre variantes
- redução de risco interpretativo

---

# Objetivo do Experimento

O experimento buscou avaliar os impactos da introdução de fluxos de saída para navegador externo em jornadas de cashback.

As hipóteses avaliadas envolviam possíveis impactos em:
- conversão
- receita
- experiência do usuário (UX)
- tracking e atribuição
- navegação cross-app

---

# Métrica Primária

## Comissão por Visita (CPV)

### Definição

CPV = Comissão Total / Total de Visitas

### Cálculo

total_expected_commission / visits

### Justificativa

A Comissão por Visita foi definida como métrica primária porque:

- representa impacto financeiro direto do experimento
- reduz distorções causadas por diferenças de tráfego
- incorpora simultaneamente:
  - conversão
  - valor transacionado
  - impacto em atribuição
- possui maior alinhamento com geração de receita do negócio

### Interpretação

Uma variante é considerada superior apenas se apresentar:
- melhora consistente de CPV
- sem degradação crítica de tracking
- sem riscos operacionais desproporcionais

---

# Métricas Secundárias

## Taxa de Conversão (CVR)

### Definição

CVR = Visitas Convertidas / Total de Visitas

### Objetivo

Medir:
- eficiência do fluxo
- impacto em comportamento
- impacto na jornada de compra

### Limitações

A métrica pode ser impactada por:
- perda de tracking
- atribuição incompleta
- comportamento cross-browser
- limitações técnicas de mensuração

---

## Comissão Total

### Objetivo

Avaliar:
- impacto financeiro absoluto
- impacto agregado do experimento

### Limitação

Pode sofrer distorção por:
- diferenças de volume
- distribuição desigual de tráfego

---

## Sale Amount (GMV)

### Objetivo

Avaliar:
- impacto no valor transacionado
- possíveis diferenças comportamentais de compra

---

## Adoção dos Fluxos Externos

### Objetivo

Avaliar:
- adoção da funcionalidade
- interesse do usuário por navegação externa
- discoverability das variantes

### Fluxos monitorados

- EXTERNAL_LOGIN
- EXTERNAL_HEADER
- EXTERNAL_CONFIG

---

# Guardrails

As seguintes métricas foram consideradas guardrails do experimento:

## Integridade de Tracking

Objetivo:
- evitar degradação severa de atribuição
- evitar perda crítica de mensuração

---

## Consistência de Conversão

Objetivo:
- evitar degradação relevante de CVR
- evitar impacto negativo desproporcional

---

## Risco Operacional

Objetivo:
- evitar dependência excessiva de tracking externo
- evitar aumento de complexidade operacional
- evitar impactos técnicos não monitorados

---

# Critérios de Decisão

A recomendação experimental considerou simultaneamente:

| Critério | Objetivo |
|---|---|
| CPV | impacto financeiro |
| CVR | impacto comportamental |
| tracking | qualidade da atribuição |
| UX | impacto na experiência |
| significância estatística | confiabilidade do efeito |
| relevância prática | impacto real no negócio |
| riscos operacionais | sustentabilidade da solução |

---

# Considerações Estatísticas

Foram executadas validações estatísticas utilizando:
- teste de diferença de proporções (Z-Test)

Objetivo:
- validar diferenças observadas de CVR
- reduzir risco de falso positivo
- aumentar confiabilidade da decisão

---

# Limitações Analíticas

As métricas disponíveis possuem limitações importantes:

- possível perda de atribuição cross-browser
- impossibilidade de observar compras não atribuídas
- possível self-selection bias
- impossibilidade de separar completamente:
  - tracking loss
  - impacto comportamental real

---

# Decisão Experimental

A decisão final priorizou:
- robustez de tracking
- estabilidade financeira
- confiabilidade da mensuração
- redução de risco operacional

Nenhuma variante demonstrou melhora quantitativa suficientemente robusta para justificar rollout.

---

# Reutilização do Framework

O framework de métricas foi estruturado para:
- reutilização em futuros experimentos
- padronização analítica
- governança experimental
- comparabilidade entre testes
- redução de inconsistências metodológicas
