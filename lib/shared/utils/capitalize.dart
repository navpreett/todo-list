extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
/*
The method takes the first character of the String and capitalizes it using the toUpperCase() method.

Then, it takes the remaining characters of the String using the substring() method and converts them to lowercase using the toLowerCase() method.

Finally, it concatenates the capitalized first character with the lowercase remaining characters and returns the resulting String.
 */