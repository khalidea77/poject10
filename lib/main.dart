
import 'package:flutter/material.dart';

void main() {
  runApp(const FavoriteDishApp());
}

class FavoriteDishApp extends StatelessWidget {
  const FavoriteDishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FavoriteDishSurvey(),
      ),
    );
  }
}

class FavoriteDishSurvey extends StatefulWidget {
  const FavoriteDishSurvey({super.key});

  @override
  State<FavoriteDishSurvey> createState() => _FavoriteDishSurveyState();
}

class _FavoriteDishSurveyState extends State<FavoriteDishSurvey> {
  String participantName = '';
  bool likesPizza = false;
  bool likesPasta = false;
  bool likesSushi = false;
  bool likesSpicy = false;
  bool likesSweet = false;
  bool likesSavory = false;
  String preferredMealTime = "Lunch";
  String preferredCuisine = "Italian";
  final List<String> mealTimeOptions = ["Breakfast", "Lunch", "Dinner"];
  final List<String> cuisineOptions = ["Italian", "Japanese", "Mexican", "Indian"];
  String surveyResult = '';

  void evaluateDishPreferences() {
    String favoriteDishes = '';
    if (likesPizza) favoriteDishes += "Pizza, ";
    if (likesPasta) favoriteDishes += "Pasta, ";
    if (likesSushi) favoriteDishes += "Sushi, ";

    String tastePreferences = '';
    if (likesSpicy) tastePreferences += "Spicy, ";
    if (likesSweet) tastePreferences += "Sweet, ";
    if (likesSavory) tastePreferences += "Savory, ";

    String dishPersonality = '';
    if (favoriteDishes.contains("Pizza") && tastePreferences.contains("Savory")) {
      dishPersonality = 'You love comfort food that brings people together.';
    } else if (favoriteDishes.contains("Sushi") && tastePreferences.contains("Spicy")) {
      dishPersonality = 'You enjoy bold flavors and love exploring new culinary experiences.';
    } else if (favoriteDishes.contains("Pasta") && tastePreferences.contains("Sweet")) {
      dishPersonality = 'You have a classic taste and enjoy the sweeter side of life.';
    } else {
      dishPersonality = 'You have diverse tastes and enjoy a variety of dishes.';
    }

    if (preferredMealTime == 'Breakfast' && preferredCuisine == 'Mexican') {
      dishPersonality += '\nYou love starting your day with vibrant and flavorful dishes.';
    } else if (preferredMealTime == 'Dinner' && preferredCuisine == 'Italian') {
      dishPersonality += '\nYou enjoy ending your day with hearty, comforting meals.';
    } else {
      dishPersonality += '\nYou adapt your meal choices to suit different occasions and moods.';
    }

    setState(() {
      surveyResult =
      'Hi, $participantName!\n\nFavorite Dishes: $favoriteDishes\n\nTaste Preferences: $tastePreferences\n\nPreferred Meal Time: $preferredMealTime\n\nPreferred Cuisine: $preferredCuisine\n\nDish Personality Insights:\n$dishPersonality';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Favorite Dish Survey'),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      participantName = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Which dishes do you enjoy?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text("Pizza"),
                  value: likesPizza,
                  onChanged: (bool? value) {
                    setState(() {
                      likesPizza = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Pasta"),
                  value: likesPasta,
                  onChanged: (bool? value) {
                    setState(() {
                      likesPasta = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Sushi"),
                  value: likesSushi,
                  onChanged: (bool? value) {
                    setState(() {
                      likesSushi = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "What type of flavors do you prefer?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text("Spicy"),
                  value: likesSpicy,
                  onChanged: (bool? value) {
                    setState(() {
                      likesSpicy = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Sweet"),
                  value: likesSweet,
                  onChanged: (bool? value) {
                    setState(() {
                      likesSweet = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Savory"),
                  value: likesSavory,
                  onChanged: (bool? value) {
                    setState(() {
                      likesSavory = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: preferredMealTime,
                  items: mealTimeOptions.map((String option) {
                    return DropdownMenuItem(value: option, child: Text(option));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      preferredMealTime = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "Preferred Meal Time"),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: preferredCuisine,
                  items: cuisineOptions.map((String option) {
                    return DropdownMenuItem(value: option, child: Text(option));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      preferredCuisine = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "Preferred Cuisine"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: evaluateDishPreferences,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                if (surveyResult.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      surveyResult,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
