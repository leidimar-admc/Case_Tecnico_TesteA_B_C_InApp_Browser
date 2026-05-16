# AI Review & Validation Process

## Objetivo

Este documento descreve o processo de revisão crítica utilizado durante a análise experimental.

O objetivo não foi utilizar IA apenas como geradora de respostas, mas como uma camada operacional supervisionada, com validação contínua, challenge analítico e redução de risco decisório.

---

# Estrutura Operacional

A análise foi conduzida em duas camadas:

| Camada | Responsabilidade |
|---|---|
| Camada Analítica | processamento, joins, validações, agregações e construção dos datasets executivos |
| Camada Cognitiva | interpretação experimental, identificação de trade-offs, revisão crítica e tomada de decisão |

---

# Workflow de Revisão

## 1. Reconstrução Experimental

### Objetivo
Reconstruir corretamente:
- variantes experimentais
- fluxos de navegação
- parâmetros de tracking
- granularidade analítica

### Validações executadas
- parsing seguro de JSON
- validação de cardinalidade
- validação de joins
- validação de flow_types
- validação de tracking parameters
- validação de normalizações do ETL

### Risco mitigado
- interpretação incorreta do experimento
- mistura de granularidades
- duplicação de conversões
- erro de tracking

---

## 2. Primeira Interpretação Experimental

### Objetivo
Gerar interpretação inicial:
- problema de produto
- hipóteses experimentais
- trade-offs
- impactos em UX
- impactos em tracking

### Resultado
Foi identificada uma forte associação entre:
- fluxos externos
- menor conversão medida
- possível perda de atribuição

### Risco identificado
Possível extrapolação causal prematura.

---

## 3. Challenge de Causalidade

### Objetivo
Revisar afirmações causais excessivamente fortes.

### Perguntas utilizadas
- Existe possibilidade de self-selection bias?
- Usuários que saem possuem comportamento diferente?
- A queda observada pode ser parcialmente comportamental?
- Os dados suportam causalidade direta?

### Resultado
A interpretação foi revisada para:
- separar associação de causalidade
- explicitar hipóteses
- reduzir inferências excessivas

### Ajustes realizados
Substituição de expressões como:
- “causou”
- “prova”
- “efeito direto”

por:
- “fortemente associado”
- “os dados sugerem”
- “hipótese mais provável”

---

## 4. Challenge de Viés Experimental

### Objetivo
Avaliar possíveis vieses analíticos.

### Principais vieses considerados
- self-selection bias
- attribution bias
- tracking loss
- behavioral segmentation
- diferenças entre usuários que permanecem e usuários que saem do In-App Browser

### Resultado
Foi identificado que:
- a decisão de saída externa não é randomizada
- usuários externos podem possuir perfil comportamental distinto
- tracking loss e comportamento real não puderam ser totalmente separados

---

## 5. Validação Estatística

### Objetivo
Confirmar se as diferenças observadas eram estatisticamente relevantes.

### Método utilizado
- teste de diferença de proporções (Z-Test)
- comparação de CVR entre variantes

### Comparações executadas
- Variante A vs Variante B
- Variante A vs Variante C

### Resultado
- Variante B apresentou diferença estatisticamente significativa
- Variante C apresentou resultado inconclusivo ao nível de 95%

### Impacto na decisão
A recomendação final foi revisada considerando:
- significância estatística
- significância prática
- risco de falso negativo
- incerteza experimental

---

## 6. Revisão Final da Recomendação

### Objetivo
Garantir:
- rigor metodológico
- clareza executiva
- redução de overclaim causal

### Critérios utilizados
- coerência estatística
- coerência experimental
- coerência comportamental
- limitações dos dados
- impacto operacional
- impacto em tracking
- impacto em UX

### Resultado Final
A recomendação executiva final priorizou:
- robustez da atribuição
- confiabilidade da mensuração
- redução de risco operacional
- manutenção do baseline experimental

---

# Governança do Uso de IA

A IA foi utilizada como:
- camada de interpretação
- apoio à tomada de decisão
- mecanismo de challenge analítico
- apoio à estruturação experimental

A IA NÃO foi utilizada como:
- fonte única de verdade
- mecanismo autônomo de decisão
- substituto de validação quantitativa

---

# Estratégia de Redução de Erro

As seguintes estratégias foram utilizadas:

- validação quantitativa independente no Colab
- separação entre camada analítica e camada cognitiva
- challenge iterativo das conclusões
- revisão de causalidade
- revisão de vieses
- validação estatística adicional
- revisão crítica dos outputs da IA

---

# Reutilização do Framework

O framework foi estruturado para ser reutilizável em futuros experimentos de produto.

A arquitetura permite:
- reutilização das validações
- reutilização dos workflows
- reutilização dos critérios de decisão
- reutilização dos processos de revisão
- reutilização da estrutura analítica
- reutilização da governança de IA

---

# Resultado

O processo final resultou em:
- maior rigor experimental
- redução de risco interpretativo
- maior confiabilidade da recomendação
- maior transparência metodológica
- maior reprodutibilidade analítica
