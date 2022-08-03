#include <stdio.h>
#include <conio.h>
#include <iostream>

using namespace std;

class bank
{
    char name[50], address[100], choice;
    float deposit;
    float amount = 0;
    long long account_number = 541247896541;
    string IFSC_code = "BKI0009731S";

public:
    void open_account()
    {
        cout << "Enter your name : ";
        cin.ignore();
        cin.getline(name, 50);
        cout << "\nEnter your address : ";
        cin.ignore();
        cin.getline(address, 100);
        cout << "\nWhat type of account you want to open: Saving(s) or Current(c)\n  Enter s for saving account\n  Enter c for current account" << endl;
        cin >> choice;
        switch (choice)
        {
        case 's':
            cout << "Enter amount of Rs 100 for opening saving account : ";
            cin >> deposit;
            if (deposit < 100)
            {
                cout << "Please deposit minimum Rs.100";
            }
            else
            {
                cout << "Your account has been created" << endl;
            }
            break;

        case 'c':
            cout << "Enter amount of Rs 1000 for opening current account : ";
            cin >> deposit;
            if (deposit < 1000)
            {
                cout << "Please deposit minimum Rs.1000";
            }
            else
            {
                cout << "Your account has been created" << endl;
            }

        default:
            break;
        }
    }

    void Deposit_Money()
    {
        int deposit;
        cout << "Enter how much you deposit : ";
        cin >> deposit;
        amount += deposit;
        cout << "Your total amount is :\t" << amount;
        cout<<"\n\nNote: Your opening amount is not shown in your actual amount.\n\n";
    }

    void display_account()
    {
        cout << "Name: " << name << endl;
        cout << "Address: " << address << endl;
        cout << "Type of account: " << choice << endl;
        cout << "Account number: " << account_number << endl;
        cout << "IFSC code: " << IFSC_code << endl;
        cout << "Total amount: " << amount << endl;
        cout<<"\n\nNote: Your opening amount is not shown in your actual amount.\n\n";
    }

    void Withdraw_money()
    {
        float Withdraw_amount;
        cout << "Withdraw " << endl;
        cout << "Enter amount to withdraw : " << endl;
        cin >> Withdraw_amount;
        amount -= Withdraw_amount;
        cout << "Now total amount is left : Rs " << amount << endl;
        cout<<"\n\nNote: Your opening amount is not shown in your actual amount.\n\n";
    }
};

int main()
{
    bank obj;
    int option;
    int x;
    do
    {
        cout << "\n\n1) Open account\n";
        cout << "2) Deposit money\n";
        cout << "3) Withdraw money\n";
        cout << "4) View account\n";
        cout << "5) Exit\n";
        cin >> option;
        switch (option)
        {
        case 1:
            obj.open_account();
            break;

        case 2:
            obj.Deposit_Money();
            break;

        case 3:
            obj.Withdraw_money();
            break;

        case 4:
            obj.display_account();
            break;

        case 5:
            exit(1);
            break;

        default:
            cout << "It doesn't exist, please try again" << endl;
            break;
        }

        cout<<"\nFor selecting next option, please enter 'y':  ";
        cout<<"Press N for exit : ";
        x = getch();
        if(x == 'n' || x == 'N'){
            exit(0);
        }

    } while (x == 'y' || x == 'Y');

    return 0;
}