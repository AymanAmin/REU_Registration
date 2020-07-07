using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicSubmission
{
    public class Enums
    {
        public enum LogFileID
        {
            Login = 11,
            ResetPassword = 12,
            AddGroup = 13,
            PermissionGroup = 14,
            CreatePermission = 15

        }
        public enum FileType
        {
            ProfileImage = 1,
            Nationality = 2,
            Capabilities = 3,
            High_School = 4,
            My_Achievement = 5,
            SAT1 = 6,
            SAT2 = 7,
            Diploma = 8 ,
            Acadimec_Regsteration = 9,
            Classification_Authority = 10,
            English_Test = 11,
            Description_of_Courses = 12,
            Before_Contract = 13,
            After_Contract = 14,
            Equation = 15 

        }
        public enum brnch
        {
            Olaya = 1,
            Munisiya = 2,
            Namuthajiyah = 3,
            Qurtuba = 4
        }

        public enum EmpType
        {
            Admin = 1,
            Manager = 2,
            Technicall = 3,
            User = 4,
            DeptMang = 5
        }

        public enum OrderStat
        {
            Pending = 1,
            Accepted = 2,
            Rejected = 3,
            Admin = 4,
            Technical = 5,
            Maintain = 6,
            Finished = 7,
            Closed = 8,
            AdminReject = 9,
            SendBack = 10
        }
    }
}