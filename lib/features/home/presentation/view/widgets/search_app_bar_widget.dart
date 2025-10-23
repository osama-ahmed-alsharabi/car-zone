import 'package:car_zone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarAppWidget extends StatefulWidget {
  const SearchBarAppWidget({super.key});

  @override
  State<SearchBarAppWidget> createState() => _SearchBarAppWidgetState();
}

class _SearchBarAppWidgetState extends State<SearchBarAppWidget> {
  bool isDark = false;
  SearchController controller = SearchController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        dividerColor: Colors.white10,
        viewLeading: CircleAvatar(
          backgroundColor: AppColors.primaryColor.withAlpha(80),
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        viewHintText: "ابحث عن سيارة احلامك",
        builder: (BuildContext context, controller) {
          return SearchBar(
            hintText: "ابحث عن سيارة احلامك",
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
      ),
    );
  }
}
