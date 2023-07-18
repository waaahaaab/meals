import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/widgets/switch_filter.dart';

enum Filter {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  bool _lactoseFreeFilter = false;

  @override
  void initState() {
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    super.initState();
  }

  void passFilters(BuildContext context) async {
    Navigator.pop(context, {
      Filter.glutenFree: _glutenFreeFilter,
      Filter.vegan: _veganFilter,
      Filter.vegetarian: _vegetarianFilter,
      Filter.lactoseFree: _lactoseFreeFilter,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              passFilters(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: WillPopScope(
        onWillPop: () async {
          passFilters(context);

          //To don't pop twice
          return false;
        },
        child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
            decoration: const BoxDecoration(gradient: kGradient),
            child: Column(
              children: [
                SwitchFilter(
                  title: 'Gluten-free',
                  subtitle: 'Only gluten-free meals',
                  filterValue: _glutenFreeFilter,
                  onChanged: (isChecked) {
                    setState(() {
                      _glutenFreeFilter = isChecked;
                    });
                  },
                ),
                SwitchFilter(
                  title: 'Vegan',
                  subtitle: 'Only Vegan meals',
                  filterValue: _veganFilter,
                  onChanged: (isChecked) {
                    setState(() {
                      _veganFilter = isChecked;
                    });
                  },
                ),
                SwitchFilter(
                  title: 'Vegetarian',
                  subtitle: 'Only vegetarian meals',
                  filterValue: _vegetarianFilter,
                  onChanged: (isChecked) {
                    setState(() {
                      _vegetarianFilter = isChecked;
                    });
                  },
                ),
                SwitchFilter(
                  title: 'Lactose-free',
                  subtitle: 'Only lactose-free meals',
                  filterValue: _lactoseFreeFilter,
                  onChanged: (isChecked) {
                    setState(() {
                      _lactoseFreeFilter = isChecked;
                    });
                  },
                )
              ],
            )),
      ),
    );
  }
}
