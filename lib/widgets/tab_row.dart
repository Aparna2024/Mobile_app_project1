// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class TabRow extends StatelessWidget {
//   const TabRow({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: SizedBox(
//             height: 6.0.h,
//             width: MediaQuery.of(context).size.width,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 const TabButtons(text: 'Filter'),
//                 SizedBox(
//                   width: 2.0.h,
//                 ),
//                 const TabButtons(text: 'Sort'),
//                 SizedBox(
//                   width: 2.0.h,
//                 ),
//                 const TabButtons(text: 'Category'),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class TabButtons extends StatelessWidget {
//   final String text;
//   const TabButtons({
//     Key? key,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 3.5,
//       child: OutlinedButton(
//         onPressed: () {},
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                 color: Theme.of(context).primaryColor,
//               ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabRow extends StatefulWidget {
  @override
  _TabRowState createState() => _TabRowState();
}

class _TabRowState extends State<TabRow> {
  String selectedTab = 'Filter'; // Track the selected tab
  String selectedFilter = '';

  void handleFilter() {
    if (selectedFilter.isEmpty) {
      print('No filter selected');
      // You can display a message or perform a default action when no filter is selected.
    } else {
      // Perform filtering based on the selected filter.
      print('Filtering by: $selectedFilter');
      // Implement your actual filter logic here.
    }
  }

  // Add sorting and category logic as needed.

  void handleSort() {
    // Implement your sorting logic here.
    print('Sorting logic goes here');

    // Example: After sorting is applied, you can clear the selected tab.
    setState(() {
      selectedTab = 'Sort';
    });
  }

  void handleCategory() {
    // Implement your category logic here.
    print('Category logic goes here');

    // Example: After the category is applied, you can clear the selected tab.
    setState(() {
      selectedTab = 'Category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 6.0.h,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TabButtons(
                  text: 'Filter',
                  isSelected: selectedTab == 'Filter',
                  onPressed: () {
                    setState(() {
                      selectedTab = 'Filter';
                      handleFilter(); // Call the filter function
                    });
                  },
                ),
                SizedBox(width: 2.0.h),
                TabButtons(
                  text: 'Sort',
                  isSelected: selectedTab == 'Sort',
                  onPressed: () {
                    setState(() {
                      selectedTab = 'Sort';
                      // Add your sorting logic here
                    });
                  },
                ),
                SizedBox(width: 2.0.h),
                TabButtons(
                  text: 'Category',
                  isSelected: selectedTab == 'Category',
                  onPressed: () {
                    setState(() {
                      selectedTab = 'Category';
                      // Add your category logic here
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TabButtons extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabButtons({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isSelected ? Theme.of(context).primaryColor : Colors.white),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color:
                    isSelected ? Colors.white : Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
