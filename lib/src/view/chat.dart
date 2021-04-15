import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/model/chatMessageModel.dart';
import 'package:luconductora/src/service/chatService.dart';
import 'package:luconductora/src/service/viajeActivoSharePreference.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatService chatService = ChatService();
  ViajeActivoSharePreference viajeActivoSharePreference =
      ViajeActivoSharePreference();
  Map travel;
  List<ChatMessage> messages = [];
  TextEditingController controller = TextEditingController();
  double height;
  double width;
  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: height / 1.3),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                controller.text = value;
                controller.value = TextEditingValue(text: value);
                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Envia un mensaje...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              chatService
                  .addMessage(travel, controller.text)
                  .then((value) => {controller.clear()});
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    viajeActivoSharePreference.getVieaje().then((value) {
      setState(() {
        travel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Chat'),
              backgroundColor: Color.fromRGBO(101, 79, 168, 1),
            ),
            body: SingleChildScrollView(
              
                child: Stack(children: <Widget>[
                  SingleChildScrollView(
                    child: StreamBuilder(
                        stream: chatService.getMessageDriver(travel),
                        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData && snapshot.data.size != 0) {
                            messages.clear();
                            snapshot.data.docs.forEach((element) {
                              messages.add(ChatMessage(
                                  messageContent:
                                      element['messageDriver'] == null
                                          ? element['messageUser']
                                          : element['messageDriver'],
                                  messageType: element['messageDriver'] == null
                                      ? 'receiver'
                                      : 'sender'));
                            });
                          }
                          return ListView.builder(
                            itemCount: messages.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment:
                                      (messages[index].messageType == "receiver"
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (messages[index].messageType ==
                                              "receiver"
                                          ? Colors.grey.shade200
                                          : Colors.deepPurple[200]),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      messages[index].messageContent,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  _buildMessageComposer()
                ]))));
  }
}
