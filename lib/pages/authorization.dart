import 'package:flutter/material.dart';

class Auhorization extends StatefulWidget {
  const Auhorization({super.key});

  @override
  AuhorizationState createState() => AuhorizationState();
}

class AuhorizationState extends State<Auhorization> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // This widget is the root of your application.
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(15.0),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: const BorderSide(color: Color(0xFF179CDF))),
  );
  final ButtonStyle enterBtnStyle = ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    padding: const EdgeInsets.all(20.0),
    backgroundColor: Colors.white.withOpacity(0.05),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(color: Color.fromARGB(255, 45, 140, 188))),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/logo.png',
          width: 300,
          height: 75,
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Card(
                elevation: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Номер телефона, эл. адрес или имя",
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Пароль",
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Material(
                        child: TextButton(
                          onPressed: () => {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/main', (route) => false)
                          },
                          style: enterBtnStyle,
                          child: Text(
                            "Вход",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue.withOpacity(0.5)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text.rich(
                style: TextStyle(fontSize: 15),
                TextSpan(children: [
                  TextSpan(
                      text: 'Забыли данные для входа?',
                      style: TextStyle(color: Colors.black45)),
                  TextSpan(
                      text: ' Помощь со входом в систему.',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ])),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              const Text(
                "ИЛИ",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
            ]),
            TextButton.icon(
                onPressed: () {},
                label: const Text('Войти через Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                icon: const Icon(Icons.facebook, color: Colors.blue)),
          ],
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Divider(
              color: Colors.black,
              height: 30,
            ),
            Text.rich(
                style: TextStyle(fontSize: 15),
                TextSpan(children: [
                  TextSpan(
                      text: 'Ещё нет аккаунта?',
                      style: TextStyle(color: Colors.black45)),
                  TextSpan(
                      text: ' Зарегистрируйтесь.',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ]))
          ],
        ),
      ),
    );
  }
}