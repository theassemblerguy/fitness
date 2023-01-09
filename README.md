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

CategoryListView
Hinzufügen mit Alert

CategoryView

WorkoutListView
Hinzufügen mit Alert

WorkoutView zum Trainieren, da sieht man die Sätze - zum Visualisieren der Sätze wurde eine untergeordnete View namens SetListingView definiert
WorkoutEditView zum Anpassen des Workouts

Realisierung der Datenbank mit Core Data. DataController sorgt für Laden der Datenbank nach dem Schema Model.xcdatamodeld
