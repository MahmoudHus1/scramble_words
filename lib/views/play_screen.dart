import 'dart:math';

import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

List<String> toList() {
  return data.map((e) => e).toList();
}

class _PlayPageState extends State<PlayPage> {
  var textField1 = TextEditingController();
  final _random = Random();
  String word = '';
  String insertedWord = '';
  int score = 0;
  int showScore = 0;
  int index = 0;
  int counter = 1;
  int totalNumOfWords = retrieve["totalNumOfWords"]!;
  List<String> alterData = toList();

  void clearText() {
    textField1.clear();
  }

  void reset() {
    counter = 1;
    score = 0;
    alterData = toList();
  }

  String getRandomElement() {
    String elem = alterData[_random.nextInt(alterData.length)];
    word = elem;
    alterData.remove(elem);
    return elem;
  }

  List<String> getLetter() {
    List<String> w = getRandomElement().trim().split("");
    w.shuffle();
    return w;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/vectors/vector-seamless-pattern-background-icon-vector-id1170275727?k=20&m=1170275727&s=612x612&w=0&h=O7XbyzyOdJ8MghtpK2TIaFlms4mH-C_U6aKWskD0PnQ="),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(254, 194, 96, 1),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Text(
                        '${counter} from ${totalNumOfWords}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 79, 11, 143)),
                      )),
                  const Expanded(child: Text("")),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    margin: const EdgeInsets.only(right: 10),
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(254, 194, 96, 1),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(
                      'Score : ${score}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 79, 11, 143)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 50, left: 10, right: 10, top: 50),
                child: Row(
                  children: [
                    ...getLetter().map((e) {
                      index++;
                      return (index % 2 == 0)
                          ? Expanded(
                              child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(10 / 360),
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      margin: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color.fromRGBO(
                                              254, 194, 96, 1)),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 79, 11, 143),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ))),
                            )
                          : Expanded(
                              child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(350 / 360),
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      margin: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color.fromARGB(
                                              255, 79, 11, 143)),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(254, 194, 96, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ))),
                            );
                    }).toList(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Unscramble the word using all the letters.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromRGBO(254, 194, 96, 1))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textField1,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple.shade800.withOpacity(.8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter the word',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(254, 194, 96, 1))),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(254, 194, 96, 1)),
                        ),
                        onPressed: () {
                          if (counter == 1) {
                            setState(() {
                              showScore = 0;
                            });
                          }
                          if (counter < totalNumOfWords) {
                            setState(() {
                              counter += 1;
                              clearText();
                            });
                          } else {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (value) => AlertDialog(
                                  backgroundColor:
                                      const Color.fromRGBO(254, 194, 96, 1),
                                  title: showScore < 60
                                      ? const Text(
                                          "Game over try again!",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const Text("congratulations!",
                                          style:
                                              TextStyle(color: Colors.green)),
                                  content: Text("Your score : ${showScore}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 79, 11, 143))),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(value).pop();
                                      },
                                      child: Container(
                                        color: showScore < 60
                                            ? Colors.red
                                            : Colors.green,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("okay",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              reset();
                            });
                          }
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 11, 143)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(254, 194, 96, 1)),
                        ),
                        onPressed: () {
                          if (counter == 1) {
                            setState(() {
                              showScore = 0;
                            });
                          }
                          insertedWord = textField1.text.trim().toLowerCase();
                          if (word != insertedWord) {
                            showDialog(
                              context: context,
                              builder: (value) => AlertDialog(
                                backgroundColor:
                                    const Color.fromRGBO(254, 194, 96, 1),
                                title: const Text("Try again!",
                                    style: TextStyle(color: Colors.red)),
                                content: const Text("You insert Wrong word.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 79, 11, 143))),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(value).pop();
                                    },
                                    child: Container(
                                      color: Colors.red,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            clearText();
                          } else if (counter < totalNumOfWords) {
                            setState(() {
                              counter += 1;
                              score += retrieve["score"]!;
                              showScore = score;
                              clearText();
                            });
                          } else {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (value) => AlertDialog(
                                  backgroundColor:
                                      const Color.fromRGBO(254, 194, 96, 1),
                                  title: showScore < 60
                                      ? const Text(
                                          "Game over try again!",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const Text("congratulations!",
                                          style:
                                              TextStyle(color: Colors.green)),
                                  content: Text("Your score : ${showScore}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 79, 11, 143))),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(value).pop();
                                      },
                                      child: Container(
                                        color: showScore < 60
                                            ? Colors.red
                                            : Colors.green,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("okay",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              reset();
                            });
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 11, 143)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
