import 'package:flutter/material.dart';
import 'package:tugas_2315091033/main.dart';
import 'package:tugas_2315091033/homepage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Koperasi Undiksha",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image.asset('logoundiksha.png',
            width: 180,
            height: 180
            ,),
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 360,
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 179, 179, 179),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('Username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 9, 28, 122)
                  ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  )),
                  SizedBox(height: 25,),
                  Text('Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 9, 28, 122)
                  ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )),
                  SizedBox(height: 25,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Lupa Password?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 122),
                    fontSize: 15
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
 } 