# 🚀 SkelPhone: White-Label Architecture & Reusability

## 🧩 Filosifia del Progetto
Questa applicazione è progettata per essere un **Motore Universale (White-Label)** per app basate su contenuti, community e abbonamenti. Il codice è strutturato per essere **100% riutilizzabile** e facilmente adattabile a diverse nicchie (Spirituale, Fitness, Formazione, Business, etc.) senza dover riscrivere la logica core.

### 🛠 Principi di Progettazione
1. **Configurazione su Codice (Config-Driven)**: Tutta l'identità dell'app (nomi, colori, terminologia, icone) è definita in file di configurazione (`BrandConfig`, `AppCopy`, `AppAssets`).
2. **Feature Modulari**: Ogni funzionalità (es. "Community Intentions", "Gamification", "Content Player") è un modulo indipendente che può essere attivato, disattivato o rinominato.
3. **Astrazione dei Dati**: I modelli dati non usano termini specifici di una nicchia. Ad esempio, usiamo `CommunityIntention` invece di `PrayerRequest`, permettendo all'app di diventare una "Gratitude Wall" o un "Support Forum" semplicemente cambiando una stringa di testo.
4. **UI basata su Design System**: I componenti UI (Bento Cards, Glass Containers) sono agnostici rispetto al contenuto e si adattano automaticamente al tema definito nel `BrandConfig`.

## 📦 Come Riciclare l'App
Per creare una nuova app basata su questo scheletro:
1. **Aggiorna `BrandConfig`**: Cambia i colori, il font e lo slug della nicchia.
2. **Aggiorna `AppCopy`**: Modifica le stringhe di testo (es. da "Preghiera" a "Supporto").
3. **Modifica le Asset**: Sostituisci icone e immagini nella cartella `assets/`.
4. **Collega Supabase**: Cambia le chiavi API nel file di configurazione ambientale per puntare a un nuovo database con lo stesso schema.

## 🏗 Struttura Modulare
- `lib/core/config`: Il "cervello" dell'app. Contiene le definizioni di cosa l'app *è* e come *appare*.
- `lib/features/`: Moduli funzionali pronti all'uso.
- `lib/shared/widgets`: Componenti UI atomici e riutilizzabili.

---
*Nota: Questa architettura permette di scalare da 1 a 100 app mantenendo un'unica base di codice solida e testata.*
