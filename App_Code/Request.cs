using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Request
/// </summary>
public class Request
{
    public string Title { get; set; }
    public string Author { get; set; }
    public string Email { get; set; }

    public Request(string title,string author,string email)
    {
        Title = title;
        Author = author;
        Email = email;
    }
}