import 'package:flutter/material.dart';
import 'package:tdesign_flutter/td_export.dart';
import '../api/api_widget.dart';



/// 示例页面数据
class ExamplePageModel{

  ExamplePageModel({required this.text,required this.path,required this.pageBuilder,});

  final String text;
  final String path;
  final WidgetBuilder pageBuilder;
}

/// 示例页面控件，建议每个页面返回一个ExampleWidget即可，不用独自封装
class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key, required this.title, required this.children, this.padding, this.backgroundColor, this.apiPath}) : super(key: key);

  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final String? apiPath;

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {

  late var list;
  bool apiVisible = false;

  @override
  void initState() {
    super.initState();

    list = <Widget>[
      for(var item in widget.children)
        Container(
          padding: widget.padding ?? const EdgeInsets.all(16),
          child: item,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(title: Text('${widget.title}示例页'),
        actions: [
          GestureDetector(
            child:  Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 32),
              child: TDText('Api >>',textColor: TDTheme.of(context).whiteColor1,),
            ),
            onTap: (){
              setState(() {
                apiVisible = !apiVisible;
              });
            },
          )
        ],
      ),
      body: Center(child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(visible:apiVisible,child: ApiWidget(apiName: widget.apiPath ?? 'empty',)), ...list,
          ],
        ),),
      ),
    );
  }
}


/// 示例样例，建议尽量使用该控件，写清晰说明内容
class ExampleItem extends StatelessWidget{

  const ExampleItem({Key? key, required this.desc, required this.builder}) : super(key: key);

  final String desc;

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('示例——$desc', style: const TextStyle(color: Colors.black45),),
        builder(context),
      ],
    );
  }
}

