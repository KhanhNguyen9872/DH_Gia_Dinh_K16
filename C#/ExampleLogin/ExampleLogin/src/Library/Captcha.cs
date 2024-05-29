using System;
using System.Windows.Forms;

public class Captcha
{
    private int result;
    private int first;
    private int second;
    private Random random = new Random();
    private Label lbCaptcha;
    private TextBox tbCaptcha;

    public Captcha(Label lbCaptcha, TextBox tbCaptcha)
    {
        this.lbCaptcha = lbCaptcha;
        this.tbCaptcha = tbCaptcha;
    }

    public bool verify(int userInput) 
    {
        if (userInput == this.result)
        {
            return true;
        }
        return false;
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
        this.lbCaptcha.Text = first.ToString() + calc_str + second.ToString();
        this.tbCaptcha.Text = "";
    }
}