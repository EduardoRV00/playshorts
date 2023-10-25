import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'conts/strings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 8.0),
            Text(
              'Olá,${FirebaseAuth.instance.currentUser?.displayName ?? 'não encontrado'}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text("Conteúdo da Página Principal"),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(logoImage, fit: BoxFit.fill, alignment: Alignment.center,),
                            ),
                            const Divider(),
                            ListTile(
                              leading: Icon(Icons.home, color: Colors.white,),
                              title: Text("HOME", style: TextStyle(color: Colors.white),),
                              onTap: () {
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.send, color: Colors.white,),
                              title: Text("Telegram", style: TextStyle(color: Colors.white)),
                              onTap: () {
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.movie, color: Colors.white,),
                              title: Text("Gerar Vídeos com IA", style: TextStyle(color: Colors.white)),
                              onTap: () {
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.white,),
                      title: Text("Sair", style: TextStyle(color: Colors.white)),
                      onTap: () {
                      },
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}

