
class BankAccount {
  final int _accountID;
  String _accountName;
  double _balance = 0;

  BankAccount(this._accountID, this._accountName);
  
  void setbalance(double balance) {
    if (balance >= 0) {
      this._balance = balance;
    }
  }

  // get current balance
  double get balance {
    return _balance;
  }

  // method withdraw
  void withdraw(double amount) {
    if (_balance > amount) {
      _balance -= amount;
      print("Withdraw successful!\n");
    } else {
      throw Exception("Insufficient balance for withdrawal!\n");
    }
  }

  void credit(double amount) {
    _balance += amount;
    print("Credit successful!\n");
  }
}

class Bank {
  final String _bankName;
  final List<BankAccount> _bankAccounts = [];

  Bank({required String bankName}) : _bankName = bankName;

  BankAccount createAccount(int accountId, String accountOwner) {
    BankAccount newAccount = new BankAccount(accountId, accountOwner);
    // checking existed account in list
    for (var account in _bankAccounts) {
      if (accountId == account._accountID) {
        throw Exception("This Account ID $accountId already existed!\n");
      }
    }

    _bankAccounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(bankName: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print("Balance: \$${ronanAccount.balance}\n"); // Balance: $0
  ronanAccount.credit(100);
  print("Balance: \$${ronanAccount.balance}\n"); // Balance: $100
  ronanAccount.withdraw(50);
  print("Balance: \$${ronanAccount.balance}\n"); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}


