import 'package:central_mobile/api/repository.dart';
import 'package:central_mobile/models/login.dart';
import 'package:central_mobile/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final Repository _repository = Repository();
  late Future<Login> login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Login Page")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
                child: Center(
                    child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/logo_unand.png'),
                )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'))),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 15),
                  child: TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'))),
              const TextButton(
                  onPressed: null,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  )),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    var username = userController.text;
                    var password = passController.text;

                    username = 'admin@central.com';
                    password = 'password';
                    _loginCheck(username, password);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              const Text('New User? Create Account')
            ],
          ),
        ));
  }

  _loginCheck(String username, String password) async {
    login = _repository.login(username, password);
    login.then((val) {
      //Jika login berhasil, maka akan menampilkan token
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => const HomeScreen(
      //               title: "List Dosen",
      //             )));
    });
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }
}
