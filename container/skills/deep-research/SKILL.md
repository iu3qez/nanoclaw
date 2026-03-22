---
name: deep-research
description: Deep research on any topic. Produces comprehensive, well-cited reports with source quality assessment. Use when the user asks for in-depth research, a detailed report, or sends /deep-research.
---

# Deep Research

Conduct structured, in-depth research using WebSearch and WebFetch.

## Workflow

Follow these steps in order:

### 1. Elabora la domanda
- Definisci i termini chiave e il perimetro della ricerca
- Identifica gli aspetti principali da coprire

### 2. Genera 3-5 sotto-domande
Ogni sotto-domanda deve:
- Coprire un aspetto specifico del topic
- Essere risolvibile tramite ricerca web
- Insieme, fornire copertura completa

### 3. Ricerca per ogni sotto-domanda
- Usa **WebSearch** con query mirate (almeno 2-3 query per sotto-domanda, riformulando se i risultati sono scarsi)
- Usa **WebFetch** per leggere le fonti più rilevanti e autorevoli
- Privilegia fonti primarie (documentazione ufficiale, paper, repo attivi) rispetto a blog generici

### 4. Valuta la qualità delle fonti
Per ogni progetto, libreria, o risorsa trovata, valuta e riporta:
- **Maturità**: progetto attivo vs abbandonato, numero di commit/release, ultimo aggiornamento
- **Adozione**: stelle, fork, utilizzo in produzione noto
- **Completezza**: cosa implementa realmente vs cosa dichiara di voler fare
- **Affidabilità**: documentazione, test, licenza

Usa un giudizio esplicito: "produzione-ready", "prototipo funzionante", "proof-of-concept", "abbandonato". Non presentare un repo con 4 commit come se fosse un'alternativa valida — segnala chiaramente i limiti.

### 5. Sintetizza il report

## Trigger

- `/deep_research <topic>`
- "fai una ricerca approfondita su..."
- "ricerca su...", "deep research on..."
- "fammi un report su...", "analizza in dettaglio..."

## Formato output

```
*Titolo della ricerca*

*Sommario*
2-3 frasi che rispondono alla domanda principale.

*Risultati principali*
Sezioni numerate per sotto-topic, ognuna con:
- Fatti chiave trovati
- Valutazione qualità delle fonti
- Limiti e incertezze

*Valutazione risorse*
Lista delle risorse principali con giudizio di maturità/affidabilità. NON usare tabelle Markdown (non renderizzano su Telegram). Usa liste puntate.

*Conclusioni*
Risposta alla domanda originale, raccomandazioni pratiche.

*Fonti*
Link alle fonti consultate.
```

## Linee guida
- Non citare estesamente da fonti copyrighted (max 25 parole per citazione)
- Presenta una visione bilanciata, riconosci incertezze
- Distingui chiaramente tra fatti verificati e ipotesi
- Se un'area ha poche fonti o solo progetti immaturi, dillo esplicitamente
