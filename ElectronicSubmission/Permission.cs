
//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace ElectronicSubmission
{

using System;
    using System.Collections.Generic;
    
public partial class Permission
{

    public Permission()
    {

        this.Log_File = new HashSet<Log_File>();

        this.Permission_Group = new HashSet<Permission_Group>();

    }


    public int Permission_Id { get; set; }

    public string Permission_Name_Ar { get; set; }

    public string Permission_Name_En { get; set; }

    public Nullable<int> Parent { get; set; }

    public string Url_Path { get; set; }

    public string Permission_Icon { get; set; }

    public Nullable<int> System_Id { get; set; }



    public virtual ICollection<Log_File> Log_File { get; set; }

    public virtual ICollection<Permission_Group> Permission_Group { get; set; }

}

}
