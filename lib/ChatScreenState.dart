import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/ChatMessage.dart';
import 'package:hello_flutter/ChatScreen.dart';

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  // note: underscore is private
  final TextEditingController _textController = new TextEditingController();

  bool _isComposing = false;

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();

    // Set the state to composing. Check to see if both setState calls can be combined
    setState(() {
      _isComposing = false;
    });

    // Create a new message
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 200),
        vsync: this,
      ),
      name: "Cody Engel"
    );

    // Set the state, inserting a new message into _messages
    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Send a message"
                  ),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS ?
                new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing ?
                      () => _handleSubmitted(_textController.text) : null,
                )
                    : new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing ?
                        () => _handleSubmitted(_textController.text) : null,
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cody's Chat App"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Container(
          child: new Column(
            children: <Widget>[
              new Flexible(child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              )
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                    color: Theme.of(context).cardColor
                ),
                child: _buildTextComposer(),
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(border: new Border(
              top: new BorderSide(
                  color: Colors.grey[200]
              )
          )
          ) : null),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}