import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var textField1 = TextEditingController();
  var textField2 = TextEditingController();
  var textField3 = TextEditingController();

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
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: textField1,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple.shade800.withOpacity(.8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Total Number Of Words',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(254, 194, 96, 1)),
                    hintText: 'Enter number of words',
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textField2,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple.shade800.withOpacity(.8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Increase Score By',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(254, 194, 96, 1)),
                    hintText: 'Score',
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textField3,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.purple.shade800.withOpacity(.8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Add New Word',
                          hintText: 'Enter the new word',
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(254, 194, 96, 1)),
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(254, 194, 96, 1)),
                      ),
                      onPressed: () {
                        if (textField3.text != "") {
                          data.add(textField3.text.trim().toLowerCase());
                        }

                        textField3.clear();
                      },
                      child: const Text(
                        'ADD',
                        style:
                            TextStyle(color: Color.fromARGB(255, 79, 11, 143)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 360,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(254, 194, 96, 1)),
                  ),
                  onPressed: () {
                    if (int.parse(textField1.text.trim().toLowerCase()) <
                        data.length) {
                      retrieve["totalNumOfWords"] =
                          int.parse(textField1.text.trim().toLowerCase()) < 10
                              ? 10
                              : int.parse(textField1.text.trim().toLowerCase());
                    } else {
                      retrieve["totalNumOfWords"] = data.length;
                    }

                    retrieve["score"] =
                        int.parse(textField2.text.trim().toLowerCase()) > 20
                            ? int.parse(textField2.text.trim().toLowerCase())
                            : 20;
                    textField1.clear();
                    textField2.clear();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Color.fromARGB(255, 79, 11, 143)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
