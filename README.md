# Arch Context Generator

Ein Bash-Script, das umfassende System-Kontext-Dokumentation für Arch Linux Systeme generiert, optimiert für die Verwendung mit Claude.

## Was macht das Script?

`arch-context-generator.sh` sammelt detaillierte Informationen über Ihr Arch Linux System und erstellt eine strukturierte Markdown-Datei mit:

- Hardware-Informationen (CPU, RAM, Disks, GPU)
- Betriebssystem-Details und Konfiguration
- Installierte Pakete und Services
- Netzwerk- und Audio-Konfiguration
- Entwicklungsumgebung
- Sicherheitseinstellungen

## Warum?

Die generierte Kontextdatei verbessert die Zusammenarbeit mit Claude erheblich:
- **Präzisere Hilfe**: Claude kann systemspezifische Lösungen anbieten
- **Weniger Rückfragen**: Alle relevanten Systeminformationen sind sofort verfügbar
- **Bessere Fehlerbehebung**: Claude kennt Ihre exakte Konfiguration

## Verwendung

### 1. Script ausführen

```bash
# Script ausführbar machen
chmod +x arch-context-generator.sh

# Vollständigen Kontext generieren
./arch-context-generator.sh

# Basis-Kontext (nur wichtigste Infos)
./arch-context-generator.sh --basic

# Spezifische Module auswählen
./arch-context-generator.sh --modules=hardware,packages,development
```

### 2. Generierte Datei finden

Das Script erstellt:
- `arch-context_YYYY-MM-DD_HH-MM-SS.md` - Zeitgestempelte Datei
- `arch-context_latest.md` - Symbolischer Link zur neuesten Version

### 3. In Claude hochladen

1. Öffnen Sie [claude.ai](https://claude.ai)
2. Starten Sie eine neue Unterhaltung
3. Klicken Sie auf das Büroklammer-Symbol (📎)
4. Wählen Sie die generierte `arch-context_latest.md`
5. Stellen Sie Ihre systemspezifische Frage

## Beispiel-Anwendungsfälle

- "Warum startet mein Audio-Service nicht?"
- "Hilf mir Docker auf meinem System zu konfigurieren"
- "Optimiere meine BTRFS-Einstellungen"
- "Warum ist mein System langsam beim Booten?"

Mit dem hochgeladenen Kontext kann Claude direkt auf Ihre spezifische Systemkonfiguration eingehen und passende Lösungen vorschlagen.

## Datenschutz

Das Script:
- Filtert sensible Daten (Passwörter, E-Mails, IPs)
- Speichert alles lokal
- Überträgt keine Daten automatisch