```dart

Stream<int> stream = Stream.periodic(Duration(milliseconds: 200), (x) => x);

StreamSubscription streamSubscription = stream.listen(null);

streamSubscription.onData((data) {
  print('data: $data');
  if ( data == 5)
    streamSubscription.cancel();
});

streamSubscription.onError((err) => print('Error: $err'));

streamSubscription.onDone(() => print('Stream Job Completed'));
```


```dart
Stream<int> stream = Stream.periodic(Duration(milliseconds: 200), (x) => x).take(5);

StreamSubscription streamSubscription = stream.listen(
  (data) => print('data: $data'),
  onDone: () {
    print('Stream Completed');
  },
  onError: (err) {
    print('Error: $err');
  }
);
```


```dart
Future<String> future = Future(() => "Latest News");

future.then((news) {
  print(news);
});
```

```dart
Future<String> getNews() async {
  final response = await http.get(url);
  return response.body;
}
```

```dart
getNews().then((news) {
  print(news);
});
```
or 

```dart
String news = await getNews();
print(news);
```

```dart
Future<void> foo() async {
  String news = await getNews();
  print(news);
}
```