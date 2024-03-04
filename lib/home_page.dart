
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
       body:  Center(
         child: ElevatedButton(onPressed: (){
          Person person = Person(name: "Abdul", age: 20);
          Person person1 = Person(name: "Abdu", age: 20);

          print(person.hashCode.toString());
          print(person1.hashCode.toString());

          print(person == person1);
          }, child: const Text('Submit')),
       ),
       appBar: AppBar(
         elevation: 0,
          centerTitle: true,
          title: const Text("Flutter block Example"),
      ),
    );
  }
}


class Person extends Equatable{
  final String name;
  final int  age;

  Person({required this.name,required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];


}
