import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:guiemod/views/widgets/mod_card.dart';
import 'package:guiemod/models/mod.dart';
import 'dart:ui' as ui;

import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchState extends StatefulWidget{
  const SearchState({super.key});

  @override
  State<SearchState> createState() => _SearchState();

}

class _SearchState extends State<SearchState> {
  Mod mod = const Mod(authors: '',
      name: '',
      description: '',
      downloadUrl: '',
      thumbnailUrl: '', id: 0);
  Mod mod2 = const Mod(authors: '',
      name: '',
      description: '',
      downloadUrl: '',
      thumbnailUrl: '', id: 0);
  bool _isLoading = true;
  List<IconData> actionsIcons = [
    Icons.cast_sharp,
    Icons.notifications_outlined,
    Icons.search,
    Icons.account_circle
  ];
  List<String> categories = [
    "All",
    "Stoves",
    "Baking",
    "Movies",
    "Flutter",
    "React Native",
    "Coding is Love"
  ];

  String selectedCategory = "All";

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getMods();
  }

  Future<void> getMods() async {
    mod = await fetchMod(350538);
    mod2 = await fetchMod(418015);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
        body:
        ListView(
            children: <Widget>[
              ModCard.fromMod(mod2),
            ]
        )

    );
  }

  PreferredSizeWidget navBar(BuildContext context) {
    return ScrollAppBar(
      controller: controller,
      centerTitle: true,
      title: GradientText(
          'SEARCH',
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              height: 1,
              letterSpacing: 2
          ),
          colors: const [
            Color(0xff36096D),
            Color(0xff37D5D6)
          ],
        ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.explore_outlined,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Explore",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                Wrap(
                    spacing: 5,
                    children: categories
                        .map((category) => FilterChip(
                        showCheckmark: false,
                        label: Text(
                          category,
                          style: TextStyle(
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        backgroundColor: Colors.grey.shade200,
                        selectedColor: Colors.grey.shade600,
                        selected: selectedCategory == category,
                        onSelected: (bool value) {
                          setState(() {
                            selectedCategory = category;
                          });
                        }))
                        .toList())
              ],
            ),
          )),
    );
  }
}