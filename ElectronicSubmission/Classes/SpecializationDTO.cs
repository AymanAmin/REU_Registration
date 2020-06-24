using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicSubmission.Classes
{
    internal class SpecializationDTO
    {
        public int Specialization_Id { get; set; }
        public string Specialization_Name_Ar { get; set; }
        public string Specialization_Name_En { get; set; }
        public Nullable<int> Collage_Id { get; set; }
        public string Condition_Ar { get; set; }
        public string High_School_Percent { get; set; }
        public string Capabilities_Percent { get; set; }
        public string My_Achievement_Percent { get; set; }
        public string Weighted_Ratio_Percent { get; set; }
        public string Specialization_Icon { get; set; }
        public string Specialization_Image { get; set; }
        public string Condition_En { get; set; }
        public string Specialization_Description_Ar { get; set; }
        public string Specialization_Description_En { get; set; }
        public Nullable<double> Specialization_Registeration_Payment { get; set; }
        public Nullable<double> Specialization_Study_Payment { get; set; }
        public Nullable<bool> Specialization_Suspend { get; set; }
    }
}