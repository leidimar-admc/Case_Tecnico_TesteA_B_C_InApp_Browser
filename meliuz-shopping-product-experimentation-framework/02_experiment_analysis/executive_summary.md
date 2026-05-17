# Executive Summary
- melhorar autenticação
- mas comprometer tracking e atribuição

---

# Hipóteses Testadas

## Variante A

Controle.

Fluxo padrão completamente em In-App Browser.

---

## Variante B

Hipótese:

permitir saída externa em elementos de maior intenção de navegação poderia melhorar experiência e conversão.

---

## Variante C

Hipótese:

permitir saída externa em pontos mais sensíveis de autenticação e configuração poderia reduzir fricção sem degradar métricas principais.

---

# Principais Resultados

## Conversão

- Variante B apresentou piora estatisticamente significativa.
- Variante C apresentou resultado inconclusivo.

---

# Tracking

Os fluxos externos apresentaram:

- maior risco de tracking loss
- possíveis limitações de atribuição
- maior incerteza experimental

---

# Trade-offs Identificados

| Benefício Potencial | Risco |
|---|---|
| Melhor UX | perda de tracking |
| Melhor autenticação | perda de atribuição |
| Navegação mais natural | menor confiabilidade analítica |
| Menor fricção | menor controle operacional |

---

# Recomendação Final

Manter a Variante A.

As evidências quantitativas atuais não justificam rollout das variantes externas.

---

# Próximos Passos

- melhorar tracking cross-browser
- validar deep linking
- melhorar persistência de sessão
- estruturar nova camada de atribuição
- executar novo experimento controlado
