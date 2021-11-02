import 'package:flutter/material.dart';
import 'package:activity6_2/uppercase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => Uppercase(),
        child: MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter any word',
                      ),
                      onChanged: (String text) {
                        setState(() {
                          userInput = text;
                        });
                      }),
                ),
                SizedBox(
                  width: 50,
                ),
                Text('Result: '),
                BlocBuilder<Uppercase, String>(
                    builder: (context, word) => Center(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            word,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        )))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => context.read<Uppercase>().capital(userInput),
                child: Text('Process user input')),
          ],
        ),
      ),
    );
  }
}
