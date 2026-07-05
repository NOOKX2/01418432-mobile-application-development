class Bank {
  String _accountNumber = "";
  String _accountHolder = "";
  double _balance = 0;

  Bank(String accountNumber, String accountHolder, double balance) {
    this._accountNumber = accountNumber;
    this._accountHolder = accountHolder;
    this._balance = balance;
  }

  String get accountNumber => _accountNumber;

  String get accounHolder => _accountHolder;

  double get balance => _balance;

  set accountNumber(String number) => _accountNumber = number;

  set accountHolder(String holder) => _accountHolder = holder;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited ${amount}. New Balance: $_balance");
    } else {
      print("Cannot deposit. Amount can't be negative number");
    }
  }

  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= _balance) {
        _balance -= amount;
        print("Withdrew ${amount}. New Balance: ${_balance}");
      } else {
        print(
          "Cannot withdraw. Your amount ${amount} can't greater than your balance ${_balance} ",
        );
      }
    } else {
      print("Cannot withdraw. Amount can't be negative number");
    }
  }
}

void main() {
  var myAccount = Bank("123456789", "John Doe", 500);

  print("Accout Holder: ${myAccount._accountHolder}");
  print("Accout Number: ${myAccount._accountNumber}");
  print("Balance: ${myAccount._balance}");

  myAccount.accountHolder = "Jane Smith";
  print("\nAccount Holder updated to: ${myAccount._accountHolder}\n");

  myAccount.deposit(200);
  myAccount.withdraw(300);
  myAccount.withdraw(500);
}
