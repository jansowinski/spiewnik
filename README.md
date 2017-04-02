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

wymagania: [ruby](https://www.ruby-lang.org/en/), [node.js](https://nodejs.org/en/), [clean-css](https://github.com/jakubpawlowicz/clean-css), [pandoc](http://pandoc.org/), [kindlegen](https://www.amazon.com/gp/feature.html?docId=1000765211)

1. odpalamy konsolę i instalujemy paczki: `bundle install`
2. W [run.rb](https://github.com/iansowinski/spiewnik/blob/master/run.rb) wpisujemy ścieżkę folderu skryptów w indesignie
3. odpalamy skrypt: `ruby run.rb`
4. Wygenerowany XML importujemy do indesigna, wstawiamy w pole tekstowe i odpalamy skrypt PageBreaks
5. Poza plikiem źródłowym XML generują się też pliki: html (na stronę), epub i mobi (do czytników ebooków)

## Co jest do zrobienia?

- [ ] **zmienić miejsce piosenek kończących**

**zmienić tytuły piosenek:**

- [ ] California (Kalifornia)
- [ ] Góry (A kiedy idę wśród gór (Góry))
- [ ] Pytania syna poety (Ja poeta (Pytania syna poety)
- [ ] Tyle kilometrów (Tyle kilometrów (Tam w bieszczadach))
- [ ] Viva la sierra (viva la plata)
- [ ] W kręgu watry (W kręgu watry (Watra))

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
- [ ] Pamiętam
- [ ] Powrót Sentymentalnej Panny S
- [ ] Przebudzenie
- [ ] Przypowieść o jeżach
- [ ] Pytania, których nie zadam
- [ ] Róża czerwono, biało kwitnie bez
- [ ] Sentymentalna Panna S
- [ ] Space Oddity
- [ ] Tato
- [ ] Ty druha we mnie masz
- [ ] Wild Horses
- [ ] Wilki
- [ ] Wish You were here
- [ ] Piosenka o nieszczęśliwej miłości chomika

**Zmienić / dodać chwyty:**

- [ ] Dola szeryfa
- [ ] Easy rider
- [ ] Rzeka
- [ ] W więziennym szpitalu (Dom wschodzącego słońca)

## Etapy rozwoju

1. [Poprawianie surowej wersji **_(od teraz do połowy września)_**](https://github.com/iansowinski/spiewnik#jak-to-działa)

  - [ ] dodawanie piosenek
  - [ ] dodawanie tabulatur
  - [ ] poprawianie tekstów
  - [ ] poprawianie chwytów
  - [ ] poprawianie tytułów piosenek
  - [ ] poprawki w rozmieszczeniu piosenek w treści

2. Edycja - formatowanie dokumentu w jeden określony sposób

  - [ ] przygotowanie surowego dokumentu z odpowiednimi wcięciami i rozmieszczeniem chwytów
  - [ ] sformatowanie dokumentu jako plik markdown
  - [x] napisanie skryptów do:
    - [x] usuwania formatowania markdown (dla łatwiejszego wklejania do indesignu)
    - [x] rozkmienienie automatyzacji składania tekstu

3. Przygotowanie wersji dla ludzi:

  - [ ] opracowanie szablonu:
    - [ ] przetestowanie odpowiednich czcionek
    - [ ] przetestowanie rozmieszczenia numerów stron itp
  - [ ] przygotowanie dokumentu do druku w indesignie
  - [x] napisanie cssa do mdwiki

4. Stworzenie wersji prywatnej:

  - [ ] ogarnięcie systemu aktualizacji i rozdzielenia śpiewnika prywatnego od błękitnego
    - [ ] osobne repo i przekazanie tego jakiemuś aktywnemu ogarniaczowi?
    - [x] stworzenie softu do generacji śpiewnika?
  - [ ] research materiałów na okładkę
  - [ ] ewentualne przygotowanie ilustracji na okładkę
  - [ ] research rodzajów papieru
  - [ ] projektowanie i testowanie spisu treści
  - [ ] wyrzucenie niechcianych piosenek i dodanie tylko swoich
  - [ ] opracowanie dodatkowych bajerów
  - [ ] druk!

5. Opublikowanie śpiewnika do wglądu Błękitnej:

  - [ ] wrzucenie markdowna na stronę
  - [ ] propozycja współpracy przy edycji
    - [ ] utworzenie arkusza z spisem treści i proponowanymi zmianami
    - [ ] post na grupie błękitnej
  - [ ] publikacja w internecie pdfa z instrukcją do druku

7. Druk wersji dla błękitnej:

  - [ ] propozycja wydrukowania śpiewników dla szczepu
  - [ ] konsultacja z drużynowymi i wybór piosenek
  - [ ] znalezienie drukarni i wycena
  - [ ] przelewy od chętnych
  - [ ] druk
  - [ ] przycięcie
  - [ ] oprawa

## Licencja

Wszystkie skrpyty udostępnione są na licencj [MIT](https://github.com/iansowinski/spiewnik/blob/master/license/MIT.txt). Tekst śpiewnika udostępniony jest na licencji [CC](https://github.com/iansowinski/spiewnik/blob/master/license/CC.txt).


