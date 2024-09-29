enum BottomBar {
  all(value: "All Tasks"),
  complete(value: "Completed Tasks");

  final String value;
  const BottomBar({required this.value});
}
