import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Meal {
  final String name;
  final String description;

  Meal(this.name, this.description);
}

class MealPlanningScreen extends StatelessWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  static List<Meal> meals = [
    Meal('Breakfast', 'Healthy start of the day'),
    Meal('Lunch', 'Delicious lunch options'),
    Meal('Dinner', 'Evening dinner ideas'),
    Meal('Snack', 'Quick snacks for the day'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('Meal Planning',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.0.h,
            ),
             Padding(
              padding: const EdgeInsets.only(right: 200.0), 
              child: Text(
                'Pick Your Diet',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Classic'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Low Carb'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Keto'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Vegan'),
                ),
              ],
            ),
            const SizedBox(height: 20.0), 
            Padding(
              padding: const EdgeInsets.only(right: 200.0), 
              child: Text(
                'Any Allergies?',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton(
                  onPressed: () {
                   
                  },
                
                  child: const Text('Fish'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                
                  child: const Text('Soy'),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                   
                  },
                
                  child: const Text('Peanut'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                
                  child: const Text('Tree Nut'),
                ),
              
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                 ElevatedButton(
                  onPressed: () {
                  
                  },
                
                  child: const Text('Gluten'),
                  
                 ), const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                   
                  },
                 
                  child: const Text('Gluten'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                 
                  },
                  child: const Text('Dairy'),
                ),
              ],
            ),
            const SizedBox(height: 20.0), 
            Padding(
              padding: const EdgeInsets.only(right: 150.0), 
              child: Text(
                'How about dislike?',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Avocado'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Eggs'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                  
                  },
                
                  child: const Text('Shrimp'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Beef'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                 ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Salmon'),
                 ), const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                  },
                 
                  child: const Text('Cauliflower'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Lamb'),
                ),
                const SizedBox(width: 10.0), 
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Tuna'),
                ),
              ],
            ),
            const SizedBox(height: 20.0), 
            Padding(
              padding: const EdgeInsets.only(right: 50.0), 
              child: Text(
                'Set a Weekly Reminder?',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('at 10:00 AM'),
                  ),
                  const SizedBox(width: 10.0), 
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('on Sunday'),
                  ),
                   const SizedBox(width: 10.0), 
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('everyday'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0), 
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Text(
                  'How many servings per meal?',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              
              Column(
                children: [
                  _buildServingOption(context, '2 servings', 'for two, or one with leftovers'),
                  const SizedBox(height: 10.0), 
                  _buildServingOption(context, '4 servings', 'for four, or two-three leftovers'),
                  const SizedBox(height: 10.0),
                  _buildServingOption(context, '6 servings', 'for a family of 5+'),
                ],
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Handle adding a new meal, e.g., show a dialog or navigate to an add meal screen
        },
      ),
    );
  }
}

Widget _buildServingOption(BuildContext context, String title, String description) {
  return Card(
    elevation: 3, // Add elevation for a card-like effect
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    ),
  );
}
