using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

/// <summary>
/// Summary description for ContactUsSubmission
/// </summary>
public class ContactUsSubmission
{
    [Required]
    public string Name { get; set; }

    public string Phone { get; set; }

    [Required]
    public string Email { get; set; }

    [Required]
    [Display(Name = "Please enter a message")]
    public string Message {get; set; }
}

