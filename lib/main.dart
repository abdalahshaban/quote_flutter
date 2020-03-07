import 'package:flutter/material.dart';
import './quote.dart';
import './quote_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quotes',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: QuoteList());
  }
}

class QuoteList extends StatefulWidget {
  QuoteList({Key key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'abdalah', text: 'Be yourself; everyone else is already taken'),
    Quote(
        author: 'abdalah', text: 'I have nothing to declare except my genius'),
    Quote(author: 'abdalah', text: 'The truth is rarely pure and never simple'),
  ];

  // Widget quoteTemplete(Quote quote) {
  //   return QuoteCard(quote: quote);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awsome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 10,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: quotes
                .map((quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    }))
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            List<Quote> quotes2 = [
              Quote(
                  author: 'abdalah',
                  text: 'Be yourself; everyone else is already taken'),
              Quote(
                  author: 'abdalah',
                  text: 'I have nothing to declare except my genius'),
              Quote(
                  author: 'abdalah',
                  text: 'The truth is rarely pure and never simple'),
            ];
            setState(() {
              quotes = quotes2;
            });
          },
          child: Icon(
            Icons.add,
            semanticLabel: 'Add',
            color: Colors.amber,
          )),
    );
  }
}
