# 🔋 Battery Test Management

Sistema desenvolvido para demonstrar o controle, rastreabilidade e análise de testes de baterias.

O projeto simula um cenário de Engenharia no qual diferentes modelos de baterias precisam ser identificados, testados, classificados e acompanhados por meio de seus números de série.

> **Importante:** todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para demonstração.

---

## 🎯 Objetivo

Centralizar informações de baterias e seus respectivos testes, permitindo:

- Identificar o modelo da bateria;
- Registrar números de série;
- Registrar resultados dos testes;
- Classificar baterias como aprovadas ou reprovadas;
- Identificar motivos de reprovação;
- Acompanhar indicadores de qualidade;
- Melhorar a rastreabilidade;
- Reduzir atividades manuais;
- Apoiar análises de Engenharia.

---

## 🏗️ Cenário

O sistema considera dois modelos de bateria:

| Modelo | Capacidade |
|---|---:|
| BAT-2600 | 2600 mAh |
| BAT-3350 | 3350 mAh |

Cada bateria possui um número de série único e passa por diferentes etapas de validação.

---

## 🔎 Fluxo do processo

```text
Número de série
       ↓
Identificação da bateria
       ↓
Validação do modelo
       ↓
Teste de impedância
       ↓
Teste de capacidade
       ↓
Análise dos resultados
       ↓
Aprovada / Reprovada
```

---

## 📋 Critérios de exemplo

### Teste de impedância

Para fins de demonstração:

- Impedância ≤ 250 mΩ → Aprovada
- Impedância > 250 mΩ → Reprovada
- Impedância = 0 → Reprovada

Os critérios são parametrizados no projeto e podem ser alterados conforme a necessidade.

---

## 📊 Indicadores

O projeto permite construir indicadores como:

- Total de baterias testadas;
- Taxa de aprovação;
- Taxa de reprovação;
- Principais motivos de reprovação;
- Resultado por modelo;
- Resultado por lote;
- Distribuição dos resultados;
- Evolução dos testes ao longo do tempo.

---

## 🗄️ Estrutura de dados

O projeto utilizará uma estrutura simplificada contendo:

### Batteries

Informações cadastrais da bateria.

### Tests

Informações relacionadas aos testes realizados.

### Test Results

Resultados e critérios utilizados na avaliação.

---

## 🛠️ Tecnologias

- Java
- Spring Boot
- SQL
- REST API
- Git
- GitHub

---

## 🚀 Próximas etapas

- [ ] Criar banco de dados;
- [ ] Criar modelo das tabelas;
- [ ] Criar API REST;
- [ ] Implementar cadastro de baterias;
- [ ] Implementar registro de testes;
- [ ] Implementar regras de aprovação;
- [ ] Criar consultas SQL para indicadores;
- [ ] Criar dados fictícios;
- [ ] Criar documentação da API.

---

## 💡 Contexto profissional

O projeto foi inspirado em desafios de Engenharia relacionados à rastreabilidade, testes, análise de resultados e automação de processos.

A implementação disponibilizada neste repositório é independente e utiliza dados fictícios, sem informações confidenciais ou proprietárias.
