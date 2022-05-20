1. Create an app called: grade_calculator.
2. Create a stateless widget `HomeScreen` with a `Scaffold`.

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
```

3. Create an `AppBar` with a `title`.

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Grade calculator"),
      ),
    );
  }
}
```

4. In your scaffold body, create a `Column` widget.

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Grade calculator"),
      ),
      body: Column(
          children: []
      )
    );
  }
}
```

5. Inside the Column widget, create 3 widgets: `TextField`, `ElevatedButton` and a `Text` widget.

```dart
    body: Column(
          children: [
            TextField(),
            ElevatedButton(child: Text("Calculate"),),
            const Text(
              "A",
            )
          ],
        ),
```

6. Style your `TextField`:

Wrap you `TextField` with `Container` to add some padding:

```dart
    Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: TextField(),
    ),
```

Set the keyboard type as number:

```dart
    child: TextField(
    keyboardType: TextInputType.number,
    ),
```

To add a hint text, add a `decoration` property:

```dart
TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                ),
              ),
```

Then add a prefix icon:

```dart
TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
```

We can add a border radius using the border property:

```dart
TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
```

7. Style your button:

Wrap your inner text with a `Padding` widget:

```dart
ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
```

Add the `onPressed` property with an empty arrow function for now:

```dart
ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
```

To change the color of the button, we'll use the `.styleFrom` method:

```dart
ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
```

8. Finally let's style the text:

```dart
const Text(
           "A",
            style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            )
```

9. Separate your widgets with a `SizedBox`:

```dart
Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "A",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            )
          ],
        ),
```

10. And wrap your column with a `Center` widget.

```dart
Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "A",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            )
          ],
        ),
      ),
```

7. Create a `TextEditingController` for the `TextField` and assign it to the `TextField`.

```dart
  final gradeController = TextEditingController();
```

```dart
TextField(
                controller: gradeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
```

8. Create a `String` variable to store the result in and replace it with the text in your `Text` widget.

```dart
  String result = "";
```

```dart
Text(
              result,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            )
```

9. Create a function to calculate the result following those conditions:

```
A if score >= 90%
B if score >= 80%
C if score >= 70%
D if score >= 60%
F if score  < 60%
```

```dart
  String gradeResult(double grade) {
    if (grade >= 90) {
      return 'A';
    } else if (grade < 90 && grade >= 80) {
      return 'B';
    } else if (grade < 80 && grade >= 70) {
      return 'C';
    } else if (grade < 70 && grade >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }
```

10. In your `onPressed` function, create a variable and store the value of the `TextEditingController` in it.

```dart
    double grade = double.parse(gradeController.text);
```

11. Call the function you created and pass the variable to it, then assign the returned value to the result variable.

```dart
result = gradeResult(grade);
```

Call `ScaffoldMessenger` of `context` and pass it a `SnackBar` with a `Text` content of the result.

```dart
ScaffoldMessenger
  .of(context)
  .showSnackBar(SnackBar(content: Text(result)));
```
