# 📊💰In-App Browser Experimentation Framework 🩷🛍️


Framework operacional para análise, validação e recomendação de experimentos relacionados à navegação In-App Browser, tracking de atribuição e comportamento de saída para browser externo. **Shopping Méliuz**

O projeto inclui:

- framework reutilizável de análise de experimentos
- reconstrução de variantes via tracking
- validação automatizada de consistência
- análise comportamental de navegação
- avaliação de impacto em conversão e atribuição
- camada de governança analítica
- agente operacional baseado em IA
- geração de recomendações executivas
- estrutura de PRD para próximas iterações
- plano de instrumentação e experimentação

---

## 🚀 Tecnologias e Bibliotecas Utilizadas

- ⚙️ [Databricks Community Edition](https://community.cloud.databricks.com/)
- 🐍 Python / PySpark
- 📊 Pandas
- 📈 Matplotlib
- 🌊 Seaborn
- 🔢 NumPy
- 🔗 Requests
- ⏳ tqdm
- 🎨 PowerPoint (para apresentação dos resultados)

---

## 📦 Instalação de Dependências

No ambiente Databricks, execute o seguinte comando para instalar as dependências necessárias:

%pip install requests tqdm pandas

## Além disso, são utilizadas as seguintes bibliotecas:

import os
import requests
import tarfile
from pyspark.sql import functions as F
from pyspark.sql.functions import (
    lit, col, to_date, to_timestamp, avg, sum, countDistinct, stddev
)
from pyspark.sql.types import StringType, BooleanType, IntegerType, DoubleType
import pandas as pd
from tqdm import tqdm
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
from scipy.stats import ttest_ind
import matplotlib.ticker as mtick
import math
from pyspark.sql.functions import sum as spark_sum


## ▶️ Como Executar
Acesse o Databricks Community Edition.

Faça login na sua conta.

Crie e configure um cluster.

Importe o notebook (.py ou .dbc) via File > Import.

Execute todos os comandos utilizando Run All.

## 🔍 Etapas da Análise

🔗 Coleta de dados: Download dos arquivos diretamente no Databricks via requisição HTTP.

🧹 Tratamento dos dados: Conversão de tipos, tratamento de valores nulos e preparação das tabelas.

🔎 Análise exploratória: Avaliação dos campos, identificação de padrões e geração de gráficos.

📊 Cálculo de métricas: Análises estatísticas descritivas e gráficas.

🧠 Testes estatísticos: Verificação de significância estatística (ex.: Teste T).

💰 Análise de viabilidade financeira: Avaliação dos impactos financeiros da estratégia proposta.

## 📂 Estrutura do Repositório

📦 case_ifood

├── 📁 notebooks/            # Notebooks de tratamento e análise

├── 📄 relatorio_final_case_ifood.pdf   # Relatório final com os resultados

├── 📄 README.md             # Este arquivo

## 📑 Relatório
O relatório final (relatorio_final_case_ifood.pdf) apresenta as conclusões, gráficos e recomendações baseadas na análise dos dados.
