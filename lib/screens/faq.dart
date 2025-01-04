import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQItem> faqItems = [
    FAQItem(
      question: 'What machine learning model was used?',
      answer:
          'This mobile application implements a logistic regression with one-vs-all (OVA) approach. Logistic regression with a one-vs-all (OvA) approach is a classification technique used when dealing with multi-class problems. In this strategy, the algorithm trains multiple binary classifiers, each distinguishing one class from the rest, enabling the model to effectively handle scenarios where there are more than two possible outcomes.',
    ),
    FAQItem(
      question: 'Why certainty level/confidence rate is not available?',
      answer:
          'Level/confidence rate is not available because of lack of expertise to implement a Python program with the Flutter application.',
    ),
    FAQItem(
      question: 'Why I am unable to save my data to database?',
      answer:
          'The devices used to build this mobile application encountered error creating the database. Also, we ran out of time due to limited time.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E2723), // Dark brown background
      appBar: AppBar(
        title: Text(
          'Crop Recommendation FAQs',
          style: TextStyle(color: Colors.white), // White text for the app bar
        ),
        backgroundColor: Color(0xFF6D4C41), // Light brown app bar background
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            elevation: 4, // Card shadow
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                faqItems[index].isExpanded = !isExpanded;
              });
            },
            children: faqItems.map((FAQItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        item.question,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text color
                        ),
                      ),
                      tileColor: Color(0xFF6D4C41), // Light brown card background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Rounded corners
                      ),
                      onTap: () {
                        setState(() {
                          item.isExpanded = !item.isExpanded;
                        });
                      },
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Text(
                    item.answer,
                    style: TextStyle(
                      color: Colors.white, // White text for answer
                    ),
                  ),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
