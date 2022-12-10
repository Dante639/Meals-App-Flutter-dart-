import 'package:flutter/material.dart';
import 'package:second_app/MainDrawer.dart';


class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savedFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter,this.savedFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    glutenFree = widget.currentFilter['gluten']!;
    lactoseFree = widget.currentFilter['lactose']!;
    vegan = widget.currentFilter['vegan']!;
    vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter={
                'gluten':glutenFree,
                'lactose':lactoseFree,
                'vegan':vegan,
                'vegetarian':vegetarian,
              };
              widget.savedFilters(selectedFilter);
            },
            icon: const Icon(
              Icons.save_alt,
              color: Colors.lightBlue,
              size: 28.4,
            ),
          ),
        ],
        title: const Text(
          'Your Filters',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w900,
            fontSize: 30.2,
            fontFamily: 'RobotoCondensed',
            letterSpacing: 3,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection. ',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                fontSize: 30.2,
                fontFamily: 'RobotoCondensed',
                letterSpacing: 3,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.purpleAccent,
                  value: glutenFree,
                  subtitle: const Text(
                    'Only included Gluten-free meals',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                  title: const Text(
                    'Gluten-free',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Colors.yellow,
                  inactiveTrackColor: Colors.yellowAccent,
                  value: lactoseFree,
                  subtitle: const Text(
                    'Only included Lactose-free meals',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                  title: const Text(
                    'Lactose-free',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Colors.deepOrange,
                  inactiveTrackColor: Colors.deepOrangeAccent,
                  value: vegetarian,
                  subtitle: const Text(
                    'Only included Vegetarian meals',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                  title: const Text(
                    'Vegetarian',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Colors.indigoAccent,
                  inactiveTrackColor: Colors.indigo,
                  value: vegan,
                  subtitle: const Text(
                    'Only included Vegan meals',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                  title: const Text(
                    'Vegan',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.2,
                      fontFamily: 'RobotoCondensed',
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
