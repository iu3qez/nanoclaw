---
name: track
description: Track parcels and shipments. Use when the user asks to track a package, check delivery status, or mentions a tracking number.
---

# Parcel Tracking

Use the `parcel` MCP server (17track.net) to track shipments.

## Usage

When the user provides a tracking number:
1. Use `mcp__parcel__track_parcel` with the tracking number
2. The carrier is usually auto-detected — don't ask unless tracking fails
3. Present the result concisely: current status, location, last update date

## Presentation

Format results as:
• *Status*: (es. In transito / Consegnato / In attesa)
• *Posizione*: ultima posizione nota
• *Ultimo aggiornamento*: data e ora
• *Corriere*: nome del corriere

If there are multiple tracking events, show only the last 3 unless the user asks for the full history.

## Multiple packages

If the user asks to track multiple packages, track them all and present a summary table.

## Tracking con aggiornamenti automatici

When the user asks to track a package with ongoing updates (e.g., "aggiornami ogni giorno", "seguilo fino alla consegna"):

1. Do an initial tracking check and report the status
2. Use `mcp__nanoclaw__schedule_task` to create a recurring task:
   - **prompt**: `Controlla il tracking del pacco NUMERO_TRACKING usando lo skill /track. Se risulta consegnato (Delivered/Consegnato), informa l'utente e poi usa mcp__nanoclaw__cancel_task per cancellare questo task. ID task: TASK_ID`
   - **schedule_type**: `cron`
   - **schedule_value**: `0 9 * * *` (daily at 9:00, or as requested by user)
3. Tell the user: "Ti aggiornerò ogni giorno alle 9:00 fino alla consegna."

The scheduled task will:
- Check the tracking status daily
- Report any changes to the user
- Auto-cancel itself when the parcel is delivered
