import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'conts/strings.dart';

class HomeScreen extends StatelessWidget {
  void _launchChatGPT() async {
    const url = 'https://chat.openai.com';
    if (await launchURL(url)) {
      await url;
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }
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
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                              transitionType: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 500),
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
                              fontSize: MediaQuery.of(context).size.width >= 500
                                  ? MediaQuery.of(context).size.width >= 1200
                                      ? MediaQuery.of(context).size.width * .01
                                      : MediaQuery.of(context).size.width * .02
                                  : MediaQuery.of(context).size.width * .03,
                            ),
                          )
                        ],
                      )),
                );
              }),
        ],
      ),
      drawer: MyDrawer(),
      body: Stack(
        children:[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1000) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWidget(
                          onTap: () {
                            context.pushReplacementNamed(
                              'HomeVideosPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 500),
                                )
                              },
                            );
                          },
                          backgroundImage: 'assets/cards/card1.png',
                        ),
                        CardWidget(
                          onTap: () {
                            _launchChatGPT();
                          },
                          backgroundImage: 'assets/cards/card2.png',
                        ),
                        CardWidget(
                          onTap: () {},
                          backgroundImage: 'assets/cards/card3.png',
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CardWidget(
                          isMobile: true,
                          onTap: () {
                            context.pushReplacementNamed(
                              'HomeVideosPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 500),
                                )
                              },
                            );
                          },
                          backgroundImage: 'assets/cards/card1.png',
                        ),
                        const SizedBox(height: 8,),
                        CardWidget(
                          isMobile: true,
                          onTap: () {},
                          backgroundImage: 'assets/cards/card2.png',
                        ),
                        const SizedBox(height: 8,),
                        CardWidget(
                          isMobile: true,
                          onTap: () {},
                          backgroundImage: 'assets/cards/card3.png',
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),


        ]
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Function() onTap;
  final String backgroundImage;
  final bool isMobile;

  CardWidget({required this.backgroundImage, required this.onTap, this.isMobile=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isMobile ? MediaQuery.of(context).size.width <=500 ? MediaQuery.of(context).size.width * 0.9 : 430 : MediaQuery.of(context).size.width * 0.3,
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
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  void _launchChatGPT() async {
    const url = 'https://chat.openai.com';
    if (await launchURL(url)) {
      await url;
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            logoImage,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "HOME",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            context.pushReplacementNamed(
                              'HomeScreen',
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
                          leading: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          title: Text("Vídeos",
                              style: TextStyle(color: Colors.white)),
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
                          leading: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          title: Text("Telegram",
                              style: TextStyle(color: Colors.white)),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                          title: Text("Gerar Vídeos com IA",
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            _launchChatGPT();


                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  title: Text("Sair", style: TextStyle(color: Colors.white)),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    context.pushReplacementNamed(
                      'LoginPage',
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
