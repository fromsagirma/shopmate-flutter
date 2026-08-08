class PriceFormatter {
  static String format(num price) {
    return '\$${price.toStringAsFixed(2)}';
  }
}
