// Aruzhan T
// OPP task
class Student
{
    public string Name { get; set; }
    public int Grade1 { get; set; }
    public int Grade2 { get; set; }
    public int Grade3 { get; set; }

    public double GetAverage()
    {
        return (Grade1 + Grade2 + Grade3) / 3.0;
    }
    public string GetLetterGrade()
    {
        double x = GetAverage();
        if (x >= 90) return "A";
        else if (x >= 75) return "B";
        else if (x >= 60) return "C";
        else return "F";
    }

    public void Print()
    {
        Console.WriteLine($"Name = {Name}, average = {GetAverage():F2}, grade = {GetLetterGrade()}");
    }

}
class Program
{
    static void Main()
    {
        Student[] roster = new Student[4];
        roster[0] = new Student { Name = "Aruzhan", Grade1 = 95, Grade2 = 88, Grade3 = 92 };
        roster[1] = new Student { Name = "Asylai", Grade1 = 70, Grade2 = 75, Grade3 = 72 };
        roster[2] = new Student { Name = "Aiken", Grade1 = 85, Grade2 = 80, Grade3 = 78 };
        roster[3] = new Student { Name = "Inabat", Grade1 = 100, Grade2 = 98, Grade3 = 95 };

        foreach (Student s in roster)
        {
            s.Print();
        }

        Student best = roster[0];

        foreach (Student s in roster)
        {
            if (s.GetAverage() > best.GetAverage())
            {
                best = s;
            }
        }

        Console.WriteLine();
        Console.WriteLine("Best student:");
        best.Print();
    }
}

// task 2

class BankAccount
{
    public string Owner { get; set; }
    public decimal Balance { get; private set; }

    public BankAccount(string owner, decimal initialDeposit)
    {
        if (initialDeposit < 0)
            throw new ArgumentException("Initial deposit cannot be negative");

        Owner = owner;
        Balance = initialDeposit;
    }

    public void Deposit(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Deposit amount must be positive");

        Balance += amount;
    }

    public void Withdraw(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Withdrawal amount must be positive");

        if (amount > Balance)
            throw new InvalidOperationException("Insufficient funds");

        Balance -= amount;
    }

    public void PrintStatement()
    {
        Console.WriteLine($"Owner = {Owner}, balance = {Balance}");
    }
}

class Program
{
    static void Main()
    {
        var acc = new BankAccount("Aruzhan", 100m);

        acc.Deposit(50m);
        acc.Withdraw(30m);

        try
        {
            acc.Withdraw(1000m);
        }
        catch (InvalidOperationException ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        acc.PrintStatement();
    }
}

// task 3

class Temperature
{
    private double _celsius;

    public double Celsius
    {
        get { return _celsius; }
        set
        {
            if (value < -273.15)
                throw new ArgumentException("Temperature cannot be below absolute zero (-273.15°C)");

            _celsius = value;
        }
    }

    public double Fahrenheit
    {
        get { return _celsius * 9 / 5 + 32; }
        set
        {
            Celsius = (value - 32) * 5 / 9;
        }
    }

    public Temperature(double celsius)
    {
        Celsius = celsius;
    }

    public void Print()
    {
        Console.WriteLine($"{Celsius:F2}°C / {Fahrenheit:F2}°F");
    }
}

class Program
{
    static void Main()
    {
        var temp = new Temperature(25);

        temp.Print();

        temp.Fahrenheit = 100;
        temp.Print();

        try
        {
            temp.Celsius = -300;
        }
        catch (ArgumentException ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}