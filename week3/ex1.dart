int checkAgeIsNull(int? age) {
  return age ?? 0;
}

void main() {
  int? age1 = 25;
  int? age2 = null;

  print(checkAgeIsNull(age1));
  print(checkAgeIsNull(age2));
}
