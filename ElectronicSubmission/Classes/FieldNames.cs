using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using ElectronicSubmission;

namespace ElectronicSubmission
{
    public static class FieldNames
    {
        public static string getFieldName(string fieldname, string DefaultValue)
        {
            string name = DefaultValue;
            
            if (SessionWrapper.Language != null)
            {
                try
                {
                    //int LanguageID = (int)SessionWrapper.LoggedUser.Language_id;
                    List<Lanuage_Detials> list = SessionWrapper.Language;
                    //Lanuage_Detials lang = list.Where(x => x.Language_Detial_FieldName == fieldname && x.Language_Master_Id == LanguageID).First();
                    Lanuage_Detials lang = list.Where(x => x.Language_Detial_FieldName == fieldname).First();
                    name = lang.Language_Detial_Value;
                }
                catch { return name; }
            }

            return name;
        }

        public static string getJavaScriptRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "<script src='../../../../Theme/files/assets/js/menu/menu-rtl.js'></script>";
            else
                return string.Empty;
        }

        public static string getJavaScriptRTLHome()
        {
            if (SessionWrapper.LanguageHome != 2)
                return "<script type='text/javascript' src='Template/script/functions-rtl.js'></script>";
            else
                return "<script type='text/javascript' src='Template/script/functions.js'></script>";
        }

        public static string getDirRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "rtl";
            else
                return string.Empty;
        }

        public static string getSTyleRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return " <link rel='stylesheet' type='text/css' href='../../../../Theme/files/assets/css/styleRTL.css' />"+
                    "<link rel='stylesheet' type='text/css' href='../../../../Theme/files/assets/css/bootstrap-rtl.min.css' />"+
                        "<link href='Template/css/rtl.min.css' rel='stylesheet'>"+
                        "<link href='Template/css/font-awesome-rtl.min.css' rel='stylesheet'>"+
                        "<link href='https://fonts.googleapis.com/css?family=Cairo:400,700' rel='stylesheet'>";
            else
                return string.Empty;
        }

        public static string getSTyleRTLHome()
        {
            if (SessionWrapper.LanguageHome != 2)
                return "<link href='Template/css/slick-slider-rtl.css' rel='stylesheet'>"+
                        "<link href='Template/style-rtl.css' rel='stylesheet'>"+
                        "<link href='Template/css/bootstrap-rtl.min.css' rel='stylesheet'>"+
                        "<link href='Template/css/rtl.min.css' rel='stylesheet'>"+
                        "<link href='Template/css/font-awesome-rtl.min.css' rel='stylesheet'>"+
                        "<link href='https://fonts.googleapis.com/css?family=Cairo:400,700' rel='stylesheet'>"+
                        "<link href='Template/css/responsive-rtl.css' rel='stylesheet'>"+
                        "<style>"+
                            ".nicescroll-rails-vr {right:100px;}"+
                            ".modal-content{float:left;}"+
                            "</style>";
            else
                return "<link href='Template/css/slick-slider.css' rel='stylesheet'>" +
                         "<link href='Template/style.css' rel='stylesheet'>" +
                         "<link href='Template/css/responsive.css' rel='stylesheet'>";
        }

        public static string getDirRTLHome()
        {
            if (SessionWrapper.LanguageHome != 2)
                return "rtl";
            else
                return "ltr";
        }

        public static string getLangHome()
        {
            if (SessionWrapper.LanguageHome != 2)
                return "ar";
            else
                return "en";
        }

        public static string getTextRTL()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "text-left";
            else
                return "text-right";
        }

        public static string getBoardColor()
        {
            if (SessionWrapper.BoardColor == 1)
                return "card-border-primary";
            else if (SessionWrapper.BoardColor == 2)
                return "card-border-warning";
            else if (SessionWrapper.BoardColor == 14)
                return "card-border-success";
            else return "card-border-danger";
        }

        public static string getTextRTLReal()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
                return "text-right";
            else
                return "text-left";
        }

    }
}