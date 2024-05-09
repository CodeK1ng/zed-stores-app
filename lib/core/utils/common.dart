String truncateName(String name) {
  const int maxLength = 20;
  return (name.length > maxLength)
      ? '${name.substring(0, maxLength)}...'
      : name;
}
