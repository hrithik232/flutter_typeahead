import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ScrollExample extends StatelessWidget {
  final List<String> items = List.generate(5, (index) => "Item $index");
  final List<String> items2 = List.generate(5, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Suggestion box will resize when scrolling"),
        ),
      ),
      SizedBox(height: 200),
      TypeAheadField<String>(
        getImmediateSuggestions: true,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you looking for?'),
        ),
        suggestionsCallback: (String pattern) async {
          return items
              .where((item) =>
                  item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        suggestionsCallback2: (String pattern) async {
          return items2
              .where((item) =>
                  item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        itemBuilder2: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion + " __"),
          );
        },
        onSuggestionSelected: (String suggestion) {
          print("Suggestion selected");
        },
      ),
      SizedBox(height: 500),
    ]);
  }
}
