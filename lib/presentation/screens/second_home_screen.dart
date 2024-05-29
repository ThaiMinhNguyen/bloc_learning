import 'package:bloc_learning/logic/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondHomePage extends StatefulWidget {

  final String title;
  final Color color;

  const SecondHomePage({required this.title, required this.color, super.key});

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Times you have pressed:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  );
                }
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text("First page")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncrement());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
