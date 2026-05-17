# Guia de Execução: Workflow de Análise de Experimentos

Este guia orienta o passo a passo para a atualização de dados, processamento estatístico no Google Colab e análise avançada utilizando o Google AI Studio.

---

## 📅 Fase 1: Preparação dos Dados (Local)

1. **Atualizar os CSVs** com os dados do novo teste na sua pasta local. Certifique-se de que os seguintes arquivos foram atualizados corretamente:
   * `channels.csv`
   * `partners.csv`
   * `transactions.csv`
   * `url_params.csv`
   * `visit_url_metadata.csv`
   * `visits.csv`
2. **Baixar o Notebook** `experiment_analysis_UP.ipynb` que está presente na pasta do projeto.

---

## 🧪 Fase 2: Processamento e Extração (Google Colab)

1. Acesse o [Google Colab](https://colab.research.google.com/).
2. No menu superior, vá em **Arquivo** > **Fazer Upload de Notebook** e selecione o arquivo `experiment_analysis_UP.ipynb`.
3. No menu lateral esquerdo, clique no ícone de pasta (**Arquivos**).
4. Importe todos os CSVs atualizados na Fase 1 para a raiz do ambiente.

> ⚠️ **Nota Importante:** Aguarde a barra circular de progresso do upload sumir completamente no rodapé do menu lateral antes de avançar. O carregamento incompleto pode gerar erros de leitura (`ParserError`) no Pandas.

5. No menu superior, clique em **Ambiente de Execução** > **Executar Tudo** para rodar o notebook completo.
6. Acompanhe a execução e **valide os outputs intermediários** gerados nas células.
7. O script exportará automaticamente os arquivos agrupados que servirão de insumo para a IA. Na barra lateral de arquivos, faça o **download** de:
   * `variant_summary.csv`
   * `flow_summary.csv`
   * `variant_flow_summary.csv`
   * `experiment_dataset_sample_small.csv`
   * `significance_results.csv`

---

## 🤖 Fase 3: Configuração do Agente (Google AI Studio)

1. Acesse o [Google AI Studio (New Chat)](https://aistudio.google.com/prompts/new_chat).
2. Em *Explore Google models*, clique em **Code and Chat**.
3. No menu lateral direito, realize as seguintes configurações:
   * **Model:** Selecione `Gemini 2.5 Pro` (ou a versão recomendada mais recente do Pro).
   * **System Instructions:** Clique e cole o conteúdo do arquivo `system_instructions.md`.
   * **Nome do Agente:** Dê um nome identificável. *Sugestão:* `Méliuz Shopping [Agente de Análise de Testes de Produto]`
   * **Code Execution:** Ativar (`ON`).
   * **Max Output Tokens:** `32k` (Sugestão para respostas profundas).
   * **Temperature:** `0.2` (Garante respostas mais analíticas e menos criativas).

> 💼 **Nota de Infraestrutura:** Se esta for a sua primeira vez utilizando a ferramenta, certifique-se de que sua conta Google esteja conectada ao seu projeto do Google Cloud Platform (GCP). Valide as cotas e o orçamento antes de iniciar.

---

## 📈 Fase 4: Execução da Análise (Esteira de Prompts)

### Passo 4.1: Alinhamento de Contexto Comercial e de Produto
No campo de texto, clique no botão **`+` (Add Files)** e anexe os seguintes arquivos de contexto:
* `contexto_produto.md` (Informações gerais sobre o contexto de testes de produto).
* `Enunciado_Teste.md` (Regras, premissas e bases específicas do teste atual).
* `Case PM - Teste A_B_C InApp Browser.pdf` (Fluxo visual de exemplo).

Envie esses arquivos em conjunto com o **`PROMPT 1`**.
* **Objetivo:** Fazer com que a IA compreenda as nuances do produto, as hipóteses de negócio e o comportamento esperado antes de olhar para os dados quantitativos.

### Passo 4.2: Análise Quantitativa e Resultados
Após a IA confirmar o entendimento do contexto, envie o **`PROMPT 2`** anexando os outputs executivos extraídos do Colab na *Fase 2*:
* `variant_summary.csv`
* `flow_summary.csv`
* `variant_flow_summary.csv`
* `experiment_dataset_sample_small.csv`
* `significance_results.csv`

Valide a resposta gerada pela IA, garantindo que ela cruzou corretamente os dados brutos com o comportamento esperado.

### Passo 4.3: Conclusão e Próximos Passos
Envie o **`PROMPT 3`** para consolidar a recomendação executiva final, os trade-offs identificados e os riscos de implementação.

---

## 🔗 Referências e Exemplos
* Para consultar uma execução padrão, acesse o exemplo prático no [Google Drive](https://drive.google.com/).
