#include <iostream>
#include <string.h>
#include <iomanip>

using namespace std;

class students
{
    int roll_no;
    char name[20];
    string gender;
    int age;
    int standard;
    float marks;
    long long mobile_no;

public:
    char *Get_name()
    {
        return name;
    }
    int get_roll_no()
    {
        return roll_no;
    }

    void Get_data()
    {
        cout << "ROLL NUMBER :    ";
        cin >> roll_no;
        cout << "NAME :   ";
        cin.ignore();
        cin.getline(name, 30);
        cout << "GENDER :   ";
        cin >> gender;
        cout << "AGE :   ";
        cin >> age;
        cout << "STANDARD :   ";
        cin >> standard;
        cout << "PERCENTAGE :   ";
        cin >> marks;
        cout << "MOBILE NUMBER :   ";
        cin >> mobile_no;
    }

    void Show_data()
    {
        cout << " _______________**********_______________ \n\n";
        cout << "  Roll Number = " << roll_no << endl;
        cout << "  Name = " << name << endl;
        cout << "  Gender = " << gender << endl;
        cout << "  Age = " << age << endl;
        cout << "  Standard = " << standard << endl;
        cout << "  Marks = " << marks << endl;
        cout << "  Mobile Number = " << mobile_no << "\n\n";
        cout << " _______________          _______________ \n";
        cout << "                **********                \n\n";
    }

    void Modify_data()
    {
        system("cls");
        cout << " ______________________________________________  \n"
             << "|                                              | \n"
             << "   Roll Number = " << roll_no << endl
             << "|______________________________________________| \n";

        cout << "\n\n";

        cout << " _____________________________________  \n"
             << "|                                     | \n"
             << "|  ***Enter New Record of Student***  | \n"
             << "|_____________________________________| \n\n";

        cout << "Name :   ";
        cin.ignore();
        cin.getline(name, 20);
        cout << "Gender :   ";
        cin >> gender;
        cout << "Age :   ";
        cin >> age;
        cout << "Standard :   ";
        cin >> standard;
        cout << "Marks :   ";
        cin >> marks;
        cout << "Mobile Number :   ";
        cin >> mobile_no;
    }

    void List_data()
    {
        cout.setf(ios::left);
        cout << "\033[95;107;1m" << setw(15) << roll_no;
        cout << "\033[95;107;1m" << setw(30) << name;
        cout << "\033[95;107;1m" << setw(10) << gender;
        cout << "\033[95;107;1m" << setw(10) << age;
        cout << "\033[95;107;1m" << setw(10) << standard;
        cout << "\033[95;107;1m" << setw(10) << marks;
        cout << "\033[95;107;1m" << setw(20) << mobile_no;
        cout << endl;
    }
};

void heading()
{
    cout.setf(ios::left);
    cout << "\033[91;107;1m" << setw(15) << "Roll Number";
    cout << "\033[91;107;1m" << setw(30) << "Name";
    cout << "\033[91;107;1m" << setw(10) << "Gender";
    cout << "\033[91;107;1m" << setw(10) << "Age";
    cout << "\033[91;107;1m" << setw(10) << "Standard";
    cout << "\033[91;107;1m" << setw(10) << "Marks";
    cout << "\033[91;107;1m" << setw(20) << "Mobile Number";
    cout << endl;
}

void menu()
{
    cout << " __________**********__________  \n"
         << "|                              | \n"
         << "|       Student's Record       | \n"
         << "|__________          __________| \n"
         << "           **********            \n\n";

    cout << " 0. Exit \n";
    cout << " 1. Resister New Student \n";
    cout << " 2. Show All Students \n";
    cout << " 3. Search a student by Roll Number \n";
    cout << " 4. Search a student by Name \n";
    cout << " 5. Modify Records \n";
    cout << " 6. Delete a Records \n\n";
    cout << " Enter Your Choice :  ";
}

int main()
{
    start:
    students s[100];
    int n = 0, ch, rn, i, flag = 0, position;
    do
    {
        system("cls");
        menu();
        cin >> ch;
        switch (ch)
        {
        case 0:
            cout<<"Exiting from program...";
            break;
        case 1:
            system("cls");
            s[n].Get_data();
            n++;
            cout << "\nRecord saved successfully...\n\n";
            break;

        case 2:
            if (n > 0)
            {
                system("cls");
                heading();
                for (int i = 0; i < n; i++)
                {
                    s[i].List_data();
                }
            }
            else
            {
                system("cls");
                cout << " ______________________  \n"
                     << "|                      | \n"
                     << "|  NO RECORD FOUND...  | \n"
                     << "|______________________| \n";
            }

            break;

        case 3:
            if (n > 0)
            {
                cout << "\nEnter Roll Number :   ";
                cin >> rn;
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (rn == s[i].get_roll_no())
                    {
                        s[i].Show_data();
                        flag++;
                    }
                }
            }

            if (flag == 0)
            {
                system("cls");
                cout << " ______________________  \n"
                     << "|                      | \n"
                     << "|   NO DATA FOUND...   | \n"
                     << "|______________________| \n";
            }
            break;

        case 4:

            if (n > 0)
            {
                char nm[20];
                cout << "\nEnter Name :   ";
                cin.ignore();
                cin.getline(nm, 30);
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (strcmpi(nm, s[i].Get_name()) == 0)

                    {
                        system("cls");
                        s[i].Show_data();
                        flag++;
                    }
                }
            }

            if (flag == 0)
            {
                system("cls");
                cout << " ______________________  \n"
                     << "|                      | \n"
                     << "|   NO DATA FOUND...   | \n"
                     << "|______________________| \n";
            }
            break;

        case 5:
            if (n > 0)
            {
                int pos;
                cout << "\nEnter Roll Number to Modify :   ";
                cin >> rn;
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (rn == s[i].get_roll_no())
                    {
                        system("cls");
                        cout << "\nFollowing record will be modified...\n";
                        s[i].Show_data();
                        cout << "\n\n ENTER NEW DATA! \n\n";
                        s[i].Modify_data();
                        flag++;
                    }
                }
            }

            if (flag == 0)
            {
                system("cls");
                cout << " ______________________  \n"
                     << "|                      | \n"
                     << "|   NO DATA FOUND...   | \n"
                     << "|______________________| \n";
            }
            break;

        case 6:
            if (n > 0)
            {
                cout << "\nEnter Roll Number to delede a Record:   ";
                cin >> rn;
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (rn == s[i].get_roll_no())
                    {
                        cout << "\nFollowing Data is Deleted...\n";
                        s[i].Show_data();
                        flag++;
                        position = i;
                        break;
                    }
                }
                for (i = position; i < n - 1; i++)
                {
                    s[i] = s[i + 1];
                }
                n--;
            }

            if (flag == 0)
            {
                system("cls");
                cout << " ______________________  \n"
                     << "|                      | \n"
                     << "|   NO DATA FOUND...   | \n"
                     << "|______________________| \n";
            }
            break;

        default:
            system("cls");
            cout << " ======================  \n"
                 << "|                      | \n"
                 << "|    Invalid Input!    | \n"
                 << "|                      | \n"
                 << " ======================  \n";
                 system("pause");
                 goto start;

            break;
        }

        system("pause");

    } while (ch);

    return 0;
}