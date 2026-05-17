
O objetivo nesta fase é estruturar o problema, as hipóteses e o framework de
análise, sem ainda processar os dados quantitativos.

Análise Experimental: In-App Browser vs. Navegador Externo

Fase 1: Interpretação de Contexto e Estruturação da Análise

Este documento estrutura a primeira fase da análise do teste A/B/C, focando no
entendimento do problema de produto, na formulação de hipóteses e na definição
do framework analítico que será utilizado para avaliar os resultados
quantitativos.

1. Entendimento do Problema de Produto

O problema central reside no trade-off fundamental entre controle operacional e
experiência do usuário (UX) na jornada de compra via aplicativo de cashback.

  - Contexto Atual (Controle): O uso de um In-App Browser (WebView) é a solução
    padrão. Ele maximiza a capacidade da Méliuz de controlar o ambiente,
    garantir a persistência de parâmetros de tracking e, consequentemente,
    assegurar a atribuição de cashback. Este controle é vital para o modelo de
    negócio.
  - Fricção do Usuário: No entanto, o In-App Browser pode gerar fricção
    significativa. Usuários frequentemente não estão autenticados em suas contas
    de lojas parceiras dentro do ambiente do In-App Browser, não possuem senhas
    salvas, cartões de crédito pré-preenchidos ou outras conveniências de seus
    navegadores padrão (Chrome, Safari, etc.). Essa fricção pode levar ao
    abandono da jornada de compra.
  - Problema a ser Resolvido: O experimento busca encontrar um equilíbrio. Como
    podemos reduzir a fricção do usuário, permitindo que ele utilize seu
    navegador externo preferido, sem comprometer fatalmente a atribuição de
    cashback, que é o core business da empresa? A questão não é apenas "qual
    variante converte mais?", mas sim "qual variante oferece o melhor balanço
    entre conversão mensurável e flexibilidade para o usuário?".

2. Hipóteses do Experimento

As três variantes testam diferentes abordagens para resolver o problema, cada
uma com sua própria hipótese.

  - Hipótese Geral: Oferecer aos usuários uma opção de saída para um navegador
    externo em momentos de alta fricção (como falha de login) irá aumentar a
    taxa de conversão geral, pois permitirá que usuários previamente bloqueados
    completem suas compras. O potencial ganho de conversão superará a potencial
    perda de atribuição.

  - Hipótese da Variante A (Controle):

      - H₀ (Hipótese Nula): Manter o fluxo 100% no In-App Browser é a abordagem
        que maximiza o cashback atribuído, pois qualquer alternativa introduzirá
        perdas de tracking inaceitáveis. A fricção de UX é um custo menor em
        comparação ao risco de atribuição.

  - Hipótese da Variante B (Header):

      - H₁: Ao disponibilizar um ponto de saída para o navegador externo de
        forma proeminente e visível (no header), reduziremos a fricção de forma
        significativa para um grande número de usuários. A alta adoção desta
        feature irá desbloquear um volume de compras que compensará a inevitável
        perda de atribuição, resultando em um impacto líquido positivo no
        cashback total gerado.

  - Hipótese da Variante C (Config):

      - H₂: Ao oferecer a opção de saída de forma discreta (no menu de
        configurações), atenderemos a um segmento de usuários mais avançados ou
        que enfrentam problemas específicos (power users), sem incentivar uma
        migração em massa para o fluxo externo. Isso permitirá um ganho de
        conversão incremental com um risco de perda de atribuição muito mais
        controlado e mitigado em comparação com a Variante B.

3. Riscos e Trade-offs Potenciais

A análise deste experimento deve ser centrada nos trade-offs inerentes.

| Dimensão                        | Risco / Trade-off                                                                                                                                                                                                                                                                                                            | Como será medido                                                                                                                                                                                                           |
| :------------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tracking e Atribuição**       | **Perda de Atribuição:** Este é o risco principal. Ao sair do In-App Browser, a cadeia de tracking (parâmetros na URL, cookies) pode ser quebrada. Uma compra pode ocorrer, mas não ser atribuída à Méliuz.                                                                                                                  | Comparação da taxa de conversão entre saídas `inapp` e `browserdefault`. Uma taxa de conversão drasticamente menor ou nula no `browserdefault` pode indicar falha de tracking, não necessariamente falha de conversão.     |
| **Comportamento do Usuário**    | **Viés de Auto-Seleção (Self-Selection Bias):** Usuários que optam por sair para o navegador externo não são uma amostra aleatória. Eles provavelmente estão mais engajados, têm maior intenção de compra ou enfrentam um problema real. O sucesso de conversão deles não pode ser extrapolado para toda a base de usuários. | Análise segmentada do comportamento. Comparar a conversão dos usuários que saíram via `header`, `config` e `login` para entender a intenção por trás da ação.                                                              |
| **Experiência do Usuário (UX)** | **Canibalização vs. Incrementalidade:** A feature está apenas mudando o caminho de usuários que já iriam converter (canibalização) ou está de fato habilitando compras que seriam abandonadas (incrementalidade)?                                                                                                            | Análise do volume total de compras e cashback por variante. Se a Variante B tiver alta adoção da saída externa mas o mesmo volume de cashback do Controle, o efeito foi nulo ou negativo (devido aos custos operacionais). |
| **Impacto Financeiro**          | **Net Cashback Impact:** O objetivo final é o impacto líquido. Um aumento de 20% na conversão com uma perda de 50% na atribuição resulta em um impacto financeiro negativo.                                                                                                                                                  | A métrica principal deve ser financeira (e.g., Cashback por Visita), não apenas a taxa de conversão.                                                                                                                       |

4. Métricas de Análise (Primárias e Secundárias)

Para validar as hipóteses e medir os riscos, as seguintes métricas serão
calculadas:

  - Métricas Primárias (de Decisão):

    1.  Cashback por Visita (CB/Visit): SUM(transactions.cashback_amount) /
        COUNT(DISTINCT visits.visit_id). Esta é a métrica mais importante, pois
        combina conversão, valor da compra e sucesso da atribuição.
    2.  Taxa de Conversão por Visita (Visit CVR): COUNT(DISTINCT
        transactions.visit_id) / COUNT(DISTINCT visits.visit_id). Mede a
        eficiência geral de cada variante em gerar uma compra atribuída.

  - Métricas Secundárias (Diagnósticas e de Comportamento):

    1.  Taxa de Adoção da Saída Externa: COUNT(visits WHERE mz_redirect =
        'browserdefault') / COUNT(total visits) para as variantes B e C. Mede o
        quanto a feature foi utilizada.
    2.  Distribuição de Pontos de Saída: Dentro das variantes B e C, qual a
        proporção de saídas via header, config e login? Isso ajuda a entender a
        motivação do usuário.
    3.  Taxa de Conversão por Canal de Saída: Comparar a CVR das visitas via
        inapp vs. browserdefault. Essencial para diagnosticar a saúde do
        tracking no fluxo externo.
    4.  Taxa de Conversão por Ponto de Saída: Comparar a CVR das visitas
        originadas por utm_term = header, config e login.
    5.  Impacto por Parceiro: Análise segmentada das métricas primárias por
        partner_id para identificar se o efeito varia entre parceiros (e.g.,
        parceiros com processos de login mais complexos).

5. Limitações e Pontos de Atenção

A interpretação dos resultados quantitativos deverá considerar as seguintes
limitações:

1.  A Causalidade da Conversão Externa é Fraca: Como mencionado no viés de
    auto-seleção, não podemos concluir que o navegador externo causa uma
    conversão maior. Apenas podemos observar que o grupo de usuários que
    escolheu esse caminho converteu a uma determinada taxa. A decisão de sair já
    sinaliza uma alta intenção.
2.  A Medição da "Verdadeira" Conversão é Impossível: Não temos como saber o
    número real de compras feitas por usuários que saíram para o navegador
    externo e cuja atribuição falhou. Nossa análise está limitada ao que foi
    mensurado. Uma baixa conversão no fluxo externo pode significar "baixa
    conversão real" ou "tracking quebrado".
3.  Efeitos de Curto Prazo: O comportamento observado pode ser influenciado pelo
    efeito novidade. A taxa de adoção e o perfil de uso podem mudar ao longo do
    tempo.
4.  Generalização: Os resultados são válidos para o período e o público do
    teste. A extrapolação para outros períodos ou segmentos de usuários deve ser
    feita com cautela.

A próxima fase da análise se concentrará na reconstrução do experimento a partir
dos dados fornecidos e no cálculo das métricas definidas acima para validar as
hipóteses e informar uma recomendação executiva.
