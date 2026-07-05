import 'dart:math';
import 'dart:io';

void main() {
  int answerNumber = Random().nextInt(100) + 1;
  while (true) {
    stdout.write("Enter your guess number (1-100): ");
    String? guessNumberInut = stdin.readLineSync();

    if (guessNumberInut == null) {
      print("\nInput cancelled. Exiting game.");
      break;
    }

    if (guessNumberInut.isEmpty) {
      print("Please enter a number.");
      continue;
    }

    int? guessNumber = int.tryParse(guessNumberInut);

    if (guessNumber == null) {
      print("Invalid input. Input must be a number.");
      continue;
    }

    if (guessNumber > 100 || guessNumber < 1) {
      print("Your Number is out of range. Guess number range should be 1-100");
      continue;
    }

    if (guessNumber > answerNumber) {
      print("Too High ");
    } else if (guessNumber < answerNumber) {
      print("Too Low");
    } else {
      print("Exactly Right");
      break;
    }
  }

  print('Answer Number is $answerNumber');
}
