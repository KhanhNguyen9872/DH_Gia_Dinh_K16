using System;

public class Captcha
{
    private int result;
    private int first;
    private int second;
    private string full_calc;
    private Random random = new Random();

    public Captcha()
    {
        this.renew();
    }

    public string getString()
    {
        return this.full_calc;
    }

    public int getResult() 
    {
        return this.result;
    }

    public void renew()
    {
        this.first = random.Next(0, 25);
        this.second = random.Next(1, 25);
        string calc_str = "";
        int calc = random.Next(0, 3); // no div '/'
        if (calc == 0)
        {
            calc_str = " + ";
            this.result = first + second;
        }
        else if (calc == 1)
        {
            calc_str = " - ";
            this.result = first - second;
        }
        else if (calc == 2)
        {
            calc_str = " * ";
            this.result = first * second;
        }
        else if (calc == 3)
        {
            calc_str = " / ";
            this.result = first / second;
        }
        this.full_calc = first.ToString() + calc_str + second.ToString();
    }
}