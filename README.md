# fth-latex
Dieses Repository soll LaTeX-Vorlagen für die Arbeit an der [Freien Theologischen Hochschule (FTH) Gießen](https://fthgiessen.de) bereitstellen, insbesondere die Leitlinien für schrifliche Arbeiten an der FTH umsetzen.

## Installation
### UNIX
```
./install.sh
```
sollte LaTeX-Pakete ins lokale `TEXMFHOME` kopieren. Das ist ein Verzeichnis, in dem ein Nutzer eigene TeX-Pakete installieren kann, sodass sie systemweit (für diesen Nutzer) verfügbar sind.

### Windows
Einfach googeln, wo auf Windows das Äquivalent von TEXMFHOME liegt und die Pakete unter `fth-lsa` dorthin kopieren, dann sollten sie auch systemweit verfügbar sein.

### Oder
Wenn das mit `TEXMFHOME` nicht funktioniert, kann man die `.sty`-Dateien auch einfach im lokalen Verzeichnis ablegen und trotzdem wie gewohnt mit `usepackage{fth-lsa}` importieren.

## Abhängigkeiten
Die Pakete `fth-lsa` und `fth-bib` sollten mit einer Standard-LaTeX-2e-Installation problemlos funktionieren.

Das Paket `fth-lang` (und `fth-nt-utils`, das `fth-lang` benötigt) benötigt bestimmte Fonts, siehe dazu unten.

## Pakete und Verwendung
Das Repository stellt verschiedene Pakete zur Verfügung. Es sollten nur diejenigen, die wirklich benötigt werden, verwendet werden:
- `fth-lang` konfiguriert die Verwendung passender Fonts für Griechisch, Hebräisch und bei Bedarf Targum-Aramäisch und Syrisch. Es sollte als erstes geladen werden.
- `fth-lsa` setzt die Formattierungs-Richtlinien aus den Leitlinien für schriftliche Arbeiten an der FTH (ohne Zitate) um.
- `fth-bib` setzt die Richtlinien zur Formattierung von Zitaten und Literaturverzeichnis um.
- `fth-nt-utils` stellt einige hilfreiche Befehle zur Arbeit mit neutestamentlichen Texten zur Verfügung, z.B. für Textkritik oder synoptische Vergleiche.

Ausführliche Beispiele zur Verwendung aller Pakete finden sich in `example.tex`, `example_handout.tex` und `example_thesis.tex` (da die Vorgaben für Abschlussarbeiten etwas anders sind.)

## Kompilierung
Ich verwende zur Kompilierung `latexmk` mit folgenden Einstellungen
```
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex example.tex
```
wobei die meisten der Argumente von meiner IDE generiert wurden und einige vermutlich nicht zwingend nötig sind. Entscheidend ist auf jeden fall `-xelatex`. Statt `latexmk` funktioniert vermutlich auch die Abfolge.
```
xelatex
biblatex
xelatex
xelatex
```
Auf Overleaf reicht es aus, als Compiler XeLaTeX einzustellen.

## Griechisch, Hebräisch und Aramäisch
Griechisch und Hebräisch lassen sich auf 2 Arten nutzen:
- Der Default-Font aus dem Pekt `fth-lsa` enthält die meisten Zeichen beider Sprachen, allerdings können masoretische Akzente nicht dargestellt werden. Verwendet man keine masoretischen Akzente, kann man ganz einfach Griechisch und Hebräisch in Unicode tippen und es sollte problemlos angezeigt werden.
- Alternativ verwendet man das Paket `fth-lang`, das mit `polyglossia` und `fontspec` die Fonts [SBL Hebrew](https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx) und [SBL Greek](https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx) einstellt, die mit `\heb{עִבְרִית}` und `\grk{κοινὴ}` verfügbar sind. Die beiden Fonts müssen auf dem System installiert oder im lokalen Verzeichnis abgelegt sein.

Aramäisch kann im Normalfall wie hebräisch verwendet werden. Will man aber babylonische Punktierung verwenden (etwa für Targum-Aramäisch), muss die Schriftart `EzraBab` auf dem System installiert sein oder als `EzraBab.ttf` im selben Verzeichnis liegen. Leider ist die Schriftart aktuell nicht frei zugänglich. Das ganze sieht dann im Code so aus: `\tgaram{א֘ד֘ם}` und wird im PDF mit den korrekten Vokalzeichen gerendert.

Außerdem kann optional Syrisch verwendet werden. Dazu muss die Schriftart `Estrangelo Edessa` installiert sein oder als `estre.ttf` bereit liegen. Verwendet wird die Sprache dann mit `\syr{ܫܪ̈ܒܬܗܘܢ}`.

Um Kompilierzeit beim Suchen der Fonts zu sparen, sind Aramäisch und Syrisch per Default deaktiviert. Sie können beim Laden des Pakets mit `\usepackage[syr=true,tgaram=true]{fth-lang}` aktiviert werden. Wenn Griechisch und Hebräisch nicht benötigt werden, können sie analog mit `\usepackage[grk=false,heb=false]{fth-lang}` deaktiviert werden.

## Anmerkung zu Bibelstellen
Zur Formattierung von Bibelstellen lädt das Paket `fth-lsa` `bibleref` und `bibleref-german` und stellt die Stile `fth-long` und `fth-short` bereit. Diese geben die Bibelbücher entsprechend Punkt 6.1 der Leitlinien an (dort sind sie mit Loccumer Richtlinien überschrieben, entsprechen diesen allerdings nicht vollständig, sonst müsste bspw. Hiob Ijob heißen). Per Default ist `fth-short` aktiviert. Bei Nutzung dieser Stile sollte `\biblerefformat` *nicht* genutzt werden, sonst würden die Buchnamen auf die Standard-Loccumer Richtlinien zurückgesetz werden. Stattdessen muss mit `\biblerefstyle{fth-long}` bzw. `fth-short` zwischen Lang- und Kurzformat gewechselt werden.

Alternativ zu den Loccumer Richtlinien erlauben die Leitlinien auch das TRE-Format, das beim Laden des Pakets mit der Option `tre` aktiviert werden kann. In dem Fall kann auch problemlos `\biblerefformat` genutzt werden.

Achtung: Bei Verwendung verschiedener Stile in einem Dokument führen die verschiedenen Bezeichnungen der Bücher zu verschiedenen Einträgen im Bibelstellenverzeichnis. Es ist also ratsam, nur einen Stil zu nutzen.

## Mitwirkung
Wenn du an diesem Projekt mitarbeiten möchtest, kannst du das gerne tun. Kontaktiere mich, dann gebe ich dir Zugriff. Bitte immer auf Branches mit sinnvollen Namen arbeiten und dann einen Pull Request an mich stellen.

## Dank
Diese Pakete, insbesondere die BibLaTeX-Einstellungen, wurden auf Grundlage der Bachelorarbeit von [@pico40](https://github.com/pico40) erstellt, danke fürs Bereitstellen! Außerdem habe ich mich an den LaTeX-Vorlagen für die HTW Dresden von [@GenericFJS](https://github.com/genericFJS) orientiert, besonders bei der Titelseite.
