import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
          child: ListView(
            children: [
              Container(
                height: 200,
                width: 400,
                margin: const EdgeInsets.only(right: 60, top: 20),
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 11, 143).withOpacity(.6),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  border: Border.all(
                    width: 3,
                    style: BorderStyle.solid,
                    color: Colors.pinkAccent,
                  ),
                ),
                child: const Text(
                  'Scramble Words Game, Game that mesure your skills in English language, and develop a way of thinking.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:  Color.fromRGBO(216, 216, 216, 1)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: 400,
                margin: const EdgeInsets.only(left: 60),
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 11, 143).withOpacity(.6),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  border: Border.all(
                    width: 3,
                    style: BorderStyle.solid,
                    color: Colors.pinkAccent,
                  ),
                ),
                child: const Text(
                  'The scrambled word will appear on the screen, you must solve this word, every one you solved, your score will increase, you can also skip the word and new word will appear.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(216, 216, 216, 1)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 400,
                margin: const EdgeInsets.only(right: 60),
                padding: const EdgeInsets.only(top: 55, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 11, 143).withOpacity(.6),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  border: Border.all(
                    width: 3,
                    color: Colors.pinkAccent,
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Text(
                  'You can change total number of words, increase score, and add new word to the game.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(216, 216, 216, 1)),
                ),
              ),
            ],
          )),
    );
  }
}
