class UserMealPlan {
  final bool isVegan;
  final bool isLowCarb;
  final bool isDairyFree;
  final List<String> allergies;
  final List<String> dislikes;
  final int servings;
  final bool hasReminder;

  UserMealPlan({
    required this.isVegan,
    required this.isLowCarb,
    required this.isDairyFree,
    required this.allergies,
    required this.dislikes,
    required this.servings,
    required this.hasReminder,
  });
}