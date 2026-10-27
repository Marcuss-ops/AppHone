# Luce App Architecture & Best Practices

Per garantire che ogni pezzo dell'applicazione sia facilmente estraibile e riutilizzabile in altri progetti, seguiamo questi principi rigorosi.

## 1. Separazione tra "Dichiarazione" e "Logica"
Nessun valore stringa, colore, dimensione o configurazione di feature deve essere scritto direttamente (hardcoded) nei widget.
- **Dichiarazione:** Tutto ciò che definisce *cosa* l'app mostra (testi, icone, menu). Si trova in `lib/core/config/`.
- **Logica/Widget:** Tutto ciò che definisce *come* l'app funziona. Questi componenti devono ricevere i dati tramite parametri o provider.

## 2. Struttura Modulare delle Cartelle
```text
lib/
├── core/
│   ├── config/          # IL MONDO DELLE DICHIARAZIONI (Config, stringhe, asset)
│   ├── theme/           # Stili e colori globali
│   └── providers/       # Stato globale (Riverpod)
├── shared/
│   └── widgets/         # Componenti UI generici (es. GlassCard) riutilizzabili ovunque
├── features/            # Ogni cartella qui è un modulo indipendente
│   ├── home/
│   ├── bible/
│   └── ...
└── main.dart            # Solo bootstrap e inizializzazione
```

## 3. Regole d'Oro per la Riutilizzabilità
- **Componenti "Agnostici":** Un widget in `shared/widgets` non deve sapere di essere dentro "Luce". Deve accettare colori e icone come parametri.
- **Configurazioni Centralizzate:** Se vuoi cambiare il nome dell'app o le icone del menu, devi poterlo fare cambiando un solo file in `core/config/`.
- **No Global Context:** Evita di usare `Navigator.of(context)` direttamente nei widget profondi; preferisci passare callback o usare un sistema di routing centralizzato.
- **Provider-based logic:** La logica di business (es. salvataggio diario) vive nei Notifier, non negli `onPressed` dei bottoni.

## 4. Estrazione di un Modulo
Per portare una feature (es. il Diario) in un'altra app, dovresti poter copiare solo:
1. La cartella `lib/features/diario/`
2. Il relativo file di configurazione in `lib/core/config/`
3. I provider associati.
