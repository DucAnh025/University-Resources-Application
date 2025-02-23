import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/open_a_i/chat_bubbles/chat_bubbles_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.promptTextController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 10.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        FFIcons.karrowNarrowLeft,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(73.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '6v8ug3m7' /* Chat GPT 4o */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final messagesItem = _model.messages.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: messagesItem.length,
                        itemBuilder: (context, messagesItemIndex) {
                          final messagesItemItem =
                              messagesItem[messagesItemIndex];
                          return ChatBubblesWidget(
                            key: Key(
                                'Keyb75_${messagesItemIndex}_of_${messagesItem.length}'),
                            messages: messagesItemItem,
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.promptTextController,
                    focusNode: _model.promptFocusNode,
                    onFieldSubmitted: (_) async {
                      if (_model.chatRef != null) {
                        // DB - Message(User)

                        var messagesRecordReference1 =
                            MessagesRecord.createDoc(_model.chatRef!);
                        await messagesRecordReference1
                            .set(createMessagesRecordData(
                          created: getCurrentTimestamp,
                          role: Role.user,
                          content: _model.promptTextController.text,
                        ));
                        _model.ongoingChatNewMessage =
                            MessagesRecord.getDocumentFromData(
                                createMessagesRecordData(
                                  created: getCurrentTimestamp,
                                  role: Role.user,
                                  content: _model.promptTextController.text,
                                ),
                                messagesRecordReference1);
                        setState(() {
                          _model.promptTextController?.clear();
                        });
                        _model.ongoingChatUserMessage =
                            await queryMessagesRecordOnce(
                          parent: _model.chatRef,
                          queryBuilder: (messagesRecord) => messagesRecord
                              .orderBy('created', descending: true),
                        );
                        // UI - Messages
                        _model.messages = _model.ongoingChatUserMessage!
                            .toList()
                            .cast<MessagesRecord>();
                        setState(() {});
                        // API
                        _model.ongoingChatResponse =
                            await OpenAIAPIGroup.createChatCompletionCall.call(
                          promptJson: functions
                              .listMessagesToListJSON(_model.messages.toList()),
                        );

                        if ((_model.ongoingChatResponse?.succeeded ?? true)) {
                          // DB - Message(Assitant)

                          var messagesRecordReference2 =
                              MessagesRecord.createDoc(_model.chatRef!);
                          await messagesRecordReference2
                              .set(createMessagesRecordData(
                            created: getCurrentTimestamp,
                            role: Role.assistant,
                            content: valueOrDefault<String>(
                              GptResponseStruct.maybeFromMap(
                                      (_model.ongoingChatResponse?.jsonBody ??
                                          ''))
                                  ?.choices
                                  ?.first
                                  ?.message
                                  ?.content,
                              'message',
                            ),
                          ));
                          _model.ongoingChatAssistantDoc =
                              MessagesRecord.getDocumentFromData(
                                  createMessagesRecordData(
                                    created: getCurrentTimestamp,
                                    role: Role.assistant,
                                    content: valueOrDefault<String>(
                                      GptResponseStruct.maybeFromMap((_model
                                                  .ongoingChatResponse
                                                  ?.jsonBody ??
                                              ''))
                                          ?.choices
                                          ?.first
                                          ?.message
                                          ?.content,
                                      'message',
                                    ),
                                  ),
                                  messagesRecordReference2);
                          // DB - Collection(Messages)
                          _model.ongoingChatAllMessages =
                              await queryMessagesRecordOnce(
                            parent: _model.chatRef,
                            queryBuilder: (messagesRecord) => messagesRecord
                                .orderBy('created', descending: true),
                          );
                          // UI - Messages
                          _model.messages = _model.ongoingChatAllMessages!
                              .toList()
                              .cast<MessagesRecord>();
                          setState(() {});
                        }
                      } else {
                        // DB - ChatDoc

                        var chatsRecordReference = ChatsRecord.collection.doc();
                        await chatsRecordReference.set(createChatsRecordData(
                          uid: currentUserReference,
                          timestamp: getCurrentTimestamp,
                        ));
                        _model.newChatDoc = ChatsRecord.getDocumentFromData(
                            createChatsRecordData(
                              uid: currentUserReference,
                              timestamp: getCurrentTimestamp,
                            ),
                            chatsRecordReference);
                        // State - ChatDoc
                        _model.chatRef = _model.newChatDoc?.reference;
                        // DB - Message(User)

                        var messagesRecordReference3 =
                            MessagesRecord.createDoc(_model.chatRef!);
                        await messagesRecordReference3
                            .set(createMessagesRecordData(
                          created: getCurrentTimestamp,
                          role: Role.user,
                          content: _model.promptTextController.text,
                        ));
                        _model.newChatNewMessage =
                            MessagesRecord.getDocumentFromData(
                                createMessagesRecordData(
                                  created: getCurrentTimestamp,
                                  role: Role.user,
                                  content: _model.promptTextController.text,
                                ),
                                messagesRecordReference3);
                        setState(() {
                          _model.promptTextController?.clear();
                        });
                        // UI - Messages
                        _model.addToMessages(_model.newChatNewMessage!);
                        setState(() {});
                        // API
                        _model.newChatResponse =
                            await OpenAIAPIGroup.createChatCompletionCall.call(
                          promptJson: functions
                              .listMessagesToListJSON(_model.messages.toList()),
                        );

                        if ((_model.newChatResponse?.succeeded ?? true)) {
                          // DB - Message(Assitant)

                          var messagesRecordReference4 =
                              MessagesRecord.createDoc(_model.chatRef!);
                          await messagesRecordReference4
                              .set(createMessagesRecordData(
                            created: getCurrentTimestamp,
                            role: Role.assistant,
                            content: GptResponseStruct.maybeFromMap(
                                    (_model.newChatResponse?.jsonBody ?? ''))
                                ?.choices
                                ?.first
                                ?.message
                                ?.content,
                          ));
                          _model.newChatAssistantDoc =
                              MessagesRecord.getDocumentFromData(
                                  createMessagesRecordData(
                                    created: getCurrentTimestamp,
                                    role: Role.assistant,
                                    content: GptResponseStruct.maybeFromMap(
                                            (_model.newChatResponse?.jsonBody ??
                                                ''))
                                        ?.choices
                                        ?.first
                                        ?.message
                                        ?.content,
                                  ),
                                  messagesRecordReference4);
                          // DB - Collection(Messages)
                          _model.newChatAllMessages =
                              await queryMessagesRecordOnce(
                            parent: _model.chatRef,
                            queryBuilder: (messagesRecord) => messagesRecord
                                .orderBy('created', descending: true),
                          );
                          // UI - Messages
                          _model.messages = _model.newChatAllMessages!
                              .toList()
                              .cast<MessagesRecord>();
                          setState(() {});
                        }
                      }

                      setState(() {});
                    },
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'ih9f81zf' /* Type something here... */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).grey3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).lightGrey2,
                      prefixIcon: Icon(
                        FFIcons.kuser,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      suffixIcon: Icon(
                        Icons.add_link,
                        size: 26.0,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                    validator: _model.promptTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
