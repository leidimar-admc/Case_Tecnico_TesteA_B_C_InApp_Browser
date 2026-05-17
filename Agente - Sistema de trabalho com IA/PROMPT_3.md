# Próxima Melhoria Experimental

Com base nos aprendizados das análises de teste, qual deve ser a próxima melhoria ou teste do In-App Browser? Por quê?

Seu objetivo é propor a próxima melhoria experimental do produto considerando:

- comportamento dos usuários
- impacto em UX
- impacto em tracking
- impacto em atribuição
- impacto financeiro
- riscos operacionais
- limitações identificadas
- oportunidades de melhoria incremental

O objetivo NÃO é apenas sugerir ideias.

O objetivo é estruturar:
- uma melhoria incremental realista
- um experimento executável
- uma PRD utilizável por engenharia
- uma estratégia robusta de tracking
- uma estratégia robusta de validação
- um plano experimental escalável
- um plano de rollout seguro

A resposta deve demonstrar:

- pensamento de produto
- pensamento experimental
- pensamento analítico
- maturidade em tracking
- maturidade em atribuição
- preocupação com UX
- preocupação operacional
- governança experimental
- capacidade de reutilização

---

# CONTEXTO OBRIGATÓRIO

Considere:

- aprendizados das análises anteriores
- possíveis tracking losses
- possíveis attribution losses
- limitações cross-browser
- persistência de sessão
- fricções de UX
- problemas de autenticação
- riscos operacionais
- riscos técnicos
- limitações de tracking mobile
- limitações de atribuição
- riscos de mensuração

Considere também:

- necessidade de melhoria incremental
- necessidade de mensuração confiável
- necessidade de escalabilidade
- necessidade de continuidade da jornada
- necessidade de rastreabilidade analítica
- necessidade de rollout controlado

---

# REGRAS OBRIGATÓRIAS

- nunca concluir sem racional quantitativo
- nunca ignorar trade-offs
- nunca ignorar tracking loss
- nunca ignorar attribution loss
- nunca ignorar risco operacional
- sempre separar hipótese de fato
- sempre explicitar limitações
- sempre considerar escalabilidade
- sempre considerar reutilização futura
- sempre considerar governança experimental
- sempre considerar impacto técnico
- sempre considerar impacto em engenharia

---

# ESTRUTURA OBRIGATÓRIA DA RESPOSTA

# 1. Diagnóstico e Oportunidade

Responder:

- qual problema foi identificado?
- qual oportunidade existe?
- por que vale priorizar isso agora?
- quais aprendizados motivam essa melhoria?
- quais riscos atuais precisam ser mitigados?

Incluir:

- impacto esperado
- trade-offs
- riscos conhecidos
- limitações atuais

---

# 2. Próxima Melhoria Proposta

Descrever claramente:

- qual melhoria será implementada
- qual comportamento do usuário ela busca melhorar
- qual problema operacional ela busca reduzir
- qual risco de tracking ela busca mitigar
- qual risco de atribuição ela busca reduzir

A proposta deve ser:

- incremental
- realista
- implementável
- mensurável
- escalável

---

# 3. Hipótese Experimental

Definir:

## hipótese principal

## hipóteses secundárias

Separar:

- hipótese comportamental
- hipótese de tracking
- hipótese operacional
- hipótese de atribuição

---

# 4. PRD Completa

A PRD deve conter obrigatoriamente:

## Contexto de Negócio

## Problema

## Oportunidade

## Objetivo

## Hipótese

## Solução Proposta

## Fluxo Esperado

## MVP

## Fora de Escopo

## Critérios de Aceite

## Dependências

## Riscos

## Trade-offs

## Impacto Esperado

## Métrica Primária

## Métricas Secundárias

## Guardrails

## Rollout Plan

## Critérios de Rollback

## Critérios de Sucesso

## Critérios de Fracasso

## Critérios de Iteração

---

# 5. Plano de Instrumentação

Definir:

## eventos

## propriedades

## parâmetros UTM

## parâmetros mz_*

## tracking URLs

## payloads

## persistência de sessão

## estratégia de atribuição

## estratégia de validação cross-browser

---

# 6. Exemplo Técnico de Tracking

Gerar exemplos reais de:

## tracking URL

## payload JSON

## propriedades de eventos

## estrutura de parâmetros

## eventos esperados

---

# 7. Validação de Instrumentação

Explicar:

- como validar tracking antes do lançamento
- como validar atribuição
- como validar persistência de sessão
- como validar consistência cross-browser
- como validar continuidade da jornada
- como validar tracking end-to-end

Incluir:

- testes QA
- testes analíticos
- validações automatizadas
- monitoramento pós-lançamento
- validações de payload
- validações de sessão

---

# 8. Plano Experimental

Definir:

## desenho experimental

## grupos experimentais

## randomização

## métricas

## tempo de experimento

## significância estatística

## critérios de decisão

## estratégia de rollout gradual

---

# 9. Plano de Coleta e Análise

Explicar:

- como os dados serão coletados
- como serão analisados
- como serão agregados
- como serão validados
- como inconsistências serão monitoradas

Definir:

## métrica primária

## métricas secundárias

## guardrails

## monitoramento operacional

## monitoramento de tracking

## monitoramento de atribuição

---

# 10. Breakdown para Engenharia

Estruturar:

## frontend tasks

## backend tasks

## tracking tasks

## analytics tasks

## QA tasks

## rollout tasks

## observability tasks

Se necessário:

- dividir em milestones
- dividir em entregas incrementais
- dividir em fases controladas

---

# 11. Governança e Escalabilidade

Explicar:

- como o framework pode ser reutilizado
- como a instrumentação pode ser reutilizada
- como reduzir risco futuro
- como melhorar rastreabilidade
- como escalar experimentação futura
- como reduzir risco operacional
- como melhorar governança experimental

---

# FORMATO OBRIGATÓRIO

A resposta deve ser:

- extremamente estruturada
- executiva
- técnica quando necessário
- reutilizável
- orientada à engenharia
- orientada à tomada de decisão
- orientada à escalabilidade

Utilize:

- tabelas
- listas
- blocos técnicos
- exemplos concretos
- exemplos de payload
- exemplos de URLs
- exemplos de eventos
- exemplos de schemas
- exemplos de rollout

Sempre:

- explicitar premissas
- explicitar limitações
- explicitar riscos
- diferenciar hipótese de fato
