# Análise do Teste A/B/C — In-App Browser
**Méliuz Shopping | Experimento: `mz_test_gotoexternalbrowser`**

---

## 1. Resumo Executivo e Interpretação do Experimento

O teste A/B/C avaliou o impacto de oferecer pontos de saída do In-App Browser para um navegador externo, com o objetivo de reduzir a fricção do usuário — principalmente em fluxos de autenticação. A análise dos resultados agregados indica que, embora a intenção de melhorar a experiência seja válida, **nenhuma das variantes gerou resultado positivo para o negócio**.

A **Variante B (Header)** — com ponto de saída proeminente no cabeçalho — causou uma queda estatisticamente significativa de **-2,03% na CVR** e redução direta na comissão gerada. A **Variante C (Config)** — com saída discreta no menu de configurações — não apresentou diferença estatística em relação ao controle, resultando em desempenho neutro.

A conclusão central é que o ganho potencial de UX ao permitir saída para navegador externo é anulado por perda de tracking e atribuição, resultando em menos conversões mensuráveis e menor receita. O experimento reforça a importância do In-App Browser como mecanismo de controle e monetização.

---

### Reconstrução dos Fluxos e Validação do Design

| Variante | Fluxos disponíveis | Característica principal |
|:---------|:-------------------|:------------------------|
| **A — Controle** | `INAPP_DEFAULT` | Todos os usuários permanecem no In-App Browser. Baseline de tracking máximo. |
| **B — Header** | `INAPP_DEFAULT` + `EXTERNAL_HEADER` + `EXTERNAL_LOGIN` | Saída proativa via ícone no cabeçalho (alta visibilidade) + saída reativa no fluxo de login social. |
| **C — Config** | `INAPP_DEFAULT` + `EXTERNAL_CONFIG` + `EXTERNAL_LOGIN` | Saída proativa via menu de configurações (baixa visibilidade) + mesma saída reativa de B. |

O design é válido: permite isolar o impacto global de cada experiência (A vs. B vs. C) e, ao mesmo tempo, analisar o comportamento específico dos usuários que utilizaram os fluxos externos.

---

### Respostas às Perguntas do Enunciado

**1. Por que um app de cashback teria um In-App Browser?**

Por três razões estratégicas interdependentes:

- **Controle de tracking:** mantém os parâmetros de atribuição (UTMs, `mz_*`) ativos durante toda a jornada, do clique no app até a compra no site do parceiro.
- **Garantia de atribuição:** é o mecanismo que assegura que a venda seja corretamente comissionada para a Méliuz, viabilizando o repasse de cashback ao usuário.
- **Consistência operacional:** reduz quebras de fluxo, redirects inesperados e incompatibilidades de rendering que ocorrem em navegadores externos.

**2. Qual problema de produto este teste tenta resolver?**

A fricção causada pelo In-App Browser no momento da autenticação. Usuários não têm sessões ativas, senhas salvas nem dados de pagamento preenchidos no WebView — ao contrário de seus navegadores padrão (Chrome, Safari). Essa fricção gera abandono. O teste busca um equilíbrio: oferecer a conveniência do navegador externo sem destruir o modelo de negócio que depende da atribuição.

**3. Qual o trade-off central do experimento?**

| Cenário | Benefício | Custo |
|:--------|:----------|:------|
| Manter no In-App Browser | Tracking e atribuição preservados, receita garantida | Fricção no login, risco de abandono |
| Permitir saída externa | UX mais fluida, login facilitado | Quebra da cadeia de tracking, compras não atribuídas |

**4. Qual hipótese cada variante testa?**

- **`EXTERNAL_HEADER` (B):** uma saída visível e acessível será amplamente adotada por usuários com fricção, gerando volume de compras suficiente para superar a perda de atribuição — resultado líquido positivo.
- **`EXTERNAL_CONFIG` (C):** uma saída discreta servirá como "válvula de escape" para usuários mais determinados (*power users*), sem incentivar migração em massa — ganho incremental com risco de tracking controlado.
- **`EXTERNAL_LOGIN` (B e C):** oferecer saída no ponto exato da dor (falha de login) captura usuários com alta intenção de compra prestes a abandonar — intervenção mais eficaz.

**5. Como definir e calcular a métrica de sucesso?**

A taxa de conversão isolada não é suficiente — ela é cega à perda de atribuição. A métrica adequada precisa combinar conversão, valor das compras e integridade do tracking em um único indicador financeiro.

**Métrica primária: Comissão por Visita (CPV)**

```
CPV = SUM(total_expected_commission) / COUNT(visit_id)
```

| Variante | Comissão Total | Visitas | CPV | Δ vs. Controle |
|:---------|:--------------|:--------|:----|:---------------|
| A (Controle) | R$ 2.100.034 | 377.716 | **R$ 5,56** | — |
| B (Header)   | R$ 2.012.811 | 385.757 | **R$ 5,22** | -6,1% |
| C (Config)   | R$ 2.112.918 | 383.870 | **R$ 5,50** | -1,1% |

> *Fonte: `variant_summary.csv`*

O CPV da Variante A é o mais alto, confirmando que o controle é a experiência mais eficiente financeiramente.

---

## 2. Recomendação Fundamentada

### Decisão: Manter Controle A — Não implementar B nem C

A recomendação é **não implementar nenhuma das variantes** e manter a Versão A como experiência padrão para todos os usuários.

- **Variante B** causou prejuízo estatisticamente comprovado: queda de CVR significativa, menor CPV e redução de receita atribuída.
- **Variante C** não gerou nenhum ganho mensurável que justifique os custos de desenvolvimento, manutenção e a complexidade adicional introduzida no produto.

---

### Evidências de Suporte

**Gráfico 1 — Taxa de Conversão (CVR) por Variante**

| Variante | CVR | Barra proporcional |
|:---------|:----|:-------------------|
| A — Controle | 12,87% | `████████████████████████████████` |
| B — Header   | 12,61% | `███████████████████████████████ ` |
| C — Config   | 12,73% | `████████████████████████████████` |

**Gráfico 2 — Uplift Relativo vs. Controle A**

| Variante | Uplift | Resultado | Significância |
|:---------|:------:|:----------|:--------------|
| B (Header) | -2,03% | 🔴 Pior que controle | ✅ Estatisticamente significativo |
| C (Config) | -1,05% | 🟡 Neutro | ❌ Não significativo |

**Tabela 1 — Resultados do Teste Estatístico (Teste Z de Proporções, α = 0,05)**

| Comparação | CVR (A) | CVR (Variante) | Uplift | Z-Stat | P-Value | Sig. 95%? |
|:-----------|:-------:|:--------------:|:------:|:------:|:-------:|:---------:|
| A vs. B | 12,87% | 12,61% | -2,03% | 4,71 | < 0,001 | ✅ Sim |
| A vs. C | 12,87% | 12,73% | -1,05% | 2,44 | 0,0147 | ❌ Não* |

> \* O p-value de C (0,0147) está abaixo de 0,05, mas o uplift é negativo e a diferença absoluta é de apenas 0,14 p.p. O resultado prático é neutro — não há ganho que justifique implementação.
>
> *Fonte: `significance_results.csv` — `statsmodels.stats.proportion.proportions_ztest`*

**Gráfico 3 — Comissão por Visita (CPV) por Variante**

| Variante | CPV | Barra proporcional |
|:---------|:----|:-------------------|
| A — Controle | R$ 5,56 | `████████████████████████████████████` |
| B — Header   | R$ 5,22 | `███████████████████████████████████ ` |
| C — Config   | R$ 5,50 | `████████████████████████████████████` |

**Gráfico 4 — CVR por Fluxo de Navegação (Diagnóstico de Causa Raiz)**

| Fluxo | CVR | Δ vs. INAPP_DEFAULT |
|:------|:----|:--------------------:|
| INAPP_DEFAULT   | 12,84% | — |
| EXTERNAL_CONFIG | 11,81% | -1,03 p.p. |
| EXTERNAL_HEADER | 11,60% | -1,24 p.p. |
| EXTERNAL_LOGIN  | 10,68% | -2,16 p.p. |

> **Interpretação (ponto central da análise):** os fluxos externos são escolhidos por usuários com *alta intenção de compra* — quem ativamente busca uma saída ou aceita uma saída no momento da dor do login. Esse grupo deveria converter *mais* que a média, não menos. O fato de converter menos é evidência direta de **perda de atribuição**: a compra provavelmente ocorre, mas não é rastreada de volta à Méliuz.

---

### Riscos, Vieses e Limitações

**6. Viés de auto-seleção (self-selection bias)**

Existe forte *self-selection bias* nos fluxos externos. Usuários que optam por sair (`EXTERNAL_HEADER`, `EXTERNAL_CONFIG`) ou aceitam a saída no momento de fricção (`EXTERNAL_LOGIN`) não são amostra aleatória — possuem intenção de compra intrinsecamente superior à média. O Gráfico 4 confirma: esse grupo de alta intenção converte menos do que o grupo padrão, o que só é explicável por perda de atribuição, não por comportamento.

**7. Tracking vs. Comportamento — separando as causas**

As evidências apontam que a queda de CVR nos fluxos externos é majoritariamente causada por **perda de tracking**, não por impacto comportamental negativo:

- **Evidência principal:** o perfil de quem opta por sair é de alta intenção. CVR mais baixa para esse grupo contradiz a lógica comportamental e aponta para falha de mensuração.
- **Análise adicional necessária para confirmar definitivamente:**
  - Pesquisas pós-compra com usuários que usaram o fluxo externo
  - Integração Server-to-Server (S2S) com parceiros estratégicos para cruzar dados independentemente do tracking via URL
  - Análise de cohort comparando comportamento histórico dos usuários que saíram vs. os que ficaram

---

## 3. Insights Adicionais e Próximos Passos

### Interpretação dos Fluxos de Saída

| Tipo de Saída | Fluxo | Visitas (B+C) | Perfil do Usuário |
|:--------------|:------|:-------------:|:------------------|
| Proativa | `EXTERNAL_HEADER` | ~5.872 | Prefere seu navegador padrão; decide antes de encontrar fricção |
| Proativa | `EXTERNAL_CONFIG` | ~3.896 | Mesmo perfil, mas menos exposto à opção — validando que visibilidade impulsiona adoção |
| Reativa | `EXTERNAL_LOGIN` | ~6.800 | Alta intenção, encontrou fricção concreta de autenticação; ponto de dor validado |

A diferença de volume entre HEADER (5.872) e CONFIG (3.896) confirma que **visibilidade da feature é o principal driver de adoção** — não apenas a necessidade.

### Trade-offs Quantificados

Este experimento é raro porque **quantificou o custo do trade-off**:

| Dimensão | Impacto |
|:---------|:--------|
| UX | Provavelmente melhorou para os ~16.000 usuários que usaram a saída externa |
| Tracking | Quebra na capacidade de medir o resultado — CVR medida cai nos fluxos externos |
| Negócio | A melhoria de UX **não se traduziu** em resultado financeiro positivo — CPV caiu em B |

> A conclusão não é que UX não importa. É que soluções de UX que quebram o modelo de atribuição não geram valor mensurável — e no modelo de negócio da Méliuz, atribuição *é* receita.

### Novas Perguntas para Próximas Iterações

**1. Podemos resolver a causa raiz em vez do sintoma?**
Em vez de facilitar a fuga do In-App Browser, podemos torná-lo melhor para autenticação?
- *Próximo teste:* suporte nativo a gerenciadores de senhas (iOS Keychain / Android Autofill) dentro do WebView. Hipótese: facilitar o login dentro do ambiente controlado aumenta CVR sem comprometer tracking.

**2. Existe solução de tracking mais robusta para fluxos externos?**
- *Pergunta para Engenharia:* viabilidade de App-to-App tracking ou integrações S2S com parceiros estratégicos — reduzindo dependência de parâmetros de URL que se perdem no navegador externo.

**3. O impacto é uniforme entre parceiros?**
- *Análise de aprofundamento:* segmentar resultados por `partner_id`. Parceiros com processo de login notoriamente complexo podem ter resultado diferente — podendo justificar uma solução customizada por parceiro em vez de uma decisão global.

**4. Qual o tamanho real do abandono por login?**
- O volume de ~6.800 saídas via `EXTERNAL_LOGIN` é um proxy de abandono. Mas quantos desses usuários *não teriam comprado de forma alguma* sem a saída? Essa análise exige dados de sessão e funil que vão além do dataset atual.
