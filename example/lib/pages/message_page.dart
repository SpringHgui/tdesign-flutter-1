import 'package:example/page_util.dart';
import 'package:flutter/material.dart';
import 'package:tdesign/tdesign.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
    // Message.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      child: _widget(),
      title: 'Message',
      backgroundColor: Colors.white,
      titleColor: Colors.black,
    );
  }

  Widget _widget() {
    return ListView(children: [
      PageUtil.buildSubTitle('带图标消息通知'),
      PageUtil.outlinedButton(
          '普通',
          () => Message.show('普通消息',
              msgType: MessageType.info, msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '成功',
          () => Message.show('成功消息',
              msgType: MessageType.success, msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '警示',
          () => Message.show('警示消息',
              msgType: MessageType.warning, msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '错误',
          () => Message.show('错误消息',
              msgType: MessageType.error, msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '超长警示',
          () => Message.show('色不异空空不异色色即是空空即是色色不异空空不异色色即是空空即是色',
              msgType: MessageType.warning, msgPosition: MessagePosition.top)),
      PageUtil.buildSubTitle('纯文本消息'),
      PageUtil.outlinedButton(
          '普通',
          () => Message.show('纯文本，不带icon',
              showIcon: false,
              msgType: MessageType.info,
              msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '成功',
          () => Message.show('纯文本，不带icon',
              showIcon: false,
              msgType: MessageType.success,
              msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '警示',
          () => Message.show('纯文本，不带icon',
              showIcon: false,
              msgType: MessageType.warning,
              msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '错误',
          () => Message.show('纯文本，不带icon',
              showIcon: false,
              msgType: MessageType.error,
              msgPosition: MessagePosition.top)),
      PageUtil.outlinedButton(
          '超长警示',
          () => Message.show('不生不灭不垢不净不增不减不生不灭不垢不净不增不减',
              showIcon: false,
              msgType: MessageType.warning,
              msgPosition: MessagePosition.top)),
      PageUtil.buildSubTitle('自定义配置'),
      PageUtil.outlinedButton(
          '自定义显示时间',
          () => Message.show('5000ms后消失',
              msgType: MessageType.info,
              msgPosition: MessagePosition.top,
              duration: Duration(milliseconds: 5000))),
      PageUtil.buildSubTitle('对齐方式'),
      PageUtil.outlinedButton(
          '居中',
          () => Message.show('居中',
              msgType: MessageType.info,
              msgPosition: MessagePosition.top,
              msgAlignment: MessageAlignment.center)),
      PageUtil.outlinedButton(
          '超长居中',
          () => Message.show('无眼耳鼻舌身意无色声香味触法无眼耳鼻舌身意无色声香味触法',
              msgType: MessageType.warning,
              msgPosition: MessagePosition.top,
              msgAlignment: MessageAlignment.center)),
    ]);
  }
}
