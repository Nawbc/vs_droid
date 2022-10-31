import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:vs_droid/config_model.dart';
import 'components/switch/switch.dart';

class LeftQuickBar extends StatefulWidget {
  const LeftQuickBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LeftQuickBarState();
  }
}

class LeftQuickBarState extends State<LeftQuickBar> {
  late ConfigModel _cm;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cm = Provider.of<ConfigModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('RightQuickBoard Painted...');

    List<Widget> settings = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: ListTile(
              trailing: CupertinoButton(
                onPressed: () {},
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  // alignment: WrapAlignment.center,
                  children: const [Text("Quake mode"), Icon(UniconsLine.bolt, size: 16)],
                ),
              ),
              // CupertinoButton(
              //   onPressed: () {},
              //   child: Text("Open"),
              // ),

              title: const Text("Terminal View"),
              contentPadding: const EdgeInsets.only(left: 15, right: 25),
            ),
          ),
          ListTile(
            trailing: DroidSwitch(
              onChanged: (bool value) {},
              value: false,
            ),
            title: const Text("Allow Lan"),
            contentPadding: const EdgeInsets.only(left: 15, right: 25),
          ),
        ],
      ),
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(
          'Quick',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        // backgroundColor: themeData.navBackgroundColor,
        border: null,
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: settings.length,
            itemBuilder: (BuildContext context, int index) {
              return settings[index];
            },
          ),
        ),
      ),
    );
  }
}
