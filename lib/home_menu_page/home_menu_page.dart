import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'conts/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<UsersRecord> nomeUsersRecordList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                      onTap: () async {
                        context.pushNamed(
                          'ProfilePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType
                                  .leftToRight,
                              duration:
                              Duration(milliseconds: 500),
                            ),
                          },
                        );
                      },

                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person_outline, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Olá, ${nomeUsersRecordList.first.displayName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width >= 500 ? MediaQuery.of(context).size.width >= 1200 ? MediaQuery.of(context).size.width*.01 :
                              MediaQuery.of(context).size.width*.02 : MediaQuery.of(context).size.width*.03,
                            ),
                          )
                        ],
                      )

                  ),
                );
              }
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardWidget(
                backgroundImage: 'assets/cards/card1.png',
                //title: 'Vídeos prontos para lucrar'
            ),
            CardWidget(
              backgroundImage: 'assets/cards/card2.png',
             // title: 'Gerador de vídeos por IA',
            ),
            CardWidget(
              backgroundImage: 'assets/cards/card3.png',
              //title: 'Gerador de ideias po IA',
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  //final String title;
  // final double width;
  // final double height;
  final String backgroundImage;

  CardWidget({required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(1.0),
            BlendMode.dstATop,
          ),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      // child: Center(
      //   child: Text(
      //     title,
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 18.0,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
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
                                context.pushReplacementNamed(
                                  'HomeVideosPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                      PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  },
                                );
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
                      onTap: () async  {
                        await FirebaseAuth.instance.signOut();
                        context.pushReplacementNamed(
                          'LoginPage',
                        );
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

