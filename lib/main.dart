import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/cubit/counter_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter App with Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterError) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: Text(state.message),
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is CounterLoading) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    '${BlocProvider.of<CounterCubit>(context, listen: true).state.number}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).reset,
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
