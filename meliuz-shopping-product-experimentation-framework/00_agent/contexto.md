# Contexto do Experimento

## Cenário

O experimento analisado envolve jornadas de cashback em ambiente mobile utilizando In-App Browser.

O fluxo padrão ocorre dentro do aplicativo, utilizando navegador interno para garantir:

- persistência de tracking
- atribuição confiável
- controle da sessão
- continuidade da jornada

---

# Problema de Produto

Embora o In-App Browser ofereça maior controle operacional, ele também pode gerar:

- limitações de autenticação
- problemas de login
- incompatibilidade com sessões existentes
- pior experiência de navegação
- fricção em jornadas web

O experimento buscou avaliar se permitir saída para navegador externo poderia melhorar experiência do usuário sem comprometer métricas de negócio.

---

# Trade-off Principal

O principal trade-off do experimento envolve:

| Benefício Potencial | Risco |
|---|---|
| Melhor UX | perda de tracking |
| Melhor autenticação | perda de atribuição |
| Navegação mais natural | menor confiabilidade analítica |
| Compatibilidade web | maior complexidade operacional |

---

# Hipóteses Gerais

## Variante A
Fluxo padrão completamente em In-App Browser.

## Variante B
Saída externa em pontos de navegação/header.

## Variante C
Saída externa em pontos relacionados a autenticação/configuração.

---

# Objetivos do Experimento

- melhorar experiência do usuário
- reduzir fricção
- melhorar autenticação
- manter tracking confiável
- preservar atribuição
- evitar degradação de conversão
