import 'package:flutter/material.dart';
import '../models/user_meal_plan.dart';


class MealPlanningScreen extends StatefulWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  @override
  _MealPlanningScreenState createState() => _MealPlanningScreenState();
}

class _MealPlanningScreenState extends State<MealPlanningScreen> {
  bool isVeganSelected = false;
  bool isLowCarbSelected = false;
  bool isDairyFreeSelected = false;
  List<String> allergies = [];
  List<String> dislikes = [];
  int servings = 1;
  bool hasReminder = false;

  void _submitMealPlan() async {
    // Create a UserMealPlan object with selected options
    UserMealPlan mealPlan = UserMealPlan(
      isVegan: isVeganSelected,
      isLowCarb: isLowCarbSelected,
      isDairyFree: isDairyFreeSelected,
      allergies: allergies,
      dislikes: dislikes,
      servings: servings,
      hasReminder: hasReminder,
    );

    // Save the meal plan to the database
    //await DatabaseHelper.instance.insertUserMealPlan(mealPlan);

    // Show a success message or navigate to another screen
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVeganSelected = !isVeganSelected;
                    });
                  },
                  child: Text('Vegan'),
                  style: ElevatedButton.styleFrom(primary: isVeganSelected ? Colors.green : Colors.grey),
                ),
                // Add similar buttons for Low Carb and Dairy Free
                // ...
              ],
            ),
            SizedBox(height: 16),
            // Add buttons for allergies (fish, soy, peanut, gluten) and dislikes (egg, cauliflower)
            // ...
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Text('Servings: '),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      servings = servings > 1 ? servings - 1 : 1;
                    });
                  },
                ),
                Text('$servings'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      servings++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Text('Set Reminder: '),
                Switch(
                  value: hasReminder,
                  onChanged: (value) {
                    setState(() {
                      hasReminder = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _submitMealPlan();
              },
              child: Text('Save Meal Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
