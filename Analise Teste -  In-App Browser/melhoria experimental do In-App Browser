Compreendido. Com base nos aprendizados do experimento anterior, esta é a
proposta estruturada para a próxima melhoria experimental do In-App Browser.

1. Diagnóstico e Oportunidade

  - Qual problema foi identificado? O experimento anterior validou que existe
    uma fricção significativa no fluxo de compra, principalmente relacionada à
    autenticação do usuário nos sites parceiros. O fluxo EXTERNAL_LOGIN foi um
    dos pontos de saída mais utilizados, provando que o login é um ponto de dor
    real.

  - Qual oportunidade existe? A oportunidade é resolver a causa raiz da fricção
    (dificuldade de login) em vez de tratar o sintoma (permitindo a fuga para um
    navegador externo). Se pudermos facilitar a autenticação dentro do nosso
    ambiente controlado (o In-App Browser), podemos melhorar a experiência do
    usuário e aumentar a conversão sem sacrificar a atribuição.

  - Por que vale priorizar isso agora? Acabamos de provar quantitativamente que
    a alternativa (saída para navegador externo) é financeiramente prejudicial
    devido à perda de tracking. O problema está validado e o impacto de não
    resolvê-lo é o abandono da jornada de compra. A organização está alinhada
    sobre a importância de manter o fluxo no In-App Browser, tornando este o
    momento ideal para investir em melhorá-lo.

  - Quais aprendizados motivam essa melhoria?

    1.  O In-App Browser é vital: Manter o usuário no ambiente controlado é
        fundamental para a atribuição e monetização.
    2.  O login é um ponto de dor validado: O volume de saídas pelo
        EXTERNAL_LOGIN quantifica o problema.
    3.  A perda de tracking é real e cara: A CVR mais baixa nos fluxos externos
        não é comportamental, mas sim um problema de mensuração que impacta
        diretamente a receita.

  - Quais riscos atuais precisam ser mitigados? O principal risco é a taxa de
    abandono de usuários com alta intenção de compra que falham ao tentar se
    autenticar no site do parceiro dentro do nosso WebView.

| Dimensão              | Detalhes                                                                                                                                                                             |
| :-------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Impacto Esperado**  | Aumento na Taxa de Conversão (CVR) e na Comissão por Visita (CPV), especialmente em parceiros que exigem login.                                                                      |
| **Trade-offs**        | Investimento de engenharia para implementar a solução vs. o potencial ganho de receita. A solução pode não funcionar em 100% dos parceiros (e.g., formulários de login não-padrão).  |
| **Riscos Conhecidos** | Complexidade técnica na integração com APIs nativas de autofill; Risco de segurança (requer revisão); Incompatibilidade com WebViews de parceiros que usam formulários customizados. |
| **Limitações Atuais** | O WebView padrão não oferece uma experiência de autenticação fluida, forçando os usuários a digitar senhas manualmente, o que leva a erros e abandono.                               |

2. Próxima Melhoria Proposta: "Seamless Authentication"

A próxima melhoria é a implementação do suporte nativo a gerenciadores de senhas
e autofill do sistema operacional (iOS Keychain/Autofill e Android Autofill
Framework) dentro do In-App Browser.

  - Comportamento do usuário a ser melhorado: Reduzir drasticamente a fricção ao
    encontrar uma tela de login. Em vez de digitar manualmente, o usuário será
    solicitado pelo sistema operacional a preencher suas credenciais salvas com
    um único toque ou autenticação biométrica.
  - Problema operacional a ser reduzido: Elimina a necessidade de soluções
    paliativas (como a saída para navegador externo) que comprometem o modelo de
    negócio.
  - Risco de tracking a ser mitigado: Nenhum. A solução mantém o usuário 100% do
    tempo dentro do nosso WebView, preservando toda a cadeia de tracking.
  - Risco de atribuição a ser reduzido: Nenhum. A atribuição permanece intacta,
    pois não há quebra na jornada do usuário.

Esta proposta é incremental (melhora um componente existente), realista (utiliza
APIs de SO padrão), mensurável (o impacto na conversão é diretamente observável)
e escalável (a solução funciona para a maioria dos parceiros sem customização).

3. Hipótese Experimental

  - Hipótese Principal: Ao implementar o suporte nativo a gerenciadores de
    senhas (Seamless Authentication) no In-App Browser, aumentaremos a Comissão
    por Visita (CPV), pois mais usuários conseguirão superar a barreira do login
    e completar suas compras, resultando em maior conversão e receita atribuída.

  - Hipóteses Secundárias:

      - Comportamental: Usuários expostos à variante com Seamless Authentication
        terão uma taxa de conversão (CVR) significativamente maior do que o
        controle, especialmente em parceiros que requerem login para compra.
      - De Atribuição/Tracking (Guardrail): A implementação da feature não
        causará nenhuma perda de eventos de tracking ou quebra na atribuição,
        pois a jornada do usuário permanece no mesmo ambiente. O volume de
        eventos por visita se manterá estável.
      - Operacional (Guardrail): A nova funcionalidade não aumentará a taxa de
        crashes do aplicativo nem degradará a performance de carregamento do
        In-App Browser.

4. PRD Completa: Seamless Authentication no In-App Browser

| Seção                     | Descrição                                                                                                                                                                                                                                                                                                                                          |
| :------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Contexto de Negócio**   | Nossa monetização depende da atribuição de compras, que é garantida pelo In-App Browser. No entanto, dados do experimento Q2-2024 "GoToExternalBrowser" provaram que a fricção de login dentro do browser causa abandono e frustração.                                                                                                             |
| **Problema**              | Usuários com alta intenção de compra abandonam a jornada porque não conseguem/querem se logar manualmente nos sites parceiros dentro do nosso app, resultando em perda de receita.                                                                                                                                                                 |
| **Oportunidade**          | Podemos resolver a causa raiz da fricção de login integrando APIs nativas de autofill do iOS e Android, melhorando a UX e a conversão sem comprometer o tracking.                                                                                                                                                                                  |
| **Objetivo**              | Aumentar a Comissão por Visita (CPV) em pelo menos 2% ao reduzir o abandono na etapa de login.                                                                                                                                                                                                                                                     |
| **Hipótese**              | A implementação do Seamless Authentication aumentará a CVR e o CPV ao facilitar o processo de login para os usuários.                                                                                                                                                                                                                              |
| **Solução Proposta**      | Habilitar as configurações necessárias no componente WebView do app para que ele se integre com o framework de Autofill do sistema operacional. Quando o usuário focar em um campo de login/senha, o teclado nativo sugerirá as credenciais salvas.                                                                                                |
| **Fluxo Esperado**        | 1\. Usuário ativa cashback e entra no In-App Browser. 2. Navega até a página de login do parceiro. 3. Toca no campo de e-mail/usuário. 4. O teclado do SO sugere as credenciais salvas. 5. Usuário autentica (biometria/senha mestre) e os campos são preenchidos. 6. Usuário prossegue com a compra logado.                                       |
| **MVP**                   | Suporte funcional para o `textContentType` (iOS) e `autofillHints` (Android) nos WebViews, cobrindo os casos de uso de login mais comuns.                                                                                                                                                                                                          |
| **Fora de Escopo**        | Construir um gerenciador de senhas próprio; Suporte a formulários de login exóticos ou não-padrão; Integrações com SDKs de terceiros.                                                                                                                                                                                                              |
| **Critérios de Aceite**   | 1\. GIVEN um usuário na variante de teste, WHEN ele foca em um campo de senha em um site parceiro, THEN o prompt de autofill do SO deve ser exibido. 2. GIVEN o prompt é exibido, WHEN o usuário autentica, THEN as credenciais devem ser preenchidas corretamente. 3. O evento `inapp_auth_autofill_triggered` é disparado com o payload correto. |
| **Dependências**          | Equipe de App Mobile (iOS/Android); Equipe de Segurança da Informação (para revisão da implementação).                                                                                                                                                                                                                                             |
| **Riscos**                | 1\. **Técnico:** Alguns parceiros podem usar iframes ou formulários não-padrão que impedem o autofill. 2. **Segurança:** A implementação deve seguir as melhores práticas para evitar vulnerabilidades.                                                                                                                                            |
| **Trade-offs**            | Esforço de engenharia e QA para uma feature que pode não funcionar em 100% dos parceiros.                                                                                                                                                                                                                                                          |
| **Impacto Esperado**      | Aumento de CVR e CPV. Redução da frustração do usuário.                                                                                                                                                                                                                                                                                            |
| **Métrica Primária**      | **Comissão por Visita (CPV)**.                                                                                                                                                                                                                                                                                                                     |
| **Métricas Secundárias**  | Taxa de Conversão por Visita (CVR); AOV (Average Order Value); Adoção da Feature (contagem de eventos `inapp_auth_autofill_triggered`).                                                                                                                                                                                                            |
| **Guardrails**            | Taxa de Crash do App; Tempo de Carregamento da Página (P75); Volume de Eventos de Tracking por Sessão.                                                                                                                                                                                                                                             |
| **Rollout Plan**          | **Fase 1 (1 semana):** 1% da base para monitorar guardrails. **Fase 2 (1 semana):** 10% da base. **Fase 3 (2 semanas):** 50% da base para coletar dados de significância estatística. **Fase 4:** 100% se os resultados forem positivos.                                                                                                           |
| **Critérios de Rollback** | Aumento \>0.5% na taxa de crash; Queda estatisticamente significativa no CPV; Quebra crítica em parceiros estratégicos.                                                                                                                                                                                                                            |
| **Critérios de Sucesso**  | Uplift estatisticamente significativo e positivo no CPV (alvo: \>2%) após 4 semanas de teste a 50%.                                                                                                                                                                                                                                                |
| **Critérios de Fracasso** | Resultado neutro ou negativo no CPV após o período de teste.                                                                                                                                                                                                                                                                                       |
| **Critérios de Iteração** | Se o resultado for neutro, investigar se a adoção foi baixa ou se o problema de login não é o principal gargalo. Se for positivo, considerar expandir o suporte para formulários de endereço e pagamento.                                                                                                                                          |

5. Plano de Instrumentação

| Componente            | Especificação                                                                                                                                                                          |
| :-------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Eventos**           | `inapp_auth_autofill_triggered`: Disparado quando o SO oferece a sugestão de autofill ao usuário.                                                                                      |
| **Propriedades**      | `partner_id`: ID do parceiro. `os`: 'ios' ou 'android'. `autofill_status`: 'offered' (sugestão exibida), 'accepted' (usuário usou a sugestão). `form_field_type`: 'login', 'password'. |
| **Parâmetros UTM**    | Sem alterações. `utm_content` continua identificando a superfície de origem (e.g., `partner_page`).                                                                                    |
| **Parâmetros mz\_**\* | `mz_test_seamlessauth`: 'a' (controle) ou 'b' (teste). Este parâmetro identifica a alocação do usuário no experimento.                                                                 |
| **Tracking URLs**     | A estrutura atual é mantida, apenas adicionando o novo parâmetro de teste.                                                                                                             |
| **Payloads**          | O novo evento será um payload JSON enviado para o endpoint de analytics.                                                                                                               |
| **Persistência**      | A alocação do usuário (`a` ou `b`) deve ser persistida no dispositivo para garantir consistência em múltiplas sessões.                                                                 |
| **Atribuição**        | Sem alterações. O fluxo permanece 100% no In-App Browser, garantindo a integridade da atribuição.                                                                                      |
| **Validação**         | O QA deve validar em diferentes versões de SO e em parceiros com diferentes tipos de formulários de login.                                                                             |

6. Exemplo Técnico de Tracking

  - Exemplo de Tracking URL (Saída da Página de Parceiro):

    https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=partner_page&user_id=USER_456&mz_test_seamlessauth=b&mz_redirect=inapp

  - Exemplo de Payload JSON do Novo Evento:

    {
      "event_name": "inapp_auth_autofill_triggered",
      "event_timestamp": "2024-10-27T10:00:00Z",
      "user_id": "USER_456",
      "session_id": "SESSION_789",
      "properties": {
        "partner_id": "partner_123",
        "os": "ios",
        "os_version": "17.1",
        "app_version": "10.5.0",
        "autofill_status": "offered",
        "form_field_type": "login",
        "experiment_details": {
          "mz_test_seamlessauth": "b"
        }
      }
    }

7. Validação de Instrumentação

1.  Testes de QA Analítico (Pré-Lançamento):

      - QA utiliza uma build de teste e uma ferramenta de proxy (e.g., Charles,
        Fiddler) para interceptar o tráfego de rede.
      - Eles executam o fluxo de login em parceiros de teste e verificam se o
        evento inapp_auth_autofill_triggered é disparado e se o payload JSON
        corresponde exatamente à especificação.
      - Validam que o parâmetro mz_test_seamlessauth está sendo corretamente
        adicionado à URL de redirecionamento.

2.  Validação no Ambiente de Staging (Pré-Lançamento):

      - Os dados de teste são enviados para um ambiente de dados de staging.
      - A equipe de Analytics executa queries para confirmar que os eventos são
        recebidos, parseados corretamente e que as novas propriedades estão
        populando as tabelas de destino sem erros de schema.

3.  Monitoramento Pós-Lançamento (Rollout Controlado):

      - No rollout de 1%, a equipe monitora um dashboard em tempo real para:
          - Volume de Eventos: O volume do novo evento é compatível com o número
            de usuários na variante? (Não pode ser zero nem excessivamente
            alto).
          - Qualidade dos Dados: Verificar a taxa de NULLs nas novas
            propriedades.
          - Guardrails: Monitorar ativamente as métricas de crash e performance.

8. Plano Experimental

| Componente               | Especificação                                                                                                                                                      |
| :----------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Desenho**              | Teste A/B, randomizado no nível do usuário.                                                                                                                        |
| **Grupos**               | **Grupo A (Controle):** Experiência atual do In-App Browser. **Grupo B (Teste):** Experiência com Seamless Authentication habilitado.                              |
| **Randomização**         | Alocação 50/50, persistente por `user_id`.                                                                                                                         |
| **Métricas**             | **Primária:** CPV. **Secundárias:** CVR, AOV. **Guardrails:** Crash Rate, Page Load Time.                                                                          |
| **Tempo**                | Mínimo de 2 semanas completas (para mitigar efeitos de sazonalidade), com duração estimada de 4 semanas para atingir poder estatístico.                            |
| **Significância**        | Nível de significância (α) de 0.05, poder estatístico (1-β) de 0.8.                                                                                                |
| **Critérios de Decisão** | Se a Variante B mostrar um uplift estatisticamente significativo e positivo no CPV, ela será a vencedora. Se o resultado for neutro ou negativo, o Controle vence. |
| **Rollout Gradual**      | 1% -\> 10% -\> 50% -\> 100%, com validação de guardrails em cada etapa.                                                                                            |

9. Plano de Coleta e Análise

  - Coleta: Os eventos de tracking (incluindo o novo evento e as visitas) são
    enviados do cliente para um coletor de dados, processados por um pipeline de
    ETL e carregados no Data Warehouse (e.g., Snowflake, BigQuery).
  - Análise: Um dashboard centralizado no BI (e.g., Tableau, Looker) será criado
    para comparar os grupos A e B em todas as métricas definidas. A análise
    estatística final será feita via script (Python/R) ou SQL para garantir a
    reprodutibilidade.
  - Monitoramento:
      - Operacional: Alertas (via Datadog, Sentry) para picos na taxa de crash
        ou latência no grupo B.
      - Tracking: Alertas para quedas anormais no volume de eventos visit ou
        transaction em qualquer um dos grupos.
      - Atribuição: Monitorar a taxa de conversão geral para garantir que não
        haja quedas inesperadas, o que poderia indicar um problema sistêmico.

10. Breakdown para Engenharia

| Área                       | Tasks                                                                                                                                                                                                                                                          |
| :------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Frontend (iOS/Android)** | 1\. Implementar a lógica de feature flag para `mz_test_seamlessauth`. 2. Configurar o componente WebView para habilitar a integração com as APIs de Autofill do SO. 3. Instrumentar o disparo do evento `inapp_auth_autofill_triggered` com o payload correto. |
| **Backend**                | 1\. Adicionar o novo feature flag (`seamless_auth_experiment`) ao serviço de configuração remota.                                                                                                                                                              |
| **Analytics/Data Eng.**    | 1\. Adicionar o novo evento e suas propriedades ao schema de dados. 2. Atualizar os pipelines de ETL para processar o novo evento. 3. Construir o dashboard de monitoramento do experimento.                                                                   |
| **QA**                     | 1\. Criar o plano de teste, cobrindo diferentes SOs, dispositivos e parceiros. 2. Executar testes manuais e de regressão. 3. Validar a instrumentação analítica usando ferramentas de proxy.                                                                   |
| **Rollout (SRE/DevOps)**   | 1\. Planejar e executar o rollout gradual (1% -\> 10% -\> 50%) através da ferramenta de feature flag.                                                                                                                                                          |
| **Observability**          | 1\. Configurar dashboards e alertas para as métricas de guardrail (crash rate, latência).                                                                                                                                                                      |

11. Governança e Escalabilidade

  - Reutilização do Framework: Este PRD e plano experimental servem como um
    template padrão para futuros testes no In-App Browser, garantindo
    consistência metodológica.
  - Reutilização da Instrumentação: O parâmetro mz_test_* é o padrão para
    identificação de experimentos. O evento inapp_auth_autofill_triggered pode
    ser enriquecido no futuro para outros tipos de autofill (endereço,
    pagamento).
  - Redução de Risco Futuro: Ao estabelecer o princípio de "resolver a fricção
    dentro do nosso ambiente", evitamos que futuras equipes proponham soluções
    que quebrem a atribuição.
  - Melhora na Rastreabilidade: A documentação rigorosa garante que, daqui a um
    ano, qualquer pessoa possa entender por que a feature foi construída, como
    foi medida e qual foi seu impacto.
  - Escalabilidade Experimental: A estrutura de feature flag e tracking permite
    que múltiplos experimentos não sobrepostos rodem em paralelo no futuro.
