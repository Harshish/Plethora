using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Book
/// </summary>
public class Book
{
    public string Title { get; set; }
    public string Price { get; set; }
    public string Quantity { get; set; }
    public string ISBN { get; set; }
    public int Total { get; set; }

    public Book(string isbn,string title,string price,string qty)
    {
        ISBN = isbn;
        Title = title;
        Price = price;
        Quantity = qty;
        int x, y;
        int.TryParse(price, out x);
        int.TryParse(qty, out y);
        Total = x * y;
    }
}