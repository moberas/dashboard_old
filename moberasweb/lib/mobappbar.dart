import 'package:flutter/material.dart';

class MobAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MobAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
