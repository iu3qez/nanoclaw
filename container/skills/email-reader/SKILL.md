---
name: email-reader
description: Check and summarize emails. Use when the user asks to read, check, or summarize emails from any account (Gmail or IMAP).
---

# Email Reader

## Accounts

- **Gmail** (mcp: gmail, gmail2) — two Google accounts
- **IMAP** (mcp: email) — iq3qc@mountainqrp.it

## Reading emails

When checking emails, always apply these filters:

### Mandatory filters for iq3qc@mountainqrp.it

This mailbox receives many automated messages. ALWAYS filter out:
- **Read receipts** (conferme di lettura / disposition notifications)
- **Delivery failure notices** (ricevute di mancata consegna / NDR / bounce)
- **Auto-replies** (risposte automatiche / out-of-office)
- Messages with subjects starting with or containing: "Read:", "Letto:", "Letta:", "Recapitato:", "Recapitata:", "Delivery Status", "Undeliverable", "Non recapitabile", "Non recapitato", "Mail Delivery", "Returned mail", "Rapporto di mancato recapito", "Notifica di lettura", "Disposition notification"
- Messages from: "mailer-daemon", "postmaster", "noreply", "no-reply"
- Messages with Content-Type containing "disposition-notification" or "delivery-status"

Only report real emails from real people or services.

### Presentation

When summarizing emails:
- Group by account if checking multiple accounts
- Show: sender, subject, date, brief preview
- Highlight urgent or important emails
- Use bullet points (•) for the list
- Keep it concise — one line per email unless asked for details
