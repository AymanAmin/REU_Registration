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
    
    public partial class Rosom_Response
    {
        public int Id { get; set; }
        public Nullable<int> Payment_Process_Id { get; set; }
        public Nullable<int> Rosom_Request_Id { get; set; }
        public string Trackingkey { get; set; }
        public string InvoiceId { get; set; }
        public string PaymentId { get; set; }
        public string SADADTransactionId { get; set; }
        public string BankTransactionId { get; set; }
        public string PaidAmount { get; set; }
        public string PaymentDate { get; set; }
        public string SADADNumber { get; set; }
        public string MerchantId { get; set; }
        public string BankName { get; set; }
        public string DistrictCode { get; set; }
        public string BranchCode { get; set; }
        public string AccessChannel { get; set; }
        public string PmtMethod { get; set; }
        public string PmtType { get; set; }
        public string ServiceType { get; set; }
    
        public virtual Payment_Process Payment_Process { get; set; }
        public virtual Rosom_Request Rosom_Request { get; set; }
    }
}
