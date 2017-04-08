# spiewnik

- [Aktualne wygenerowane pliki (pdf+html)](https://github.com/iansowinski/spiewnik/releases)
- [Wersja markdown (źródłowa)](https://github.com/iansowinski/spiewnik/blob/master/spiewnik.md)
- **[Dokument do edycjii (dla ludzi którzy nie umieją into github)](https://docs.google.com/document/d/1uRUAUEv_SaCI_815sAskEVCUBoUeLJSJrEcUolSJ8Oc/edit?usp=sharing)**

## Jak to działa? (Instrukcja obsługi edycji)

1. Zaglądamy sobie do [wersji poglądowej](https://github.com/iansowinski/spiewnik/releases) i ogarniamy co nam nie pasuje (brakuje piosenek, złe chwyty, brakuje tabulatur i tak dalej...)
2. Wpisujemy uwagi (czyli to co nam nie pasuje) do listy rzeczy do zrobienia w odpowiednią kategorię [dokumencie do edycji](https://docs.google.com/document/d/1uRUAUEv_SaCI_815sAskEVCUBoUeLJSJrEcUolSJ8Oc/edit?usp=sharing)
3. (opcjonalnie) Kopiujemy piosenkę i wklejamy do [dokumentu do edycji](https://docs.google.com/document/d/1uRUAUEv_SaCI_815sAskEVCUBoUeLJSJrEcUolSJ8Oc/edit?usp=sharing) a następnie przerabiamy tak, żeby było dobrze

**_Uwaga!_** _Nie używamy tób'ów - zamiast tego spacje, nie używay innych czcionek niż courier new - w finalnej wersji będziemy używać ładniejszej czcionki ale google docs oferuje tylko jedną czcionkę stałej szerokości, która pozwoli nam później na łatwiejsze ogarnięcie edycji._

## Instrukcja obsługi skryptów

wymagania: 
  - [node.js](https://nodejs.org/en/)
  - [clean-css](https://github.com/jakubpawlowicz/clean-css)

*opcjonalnie:
  - [ruby](https://www.ruby-lang.org/en/) - do odpalenia starym sposobem
  - potrzebne do generowania ebooków): 
    - [pandoc](http://pandoc.org/)
    - [kindlegen](https://www.amazon.com/gp/feature.html?docId=1000765211)*

**BASH:**

1. W [run.sh](https://github.com/iansowinski/spiewnik/blob/master/run.sh) wpisujemy ścieżkę folderu skryptów w indesignie
2. odpalamy skrypt: `sh run.sh` (jeśli chcesz wygenerować ebooki, to wpisz `sh run.sh -e`)
3. Wygenerowany XML (`generated/spiewnik.xml`) importujemy do indesigna, wstawiamy w pole tekstowe i odpalamy skrypt PageBreaks
4. Poza plikiem źródłowym XML, w folderze `generated/` znajdziemy też pliki: html (na stronę), epub i mobi (do czytników ebooków)

**RUBY:**

1. odpalamy konsolę i instalujemy paczki: `bundle install`
2. W [run.rb](https://github.com/iansowinski/spiewnik/blob/master/run.rb) wpisujemy ścieżkę folderu skryptów w indesignie
3. odpalamy skrypt: `ruby run.rb` (jeśli chcesz wygenerować ebooki, to wpisz `ruby run.eb -e`, by odpalić skrypt z ostrzeżeniami z konsoli, dodaj `-w`)
4. Wygenerowany XML (`generated/spiewnik.xml`) importujemy do indesigna, wstawiamy w pole tekstowe i odpalamy skrypt PageBreaks
5. Poza plikiem źródłowym XML, w folderze `generated/` znajdziemy też pliki: html (na stronę), epub i mobi (do czytników ebooków)

## Co jest do zrobienia?

**Dorobić taby:**

- [ ] Barykada (Śmierć Baczyńskiego)
- [ ] Cóż wam chorym
- [ ] Bukowina II
- [ ] Błękitny czas
- [ ] Chyba już można iść spać
- [ ] Dom wschodzącego słońca
- [ ] Dom wschodzącego słońca
- [ ] Jolka, Jolka
- [ ] Kwiatek
- [ ] Mury
- [ ] Myślę sobie, że
- [ ] Nasza klasa
- [ ] Nie płacz Ewka
- [ ] Piosenka na nowy rok
- [ ] Wehikuł czasu
- [ ] Winda
- [ ] Zaułki
- [ ] Śmiech

**Dodać piosenki:**

- [ ] All along the watchtower
- [ ] Gdybym miał gitarę
- [ ] Kto zeżarł talerz klusek
- [ ] Powrót Sentymentalnej Panny S
- [ ] Przebudzenie
- [ ] Przypowieść o jeżach
- [ ] Pytania, których nie zadam
- [ ] Róża czerwono, biało kwitnie bez
- [ ] Sentymentalna Panna S
- [ ] Space Oddity
- [ ] Ty druha we mnie masz
- [ ] Wild Horses
- [ ] Wilki
- [ ] Wish You were here
- [ ] Piosenka o nieszczęśliwej miłości chomika
- [ ] Rio
- [ ] Zbyszek
- [ ] Grażka
- [ ] Tato
- [ ] Tu i teraz
- [ ] Las
- [ ] Północ
- [ ] Wilkiem
- [ ] Wschód
- [ ] Rycerz

**Fonty:**

- [iosevka](https://be5invis.github.io/Iosevka/)
- [fira mono](https://mozilla.github.io/Fira/)
- [input](http://input.fontbureau.com/preview/)
- [source code pro](https://fonts.google.com/specimen/Source+Code+Pro)

## Etapy rozwoju

1. [edycja surowej wersji (do czerwca)](https://github.com/iansowinski/spiewnik#jak-to-działa)

  - [ ] dodawanie piosenek
  - [ ] dodawanie tabulatur
  - [ ] poprawianie tekstów
  - [ ] poprawianie chwytów
  - [ ] poprawianie tytułów piosenek
  - [ ] poprawki w rozmieszczeniu piosenek w treści
  - [ ] przygotowanie surowego dokumentu z odpowiednimi wcięciami i rozmieszczeniem chwytów
  - [x] sformatowanie dokumentu jako plik markdown
  - [x] napisanie skryptów do:
    - [x] usuwania formatowania markdown (dla łatwiejszego wklejania do indesignu)
    - [x] rozkmienienie automatyzacji składania tekstu
    - [ ] spis treści według inciptu

2. Przygotowanie fizycznej wersji prototypowej (do końca czerwca):

  - [ ] opracowanie szablonu:
    - [ ] przetestowanie odpowiednich czcionek
    - [ ] przetestowanie rozmieszczenia numerów stron itp
  - [ ] przygotowanie dokumentu do druku w indesignie
  - [x] napisanie cssa do htmla
  - [x] ogarnięcie systemu aktualizacji
  - [x] stworzenie softu do generacji śpiewnika?
  - [ ] research materiałów na okładkę
  - [ ] przygotowanie ilustracji na okładkę
  - [ ] research rodzajów papieru
  - [ ] projektowanie i testowanie spisu treści
  - [ ] wyrzucenie niechcianych piosenek i dodanie tylko swoich
  - [ ] opracowanie dodatkowych bajerów
  - [ ] druk!
  - [ ] znalezienie drukarni i wycena

3. Opublikowanie śpiewnika (2 tygodnie przed obozem):

  - [ ] propozycja wydrukowania śpiewników dla szczepu
    - [ ] konsultacja z drużynowymi i wybór piosenek
  - [ ] post na grupie błękitnej + zebranie zamówień
  - [ ] wrzucenie plików na stronę
    - [ ] publikacja w internecie pdfa z instrukcją do druku
    - [ ] wrzucenie tego na fanpage i napisanie do starych czternastaków
    - [ ] propozycja współpracy przy edycji
  - [ ] produkcja
    - [ ] druk
    - [ ] przycięcie
    - [ ] oprawa

4. Dalszy rozwój:
  
  - [ ] stworzenie web-apki do generowania śpiewnika i proponowania edycji

## Licencja

Wszystkie skrpyty udostępnione są na licencj [MIT](https://github.com/iansowinski/spiewnik/blob/master/license/MIT.txt). Tekst śpiewnika udostępniony jest na licencji [CC](https://github.com/iansowinski/spiewnik/blob/master/license/CC.txt).

## Podziękowania

Projekt powstał na podstawie różnych śpiewników kilku pokoleń Czternastaków. Korzystaliśmy z śpiewników autorstwa: Marty Bieniasz, Julki Suwalskiej i Janka Sowińskiego, Kuby Zygrłowskiego (Zygacza) i Tomka Bratkowskiego (Bratka), Grzesia Rachlewicza
