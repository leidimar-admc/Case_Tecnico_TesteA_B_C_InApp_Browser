# Enunciado 
A Méliuz é uma plataforma de cashback e benefícios. No app, uma compra começa quando o usuário ativa o cashback em uma loja parceira e é direcionado para concluir a jornada no ambiente da loja.

Neste, você vai analisar um teste A/B/C real relacionado ao In-App Browser, o navegador interno usado no app para abrir lojas parceiras. O material visual mostra as experiências testadas e as instrumentações (tracking URLs) geradas em pontos específicos do fluxo.

# Seu objetivo é interpretar o problema de produto, reconstruir o teste a partir dos dados e recomendar uma decisão.
Materiais

# Você receberá:

1.	Material visual com os fluxos das três versões testadas.
2.	Os inputs recebidos podem incluir:

- datasets analíticos processados
- summaries executivos
- outputs agregados
- métricas experimentais
- tabelas analíticas
- material visual com fluxos das variantes
- exemplos de tracking URLs
- documentação de tracking
- schemas relacionais
- regras experimentais
- contexto de negócio
- parâmetros UTM
- parâmetros customizados mz_*
- eventos de navegação
- métricas e definições de negócio

3.	Este enunciado com as perguntas e regras do teste.

Teste A/B/C
O teste comparou três versões da experiência:

Versão	Nome	Descrição visual
A	Controle	Fluxo padrão do In-App Browser.
B	Header	Experiência com opção de saída para navegador externo no header e fluxo de login social.
C	Config	Experiência com opção de saída para navegador externo no menu de configurações e fluxo de login social.
Como ler o material visual e os dados
O material visual mostra exemplos de tracking URL bruta gerada pelo app. Os CSVs mostram os dados depois do processamento no BI.

A tracking URL não vira uma única tabela. Parte dos parâmetros segue um ETL fixo, como os campos UTM, e aparece em url_params. Outros parâmetros são customizados do app, geralmente prefixados com mz_, e ficam no JSON de visit_url_metadata. Além disso, alguns dados importantes não vêm da URL: a loja/parceiro e o canal final da saída são registrados pelo próprio evento de saída.

Na prática:

Dado na URL ou no evento	Como usar nos CSVs
utm_content	Identifica feature ou superfície em url_params.utm_content. Use visits.url_param_id para relacionar com url_params.url_param_id.
utm_term	Detalhe opcional em url_params.utm_term; pode estar vazio. Use visits.url_param_id para relacionar com url_params.url_param_id.
mz_test_gotoexternalbrowser	Identifica a variante A/B/C no JSON de visit_url_metadata.tracking_url_params. Use visits.visit_id para relacionar com visit_url_metadata.visit_id
mz_redirect	Indica o destino bruto no JSON de visit_url_metadata e o canal tratado em channels.channel_name.
Loja/parceiro	Não vem de UTM; use visits.partner_id relacionado com partners.partner_id.
Compra atribuída	Relacione transactions.visit_id com visits.visit_id para identificar compras atribuídas a cada saída.

Observações importantes:

-	Sempre que o usuário clica em ativar cashback, a aplicação chama a URL de redirecionamento e envia parâmetros que ajudam a identificar origem, feature, teste, versão e outros detalhes da saída.
-	utm_content indica a feature ou superfície que gerou a saída.
-	utm_term é um campo auxiliar livre. Ele pode estar vazio ou carregar um detalhe adicional da feature.
-	Parâmetros customizados do app, como mz_test_gotoexternalbrowser, mz_redirect ou qualquer mz_*, podem ser enviados na tracking URL e ficar disponíveis em visit_url_metadata.tracking_url_params quando não existem como colunas fixas do ETL de UTMs.
-	A loja/parceiro não deve ser inferida por utm_term. Ela já vem registrada na saída e deve ser analisada por visits.partner_id.
-	Nos CSVs, alguns valores de UTM foram normalizados para facilitar análise: por exemplo, external_browser_modal aparece como EXTERNAL_BROWSER_MODAL.
-	Uma mesma visit_id pode estar associada a mais de uma compra. Ao calcular métricas de conversão e impacto, valide o grão das tabelas antes de transformar compras em uma flag binária.
Exemplos de tracking URLs brutas
O material visual ajuda a entender a jornada. Para evitar ambiguidade na leitura das URLs, abaixo estão exemplos brutos de tracking URL geradas pelo app em cada tipo de saída.

Situação	Exemplo
Controle A - saída base InApp	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=partner_page&utm_term=&user_id=USER_123&mz_test_gotoexternalbrowser=a&mz_redirect=inapp
Header B - saída base InApp	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=partner_page&utm_term=&user_id=USER_123&mz_test_gotoexternalbrowser=b&mz_redirect=inapp
Header B - saída pelo header	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=external_browser_modal&utm_term=header&user_id=USER_123&mz_test_gotoexternalbrowser=b&mz_redirect=browserdefault
Header B - saída por login social	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=external_browser_modal&utm_term=login&user_id=USER_123&mz_test_gotoexternalbrowser=b&mz_redirect=browserdefault
Config C - saída base InApp	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=partner_page&utm_term=&user_id=USER_123&mz_test_gotoexternalbrowser=c&mz_redirect=inapp
Config C - saída pelo menu Config	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=external_browser_modal&utm_term=config&user_id=USER_123&mz_test_gotoexternalbrowser=c&mz_redirect=browserdefault
Config C - saída por login social	https://www.meliuz.com.br/redirecionar?utm_source=app&utm_medium=ios&utm_content=external_browser_modal&utm_term=login&user_id=USER_123&mz_test_gotoexternalbrowser=c&mz_redirect=browserdefault
Dados entregues
Arquivo	Grão	Descrição
visits.csv	Uma linha por saída/click	Saídas do usuário para loja parceira, com IDs anonimizados e chaves para dimensões.
transactions.csv	Uma linha por compra atribuída	Compras atribuídas a uma saída, com valores financeiros.
url_params.csv	Uma linha por conjunto de parâmetros	Parâmetros de origem e acionamento capturados na URL de tracking.
visit_url_metadata.csv	Uma linha por saída/click	JSON com parâmetros customizados da tracking URL.
partners.csv	Uma linha por parceiro	Parceiros anonimizados.
channels.csv	Uma linha por canal	Canal final registrado para a saída.
