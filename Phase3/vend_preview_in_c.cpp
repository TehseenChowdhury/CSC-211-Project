#include <iostream>
#include <limits> // For numeric_limits
using namespace std;

int main() {
    // Prices of the products
    const int PRICE_WATER = 5;
    const int PRICE_SNACKS = 10;
    const int PRICE_SANDWICHES = 15;
    const int PRICE_MEALS = 20;

    int balance = 0, choice = 0;

    // Ask the user to insert money
    cout << "Welcome to the vending machine!" << endl;
    cout << "Please enter the amount of money you wish to add: ";
    
    while (!(cin >> balance) || balance < 0) {
        cout << "Invalid input. Please enter a positive integer amount: ";
        cin.clear(); // Clear the error flag
        cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Discard invalid input
    }

    while (balance > 0) {
        // Display options
        cout << "\nAvailable options:" << endl;
        cout << "1: Water ($" << PRICE_WATER << ")" << endl;
        cout << "2: Snacks ($" << PRICE_SNACKS << ")" << endl;
        cout << "3: Sandwiches ($" << PRICE_SANDWICHES << ")" << endl;
        cout << "4: Meals ($" << PRICE_MEALS << ")" << endl;
        cout << "-1: Exit" << endl;
        cout << "Your current balance: $" << balance << endl;

        // Get user's choice
        cout << "Enter your choice: ";
        
        while (!(cin >> choice)) {
            cout << "Invalid input. Please enter a valid option: ";
            cin.clear(); // Clear the error flag
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Discard invalid input
        }

        // Process user's choice
        if (choice == -1) {
            // Exit
            break;
        } else if (choice == 1) {
            if (balance >= PRICE_WATER) {
                balance -= PRICE_WATER;
                cout << "Dispensing Water. Remaining balance: $" << balance << endl;
            } else {
                cout << "Not enough balance for Water." << endl;
            }
        } else if (choice == 2) {
            if (balance >= PRICE_SNACKS) {
                balance -= PRICE_SNACKS;
                cout << "Dispensing Snacks. Remaining balance: $" << balance << endl;
            } else {
                cout << "Not enough balance for Snacks." << endl;
            }
        } else if (choice == 3) {
            if (balance >= PRICE_SANDWICHES) {
                balance -= PRICE_SANDWICHES;
                cout << "Dispensing Sandwiches. Remaining balance: $" << balance << endl;
            } else {
                cout << "Not enough balance for Sandwiches." << endl;
            }
        } else if (choice == 4) {
            if (balance >= PRICE_MEALS) {
                balance -= PRICE_MEALS;
                cout << "Dispensing Meals. Remaining balance: $" << balance << endl;
            } else {
                cout << "Not enough balance for Meals." << endl;
            }
        } else {
            cout << "Invalid choice. Please select a valid option." << endl;
        }
    }

    // End of program
    cout << "\nThank you for using the vending machine!" << endl;
    cout << "Remaining balance: $" << balance << endl;

    return 0;
}
