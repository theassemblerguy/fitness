# Fitness App

## Funktionsweise

Unmittelbar nach Aufruf präsentiert die Fitness App einem standardmäßig die Liste der Übungen (ExerciseListView) in der ContentView, welche die TabBar enthält. Diese Liste von
Übungen ist bei noch nicht gefütterter Datenbank allerdings selbstverständlich leer, was dazu führt, dass – vorausgesetzt Deutsch als Systemsprache eingestellt ist – der String "Noch keine
Übungen definiert" unter der Überschrift „Übungen“ angezeigt wird.
Die Überschriften sind hierbei als Navigation Title innerhalb einer `NavigationView` definiert,
was für ein dem iOS Nutzer bekanntes Bedienkonzept der Anwendung sorgt und stets eine Möglichkeit zum Zurückkhehren
zur vorherigen View bietet.

Prinzipiell wurde die App sowohl ins Deutsche als auch ins Englische lokalisiert. TODO Lobalizable.strings, keys
Um den Rahmen dieser Dokumentation jedoch nicht zu sprengen, wird nachfolgend von Deutsch als Systemsprache ausgegangen.

Es ergibt sich nun also für die Übungsansicht ein Button zum Hinzufügen von Übungen, welcher als Teil einer Toolbar mit einem Accessibility-Label (einer Beschriftung für die Barrierefreiheit) und einem `systemImage` für `plus` ausgestattet ist.

Darunter die bereits erwähnte Überschrift Übungen und je nach Zustand der Datenbank entweder den String, oder einer Liste mit Übungen, welche jeweils aus einem Bild und einem
Namen (Text) bestehen.  Außerhalb dieser ExerciseListView, also in der ContentView findet sich wie gehabt die TabBar, welche allerdings zeitgleich unter dieser Übungsliste
präsentiert wird. Die enthaltenen Tabs heißen „Übungen“, „Kategorien“ und „Workouts“. Zum Start der App ist hier logischerweise „Übungen“ ausgewählt.

Ein Tippen auf den Hinzufügen-button präsentiert die AddExerciseView, welche zunächst ein Texteingabefeld für den Namen der Übung, sowie einen Button zur Fotoauswahl bietet.
Selbstverständlich wird auch der obligatorische Backbutton oben links angezeigt.
Sobald beide Felder gefüllt sind, erscheint oben rechts ein Knopf zum Speichern der neuen Übung.

Beim Langen drücken auf eine Übung in der `ExerciseListView` wird in einem Alert angeboten, die Übung zu löschen.
Der Druck muss mindestens 1,5 Sekunden lang erfolgen.

Die CategoryListView zeigt den Namen aller Kategorien an. Beim Klick auf eine Kategorie wird die `CategoryView` auf den navigation stack gepushed.
Zum Hinzufügen einer Kategorie wird der "Neu"-Button verwendet, welcher einen Alert öffnet. In diesem kann der Name der Kategorie eingetragen werden.

Die Details für die Kategorie, d.h. welche Übungen beinhaltet sind werden in der CategoryView festgelegt.
Hierzu lädt diese sich eine Liste der nicht kategorisierten Übungen, um sie dem Nutzer falls nötig
zu präsentieren.

Zuletzt listet die WorkoutListView alle Workouts beim Namen auf. Auch hier wird analog zur CategoryListView ein Alert für die Erzeugung
neuer Workouts vwerendet. Bei einem Klick auf ein Wokout wird die WorkoutView geöffnet, d.h. auch wieder auf den Navigation Stack
gepushed.

Hierbei dient die WorkoutView primär zur Ansicht und zum Trainieren, wofür die einzelnen Sätze jeder Übung visualisiert werden.
Es werden außerdem Statistiken zur Anzahl der Übungen und Anzahl der Sätze angezeigt.
Zur einfacheren Umsetzung im Code und zur Teilung der Zuständigkeiten wurden die Sätze mit Hilfe einer zusätzlichen View,
der `SetsListingView` visualisiert. in der `WorkoutView` kann das Workout gelöscht werden oder die Bearbeitungsansicht aufgerufen werden.
Die Besonderheit der Bearbeitunsansicht ist, dass nur die Übungen augelistet werden, nicht jeder einzelne Satz.

Zur Realisierung der Datenbank wurde Core Data. Dabei sorgt der DataController für das Laden der Datenbank nach dem Schema `Model.xcdatamodeld`.
