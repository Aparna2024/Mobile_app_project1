import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/screens/login_page.dart';
import 'package:provider/provider.dart';
import '/provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'screens.dart';
import '/utils/utils.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40.0,
            ),
            const HomeLogoText(),
            const SizedBox(
              height: 10.0,
            ),
            const HomeHeaderRow(),
            const SizedBox(
              height: 20.0,
            ),
            const SearchField(),
            const SizedBox(
              height: 40.0,
            ),
            const HomeGrid(),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'Popular Recipes',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const HomePopularGrid(),
            const SizedBox(
              height: 10.0,
            )
          ]),
        ),
      ),
    );
  }
}

class HomeHeaderRow extends StatelessWidget {
  const HomeHeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final isLoggedIn = Provider.of<AuthProvider>(context).isLoggedIn;
    var userName = "User";
    bool loggedIn = isLoggedIn ?? true;

    if(user != null) {
      userName = user.username;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello, $userName',
          style: Theme.of(context).textTheme.headline4,
        ),
        const Spacer(
          flex: 3,
        ),
        Visibility(
          visible: loggedIn,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the login page when the ElevatedButton is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              },
            child: Icon(
              Icons.login_sharp,
              size: 36.0,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24.0),
              primary: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class HomePopularGrid extends StatelessWidget {
  const HomePopularGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<ListOfRecipes>(context);
    final popularRecipes = recipes.popularRecipes;
    return SizedBox(
      height: 350.0,
      child: ListView.builder(
        itemCount: popularRecipes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: HomeStack(
                image: popularRecipes[index].recipeImage,
                text: popularRecipes[index].recipeName,
                prepTime: popularRecipes[index].prepTime,
                cookTime: popularRecipes[index].cookTime,
                recipeReview: popularRecipes[index].recipeReview,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecipeScreen(),
                  settings: RouteSettings(
                    arguments: popularRecipes[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HomeStack extends StatelessWidget {
  final String image;
  final String text;
  final double prepTime;
  final double cookTime;
  final double recipeReview;
  const HomeStack({
    Key? key,
    required this.image,
    required this.text,
    required this.prepTime,
    required this.cookTime,
    required this.recipeReview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ReusableNetworkImage(
            imageUrl: image,
            height: 350.0,
            width: 200.0,
          ),
          Positioned(
            bottom: 10.0,
            right: 12.0,
            child: Container(
              width: 180.0,
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // const Spacer(),
                    // Row(
                    //   children: [
                    //     const Icon(UniconsLine.clock),
                    //     const SizedBox(
                    //       width: 5.0,
                    //     ),
                    //     Text(
                    //       '${prepTime + cookTime}',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline3!
                    //           .copyWith(color: Colors.black38),
                    //     ),
                    //   ],
                    // ),
                    // const Spacer(),
                    // Row(
                    //   children: [
                    //     const Icon(UniconsLine.star),
                    //     const SizedBox(
                    //       width: 5.0,
                    //     ),
                    //     Text(
                    //       recipeReview.toStringAsFixed(0),
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline3!
                    //           .copyWith(color: Colors.black38),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        itemCount: iconList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              width: 120.0,
              padding: const EdgeInsets.all(5.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconList[index].icon,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      iconList[index].text,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecipesScreen(),
                  settings: RouteSettings(arguments: items[index].category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
