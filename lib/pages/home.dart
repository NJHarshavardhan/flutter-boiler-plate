import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../default_imports.dart';
import 'home/explore.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late List<Widget> pages;
  int navIndex = 0;
  int index = 0;

  @override
  void initState() {
    pages = [
      const Explore(),
      const Explore(),
      const Explore(),
    ];
    navIndex = index;
    super.initState();
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
      currentIndex: navIndex,
      onTap: (index) {
        setState(() {
          navIndex = index;
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: 'explore'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.verified_user_outlined),
          label: 'explore'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'settings'.tr(),
        ),
      ],
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(appName,
                  style: Theme.of(context).textTheme.headlineMedium),
              content: Text('are_you_sure_want_to_close_app',
                      style: Theme.of(context).textTheme.bodyLarge)
                  .tr(),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('no'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                ),
                MaterialButton(
                  onPressed: () => exit(0),
                  color: Theme.of(context).colorScheme.primary,
                  child: Text('yes'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white)),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        bool value = await _onWillPop();
        if (value) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            pages.elementAt(navIndex),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }
}
