import 'package:bloc_learning/constants/enum.dart';
import 'package:bloc_learning/logic/counter_bloc.dart';
import 'package:bloc_learning/logic/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {

  final String title;
  final Color color;

  const HomePage({required this.title, required this.color, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected && state.connectionType == ConnectionType.Wifi) {
          context.read<CounterBloc>().add(CounterIncrement());
        } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile) {
          context.read<CounterBloc>().add(CounterDecrement());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Text(
                      'Wifi',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Text(
                      'Mobile',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
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
              SizedBox(height: 20,),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/second');
                  },
                  child: Text("Second page")
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
      ),
    );
  }
}
