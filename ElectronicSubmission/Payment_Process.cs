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
    
    public partial class Payment_Process
    {
        public Payment_Process()
        {
            this.Rosom_Request = new HashSet<Rosom_Request>();
            this.Rosom_Response = new HashSet<Rosom_Response>();
        }
    
        public int Payment_Id { get; set; }
        public Nullable<int> Student_Id { get; set; }
        public Nullable<bool> Payment_IsPaid { get; set; }
        public string Comment { get; set; }
        public Nullable<System.DateTime> DateCreation { get; set; }
        public string Send_EntityId { get; set; }
        public Nullable<double> Send_Amount { get; set; }
        public string Send_Currency { get; set; }
        public string Send_PaymentType { get; set; }
        public string Result_Code { get; set; }
        public string Result_Description { get; set; }
        public string Result_BuildNumber { get; set; }
        public string Result_Timestamp { get; set; }
        public string Result_Ndc { get; set; }
        public string Result_Id { get; set; }
        public Nullable<System.DateTime> Payment_Date { get; set; }
        public Nullable<int> Payment_Type_Id { get; set; }
        public string Payment_Trackingkey { get; set; }
        public Nullable<bool> Payment_URL_IsValid { get; set; }
        public string Payment_Result_Json { get; set; }
        public string Payment_SMS_Result { get; set; }
    
        public virtual Payment_Type Payment_Type { get; set; }
        public virtual Student Student { get; set; }
        public virtual ICollection<Rosom_Request> Rosom_Request { get; set; }
        public virtual ICollection<Rosom_Response> Rosom_Response { get; set; }
    }
}
