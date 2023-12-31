import 'package:flutter/material.dart';
import 'package:high_level_test/constants/widget_keys.dart';
import 'favorites_page.dart';
import 'generator_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


@override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState  extends State<MyHomePage>{
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
      Widget page;
      switch (selectedIndex){
        case 0:
        page = GeneratorPage();
        case 1:
        page = FavoritesPage();
        default:
          throw UnimplementedError('no widget for $selectedIndex');
      }
  return LayoutBuilder(builder: (context, constraints)
      {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                  child: NavigationRail(
                extended: constraints.maxWidth >=600,
                destinations: [ NavigationRailDestination(
                    icon: Icon(Icons.home,key: ValueKey(homeBtn),),
                    label: Text('Home'),
                ),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite,key: ValueKey(favouriteBtn),),
                      label: Text('Favorites'),
                  ),
              ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value){
                  setState(() {
                    selectedIndex = value;
                  });
                    },
              ),
              ),
              Expanded(child:
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
              ),
            ],
          ),
        );
      }
    );
  }
}
