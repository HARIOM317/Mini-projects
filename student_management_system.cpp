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
        cout << "\033[91;107;1m ROLL NUMBER :    ";
        cin >> roll_no;
        cout << "\033[91;107;1m NAME :   ";
        cin.ignore();
        cin.getline(name, 30);
        cout << "\033[91;107;1m GENDER :   ";
        cin >> gender;
        cout << "\033[91;107;1m AGE :   ";
        cin >> age;
        cout << "\033[91;107;1m STANDARD :   ";
        cin >> standard;
        cout << "\033[91;107;1m PERCENTAGE :   ";
        cin >> marks;
        cout << "\033[91;107;1m MOBILE NUMBER :   ";
        cin >> mobile_no;
    }

    void Show_data()
    {
        cout << "\033[94;107;1m  _______________**********_______________ \n\n";
        cout << "\033[96;107;1m   Roll Number = " << roll_no << endl;
        cout << "\033[96;107;1m   Name = " << name << endl;
        cout << "\033[96;107;1m   Gender = " << gender << endl;
        cout << "\033[96;107;1m   Age = " << age << endl;
        cout << "\033[96;107;1m   Standard = " << standard << endl;
        cout << "\033[96;107;1m   Marks = " << marks << endl;
        cout << "\033[96;107;1m   Mobile Number = " << mobile_no << "\n\n";
        cout << "\033[94;107;1m  _______________          _______________ \n";
        cout << "\033[94;107;1m                 **********                \n\n";
    }

    void Modify_data()
    {
        system("cls");
        cout << "\033[91;107;1m  ______________________________________________  \n"
             << "\033[91;107;1m |                                              | \n"
             << "\033[90;107;1m    Roll Number = " << roll_no << endl
             << "\033[91;107;1m |______________________________________________| \n";

        cout << "\n\n";

        cout << "\033[90;107;1m      _____________________________________  \n"
             << "\033[90;107;1m     |                                     | \n"
             << "\033[91;107;1m     |  ***Enter New Record of Student***  | \n"
             << "\033[90;107;1m     |_____________________________________| \n\n";

        cout << "\033[95;107;1m Name :   ";
        cin.ignore();
        cin.getline(name, 20);
        cout << "\033[95;107;1m Gender :   ";
        cin >> gender;
        cout << "\033[95;107;1m Age :   ";
        cin >> age;
        cout << "\033[95;107;1m Standard :   ";
        cin >> standard;
        cout << "\033[95;107;1m Marks :   ";
        cin >> marks;
        cout << "\033[95;107;1m Mobile Number :   ";
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
    cout << "\033[91;107;1m      __________**********__________  \n"
         << "\033[91;107;1m     |                              | \n"
         << "\033[91;107;1m     |       Student's Record       | \n"
         << "\033[91;107;1m     |__________          __________| \n"
         << "\033[91;107;1m                **********            \n\n";

    cout << "\033[90;107;1m 0. Exit \n";
    cout << "\033[90;107;1m 1. Resister New Student \n";
    cout << "\033[90;107;1m 2. Show All Students \n";
    cout << "\033[90;107;1m 3. Search a student by Roll Number \n";
    cout << "\033[90;107;1m 4. Search a student by Name \n";
    cout << "\033[90;107;1m 5. Modify Records \n";
    cout << "\033[90;107;1m 6. Delete a Records \n\n";
    cout << "\033[96;107;1m Enter Your Choice :  ";
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
            cout << "\033[95;107;1m \nRecord saved successfully...\n\n";
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
                cout << "\033[91;107;1m  ______________________  \n"
                     << "\033[91;107;1m |                      | \n"
                     << "\033[91;107;1m |  NO RECORD FOUND...  | \n"
                     << "\033[91;107;1m |______________________| \n";
            }

            break;

        case 3:
            if (n > 0)
            {
                cout << "\033[91;107;1m \nEnter Roll Number :   ";
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
                cout << "\033[91;107;1m  ______________________  \n"
                     << "\033[91;107;1m |                      | \n"
                     << "\033[91;107;1m |   NO DATA FOUND...   | \n"
                     << "\033[91;107;1m |______________________| \n";
            }
            break;

        case 4:

            if (n > 0)
            {
                char nm[20];
                cout << "\033[91;107;1m \nEnter Name :   ";
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
                cout << "\033[91;107;1m  ______________________  \n"
                     << "\033[91;107;1m |                      | \n"
                     << "\033[91;107;1m |   NO DATA FOUND...   | \n"
                     << "\033[91;107;1m |______________________| \n";
            }
            break;

        case 5:
            if (n > 0)
            {
                int pos;
                cout << "\033[91;107;1m \nEnter Roll Number to Modify :   ";
                cin >> rn;
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (rn == s[i].get_roll_no())
                    {
                        system("cls");
                        cout << "\033[91;107;1m \nFollowing record will be modified...\n";
                        s[i].Show_data();
                        cout << "\033[95;107;1m \n\n ENTER NEW DATA! \n\n";
                        s[i].Modify_data();
                        flag++;
                    }
                }
            }

            if (flag == 0)
            {
                system("cls");
                cout << "\033[91;107;1m  ______________________  \n"
                     << "\033[91;107;1m |                      | \n"
                     << "\033[91;107;1m |   NO DATA FOUND...   | \n"
                     << "\033[91;107;1m |______________________| \n";
            }
            break;

        case 6:
            if (n > 0)
            {
                cout << "\033[91;107;1m \nEnter Roll Number to delede a Record:   ";
                cin >> rn;
                system("cls");
                for (i = 0; i < n; i++)
                {
                    if (rn == s[i].get_roll_no())
                    {
                        cout << "\033[91;107;1m \nFollowing Data is Deleted...\n";
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
                cout << "\033[91;107;1m  ______________________  \n"
                     << "\033[91;107;1m |                      | \n"
                     << "\033[91;107;1m |   NO DATA FOUND...   | \n"
                     << "\033[91;107;1m |______________________| \n";
            }
            break;

        default:
            system("cls");
            cout << "\033[91;107;1m  ======================  \n"
                 << "\033[91;107;1m |                      | \n"
                 << "\033[91;107;1m |    Invalid Input!    | \n"
                 << "\033[91;107;1m |                      | \n"
                 << "\033[91;107;1m  ======================  \n";
                 system("pause");
                 goto start;

            break;
        }

        system("pause");

    } while (ch);

    return 0;
}