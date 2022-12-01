> 4. Conditional Expressions
```dart
var animal = 'fish';

if (animal == 'cat' || animal = 'bear'){
    print('That is a cute animal');
} else if (animal == 'dinosaur'){
    print('Dinosaur is extincted');
} else{
   print('That is a fly animal');
}
```

> 5. Iterations
```dart
for (int i=0 ;i < 69; i++) {
  print(i);
} // prints 0 to 69

final list = [ 'a', 'b', 'c' , 'd', 'e'];

for(final i in list){
   print(i)
} // prints: a, b, c, d, e

final list = [ 1, 2, 3, 4, 5, 6];
list.forEach(print)
```

> 6. String Interpolation:
```dart
int x = 9;
int y = 6;

print('${x + y}'); // 15
print('${"flutter".toUpperCase()}'); // 'FLUTTER'
print('$x$y'); // 96
```

> 7. Functions
```dart
  // Named Function
  String fullName() {
    String firstName = "Barry";
    String lastName = "Allen";
    return '$firstName $lastName'; // 'Barry Allen'
  }

  int lengthOfText(String text) {
    return text.length; // returns length of text
  }

  int length = lengthOfText('200lab'); // 6

  // Arrow Syntak Function
  int sum(int a, int b) => a + b;

  // Optional named arguments
  int sumNumber(int a, int b, {int c = 0}) {
    return a + b + c;
  }
  print(sumNumber(1, 2, c: 3)); // 6

  // Lamda Function
  var list = [1, 4, 3, 2, 5];
  var odds = list.where((n) => n % 2 == 1).toList();
  print(odds); // [1, 3, 5]

  // High Order Function
  list.sort((a,b){
    return a > b ? 1 : -1;
  });
  print(list); // prints: [1, 2, 3, 4, 5]
```