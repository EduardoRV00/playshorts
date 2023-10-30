import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../backend/backend.dart';
import '../custom_code/actions/download_from_video_collection_firebase.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_menu_page/conts/strings.dart';


class HomeVideosPageWidget extends StatefulWidget {
  @override
  State<HomeVideosPageWidget> createState() => _HomeVideosPageWidgetState();
}

class _HomeVideosPageWidgetState extends State<HomeVideosPageWidget> {
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
      body:  SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: StreamBuilder<List<VideosRecord>>(
                  stream: queryVideosRecord(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<VideosRecord> gridViewVideosRecordList =
                    snapshot.data!;
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount;
                        if (constraints.maxWidth >= 1200) {
                          crossAxisCount = 3;
                        } else if (constraints.maxWidth >= 800) {
                          crossAxisCount = 2;
                        } else {
                          crossAxisCount = 1;
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewVideosRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewVideosRecord =
                              gridViewVideosRecordList[gridViewIndex];
                              return Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x2B202529),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 140,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    gridViewVideosRecord
                                                        .imagemThumbnail,
                                                    width: 100,
                                                    height: 259,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: AlignmentDirectional(
                                                      1.01, 1.05),
                                                  child: ClipRRect(
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 5,
                                                        sigmaY: 2,
                                                      ),
                                                      child: Container(
                                                        width: 50,
                                                        height: 24,
                                                        decoration: BoxDecoration(
                                                          color:
                                                          Color(0xBF0F1113),
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                8),
                                                            topLeft:
                                                            Radius.circular(
                                                                8),
                                                            topRight:
                                                            Radius.circular(
                                                                0),
                                                          ),
                                                        ),
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                        child: Text(
                                                          gridViewVideosRecord
                                                              .duracao,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Readex Pro',
                                                            color:
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                              child: Text(
                                                gridViewVideosRecord.titulo,
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Text(
                                          gridViewVideosRecord.descricao,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                      Divider(
                                        height: 24,
                                        thickness: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final Reference videoRef = FirebaseStorage.instance.refFromURL(gridViewVideosRecord.urlVideo);
                                          final String fileName = videoRef.fullPath;
                                          final storage = FirebaseStorage.instance.ref(fileName);

                                          ///chamada do metodo para salvar arquivo
                                          final data = await storage.getData(838860800);
                                          print(data);
                                          FileUtils.saveFile(data: data!, filename: 'video',);
                                        },
                                        text: 'Download',
                                        icon: Icon(
                                          Icons.cloud_download_rounded,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 36,
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                          ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );

                  },
                ),
              ),
            ),
          ],
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
                              leading: Icon(Icons.play_arrow, color: Colors.white,),
                              title: Text("Vídeos", style: TextStyle(color: Colors.white)),
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
                                _launchChatGPT();
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

