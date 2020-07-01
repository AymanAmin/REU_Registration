USE [REU_Registration]
GO
/****** Object:  Table [dbo].[Collage]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collage](
	[Collage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Collage_Name_Ar] [nvarchar](max) NULL,
	[Collage_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Collage] PRIMARY KEY CLUSTERED 
(
	[Collage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name_Ar] [nvarchar](max) NULL,
	[Employee_Name_En] [nvarchar](max) NULL,
	[Employee_Email] [nvarchar](max) NULL,
	[Employee_Phone] [nvarchar](max) NULL,
	[Group_Id] [int] NULL,
	[Employee_Profile] [nvarchar](max) NULL,
	[Employee_Password] [nvarchar](max) NULL,
	[Employee_Active] [bit] NULL,
	[Language_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[File_Id] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [nvarchar](max) NULL,
	[File_Path] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Student_Id] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[File_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name_Ar] [nvarchar](max) NULL,
	[Group_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group_Status]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Status](
	[Group_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Id] [int] NULL,
	[Status_Id] [int] NULL,
 CONSTRAINT [PK_Group_Status] PRIMARY KEY CLUSTERED 
(
	[Group_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LanguageMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lanuage_Detials](
	[Language_Detial_Id] [int] IDENTITY(1,1) NOT NULL,
	[Language_Master_Id] [int] NULL,
	[Language_Detial_FieldName] [nvarchar](150) NULL,
	[Language_Detial_Value] [nvarchar](150) NULL,
 CONSTRAINT [PK_Lanuage_Detials] PRIMARY KEY CLUSTERED 
(
	[Language_Detial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LastUpdate]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastUpdate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Counter] [int] NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_LastUpdate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_File]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_File](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Log_Date] [datetime] NULL,
	[Log_Note] [ntext] NULL,
	[Login_Id] [int] NULL,
	[Form_Id] [int] NULL,
	[Log_Name] [nvarchar](max) NULL,
	[Log_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Log_File] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nationality](
	[Nationality_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_code] [varchar](2) NOT NULL,
	[Country_Name_En] [varchar](100) NOT NULL,
	[Country_Name_Ar] [nvarchar](100) NOT NULL,
	[Nationality_Name_En] [varchar](100) NOT NULL,
	[Nationality_Name_Ar] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__countrie__3436E9A406F40284] PRIMARY KEY CLUSTERED 
(
	[Nationality_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Employee](
	[NotificationShow_Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NULL,
	[NotificationShow_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Employee] PRIMARY KEY CLUSTERED 
(
	[NotificationShow_Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Master](
	[Notification_Id] [int] IDENTITY(1,1) NOT NULL,
	[Notification_Date] [datetime] NULL,
	[Notification_Description_Ar] [nvarchar](max) NULL,
	[Notification_Description_En] [nvarchar](max) NULL,
	[Is_Read] [bit] NULL,
	[Date_Read] [datetime] NULL,
	[From_Employee_Structure_Id] [int] NULL,
	[To_Employee_Structure_Id] [int] NULL,
	[Master_Id] [int] NULL,
	[Notification_Link] [nvarchar](max) NULL,
	[Is_Show_Reply] [bit] NULL,
	[Date_Show_Reply] [datetime] NULL,
	[Notification_Show_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Master] PRIMARY KEY CLUSTERED 
(
	[Notification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Show](
	[Notification_Show_Id] [int] NOT NULL,
	[Notification_Show_Name_Ar] [nvarchar](max) NULL,
	[Notification_Show_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notification_Show] PRIMARY KEY CLUSTERED 
(
	[Notification_Show_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Process]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Process](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Payment_IsPaid] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Send_EntityId] [nvarchar](max) NULL,
	[Send_Amount] [float] NULL,
	[Send_Currency] [nvarchar](max) NULL,
	[Send_PaymentType] [nvarchar](max) NULL,
	[Result_Code] [nvarchar](max) NULL,
	[Result_Description] [nvarchar](max) NULL,
	[Result_BuildNumber] [nvarchar](max) NULL,
	[Result_Timestamp] [nvarchar](max) NULL,
	[Result_Ndc] [nvarchar](max) NULL,
	[Result_Id] [nvarchar](max) NULL,
	[Payment_Date] [datetime] NULL,
	[Payment_Type_Id] [int] NULL,
	[Payment_Trackingkey] [nvarchar](max) NULL,
	[Payment_URL_IsValid] [bit] NULL,
	[Payment_Result_Json] [varchar](max) NULL,
	[Payment_SMS_Result] [varchar](max) NULL,
 CONSTRAINT [PK_Payment_Study] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[Payment_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Name_Ar] [nvarchar](max) NULL,
	[Payment_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payment_Registration] PRIMARY KEY CLUSTERED 
(
	[Payment_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Permission_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Name_Ar] [nvarchar](max) NULL,
	[Permission_Name_En] [nvarchar](max) NULL,
	[Parent] [int] NULL,
	[Url_Path] [nvarchar](max) NULL,
	[Permission_Icon] [nvarchar](max) NULL,
	[System_Id] [int] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Group](
	[Permission_Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Id] [int] NULL,
	[Group_Id] [int] NULL,
 CONSTRAINT [PK_Permission_Group] PRIMARY KEY CLUSTERED 
(
	[Permission_Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[Resource_Name_Ar] [nchar](100) NULL,
	[Resource_Name_En] [nvarchar](100) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rosom_Request]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rosom_Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Trackingkey] [nvarchar](100) NULL,
	[Payment_Process_Id] [int] NULL,
	[PaymentType] [int] NULL,
	[DateCreation] [datetime] NULL,
	[UUID] [nvarchar](200) NULL,
	[Timestamp] [nvarchar](50) NULL,
	[MerchantId] [nchar](10) NULL,
	[Invoice_Students_Id] [nvarchar](200) NULL,
	[Invoice_Students_FirstName] [nvarchar](200) NULL,
	[Invoice_Students_LastName] [nvarchar](200) NULL,
	[InvoiceId] [nvarchar](200) NULL,
	[PayeeId] [nvarchar](200) NULL,
	[InvoiceStatus] [nvarchar](200) NULL,
	[BillType] [nvarchar](200) NULL,
	[DisplayInfo] [nvarchar](max) NULL,
	[AmountDue] [nvarchar](200) NULL,
	[CreateDate] [nvarchar](200) NULL,
	[ExpiryDate] [nvarchar](200) NULL,
	[PaymentRange_MinPartialAmount] [nvarchar](200) NULL,
	[PaymentRange_MinAdvanceAmount] [nvarchar](200) NULL,
	[PaymentRange_MaxAdvanceAmount] [nvarchar](200) NULL,
	[IsPaid] [bit] NULL,
	[Result_JSON] [nvarchar](max) NULL,
	[Response_InvoiceId] [nvarchar](200) NULL,
	[Response_SADADNumber] [nvarchar](200) NULL,
	[Response_Status_Code] [nvarchar](200) NULL,
	[Response_Status_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rosom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rosom_Response]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rosom_Response](
	[Id] [int] NOT NULL,
	[Payment_Process_Id] [int] NULL,
	[Rosom_Request_Id] [int] NULL,
	[Trackingkey] [nvarchar](max) NULL,
	[InvoiceId] [nvarchar](250) NULL,
	[PaymentId] [nvarchar](250) NULL,
	[SADADTransactionId] [nvarchar](max) NULL,
	[BankTransactionId] [nvarchar](max) NULL,
	[PaidAmount] [nvarchar](250) NULL,
	[PaymentDate] [nvarchar](250) NULL,
	[SADADNumber] [nvarchar](250) NULL,
	[MerchantId] [nvarchar](max) NULL,
	[BankName] [nvarchar](250) NULL,
	[DistrictCode] [nvarchar](max) NULL,
	[BranchCode] [nvarchar](max) NULL,
	[AccessChannel] [nvarchar](max) NULL,
	[PmtMethod] [nvarchar](250) NULL,
	[PmtType] [nvarchar](250) NULL,
	[ServiceType] [nvarchar](250) NULL,
 CONSTRAINT [PK_Rosom_Response] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sequence]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sequence](
	[Sequence_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Status_Id] [int] NULL,
	[Student_Id] [int] NULL,
	[DateCreation] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sequence] PRIMARY KEY CLUSTERED 
(
	[Sequence_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Specialization_Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization_Name_Ar] [nvarchar](max) NULL,
	[Specialization_Name_En] [nvarchar](max) NULL,
	[Collage_Id] [int] NULL,
	[Condition_Ar] [nvarchar](max) NULL,
	[High_School_Percent] [nvarchar](50) NULL,
	[Capabilities_Percent] [nvarchar](50) NULL,
	[My_Achievement_Percent] [nvarchar](50) NULL,
	[Weighted_Ratio_Percent] [nvarchar](50) NULL,
	[Specialization_Icon] [nvarchar](max) NULL,
	[Specialization_Image] [nvarchar](max) NULL,
	[Condition_En] [nvarchar](max) NULL,
	[Specialization_Description_Ar] [nvarchar](max) NULL,
	[Specialization_Description_En] [nvarchar](max) NULL,
	[Specialization_Registeration_Payment] [float] NULL,
	[Specialization_Study_Payment] [float] NULL,
	[Specialization_Suspend] [bit] NULL,
	[Specialization_Study_Payment_Semester] [float] NULL,
	[Specialization_Study_Payment_Contract] [float] NULL,
	[Specialization_Study_Payment_Equation] [float] NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Code] [int] NULL,
	[Status_Name_Ar] [nvarchar](max) NULL,
	[Status_Name_En] [nvarchar](max) NULL,
	[Status_Color] [nvarchar](max) NULL,
	[Status_Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_SSN] [nvarchar](50) NULL,
	[Student_Name_En] [nvarchar](max) NULL,
	[Student_Name_Ar] [nvarchar](max) NULL,
	[Student_Address] [nvarchar](max) NULL,
	[Student_Phone] [nvarchar](50) NULL,
	[Student_Email] [nvarchar](max) NULL,
	[Student_High_School_Degree] [nvarchar](50) NULL,
	[Student_Capabilities_Degree] [nvarchar](50) NULL,
	[Student_My_Achievement_Degree] [nvarchar](50) NULL,
	[Student_CreationDate] [datetime] NULL,
	[Student_Employee_Id] [int] NULL,
	[Student_Assign_Date] [datetime] NULL,
	[Student_Image_Profile] [nvarchar](max) NULL,
	[Student_Specialization_Id] [int] NULL,
	[Student_Nationality_Id] [int] NULL,
	[Student_Resource_Id] [int] NULL,
	[Student_Status_Id] [int] NULL,
	[Student_Total] [nvarchar](50) NULL,
	[Suspended] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[Student_URL_Video] [nvarchar](max) NULL,
	[Student_Type_Id] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_Concat]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Concat](
	[Student_Concat_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Concat_Name] [nvarchar](max) NULL,
	[Student_Concat_Phone] [nvarchar](max) NULL,
	[Student_Concat_Email] [nvarchar](max) NULL,
	[Student_Concat_Message] [nvarchar](max) NULL,
	[Student_Concat_Status] [int] NULL,
	[Student_Concat_CreationDate] [datetime] NULL,
 CONSTRAINT [PK_Student_Concat] PRIMARY KEY CLUSTERED 
(
	[Student_Concat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_Other_Info]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Other_Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[MessageType] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student_Other_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_Type]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Type](
	[Student_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Type_Name_Ar] [nvarchar](max) NULL,
	[Student_Type_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student_Type] PRIMARY KEY CLUSTERED 
(
	[Student_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VISA_MADA]    Script Date: 7/1/2020 5:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISA_MADA](
	[VISA_MADA_Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentProcess_Id] [int] NULL,
	[Trackingkey] [nvarchar](max) NULL,
	[UUID] [nvarchar](max) NULL,
	[Result_JSON] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
 CONSTRAINT [PK_VISA_MADA] PRIMARY KEY CLUSTERED 
(
	[VISA_MADA_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Collage] ON 

GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (1, N'كلية طب الأسنان', N'College of Dentistry')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (2, N'كلية الصيدلة', N'College of Pharmacy')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (3, N'كلية التمريض', N'College of Nursing')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (4, N'كلية العلوم الطبية التطبيقية', N'College of Applied Medical Sciences')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (5, N'البورد السعودي', N'Saudi Board')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (6, N'دبلوم عالي في زراعة الأسنان اكمال التعليم', N'Higher Diploma in Implant Dentistry Continuing Education')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (7, N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Collage] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (1, N'مدير النظام', N'Admin System', N'ayman@softwarecornerit.com', N'0550932548', 1, N'815ba3f3-40a6-4145-8895-915771ea594d.jpg', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 1)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (10, N'فهد الشمري', N'Fahad', N'fahad@riyadh.edu.sa', N'050000259', 1, N'0fba115a-773c-4461-9360-0f0903c4482e.jpg', N'tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (13, N'تجربة ', N'Test', N'ayman1793@gmail.com', N'0550932548', 1, N'Profile.JPG', N'PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1084, N'92e90aa8-a682-474d-b094-ba055df07b98.jpg', N'92e90aa8-a682-474d-b094-ba055df07b98.jpg', CAST(0x0000ABE900EE379A AS DateTime), 23, 2)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1085, N'f4f15114-d4df-44b2-844b-f58674efe876.png', N'f4f15114-d4df-44b2-844b-f58674efe876.png', CAST(0x0000ABE900EE37BD AS DateTime), 23, 4)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1086, N'11723a85-e476-4115-bae9-587bec593c42.png', N'11723a85-e476-4115-bae9-587bec593c42.png', CAST(0x0000ABE900EE37C5 AS DateTime), 23, 3)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1087, N'eed254f4-9a7a-4935-b556-fdd4ff5716dd.png', N'eed254f4-9a7a-4935-b556-fdd4ff5716dd.png', CAST(0x0000ABE900EE37CC AS DateTime), 23, 3)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1088, N'33b50ef4-a0e6-490b-8fae-1d342acb9749.png', N'33b50ef4-a0e6-490b-8fae-1d342acb9749.png', CAST(0x0000ABE900EE37D2 AS DateTime), 23, 5)
GO
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'الادارة', N'Management')
GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (2, N'مركز الاتصالات', N'Call Center')
GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (3, N'مشرف مركز الاتصال', N'Call Center Supervisor')
GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (4, N'لجنة الامتحان', N'Examination committee')
GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (5, N'لجنة اصدار الرقم الجامعي', N'University number issuance committee')
GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (6, N'اللجنة المالية', N'Finance committee')
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Group_Status] ON 

GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (352, 5, 12)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (353, 5, 13)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (358, 6, 5)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (359, 6, 10)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (375, 2, 3)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (376, 2, 4)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (377, 3, 1)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (378, 3, 2)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (379, 4, 8)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (380, 4, 7)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (381, 4, 9)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (401, 1, 2)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (402, 1, 3)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (403, 1, 4)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (404, 1, 5)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (405, 1, 6)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (406, 1, 7)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (407, 1, 8)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (408, 1, 9)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (409, 1, 10)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (410, 1, 11)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (411, 1, 12)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (412, 1, 13)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (413, 1, 15)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (414, 1, 1)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (415, 1, 14)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (416, 1, 16)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (417, 1, 17)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (418, 1, 18)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (419, 1, 19)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (420, 1, 1016)
GO
SET IDENTITY_INSERT [dbo].[Group_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON 

GO
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (1, N'Arabic')
GO
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (2, N'English')
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] ON 

GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1, 2, N'homepage-title', N'REU - Admission')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2, 1, N'homepage-title', N'جامعة رياض العلم - القبول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (3, 2, N'homepage-work', N'sat - fri: 24 hour')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (4, 1, N'homepage-work', N'السبت - الجمعة: 24 ساعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (5, 2, N'homepage-login', N'Login')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (6, 1, N'homepage-login', N'تسجيل الدخول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (7, 2, N'homepage-Address', N'King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (8, 1, N'homepage-Address', N'طريق الملك فهد الفرعي ، النموذجية ، الرياض 12734 ، المملكة العربية السعودية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (9, 2, N'homepage-home', N'Home')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (10, 1, N'homepage-home', N'الرئيسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (11, 2, N'homepage-Colleges', N'Colleges')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (12, 1, N'homepage-Colleges', N'الكليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (13, 2, N'homepage-Steps', N'Steps')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (14, 1, N'homepage-Steps', N'خطوات التقديم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (15, 2, N'homepage-Contact', N'Contact As')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (16, 1, N'homepage-Contact', N'الإتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (17, 2, N'homepage-About', N'About As')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (18, 1, N'homepage-About', N'حول الجامعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (19, 2, N'homepage-Admission', N'Admission')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (20, 1, N'homepage-Admission', N'التقديم للقبول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (21, 2, N'homepage-ReadMore', N'Read More')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (22, 1, N'homepage-ReadMore', N'قراء المزيد')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (23, 1, N'homepage-bannerHeadOne', N'جامعة رياض العلم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (24, 2, N'homepage-bannerHeadOne', N'Riyadh Elm University')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (25, 2, N'homepage-bannerDetailOne', N'Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is a privately supported post-secondary...')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (26, 1, N'homepage-bannerDetailOne', N'تعد جامعة رياض علم ، التي كانت تسمى سابقًا كليات الرياض لطب الأسنان والصيدلة ، دعمًا خاصًا لما بعد المرحلة الثانوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (27, 2, N'homepage-bannerHeadTow', N'Bachelors Degrees')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (28, 1, N'homepage-bannerHeadTow', N'درجة البكالوريوس')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (29, 2, N'homepage-bannerDetailTow', N'The core of Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is the academic excellence')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (30, 1, N'homepage-bannerDetailTow', N'جوهر جامعة الرياض علم ، سابقا كليات الرياض لطب الأسنان والصيدلة هو التميز الأكاديمي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (31, 2, N'homepage-bannerHeadThree', N'Research & Business')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (32, 1, N'homepage-bannerHeadThree', N'البحث والأعمال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (33, 2, N'homepage-bannerDetailThree', N'The scientific community nominates CRISPR System, based on research developed at the UA.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (34, 1, N'homepage-bannerDetailThree', N'يرشح المجتمع العلمي نظام CRISPR ، بناءً على الأبحاث التي تم تطويرها في UA.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (35, 2, N'homepage-BachelorsOfUniversity', N'<span>Bachelors </span> Of University')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (36, 1, N'homepage-BachelorsOfUniversity', N'<span>البكالوريوس</span> في الجامعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (37, 2, N'homepage-FindYourBachelors', N'Find Your Bachelors')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (38, 1, N'homepage-FindYourBachelors', N'البحث عن بكالوريوس')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (39, 2, N'homepage-FillBachelors', N'Fill in the form below to find your Bachelors:')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (40, 1, N'homepage-FillBachelors', N'املأ النموذج أدناه للعثور على البكالوريوس:')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1031, 2, N'homepage-WhyChoose', N'Why <span> Choose Us</span>')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1032, 1, N'homepage-WhyChoose', N'لماذا<span> تختارنا</span>')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1033, 2, N'homepage-WhyChooseOne', N'of our trainees have got a prestigious job')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1034, 1, N'homepage-WhyChooseOne', N'الاختيار')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1035, 2, N'homepage-WhyChooseTwo', N'students have established successful business')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1036, 1, N'homepage-WhyChooseTwo', N'الاختيار')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1037, 2, N'homepage-WhyChooseThree', N'have already earned their first million')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1038, 1, N'homepage-WhyChooseThree', N'الاختيار')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1039, 2, N'homepage-QuestionsHead', N'Questions about studying with us?')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1040, 1, N'homepage-QuestionsHead', N'الاسئلة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1041, 2, N'homepage-QuestionsDetail', N'We have a team of student advisers & officers to answer any questions:')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1042, 1, N'homepage-QuestionsDetail', N'اذا كان لديك اي سؤال الرجاء كتابته في مكان الاتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1043, 2, N'homepage-QuestionsButton', N'Ask us now')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1044, 1, N'homepage-QuestionsButton', N'إسئل الان')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1045, 2, N'homepage-StepOne', N'Electronic submission.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1046, 1, N'homepage-StepOne', N'التقديم الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1047, 2, N'homepage-StepTwo', N'Pay the registration fees.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1048, 1, N'homepage-StepTwo', N'سداد رسوم التسجيل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1049, 2, N'homepage-StepThree', N'English test personal interview.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1050, 1, N'homepage-StepThree', N'اختبار اللغة الانجليزية والمقابلة الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1051, 2, N'homepage-StepFour', N'Congratulations acceptance.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1052, 1, N'homepage-StepFour', N'تهنئة بالقبول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1053, 2, N'homepage-StepFive', N'Pay the tuition fees.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1054, 1, N'homepage-StepFive', N'سداد الرسوم الدراسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1055, 2, N'homepage-StepSix', N'Issuing the university number.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1056, 1, N'homepage-StepSix', N'اصدار الرقم الجامعي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1057, 2, N'homepage-StillNotConvincedHead', N'Still not convinced? We can help you!')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1058, 1, N'homepage-StillNotConvincedHead', N'للتواصل عن طريقة التقديم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1059, 2, N'homepage-StillNotConvincedDetail', N'Fill out the form below and we will contact you.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1060, 1, N'homepage-StillNotConvincedDetail', N'للاستفسار عن خطوات التقديم الرجاء ملاء الاستمارة ادناه')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1061, 2, N'homepage-InformationDetails', N'Information Details')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1062, 1, N'homepage-InformationDetails', N'معلومات إضافة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1063, 2, N'homepage-TalkToday', N'Talk To Us Today')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1064, 1, N'homepage-TalkToday', N'تواصل اليوم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1065, 2, N'homepage-ContactInfo', N'Contact Info')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1066, 1, N'homepage-ContactInfo', N'معلومات الاتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1067, 2, N'homepage-AddressName', N'Address')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1068, 1, N'homepage-AddressName', N'العنوان')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1069, 2, N'homepage-Phone', N'Phone')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1070, 1, N'homepage-Phone', N'رقم الهاتف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1071, 1, N'homepage-Email', N'البريد الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1072, 2, N'homepage-Email', N'E-mail')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1073, 2, N'homepage-Facebook', N'Facebook')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1074, 1, N'homepage-Facebook', N'فيس بوك')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1075, 2, N'homepage-Twitter', N'Twitter')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1076, 1, N'homepage-Twitter', N'تويتر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1077, 2, N'homepage-Youtube', N'Youtube')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1078, 1, N'homepage-Youtube', N'يوتيوب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1079, 2, N'homepage-Instagram', N'Instagram')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1080, 1, N'homepage-Instagram', N'انستغرام')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1081, 2, N'homepage-Flickr', N'Flickr')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1082, 1, N'homepage-Flickr', N'فليقر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1083, 2, N'homepage-Snapchat', N'Snapchat')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1084, 1, N'homepage-Snapchat', N'سناب شات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1085, 2, N'homepage-QuickLinks', N'Quick Links')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1086, 1, N'homepage-QuickLinks', N'روابط سريعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1087, 2, N'homepage-OurVisionHead', N'Our Vision')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1088, 1, N'homepage-OurVisionHead', N'الرؤية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1089, 2, N'homepage-OurVisionDetail', N'To become a preeminent educational institution locally, regionally, and internationally.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1090, 1, N'homepage-OurVisionDetail', N'تحقيق الريادة و التميز لنكون في طليعة المؤسسات التعليمية محلياً و إقليمياً و عالمياً')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1091, 2, N'homepage-OurMissionHead', N'Our Mission')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1092, 1, N'homepage-OurMissionHead', N'الرسالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1093, 2, N'homepage-OurMissionDetail', N'Effective education and training with active contribution to scientific research and community service.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1094, 1, N'homepage-OurMissionDetail', N'تعليم و تدريب فعال و مساهمة نشطة في البحث العلمي و خدمة المجتمع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1095, 2, N'homepage-OurGoals', N'Our Goals')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1096, 1, N'homepage-OurGoals', N'الاهداف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1097, 2, N'homepage-GoalOne', N'Graduate competent professionals to meet the needs of the labor market.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1098, 1, N'homepage-GoalOne', N'إعداد كوادر مؤهلة لسد حاجة سوق العمل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1099, 2, N'homepage-GoalTwo', N'Engage in community service.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1100, 1, N'homepage-GoalTwo', N'خدمة المجتمع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1101, 2, N'homepage-GoalThree', N'Conduct scientific research.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1102, 1, N'homepage-GoalThree', N'تنفيذ البحوث العلمية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1103, 2, N'homepage-GoalFour', N'Provide competitive postgraduate programs.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1104, 1, N'homepage-GoalFour', N'تقديم برامج دراسات عليا منافسة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1105, 2, N'homepage-GoalFive', N'Provide health care and promote health awareness to the public.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1106, 1, N'homepage-GoalFive', N'تقديم برامج علاجية و توعوية للمجتمع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1107, 2, N'homepage-GoalSix', N'Encourage lifelong learning through accredited continuous education programs.')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1108, 1, N'homepage-GoalSix', N'تشجيع التعلم مدى الحياة من خلال برامج معتمدة للتعليم المستمر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1109, 2, N'homepage-Copyright', N'© Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy | All Rights Reserved')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1110, 1, N'homepage-Copyright', N'© جامعة رياض العلم سابقاَ كلية الرياض لطب الأسنان والصيدلة | جميع الحقوق محفوظة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1111, 2, N'homepage-RiyadhElmUniversity', N'Riyadh Elm University')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1112, 1, N'homepage-RiyadhElmUniversity', N'جامعة رياض العلم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1113, 2, N'homepage-ForgotPassword', N'Forgot Password?')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1114, 1, N'homepage-ForgotPassword', N'إسترجاع كلمة المرور؟')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1115, 2, N'Bachelors-Bachelors', N'Bachelors')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1116, 1, N'Bachelors-Bachelors', N'بكالوريوس')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1117, 2, N'Bachelors-title', N'REU - Bachelors')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1118, 1, N'Bachelors-title', N'جامعة رياض العلم - البكالوريوس')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1119, 2, N'homepage-FormRequest', N'Form Request')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1120, 1, N'homepage-FormRequest', N'إستمارة الطلب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1121, 2, N'homepage-Admissionrequirements', N'Admission Requirements')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (1122, 1, N'homepage-Admissionrequirements', N'متطلبات القبول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2031, 2, N'homepage-AdmissionFormRequest', N'Admission Form Request')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2032, 1, N'homepage-AdmissionFormRequest', N'إستمارة طلب القبول')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2033, 1, N'Default-AllStudents', N'كل الطلاب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2034, 1, N'Default-InProgress', N'جاري التنفيذ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2035, 1, N'Default-Successfully', N'تم بنجاح')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2036, 1, N'Default-Failure', N'تم بالفشل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2037, 1, N'Default-DelayPerStatus', N'التأخير حسب الحالات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2038, 1, N'Default-Update', N'تحديث')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2039, 1, N'Default-RecordPerMounths', N'احصائيات حسب الايام')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2040, 1, N'Default-RecordsPerStatus', N'احصائيات حسب الحالات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2041, 1, N'Default-TheSourceoftheInformation', N'احصائية حسب المصدر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2042, 1, N'Default-NumberOfRecordPerMounths', N'عدد الملفات في اليوم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2043, 1, N'Default-Title', N'التقديم - لوحة المعلومات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2044, 1, N'ListView-AllRecords', N'كل الملفات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2045, 1, N'ListView-InProgress', N'تحت التنفيذ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2046, 1, N'ListView-CompletedSuccessfully', N'اكتمل بنحاج')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2047, 1, N'ListView-EndinFailure', N'اكتمل بالفشل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2048, 1, N'ListView-ListofStudents', N'قائمة الطلاب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2049, 1, N'ListView-Actions', N'العمليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2050, 1, N'ListView-Status', N'الحالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2051, 1, N'ListView-AssignTo', N'مسنده الي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2052, 1, N'ListView-EnglishName', N'الاسم بالانجليزية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2053, 1, N'ListView-ArabicName', N'الاسم بالعربية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2054, 1, N'ListView-Phone', N'جوال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2055, 1, N'ListView-Email', N'الايميل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2056, 1, N'ListView-Address', N'العنوان')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2057, 1, N'ListView-CreationDate', N'تاريخ الانشاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2058, 1, N'ListView-Expand', N'عرض المزيد')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2059, 1, N'Permissions-AddPermission', N'اضافة صلاحية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2060, 1, N'Permissions-EnglishName', N'الاسم الانجليزية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2061, 1, N'Permissions-ArabicName', N'الاسم بالعربية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2062, 1, N'Permissions-Parent', N'تندرج تحت')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2063, 1, N'Permissions-System', N'تتبع لنظام')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2064, 1, N'Permissions-Icon', N'ايقونة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2065, 1, N'Permissions-URLPath', N'الرابط')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2066, 1, N'Permissions-Action', N'العمليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2067, 1, N'Permissions-NameArabic', N'الاسم بالعربية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2068, 1, N'Permissions-NameEnglish', N'الاسم بالانجليزية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2069, 1, N'Permissions-MainParent', N'صفحة رئيسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2070, 1, N'Permissions-ClassIcon', N'تصميم الايقونة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2071, 1, N'Permissions-ClickHere', N'إضغط هنا')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2072, 1, N'Permissions-Save', N'حفظ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2073, 1, N'PermissionGroups-ArabicName', N'الاسم بالعربية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2074, 1, N'PermissionGroups-AddGroup', N'إضافة مجموعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2075, 1, N'PermissionGroups-EnglishName', N'الاسم بالانجليزية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2076, 1, N'PermissionGroups-ID', N'الرقم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2077, 1, N'PermissionGroups-Action', N'العمليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2078, 1, N'PermissionGroups-Groups', N'المجموعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2079, 1, N'PermissionGroups-PermissionID', N'رقم الصلاحية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2080, 1, N'PermissionGroups-URLPath', N'الرابط')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2081, 1, N'PermissionGroups-Save', N'حفظ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2082, 1, N'PermissionGroups-Title', N'ادارة الموظفين - المجموعات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2083, 1, N'MyNotifications-Title', N'نشاطاتي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2084, 1, N'MyNotifications-MyActivites', N'نشاطاتي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2085, 1, N'MyNotifications-Youhave', N'لقد قمت بـ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2086, 1, N'Master-Profile', N'الصفحة الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2087, 1, N'Master-LockScreen', N'قفل النظام')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2088, 1, N'Master-Logout', N'تسجيل خروج')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2089, 1, N'Language-Title', N'شاشة اللغات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2090, 1, N'Language-Language', N'اللغه')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2091, 1, N'Language-FieldName', N'اسم الخانة(مركب)')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2092, 1, N'Language-ID', N'الرقم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2093, 1, N'Language-Value', N'الترجمة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2094, 1, N'LogFile-Title', N'شاشة التتبع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2095, 1, N'LogFile-ID', N'الرقم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2096, 1, N'LogFile-MainPage', N'الصفحة الرئيسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2097, 1, N'LogFile-Employee', N'الموظف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2098, 1, N'LogFile-Date', N'التاريخ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2099, 1, N'LogFile-LogName', N'النص بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2100, 1, N'LogFile-Description', N'النص بالانجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2101, 1, N'Employees-Group', N'المجموعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2102, 1, N'Employees-Language', N'اللغة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2103, 1, N'View-Employees', N'الموظفين')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2104, 1, N'Employees-Active', N'نشط')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2105, 1, N'View-SSN', N'رقم الهوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2106, 1, N'View-StudentName', N'اسم الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2107, 1, N'View-Nationality', N'الجنسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2108, 1, N'View-Specialization', N'التخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2109, 1, N'View-Resource', N'المصدر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2110, 1, N'View-ContactInfo', N'معلومات الاتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2111, 1, N'View-AdditionalInformation', N'معلومات اضافية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2112, 1, N'Employees-Employee', N'الموظفين')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2113, 1, N'View-IdTrack', N'رقم الملف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2114, 1, N'View-Date', N'التاريخ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2115, 1, N'Employees-ArabicName', N'الإسم بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2116, 1, N'View-Status', N'الحالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2117, 1, N'View-DegreesInformation', N'معلومات النسب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2118, 1, N'View-HighSchool', N'درجة الثانوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2119, 1, N'Employees-EnglishName', N'الإسم بالانجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2120, 1, N'View-Capabilities', N'درجة القدرات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2121, 1, N'View-Achievement', N'درجة التحصيلي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2122, 1, N'View-Total', N'النسبة الكلية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2123, 1, N'Employees-Phone', N'رقم الهاتف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2124, 1, N'View-FileName', N'اسم المستند')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2125, 1, N'View-Type', N'نوع المستند')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2126, 1, N'Employees-Email', N'البريد الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2127, 1, N'View-Delete', N'حذف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2128, 1, N'View-View', N'عرض')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2129, 1, N'Employees-Language', N'اللغة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2130, 1, N'View-SequenceOfOperations', N'تسلسل العمليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2131, 1, N'View-Assign', N'اسناد الي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2132, 1, N'Employees-Group', N'المجموعة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2133, 1, N'Employees-Active', N'نشط')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2134, 1, N'View-MyAchievement', N'تحصيلي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2135, 1, N'View-ChangeStatusTo', N'تغير الحالة الي ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2136, 1, N'Profile-AboutMe', N'البيانات الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2137, 1, N'Profile-ArabicName', N'الإسم بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2138, 1, N'Profile-EnglishName', N'الإسم بالإنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2139, 1, N'Profile-Email', N'البريد الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2140, 1, N'Profile-Phone', N'رقم الهاتف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2141, 1, N'Profile-Language', N'اللغة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2142, 1, N'Profile-Group', N'المجموعات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2143, 1, N'Profile-Active', N'نشط')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2144, 1, N'Profile-changePassWord', N'تغير كلمة المرور')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2145, 1, N'Profile-Personal', N'البيانات الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2146, 1, N'Profile-Change Password', N'تغير كلمة المرور')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2147, 1, N'Profile-OldPassword', N'كلمة المرور القديمة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2148, 1, N'Profile-NewPassword', N'كلمة المرور الجديدة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2149, 1, N'Profile-TryNewPassword', N'إعادة كلمة المرور الجديدة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2150, 1, N'StudentInfo-RegistrationDate', N'تاريخ التسجيل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2151, 1, N'StudentInfo-StudentID', N'رقم الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2152, 1, N'StudentInfo-StudentArabicName', N'إسم الطالب بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2153, 1, N'StudentInfo-StudentEnglishName', N'إسم الطالب بالانجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2154, 1, N'StudentInfo-StudentPhone', N'رقم الهاتف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2155, 1, N'StudentInfo-StudentEmail', N'البريد الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2156, 1, N'StudentInfo-StudentSSN', N'رقم الهوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2157, 1, N'StudentInfo-AddStudentSSNAttachments', N'أضف مرفقات الهوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2158, 1, N'StudentInfo-StudentAddress', N'العنوان')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2159, 1, N'StudentInfo-Specialization', N'التخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2160, 1, N'StudentInfo-Resource', N'المصدر')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2161, 1, N'StudentInfo-Nationality', N'الجنسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2162, 1, N'StudentInfo-HighSchoolDegree', N'الشهادة الثانوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2163, 1, N'StudentInfo-CapabilitiesDegree', N'درجة القدرات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2164, 1, N'StudentInfo-MyAchievementDegree', N'درجة التحصيلي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2165, 1, N'StudentInfo-Note', N'الملاحظات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2166, 1, N'StudentInfo-Title', N'بيانات الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2167, 1, N'Profile-Title', N'الصفحة الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2168, 1, N'Employees-Title', N'الموظفين')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2169, 2, N'FormCollege-Title', N'REU - College')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2170, 1, N'FormCollege-Title', N'جامعة رياض العلم - الكليات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2171, 2, N'FormCollege-AddCollege', N'Add College')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2172, 1, N'FormCollege-AddCollege', N'إضافة كلية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2173, 2, N'FormCollege-ArabicName', N'Arabic Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2174, 1, N'FormCollege-ArabicName', N'الإسم عربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2175, 2, N'FormCollege-EnglishName', N'English Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2176, 1, N'FormCollege-EnglishName', N'الإسم إنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2177, 2, N'FormNationality-Title', N'REU - Nationality')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2178, 1, N'FormNationality-Title', N'جامعة رياض العلم - الجنسيات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2179, 2, N'FormNationality-AddNationality', N'Add Nationality')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2180, 1, N'FormNationality-AddNationality', N'إضافة جنسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2181, 2, N'FormNationality-ArabicName', N'Arabic Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2182, 1, N'FormNationality-ArabicName', N'الإسم عربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2183, 2, N'FormNationality-EnglishName', N'English Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2184, 1, N'FormNationality-EnglishName', N'الإسم إنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2185, 2, N'FormResource-Title', N'REU - Resource')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2186, 1, N'FormResource-Title', N'جامعة رياض العلم - مصادر المعرفة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2187, 2, N'FormResource-AddResource', N'Add Resource')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2188, 1, N'FormResource-AddResource', N'إضافة مصادر معرفة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2189, 2, N'FormResource-ArabicName', N'Arabic Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2190, 1, N'FormResource-ArabicName', N'الإسم عربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2191, 2, N'FormResource-EnglishName', N'English Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2192, 1, N'FormResource-EnglishName', N'الإسم إنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2193, 2, N'FormSpecialization-Title', N'REU - Specialization')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2194, 1, N'FormSpecialization-Title', N'جامعة رياض العلم - التخصصات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2195, 2, N'FormSpecialization-College', N'College Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2196, 1, N'FormSpecialization-College', N'إسم الكلية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2197, 2, N'FormSpecialization-Keyword', N'Keyword')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2198, 1, N'FormSpecialization-Keyword', N'كلمة مفتاحية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2199, 2, N'FormSpecialization-Specialization', N'Specialization')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2200, 1, N'FormSpecialization-Specialization', N'التخصصات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2201, 2, N'FormSpecialization-ArabicName', N'Arabic Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2202, 1, N'FormSpecialization-ArabicName', N'الإسم عربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2203, 2, N'FormSpecialization-EnglishName', N'English Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2204, 1, N'FormSpecialization-EnglishName', N'الإسم إنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2205, 2, N'FormSpecialization-Icon', N'Specialization Icon')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2206, 1, N'FormSpecialization-Icon', N'أيقونة التخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2207, 2, N'FormSpecialization-HighSchoolPercent', N'High School Percent')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2208, 1, N'FormSpecialization-HighSchoolPercent', N'نسبة الثانوية العامة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2209, 2, N'FormSpecialization-CapabilitiesPercent', N'Capabilities Percent')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2210, 1, N'FormSpecialization-CapabilitiesPercent', N'نسبة القدرات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2211, 2, N'FormSpecialization-MyAchievementPercent', N'My Achievement Percent')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2212, 1, N'FormSpecialization-MyAchievementPercent', N'نسبة التحصيلي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2213, 2, N'FormSpecialization-WeightedRatioPercent', N'Weighted Ratio Percent')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2214, 1, N'FormSpecialization-WeightedRatioPercent', N'النسبة المئوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2215, 2, N'FormSpecialization-SpecializationImage', N'Specialization Image')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2216, 1, N'FormSpecialization-SpecializationImage', N'صورة التخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2217, 2, N'FormSpecialization-SpecializationDescriptionArabic', N'Specialization Description Arabic')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2218, 1, N'FormSpecialization-SpecializationDescriptionArabic', N'وصف التخصص بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2219, 2, N'FormSpecialization-SpecializationDescriptionEnglish', N'Specialization Description English')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2220, 1, N'FormSpecialization-SpecializationDescriptionEnglish', N'وصف التخصص بالإنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2221, 2, N'FormSpecialization-ConditionArabic', N'Admission Requirements Arabic')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2222, 1, N'FormSpecialization-ConditionArabic', N'شروط القبول بالعربي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2223, 2, N'FormSpecialization-ConditionEnglish', N'Admission Requirements English')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2224, 1, N'FormSpecialization-ConditionEnglish', N'شروط القبول بالإنجليزي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2225, 2, N'ListContact-Title', N'REU - List Contact')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2226, 1, N'ListContact-Title', N'جامعة رياض العلم - قائمة الإتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2227, 2, N'ListContact-AllRecords', N'All Records')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2228, 1, N'ListContact-AllRecords', N'كل السجلات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2229, 2, N'ListContact-InProgress', N'In Progress')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2230, 1, N'ListContact-InProgress', N'قيد التنفيذ')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2231, 2, N'ListContact-CompletedSuccessfully', N'Completed Successfully')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2232, 1, N'ListContact-CompletedSuccessfully', N'إكتمل بنجاح')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2233, 2, N'ListContact-EndinFailure', N'End In Failure')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2234, 1, N'ListContact-EndinFailure', N'انتهي بالفشل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2235, 2, N'ListContact-ListofContact', N'List Of Contact')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2236, 1, N'ListContact-ListofContact', N'قاتمة الإتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2237, 2, N'ListContact-Expand', N'Expand')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2238, 1, N'ListContact-Expand', N'وسع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2239, 2, N'ListContact-Actions', N'Action')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2240, 1, N'ListContact-Actions', N'الأكشن')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2241, 2, N'ListContact-Status', N'Status')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2242, 1, N'ListContact-Status', N'الحالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2243, 2, N'ListContact-Name', N'Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2244, 1, N'ListContact-Name', N'الإسم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2245, 2, N'ListContact-Phone', N'Phone')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2246, 1, N'ListContact-Phone', N'رقم الهاتف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2247, 2, N'ListContact-Email', N'E-mail')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2248, 1, N'ListContact-Email', N'البريد الإلكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2249, 2, N'ListContact-CreationDate', N'Creation Date')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2250, 1, N'ListContact-CreationDate', N'تاريخ الإنشاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2251, 2, N'ListContact-Message', N'Message')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2252, 1, N'ListContact-Message', N'الرسالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2253, 2, N'ViewContact-Title', N'REU - View Contact')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2254, 1, N'ViewContact-Title', N'جامعة رياض العلم - عرض الإتصال')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2255, 2, N'ViewContact-Id', N'Student Id')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2256, 1, N'ViewContact-Id', N'رقم الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2257, 2, N'ViewContact-Name', N'Student Name')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2258, 1, N'ViewContact-Name', N'إسم الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2259, 2, N'ViewContact-Phone', N'Student Phone')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2260, 1, N'ViewContact-Phone', N'رقم هاتف الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2261, 2, N'ViewContact-Email', N'Student E-mail')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2262, 1, N'ViewContact-Email', N'البريد الإلكتروني للطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2263, 2, N'ViewContact-CreationDate', N'Creation Date')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2264, 1, N'ViewContact-CreationDate', N'تاريخ الإنشاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2265, 2, N'ViewContact-Status', N'Status')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2266, 1, N'ViewContact-Status', N'الحالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2267, 2, N'ViewContact-Message', N'Message')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2268, 1, N'ViewContact-Message', N'الرسالة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2269, 1, N'Master-Title', N'نظام التقديم الالكتروني')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2270, 2, N'Master-Title', N'Admission System')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2271, 1, N'StudentInfo-AddHighSchoolDegreeAttachments', N'أضف مرفقات الشهادة الثانوية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2272, 1, N'StudentInfo-AddCapabilitiesDegreeAttachments', N'أضف مرفقات القدرات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2273, 1, N'StudentInfo-AddMyAchievementDegreeAttachments', N'أضف مرفقات التحصيلي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2274, 1, N'Profile-Cancel', N'إلغاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2275, 1, N'Profile-Profile', N'الصورة الشخصية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2276, 1, N'AllRecords-Title', N'كل الملفات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2277, 1, N'RestoreStudent-Title', N' سلة المحذوفات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2278, 1, N'ListView-Title', N'الملفات النشطة')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2279, 1, N'View-Title', N'عرض ملف الطالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2280, 1, N'Permissions-Title', N'شاشة الصلاحيات')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2281, 2, N'FormSpecialization-AddSpecialization', N'Add Specialization')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2282, 1, N'FormSpecialization-AddSpecialization', N'إضافة تخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2283, 1, N'StudentSubmitting-Applicationform', N'إستمارة التقديم')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2284, 1, N'ListView-DeleteHeader', N'حذف ملف طالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2285, 1, N'ListView-DeleteMessage', N'هل انت متأكد انك تريد حذف ملف هذا الطالب ؟')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2286, 1, N'ListView-Delete', N'حذف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2287, 1, N'ListView-Cancel', N'الغاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2288, 1, N'View-DeleteHeader', N'حذف ملف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2289, 1, N'View-Delete', N'حذف')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2290, 1, N'View-Cancel', N'الغاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2291, 1, N'View-DeleteMessage', N'هل انت متأكد انك تريد حذف هذا ملف ؟')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2292, 1, N'RestoreStudent-Cancel', N'الغاء')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2293, 1, N'RestoreStudent-Restore', N'استرجاع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2294, 1, N'RestoreStudent-DeleteHeader', N'استعادة ملف طالب')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2295, 1, N'RestoreStudent-DeleteMessage', N'هل انت متأكد انك تريد استعادة ملف الطالب؟')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2296, 1, N'FormSpecialization-DeleteHeader', N'حذف التخصص')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2297, 1, N'FormSpecialization-DeleteMessage', N'هل أنت متأكد أنك تريد حذف هذا التخصص؟')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2298, 1, N'FormSpecialization-RegisterationPayment', N'رسوم التسجيل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2299, 1, N'FormSpecialization-StudyPayment', N'الرسوم الدراسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2300, 1, N'View-URLVideoLink', N'رابط الاجتماع')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2301, 2, N'StudentInfo-StudentSSN', N'Student National ID')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2302, 2, N'StudentInfo-AddStudentSSNAttachments', N'Add Student National ID Attachments')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2303, 1, N'homepage-SAR', N'ريال سعودي')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2304, 1, N'Bachelors-RegisterFees', N'رسوم التسجيل')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2305, 1, N'Bachelors-StudyFees', N'الرسوم الدراسية')
GO
INSERT [dbo].[Lanuage_Detials] ([Language_Detial_Id], [Language_Master_Id], [Language_Detial_FieldName], [Language_Detial_Value]) VALUES (2306, 1, N'FormSpecialization-SpecializationSuspend', N'ايقاف التخصص')
GO
SET IDENTITY_INSERT [dbo].[Lanuage_Detials] OFF
GO
SET IDENTITY_INSERT [dbo].[LastUpdate] ON 

GO
INSERT [dbo].[LastUpdate] ([Id], [Counter], [CreationDate]) VALUES (1, 4, CAST(0x0000ABCE01611836 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LastUpdate] OFF
GO
SET IDENTITY_INSERT [dbo].[Log_File] ON 

GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7179, CAST(0x0000ABE8011C2889 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7180, CAST(0x0000ABE8011C791B AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":31,"Permission_Name_Ar":"معلومات اخرى","Permission_Name_En":"Other Informations","Parent":1,"Url_Path":"Pages/RegistrationProcess/OtherInfo.aspx","Permission_Icon":"icofont icofont-info-circle","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7181, CAST(0x0000ABE8011CAE1A AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7182, CAST(0x0000ABE8011CCDBC AS DateTime), N'data:2', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7183, CAST(0x0000ABE8011CFB7B AS DateTime), N'data:3', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7184, CAST(0x0000ABE8011D0E77 AS DateTime), N'data:4', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7185, CAST(0x0000ABE8012010F0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7186, CAST(0x0000ABE8012DC6A4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7187, CAST(0x0000ABE8012E0EE2 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"AZgBbSSgTskfolca0GH+v8viLDGisXBW/meTc93ElKxgptxXfroB4sqnGDPBqSPMIWO1/R8pyzpY2EnPCM1x6HAom8HcQyZUSBL6XBoAK0G5sBHhoKXrzXZAIu3V5eLM","Employee_Active":true,"Language_id":2}', 1, 16, N'إضافة موظف', N'Add Employee')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7188, CAST(0x0000ABE8012E671C AS DateTime), N'data:{"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 13, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7189, CAST(0x0000ABE8012E80C9 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}', 1, 30, N'إعادة تعين كلمة السر', N'reset your password')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7190, CAST(0x0000ABE8012FEE03 AS DateTime), N'data:{"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 13, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7191, CAST(0x0000ABE900EDCF17 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7192, CAST(0x0000ABE900EE37ED AS DateTime), N'data:{"Employee":null,"Files":[{"File_Id":1084,"File_Name":"92e90aa8-a682-474d-b094-ba055df07b98.jpg","File_Path":"92e90aa8-a682-474d-b094-ba055df07b98.jpg","DateCreation":"2020-06-29T14:27:19.3406496+03:00","Student_Id":23,"Type":2},{"File_Id":1085,"File_Name":"f4f15114-d4df-44b2-844b-f58674efe876.png","File_Path":"f4f15114-d4df-44b2-844b-f58674efe876.png","DateCreation":"2020-06-29T14:27:19.4547936+03:00","Student_Id":23,"Type":4},{"File_Id":1086,"File_Name":"11723a85-e476-4115-bae9-587bec593c42.png","File_Path":"11723a85-e476-4115-bae9-587bec593c42.png","DateCreation":"2020-06-29T14:27:19.4839202+03:00","Student_Id":23,"Type":3},{"File_Id":1087,"File_Name":"eed254f4-9a7a-4935-b556-fdd4ff5716dd.png","File_Path":"eed254f4-9a7a-4935-b556-fdd4ff5716dd.png","DateCreation":"2020-06-29T14:27:19.5068956+03:00","Student_Id":23,"Type":3},{"File_Id":1088,"File_Name":"33b50ef4-a0e6-490b-8fae-1d342acb9749.png","File_Path":"33b50ef4-a0e6-490b-8fae-1d342acb9749.png","DateCreation":"2020-06-29T14:27:19.5265657+03:00","Student_Id":23,"Type":5}],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false},"Status":null,"Student_Other_Info":[],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":null,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":1,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 12, N'إضافة طالب', N'Add Student')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7193, CAST(0x0000ABE900EE4678 AS DateTime), N'data:{"Employee":{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Status":{"Group_Status":[],"Sequences":[{"Sequence_Id":1224,"Emp_Id":1,"Status_Id":2,"Student_Id":23,"DateCreation":"2020-06-29T14:27:31.8696345+03:00","Note":null}],"Student_Concat":[],"Students":[],"Status_Id":2,"Status_Code":2,"Status_Name_Ar":"قيد الانتظار","Status_Name_En":"Pending","Status_Color":null,"Status_Icon":null},"Group_Status_Id":360,"Group_Id":1,"Status_Id":2},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"Group_Status_Id":360,"Group_Id":1,"Status_Id":2}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":2,"Status_Code":2,"Status_Name_Ar":"قيد الانتظار","Status_Name_En":"Pending","Status_Color":null,"Status_Icon":null},"Sequence_Id":1224,"Emp_Id":1,"Status_Id":2,"Student_Id":23,"DateCreation":"2020-06-29T14:27:31.8696345+03:00","Note":null}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":{"Students":[],"Nationality_Id":194,"Country_code":"SD","Country_Name_En":"Sudan","Country_Name_Ar":"السودان","Nationality_Name_En":"Sudanese","Nationality_Name_Ar":"سوداني"},"Payment_Process":[],"Resource":{"Students":[],"ResourceID":1,"Resource_Name_Ar":"فيس بوك                                                                                             ","Resource_Name_En":"Facebook"},"Sequences":[{"Employee":{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":2,"Status_Code":2,"Status_Name_Ar":"قيد الانتظار","Status_Name_En":"Pending","Status_Color":null,"Status_Icon":null},"Group_Status_Id":360,"Group_Id":1,"Status_Id":2},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"Group_Status_Id":360,"Group_Id":1,"Status_Id":2}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":2,"Status_Code":2,"Status_Name_Ar":"قيد الانتظار","Status_Name_En":"Pending","Status_Color":null,"Status_Icon":null},"Sequence_Id":1224,"Emp_Id":1,"Status_Id":2,"Student_Id":23,"DateCreation":"2020-06-29T14:27:31.8696345+03:00","Note":null}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false},"Status":{"Group_Status":[{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Sequence_Id":1224,"Emp_Id":1,"Status_Id":2,"Student_Id":23,"DateCreation":"2020-06-29T14:27:31.8696345+03:00","Note":null}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"Group_Status_Id":360,"Group_Id":1,"Status_Id":2}],"Sequences":[{"Employee":{"Group":{"Employees":[{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":10,"Employee_Name_Ar":"فهد الشمري","Employee_Name_En":"Fahad","Employee_Email":"fahad@riyadh.edu.sa","Employee_Phone":"050000259","Group_Id":1,"Employee_Profile":"0fba115a-773c-4461-9360-0f0903c4482e.jpg","Employee_Password":"tLq9hdIRdAubqwvNQOL86k/o+fflqLG8jWta73NzlT0cHtgT5iTW7B9OP166VrdBU1Cpz0Kc2qBdk+nUuw9g4ZPDFuQO3KZJWxNXUdUVKflcmWsBEU+hSghlFkoWF8Wc","Employee_Active":true,"Language_id":2},{"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":13,"Employee_Name_Ar":"تجربة ","Employee_Name_En":"Test","Employee_Email":"ayman1793@gmail.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"Profile.JPG","Employee_Password":"PKzwnVTu7oTYu3xilH5e67Pz/M6TqbIho1yafsOxAzjGNdaSTuIRgml9YGJJ7hc8ph00u2uOzU9ZTambLOTdJgq3Qwb61jpKncqXLy/++eu/fN1xZoQDeKumaANctYSv","Employee_Active":true,"Language_id":2}],"Group_Status":[{"Status":{"Group_Status":[{"Group":{"Employees":[],"Group_Status":[],"Permission_Group":[],"Group_Id":2,"Group_Name_Ar":"مركز الاتصالات","Group_Name_En":"Call Center"},"Group_Status_Id":375,"Group_Id":2,"Status_Id":3}],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Group_Status_Id":361,"Group_Id":1,"Status_Id":3},{"Group_Status_Id":360,"Group_Id":1,"Status_Id":2},{"Status":null,"Group_Status_Id":362,"Group_Id":1,"Status_Id":4},{"Status":null,"Group_Status_Id":363,"Group_Id":1,"Status_Id":5},{"Status":null,"Group_Status_Id":364,"Group_Id":1,"Status_Id":6},{"Status":null,"Group_Status_Id":365,"Group_Id":1,"Status_Id":7},{"Status":null,"Group_Status_Id":366,"Group_Id":1,"Status_Id":8},{"Status":null,"Group_Status_Id":367,"Group_Id":1,"Status_Id":9},{"Status":null,"Group_Status_Id":368,"Group_Id":1,"Status_Id":10},{"Status":null,"Group_Status_Id":369,"Group_Id":1,"Status_Id":11},{"Status":null,"Group_Status_Id":370,"Group_Id":1,"Status_Id":12},{"Status":null,"Group_Status_Id":371,"Group_Id":1,"Status_Id":13},{"Status":null,"Group_Status_Id":372,"Group_Id":1,"Status_Id":15},{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":1,"Status_Code":1,"Status_Name_Ar":"جديدة","Status_Name_En":"New","Status_Color":null,"Status_Icon":null},"Group_Status_Id":373,"Group_Id":1,"Status_Id":1},{"Status":null,"Group_Status_Id":374,"Group_Id":1,"Status_Id":14}],"Permission_Group":[],"Group_Id":1,"Group_Name_Ar":"الادارة","Group_Name_En":"Management"},"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1224,"Emp_Id":1,"Status_Id":2,"Student_Id":23,"DateCreation":"2020-06-29T14:27:31.8696345+03:00","Note":null}],"Student_Concat":[],"Students":[],"Status_Id":2,"Status_Code":2,"Status_Name_Ar":"قيد الانتظار","Status_Name_En":"Pending","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":2,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7194, CAST(0x0000ABE900EE4FED AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Sequence_Id":1225,"Emp_Id":1,"Status_Id":3,"Student_Id":23,"DateCreation":"2020-06-29T14:27:39.9616051+03:00","Note":null}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Sequence_Id":1225,"Emp_Id":1,"Status_Id":3,"Student_Id":23,"DateCreation":"2020-06-29T14:27:39.9616051+03:00","Note":null}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1225,"Emp_Id":1,"Status_Id":3,"Student_Id":23,"DateCreation":"2020-06-29T14:27:39.9616051+03:00","Note":null}],"Student_Concat":[],"Students":[],"Status_Id":3,"Status_Code":3,"Status_Name_Ar":"مخصصة","Status_Name_En":"Assigned","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":3,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 2, N'اسناد ملف لموظف مركز الاتصالات', N'File assigned to Call Center')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7195, CAST(0x0000ABE900EE5F09 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":1226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-06-29T14:27:48.7218282+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":1226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-06-29T14:27:48.7218282+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-06-29T14:27:48.7218282+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 6/29/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-06-29T14:27:52.8961696+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7196, CAST(0x0000ABE900EE831B AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1227,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-06-29T14:28:20.0539999+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":7,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-06-29T14:28:20.1850386+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"7XRV8235IZ-1558081140CU3BR","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1227,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-06-29T14:28:20.0539999+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1227,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-06-29T14:28:20.0539999+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":2,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=7XRV8235IZ-1558081140CU3BR <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 6/29/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-06-29T14:28:23.0993443+03:00","Note":""},{"Id":3,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=7XRV8235IZ-1558081140CU3BR","DateCreation":"2020-06-29T14:28:23.6567074+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7197, CAST(0x0000ABE900EEE95B AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":7,"Student_Id":23,"Payment_IsPaid":true,"Comment":"Registration Fees","DateCreation":"2020-06-29T14:28:20.187","Send_EntityId":"8ac7a4c87284f6c901728e6183ff150e","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":"000.200.100","Result_Description":"successfully created checkout","Result_BuildNumber":"5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000","Result_Timestamp":"2020-06-29 11:29:20+0000","Result_Ndc":"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03","Result_Id":"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03","Payment_Date":"2020-06-29T14:29:50.826627+03:00","Payment_Type_Id":1,"Payment_Trackingkey":"7XRV8235IZ-1558081140CU3BR","Payment_URL_IsValid":false,"Payment_Result_Json":"{\"id\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"paymentType\":\"DB\",\"paymentBrand\":\"VISA\",\"amount\":\"1000.00\",\"currency\":\"SAR\",\"descriptor\":\"0627.2299.1319 Riyadh Elm University\",\"merchantTransactionId\":\"MSSHZ23XRX-943289611WDOX7\",\"result\":{\"code\":\"000.100.112\",\"description\":\"Request successfully processed in ''Merchant in Connector Test Mode''\"},\"resultDetails\":{\"3DSecure.acsEci\":\"05\",\"ConnectorTxID1\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"connectorId\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"authorizationResponse.stan\":\"73195\",\"transaction.acquirer.settlementDate\":\"2020-06-29\",\"transaction.receipt\":\"018111073195\",\"reconciliationId\":\"0627.2299.1319\",\"transaction.authorizationCode\":\"073195\",\"sourceOfFunds.provided.card.issuer\":\"JPMORGAN CHASE BANK, N.A.\",\"response.acquirerMessage\":\"Approved\",\"response.acquirerCode\":\"00\"},\"card\":{\"bin\":\"411111\",\"binCountry\":\"US\",\"last4Digits\":\"1111\",\"holder\":\"cw2\",\"expiryMonth\":\"05\",\"expiryYear\":\"2021\"},\"customer\":{\"givenName\":\"Ayman amin Alicustomer.surname=Ayman\",\"email\":\"ayman@softwarecornerit.com\",\"ip\":\"95.187.206.127\",\"ipCountry\":\"SA\"},\"billing\":{\"street1\":\"60 street\",\"city\":\"Riyadh\",\"state\":\"RIYADH\",\"postcode\":\"00000\",\"country\":\"SA\"},\"customParameters\":{\"SHOPPER_EndToEndIdentity\":\"0b8b7c44dca8313493c3b30c0bca8907b562f2c096c0e4466608a190be378ef6\",\"CTPE_DESCRIPTOR_TEMPLATE\":\"\"},\"risk\":{\"score\":\"100\"},\"buildNumber\":\"5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000\",\"timestamp\":\"2020-06-29 11:29:49+0000\",\"ndc\":\"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03\"}","Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null}', 1, 1, N'تغير الحالة تلقائي', N'Update Status Automatic')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7198, CAST(0x0000ABE900EEE974 AS DateTime), N'data:{"Payment_Type":null,"Student":{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":1228,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-06-29T14:29:50.9308205+03:00","Note":"Auto payment"}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"","Student_URL_Video":null},"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":7,"Student_Id":23,"Payment_IsPaid":true,"Comment":"Registration Fees","DateCreation":"2020-06-29T14:28:20.187","Send_EntityId":"8ac7a4c87284f6c901728e6183ff150e","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":"000.200.100","Result_Description":"successfully created checkout","Result_BuildNumber":"5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000","Result_Timestamp":"2020-06-29 11:29:20+0000","Result_Ndc":"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03","Result_Id":"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03","Payment_Date":"2020-06-29T14:29:50.826627+03:00","Payment_Type_Id":1,"Payment_Trackingkey":"7XRV8235IZ-1558081140CU3BR","Payment_URL_IsValid":false,"Payment_Result_Json":"{\"id\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"paymentType\":\"DB\",\"paymentBrand\":\"VISA\",\"amount\":\"1000.00\",\"currency\":\"SAR\",\"descriptor\":\"0627.2299.1319 Riyadh Elm University\",\"merchantTransactionId\":\"MSSHZ23XRX-943289611WDOX7\",\"result\":{\"code\":\"000.100.112\",\"description\":\"Request successfully processed in ''Merchant in Connector Test Mode''\"},\"resultDetails\":{\"3DSecure.acsEci\":\"05\",\"ConnectorTxID1\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"connectorId\":\"8ac7a4a072f0cc0b0172ffd701bd6600\",\"authorizationResponse.stan\":\"73195\",\"transaction.acquirer.settlementDate\":\"2020-06-29\",\"transaction.receipt\":\"018111073195\",\"reconciliationId\":\"0627.2299.1319\",\"transaction.authorizationCode\":\"073195\",\"sourceOfFunds.provided.card.issuer\":\"JPMORGAN CHASE BANK, N.A.\",\"response.acquirerMessage\":\"Approved\",\"response.acquirerCode\":\"00\"},\"card\":{\"bin\":\"411111\",\"binCountry\":\"US\",\"last4Digits\":\"1111\",\"holder\":\"cw2\",\"expiryMonth\":\"05\",\"expiryYear\":\"2021\"},\"customer\":{\"givenName\":\"Ayman amin Alicustomer.surname=Ayman\",\"email\":\"ayman@softwarecornerit.com\",\"ip\":\"95.187.206.127\",\"ipCountry\":\"SA\"},\"billing\":{\"street1\":\"60 street\",\"city\":\"Riyadh\",\"state\":\"RIYADH\",\"postcode\":\"00000\",\"country\":\"SA\"},\"customParameters\":{\"SHOPPER_EndToEndIdentity\":\"0b8b7c44dca8313493c3b30c0bca8907b562f2c096c0e4466608a190be378ef6\",\"CTPE_DESCRIPTOR_TEMPLATE\":\"\"},\"risk\":{\"score\":\"100\"},\"buildNumber\":\"5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000\",\"timestamp\":\"2020-06-29 11:29:49+0000\",\"ndc\":\"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03\"}","Payment_SMS_Result":null}', 1, 1, N'اضافة عملية دفع', N'add payment process')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7199, CAST(0x0000ABE90101D7C0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7200, CAST(0x0000ABE901077703 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (8191, CAST(0x0000ABEA0127837D AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9191, CAST(0x0000ABEB00D44B2D AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9192, CAST(0x0000ABEB00D4C964 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9193, CAST(0x0000ABEB00D50379 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2224,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T12:55:29.025095+03:00","Note":"تجربة"}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2224,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T12:55:29.025095+03:00","Note":"تجربة"}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2224,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T12:55:29.025095+03:00","Note":"تجربة"}],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1002,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 15:57<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T12:55:32.8898618+03:00","Note":""},{"Id":1003,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23\n\nMeeting Date: 2020-07-02 Meeting Time: 15:57\n\nPlease Check Your Email.","DateCreation":"2020-07-01T12:55:33.3707329+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":8,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9194, CAST(0x0000ABEB00D9821A AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":4,"Status_Code":4,"Status_Name_Ar":"غير مكتملة","Status_Name_En":"Not Complete","Status_Color":null,"Status_Icon":null},"Sequence_Id":2225,"Emp_Id":1,"Status_Id":4,"Student_Id":23,"DateCreation":"2020-07-01T13:11:48.7668425+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":4,"Status_Code":4,"Status_Name_Ar":"غير مكتملة","Status_Name_En":"Not Complete","Status_Color":null,"Status_Icon":null},"Sequence_Id":2225,"Emp_Id":1,"Status_Id":4,"Student_Id":23,"DateCreation":"2020-07-01T13:11:48.7668425+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2225,"Emp_Id":1,"Status_Id":4,"Student_Id":23,"DateCreation":"2020-07-01T13:11:48.7668425+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":4,"Status_Code":4,"Status_Name_Ar":"غير مكتملة","Status_Name_En":"Not Complete","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1004,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Not Complete stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:11:52.0353388+03:00","Note":""},{"Id":1005,"Student_Id":23,"MessageType":"E-mail","Message":" <Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Please complete the missing data in your file as soon as posible Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23 <br /> <Strong>Current Status:</Strong> Not Complete <br /> <Strong>Note:</Strong>  <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:11:54.9898768+03:00","Note":""},{"Id":1006,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\nPlease complete the missing data in your file as soon as posible Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23\n\nPlease Check Your Email","DateCreation":"2020-07-01T13:11:55.3548026+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":4,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9195, CAST(0x0000ABEB00D98EC2 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T13:12:03.3930102+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T13:12:03.3930102+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2226,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T13:12:03.3930102+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1007,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:12:06.1559011+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9196, CAST(0x0000ABEB00DA6E3E AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2227,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T13:15:14.2584693+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2227,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T13:15:14.2584693+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2227,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T13:15:14.2584693+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1008,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Complete Contract Files stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:15:16.8740133+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":16,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9197, CAST(0x0000ABEB00DAB86B AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9198, CAST(0x0000ABEB00DAC5D4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9199, CAST(0x0000ABEB00DB0DCB AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2228,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T13:17:30.3270168+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2228,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T13:17:30.3270168+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2228,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T13:17:30.3270168+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1009,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:17:32.9999344+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":17,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9200, CAST(0x0000ABEB00DB330D AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2229,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T13:18:02.1960868+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2229,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T13:18:02.1960868+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2229,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T13:18:02.1960868+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1010,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:18:04.8073386+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":18,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9201, CAST(0x0000ABEB00DBB0CC AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2230,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T13:19:49.3741782+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2230,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T13:19:49.3741782+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2230,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T13:19:49.3741782+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1011,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:19:52.0341461+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":12,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9202, CAST(0x0000ABEB00DBD640 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2231,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T13:20:21.1525632+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2231,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T13:20:21.1525632+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2231,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T13:20:21.1525632+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1012,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:20:24.0687825+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":13,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9203, CAST(0x0000ABEB00DBE2C1 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2232,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T13:20:32.1106305+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2232,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T13:20:32.1106305+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2232,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T13:20:32.1106305+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1013,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T13:20:34.7480279+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":14,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9204, CAST(0x0000ABEB00FC2C3B AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9205, CAST(0x0000ABEB00FC5000 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2233,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:18:34.8192014+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2233,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:18:34.8192014+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2233,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:18:34.8192014+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1014,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:18:38.4079038+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9206, CAST(0x0000ABEB00FCCFE7 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2234,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:20:23.9368895+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":1007,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-07-01T15:20:24.0287368+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"PMV8E23VAF13102808915FK5P","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2234,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:20:23.9368895+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false,"Specialization_Study_Payment_NonSaudi":null,"Specialization_Study_Payment_Semester":null,"Specialization_Study_Payment_Contract":null,"Specialization_Study_Payment_Equation":null},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2234,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:20:23.9368895+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1015,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=PMV8E23VAF13102808915FK5P <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:20:26.8605876+03:00","Note":""},{"Id":1016,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=PMV8E23VAF13102808915FK5P","DateCreation":"2020-07-01T15:20:27.3466027+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9207, CAST(0x0000ABEB00FCDB36 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2235,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:20:34.602247+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2235,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:20:34.602247+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2235,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:20:34.602247+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1017,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:20:37.2651459+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 15:57","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9208, CAST(0x0000ABEB00FCF347 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2236,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:20:54.6076072+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2236,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:20:54.6076072+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2236,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:20:54.6076072+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1018,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 17:23<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:20:57.4291292+03:00","Note":""},{"Id":1019,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23\n\nMeeting Date: 2020-07-02 Meeting Time: 17:23\n\nPlease Check Your Email.","DateCreation":"2020-07-01T15:20:57.8051106+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":8,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9209, CAST(0x0000ABEB00FCFD0A AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2237,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:21:03.2539626+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2237,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:21:03.2539626+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2237,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:21:03.2539626+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1020,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:21:06.1193131+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":10,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9210, CAST(0x0000ABEB00FDACF4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9211, CAST(0x0000ABEB00FE0CA8 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2238,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:24:55.0848248+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2238,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:24:55.0848248+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2238,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:24:55.0848248+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1021,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Complete Contract Files stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:24:57.8647461+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":16,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9212, CAST(0x0000ABEB00FE4E50 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2239,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:25:51.2432309+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2239,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:25:51.2432309+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2239,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:25:51.2432309+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1022,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:25:53.9446222+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":17,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9213, CAST(0x0000ABEB00FE7001 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2240,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:26:20.1499024+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2240,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:26:20.1499024+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2240,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:26:20.1499024+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1023,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:26:22.6938197+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":18,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9214, CAST(0x0000ABEB00FE7DE7 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2241,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T15:26:31.8392695+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2241,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T15:26:31.8392695+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2241,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T15:26:31.8392695+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1024,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:26:34.550707+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":12,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9215, CAST(0x0000ABEB00FE87E6 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2242,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T15:26:40.4783855+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2242,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T15:26:40.4783855+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2242,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T15:26:40.4783855+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1025,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:26:43.0747833+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":13,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9216, CAST(0x0000ABEB00FE928A AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2243,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T15:26:49.5428739+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2243,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T15:26:49.5428739+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2243,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T15:26:49.5428739+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1026,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:26:52.1634014+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":14,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9217, CAST(0x0000ABEB01029065 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9218, CAST(0x0000ABEB0102B548 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2244,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:41:52.5805487+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2244,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:41:52.5805487+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2244,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T15:41:52.5805487+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1027,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:41:55.5689151+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9219, CAST(0x0000ABEB0102BE7F AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2245,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:42:00.0616118+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":1008,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-07-01T15:42:00.1144711+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"K4W8S230CJ1133537433WOHHH","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2245,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:42:00.0616118+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false,"Specialization_Study_Payment_NonSaudi":null,"Specialization_Study_Payment_Semester":null,"Specialization_Study_Payment_Contract":null,"Specialization_Study_Payment_Equation":null},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2245,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T15:42:00.0616118+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1028,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=K4W8S230CJ1133537433WOHHH <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:42:02.7285881+03:00","Note":""},{"Id":1029,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=K4W8S230CJ1133537433WOHHH","DateCreation":"2020-07-01T15:42:03.4485643+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9220, CAST(0x0000ABEB0102C69B AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2246,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:42:07.7056286+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2246,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:42:07.7056286+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2246,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T15:42:07.7056286+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1030,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:42:10.4070486+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:23","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9221, CAST(0x0000ABEB0102ECB4 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2247,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:42:39.913377+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2247,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:42:39.913377+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2247,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T15:42:39.913377+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1031,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 17:42<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:42:42.5433378+03:00","Note":""},{"Id":1032,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23\n\nMeeting Date: 2020-07-02 Meeting Time: 17:42\n\nPlease Check Your Email.","DateCreation":"2020-07-01T15:42:42.9073826+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":8,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9222, CAST(0x0000ABEB010316DF AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2248,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:43:16.0083101+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2248,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:43:16.0083101+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2248,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T15:43:16.0083101+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1033,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:43:18.8971919+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":10,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9223, CAST(0x0000ABEB0103F173 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9224, CAST(0x0000ABEB01040C28 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2250,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:46:45.406363+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2250,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:46:45.406363+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2250,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:46:45.406363+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1035,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:46:48.1640426+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":17,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9225, CAST(0x0000ABEB010472F9 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2251,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:47:54.542578+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2251,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:47:54.542578+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2251,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T15:47:54.542578+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1036,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23<br /> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:47:57.3213135+03:00","Note":""},{"Id":1037,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to upload the required files Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23\n\nPlease Check Your Email.","DateCreation":"2020-07-01T15:48:15.935163+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":16,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9226, CAST(0x0000ABEB0104A568 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2252,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:48:55.2384304+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2252,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:48:55.2384304+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2252,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T15:48:55.2384304+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1038,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:48:58.9834927+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":17,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9227, CAST(0x0000ABEB0104B8A7 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2253,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:49:12.8071555+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2253,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:49:12.8071555+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2253,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T15:49:12.8071555+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1039,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T15:49:15.4094492+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":18,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9228, CAST(0x0000ABEB010CDD12 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9229, CAST(0x0000ABEB010D02CD AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2254,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T16:19:22.7763534+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2254,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T16:19:22.7763534+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2254,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T16:19:22.7763534+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1040,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:19:26.1793293+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9230, CAST(0x0000ABEB010D1104 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2255,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T16:19:35.1518307+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":1009,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-07-01T16:19:35.2445856+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"3VGDT23CBS-2085983254PVH9M","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2255,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T16:19:35.1518307+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false,"Specialization_Study_Payment_NonSaudi":null,"Specialization_Study_Payment_Semester":null,"Specialization_Study_Payment_Contract":null,"Specialization_Study_Payment_Equation":null},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2255,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T16:19:35.1518307+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1041,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=3VGDT23CBS-2085983254PVH9M <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:19:38.0561991+03:00","Note":""},{"Id":1042,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=3VGDT23CBS-2085983254PVH9M","DateCreation":"2020-07-01T16:19:38.4178084+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9231, CAST(0x0000ABEB010D19F3 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2256,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T16:19:43.3832022+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2256,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T16:19:43.3832022+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2256,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T16:19:43.3832022+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1043,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:19:46.0492318+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 17:42","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9232, CAST(0x0000ABEB010D36EF AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2257,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T16:20:07.3841663+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Sequence_Id":2257,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T16:20:07.3841663+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2257,"Emp_Id":1,"Status_Id":8,"Student_Id":23,"DateCreation":"2020-07-01T16:20:07.3841663+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":8,"Status_Code":8,"Status_Name_Ar":"حجز موعد","Status_Name_En":"Appointment Booking","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1044,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 18:19<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:20:10.4281027+03:00","Note":""},{"Id":1045,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23\n\nMeeting Date: 2020-07-02 Meeting Time: 18:19\n\nPlease Check Your Email.","DateCreation":"2020-07-01T16:20:10.7894519+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":8,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9233, CAST(0x0000ABEB010D416C AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2258,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T16:20:17.0584401+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Sequence_Id":2258,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T16:20:17.0584401+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2258,"Emp_Id":1,"Status_Id":10,"Student_Id":23,"DateCreation":"2020-07-01T16:20:17.0584401+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":10,"Status_Code":10,"Status_Name_Ar":"نجح في الامتحان","Status_Name_En":"Successful in Exam","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1046,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:20:19.734482+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":10,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9234, CAST(0x0000ABEB010D59A5 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2259,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T16:20:37.2154978+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Sequence_Id":2259,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T16:20:37.2154978+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2259,"Emp_Id":1,"Status_Id":16,"Student_Id":23,"DateCreation":"2020-07-01T16:20:37.2154978+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":16,"Status_Code":16,"Status_Name_Ar":"اكمال ملفات العقد","Status_Name_En":"Complete Contract Files","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1047,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23<br /> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:20:40.0551523+03:00","Note":""},{"Id":1048,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to upload the required files Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23\n\nPlease Check Your Email.","DateCreation":"2020-07-01T16:20:40.4092274+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":16,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9235, CAST(0x0000ABEB010D67A7 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2260,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T16:20:49.580996+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2260,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T16:20:49.580996+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2260,"Emp_Id":1,"Status_Id":17,"Student_Id":23,"DateCreation":"2020-07-01T16:20:49.580996+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":17,"Status_Code":17,"Status_Name_Ar":"تم تكملة الملف","Status_Name_En":"Files Contract Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1049,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:20:52.3734263+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":17,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9236, CAST(0x0000ABEB010D73B7 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2261,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T16:21:00.0086338+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Sequence_Id":2261,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T16:21:00.0086338+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2261,"Emp_Id":1,"Status_Id":18,"Student_Id":23,"DateCreation":"2020-07-01T16:21:00.0086338+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":18,"Status_Code":18,"Status_Name_Ar":"مرحلة العقد","Status_Name_En":"Contract Stage","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1050,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:21:02.653726+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":18,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9237, CAST(0x0000ABEB010D9C1E AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2262,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T16:21:34.1029743+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2262,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T16:21:34.1029743+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2262,"Emp_Id":1,"Status_Id":12,"Student_Id":23,"DateCreation":"2020-07-01T16:21:34.1029743+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":12,"Status_Code":12,"Status_Name_Ar":"تم الدفع (الدراسة)","Status_Name_En":"Paid (study)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1051,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:21:37.1373068+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":12,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9238, CAST(0x0000ABEB010DAAB3 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2263,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T16:21:46.7917332+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Sequence_Id":2263,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T16:21:46.7917332+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2263,"Emp_Id":1,"Status_Id":13,"Student_Id":23,"DateCreation":"2020-07-01T16:21:46.7917332+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":13,"Status_Code":13,"Status_Name_Ar":"اصدار الرقم الجامعي","Status_Name_En":"Issuance University ID","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1052,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:21:49.5797467+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":13,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9239, CAST(0x0000ABEB010DB5B5 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2264,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T16:21:56.2565974+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Sequence_Id":2264,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T16:21:56.2565974+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2264,"Emp_Id":1,"Status_Id":14,"Student_Id":23,"DateCreation":"2020-07-01T16:21:56.2565974+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":14,"Status_Code":14,"Status_Name_Ar":"اكتمال الملف بنجاح","Status_Name_En":"File Completed Successfully","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1053,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T16:21:58.9735529+03:00","Note":""}],"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":14,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23"}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9240, CAST(0x0000ABEB0118C9B6 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9241, CAST(0x0000ABEB01190D2F AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2265,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T17:03:12.4553453+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Sequence_Id":2265,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T17:03:12.4553453+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2265,"Emp_Id":1,"Status_Id":5,"Student_Id":23,"DateCreation":"2020-07-01T17:03:12.4553453+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":5,"Status_Code":5,"Status_Name_Ar":"مكتملة البيانات","Status_Name_En":"Data Completed","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1054,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:03:16.5216638+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":5,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23","Student_Type_Id":1}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9242, CAST(0x0000ABEB0119183F AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2266,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:03:22.5394943+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":1010,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-07-01T17:03:22.6501989+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"687MO23IMM-1587887470I0A93","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2266,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:03:22.5394943+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false,"Specialization_Study_Payment_NonSaudi":null,"Specialization_Study_Payment_Semester":null,"Specialization_Study_Payment_Contract":null,"Specialization_Study_Payment_Equation":null},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2266,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:03:22.5394943+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1055,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=687MO23IMM-1587887470I0A93 <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:03:25.4057355+03:00","Note":""},{"Id":1056,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=687MO23IMM-1587887470I0A93","DateCreation":"2020-07-01T17:03:26.0011095+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23","Student_Type_Id":1}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9243, CAST(0x0000ABEB011926FE AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2267,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:03:35.7557168+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2267,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:03:35.7557168+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2267,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:03:35.7557168+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1057,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:03:38.6231362+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23","Student_Type_Id":1}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9244, CAST(0x0000ABEB0119857F AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2268,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:04:55.6774779+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[{"Payment_Type":null,"Rosom_Request":[],"Rosom_Response":[],"VISA_MADA":[],"Payment_Id":1011,"Student_Id":23,"Payment_IsPaid":false,"Comment":"Registration Fees","DateCreation":"2020-07-01T17:04:55.8245567+03:00","Send_EntityId":"","Send_Amount":1000.0,"Send_Currency":"SAR","Send_PaymentType":"DB","Result_Code":null,"Result_Description":null,"Result_BuildNumber":null,"Result_Timestamp":null,"Result_Ndc":null,"Result_Id":null,"Payment_Date":null,"Payment_Type_Id":1,"Payment_Trackingkey":"DQW86237UY-372196513M13E0","Payment_URL_IsValid":true,"Payment_Result_Json":null,"Payment_SMS_Result":null}],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2268,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:04:55.6774779+03:00","Note":""}],"Specialization":{"Collage":null,"Students":[],"Specialization_Id":18,"Specialization_Name_Ar":"بكالوريوس الحاسب الآلي","Specialization_Name_En":"Bachelor of Computer","Collage_Id":6,"Condition_Ar":"<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>\r\n\r\n<ul>\r\n\t<li>أن ال تقل النسبة الموزونة عن ) <span style=\"color:#2980b9\">70</span>&nbsp;) % موزعة على النحو التالي:\r\n\r\n\t<ul>\r\n\t\t<li>) 30 ) % ثانوية عامة.</li>\r\n\t\t<li>) 30 ) % قدرات</li>\r\n\t\t<li>) 40 ) % تحصيلي</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>\r\n\r\n<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>\r\n\r\n<p>4-&nbsp;أن يكون الئقاً طبياً.</p>\r\n\r\n<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>\r\n","High_School_Percent":"30","Capabilities_Percent":"30","My_Achievement_Percent":"40","Weighted_Ratio_Percent":"70","Specialization_Icon":"fa fa-desktop","Specialization_Image":"christopher-gower.jpg","Condition_En":"<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>\r\n\r\n<p>The weighted percentage should not be less than (<span style=\"color:#2980b9\">70%</span>) distributed as follows:</p>\r\n\r\n<ul>\r\n\t<li>(30%) of high school.</li>\r\n\t<li>(30%) capabilities.</li>\r\n\t<li>(40%) achievement.</li>\r\n</ul>\r\n\r\n<p>2- To be of good conduct and behavior.</p>\r\n\r\n<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>\r\n\r\n<p>4- To be medically fit.</p>\r\n\r\n<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>\r\n","Specialization_Description_Ar":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Description_En":"Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.","Specialization_Registeration_Payment":1000.0,"Specialization_Study_Payment":90000.0,"Specialization_Suspend":false,"Specialization_Study_Payment_NonSaudi":null,"Specialization_Study_Payment_Semester":null,"Specialization_Study_Payment_Contract":null,"Specialization_Study_Payment_Equation":null},"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2268,"Emp_Id":1,"Status_Id":6,"Student_Id":23,"DateCreation":"2020-07-01T17:04:55.6774779+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":6,"Status_Code":6,"Status_Name_Ar":"جاهز للدفع (التسجيل)","Status_Name_En":"Ready to pay (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1058,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=DQW86237UY-372196513M13E0 <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:04:58.6786561+03:00","Note":""},{"Id":1059,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nNow you can pay the fees of Registration\n\nPlease use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=DQW86237UY-372196513M13E0","DateCreation":"2020-07-01T17:04:59.26738+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":6,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23","Student_Type_Id":2}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9245, CAST(0x0000ABEB01199018 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2269,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:05:05.7377835+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Sequence_Id":2269,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:05:05.7377835+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2269,"Emp_Id":1,"Status_Id":7,"Student_Id":23,"DateCreation":"2020-07-01T17:05:05.7377835+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":7,"Status_Code":7,"Status_Name_Ar":"تم الدفع (التسجيل)","Status_Name_En":"Paid (Registration)","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1060,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:05:08.3000541+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":7,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date: 2020-07-02 Meeting Time: 18:19","Student_URL_Video":"http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23","Student_Type_Id":2}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9246, CAST(0x0000ABEB0119AD06 AS DateTime), N'data:{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[{"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":19,"Status_Code":19,"Status_Name_Ar":"معادلة الشهادة","Status_Name_En":"Certificate Equation","Status_Color":null,"Status_Icon":null},"Sequence_Id":2270,"Emp_Id":1,"Status_Id":19,"Student_Id":23,"DateCreation":"2020-07-01T17:05:29.9906865+03:00","Note":""}],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Files":[],"Nationality":null,"Payment_Process":[],"Resource":null,"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Status":{"Group_Status":[],"Sequences":[],"Student_Concat":[],"Students":[],"Status_Id":19,"Status_Code":19,"Status_Name_Ar":"معادلة الشهادة","Status_Name_En":"Certificate Equation","Status_Color":null,"Status_Icon":null},"Sequence_Id":2270,"Emp_Id":1,"Status_Id":19,"Student_Id":23,"DateCreation":"2020-07-01T17:05:29.9906865+03:00","Note":""}],"Specialization":null,"Status":{"Group_Status":[],"Sequences":[{"Employee":{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"815ba3f3-40a6-4145-8895-915771ea594d.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":1},"Sequence_Id":2270,"Emp_Id":1,"Status_Id":19,"Student_Id":23,"DateCreation":"2020-07-01T17:05:29.9906865+03:00","Note":""}],"Student_Concat":[],"Students":[],"Status_Id":19,"Status_Code":19,"Status_Name_Ar":"معادلة الشهادة","Status_Name_En":"Certificate Equation","Status_Color":null,"Status_Icon":null},"Student_Other_Info":[{"Id":1061,"Student_Id":23,"MessageType":"E-mail","Message":"<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Certificate Equation stage </Strong> <br /><Strong>Meeting Date:</Strong> <br /><Strong>Meeting Timme:</Strong> <br /><Strong>URL Meeting:</Strong> <br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ","DateCreation":"2020-07-01T17:05:32.6034497+03:00","Note":""},{"Id":1062,"Student_Id":23,"MessageType":"SMS","Message":"Dear Ayman amin Ali\n\nUse the link that sent with the message to attend the exam Link:\n\nMeeting Date:  Meeting Time: \n\nPlease Check Your Email.","DateCreation":"2020-07-01T17:05:32.9761428+03:00","Note":""}],"Student_Type":null,"Student_Id":23,"Student_SSN":"1234567895","Student_Name_En":"Ayman amin Ali","Student_Name_Ar":"ايمن امين علي","Student_Address":"السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24","Student_Phone":"0550932548","Student_Email":"ayman@softwarecornerit.com","Student_High_School_Degree":"100","Student_Capabilities_Degree":"100","Student_My_Achievement_Degree":"99","Student_CreationDate":"2020-06-29T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"Profile.JPG","Student_Specialization_Id":18,"Student_Nationality_Id":194,"Student_Resource_Id":1,"Student_Status_Id":19,"Student_Total":"99.6","Suspended":0,"Notes":"Meeting Date:  Meeting Time: ","Student_URL_Video":"","Student_Type_Id":2}', 1, 2, N'تغير الحالة', N'Update Status')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9247, CAST(0x0000ABEB0119FD54 AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9248, CAST(0x0000ABEB011A0B9A AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"مدير النظام","Employee_Name_En":"Admin System","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 28, N'تسجيل دخول', N'login to system')
GO
SET IDENTITY_INSERT [dbo].[Log_File] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON 

GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (1, N'AD', N'Andorra', N'أندورا', N'Andorran', N'أندوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (2, N'AE', N'United Arab Emirates', N'الإمارات العربية المتحدة', N'Emirati', N'إماراتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (3, N'AF', N'Afghanistan', N'أفغانستان', N'Afghan', N'أفغانستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (4, N'AG', N'Antigua and Barbuda', N'أنتيغوا وبربودا', N'Antiguan', N'بربودي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (5, N'AI', N'Anguilla', N'أنغويلا', N'Anguillan', N'أنغويلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (6, N'AL', N'Albania', N'ألبانيا', N'Albanian', N'ألباني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (7, N'AM', N'Armenia', N'أرمينيا', N'Armenian', N'أرميني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (8, N'AN', N'Netherlands Antilles', N'جزر الأنتيل الهولندي', N'Dutch Antilier', N'هولندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (9, N'AO', N'Angola', N'أنغولا', N'Angolan', N'أنقولي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (10, N'AQ', N'Antarctica', N'أنتاركتيكا', N'Antarctican', N'أنتاركتيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (11, N'AR', N'Argentina', N'الأرجنتين', N'Argentinian', N'أرجنتيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (12, N'AS', N'American Samoa', N'ساموا-الأمريكي', N'American Samoan', N'أمريكي سامواني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (13, N'AT', N'Austria', N'النمسا', N'Austrian', N'نمساوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (14, N'AU', N'Australia', N'أستراليا', N'Australian', N'أسترالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (15, N'AW', N'Aruba', N'أروبه', N'Aruban', N'أوروبهيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (16, N'AX', N'Aland Islands', N'جزر آلاند', N'Aland Islander', N'آلاندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (17, N'AZ', N'Azerbaijan', N'أذربيجان', N'Azerbaijani', N'أذربيجاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (18, N'BA', N'Bosnia and Herzegovina', N'البوسنة و الهرسك', N'Bosnian / Herzegovinian', N'بوسني/هرسكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (19, N'BB', N'Barbados', N'بربادوس', N'Barbadian', N'بربادوسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (20, N'BD', N'Bangladesh', N'بنغلاديش', N'Bangladeshi', N'بنغلاديشي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (21, N'BE', N'Belgium', N'بلجيكا', N'Belgian', N'بلجيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (22, N'BF', N'Burkina Faso', N'بوركينا فاسو', N'Burkinabe', N'بوركيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (23, N'BG', N'Bulgaria', N'بلغاريا', N'Bulgarian', N'بلغاري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (24, N'BH', N'Bahrain', N'البحرين', N'Bahraini', N'بحريني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (25, N'BI', N'Burundi', N'بوروندي', N'Burundian', N'بورونيدي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (26, N'BJ', N'Benin', N'بنين', N'Beninese', N'بنيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (27, N'BL', N'Saint Barthelemy', N'سان بارتيلمي', N'Saint Barthelmian', N'سان بارتيلمي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (28, N'BM', N'Bermuda', N'جزر برمودا', N'Bermudan', N'برمودي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (29, N'BN', N'Brunei Darussalam', N'بروني', N'Bruneian', N'بروني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (30, N'BO', N'Bolivia', N'بوليفيا', N'Bolivian', N'بوليفي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (31, N'BR', N'Brazil', N'البرازيل', N'Brazilian', N'برازيلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (32, N'BS', N'Bahamas', N'الباهاماس', N'Bahamian', N'باهاميسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (33, N'BT', N'Bhutan', N'بوتان', N'Bhutanese', N'بوتاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (34, N'BV', N'Bouvet Island', N'جزيرة بوفيه', N'Bouvetian', N'بوفيهي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (35, N'BW', N'Botswana', N'بوتسوانا', N'Botswanan', N'بوتسواني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (36, N'BY', N'Belarus', N'روسيا البيضاء', N'Belarusian', N'روسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (37, N'BZ', N'Belize', N'بيليز', N'Belizean', N'بيليزي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (38, N'CA', N'Canada', N'كندا', N'Canadian', N'كندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (39, N'CC', N'Cocos (Keeling) Islands', N'جزر كوكوس', N'Cocos Islander', N'جزر كوكوس')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (40, N'CF', N'Central African Republic', N'جمهورية أفريقيا الوسطى', N'Central African', N'أفريقي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (41, N'CG', N'Congo', N'الكونغو', N'Congolese', N'كونغي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (42, N'CH', N'Switzerland', N'سويسرا', N'Swiss', N'سويسري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (43, N'CI', N'Ivory Coast', N'ساحل العاج', N'Ivory Coastian', N'ساحل العاج')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (44, N'CK', N'Cook Islands', N'جزر كوك', N'Cook Islander', N'جزر كوك')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (45, N'CL', N'Chile', N'شيلي', N'Chilean', N'شيلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (46, N'CM', N'Cameroon', N'كاميرون', N'Cameroonian', N'كاميروني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (47, N'CN', N'China', N'الصين', N'Chinese', N'صيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (48, N'CO', N'Colombia', N'كولومبيا', N'Colombian', N'كولومبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (49, N'CR', N'Costa Rica', N'كوستاريكا', N'Costa Rican', N'كوستاريكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (50, N'CU', N'Cuba', N'كوبا', N'Cuban', N'كوبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (51, N'CV', N'Cape Verde', N'الرأس الأخضر', N'Cape Verdean', N'الرأس الأخضر')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (52, N'CW', N'Curaçao', N'كوراساو', N'Curacian', N'كوراساوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (53, N'CX', N'Christmas Island', N'جزيرة عيد الميلاد', N'Christmas Islander', N'جزيرة عيد الميلاد')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (54, N'CY', N'Cyprus', N'قبرص', N'Cypriot', N'قبرصي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (55, N'CZ', N'Czech Republic', N'الجمهورية التشيكية', N'Czech', N'تشيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (56, N'DE', N'Germany', N'ألمانيا', N'German', N'ألماني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (57, N'DJ', N'Djibouti', N'جيبوتي', N'Djiboutian', N'جيبوتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (58, N'DK', N'Denmark', N'الدانمارك', N'Danish', N'دنماركي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (59, N'DM', N'Dominica', N'دومينيكا', N'Dominican', N'دومينيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (60, N'DO', N'Dominican Republic', N'الجمهورية الدومينيكية', N'Dominican', N'دومينيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (61, N'DZ', N'Algeria', N'الجزائر', N'Algerian', N'جزائري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (62, N'EC', N'Ecuador', N'إكوادور', N'Ecuadorian', N'إكوادوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (63, N'EE', N'Estonia', N'استونيا', N'Estonian', N'استوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (64, N'EG', N'Egypt', N'مصر', N'Egyptian', N'مصري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (65, N'EH', N'Western Sahara', N'الصحراء الغربية', N'Sahrawian', N'صحراوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (66, N'ER', N'Eritrea', N'إريتريا', N'Eritrean', N'إريتيري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (67, N'ES', N'Spain', N'إسبانيا', N'Spanish', N'إسباني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (68, N'ET', N'Ethiopia', N'أثيوبيا', N'Ethiopian', N'أثيوبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (69, N'FI', N'Finland', N'فنلندا', N'Finnish', N'فنلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (70, N'FJ', N'Fiji', N'فيجي', N'Fijian', N'فيجي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (71, N'FK', N'Falkland Islands (Malvinas)', N'جزر فوكلاند', N'Falkland Islander', N'فوكلاندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (72, N'FM', N'Micronesia', N'مايكرونيزيا', N'Micronesian', N'مايكرونيزيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (73, N'FO', N'Faroe Islands', N'جزر فارو', N'Faroese', N'جزر فارو')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (74, N'FR', N'France', N'فرنسا', N'French', N'فرنسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (75, N'GA', N'Gabon', N'الغابون', N'Gabonese', N'غابوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (76, N'GB', N'United Kingdom', N'المملكة المتحدة', N'British', N'بريطاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (77, N'GD', N'Grenada', N'غرينادا', N'Grenadian', N'غرينادي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (78, N'GE', N'Georgia', N'جيورجيا', N'Georgian', N'جيورجي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (79, N'GF', N'French Guiana', N'غويانا الفرنسية', N'French Guianese', N'غويانا الفرنسية')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (80, N'GG', N'Guernsey', N'غيرنزي', N'Guernsian', N'غيرنزي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (81, N'GH', N'Ghana', N'غانا', N'Ghanaian', N'غاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (82, N'GI', N'Gibraltar', N'جبل طارق', N'Gibraltar', N'جبل طارق')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (83, N'GL', N'Greenland', N'جرينلاند', N'Greenlandic', N'جرينلاندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (84, N'GM', N'Gambia', N'غامبيا', N'Gambian', N'غامبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (85, N'GN', N'Guinea', N'غينيا', N'Guinean', N'غيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (86, N'GP', N'Guadeloupe', N'جزر جوادلوب', N'Guadeloupe', N'جزر جوادلوب')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (87, N'GQ', N'Equatorial Guinea', N'غينيا الاستوائي', N'Equatorial Guinean', N'غيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (88, N'GR', N'Greece', N'اليونان', N'Greek', N'يوناني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (89, N'GS', N'South Georgia and the South Sandwich', N'المنطقة القطبية الجنوبية', N'South Georgia and the South Sandwich', N'لمنطقة القطبية الجنوبية')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (90, N'GT', N'Guatemala', N'غواتيمال', N'Guatemalan', N'غواتيمالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (91, N'GU', N'Guam', N'جوام', N'Guamanian', N'جوامي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (92, N'GW', N'Guinea-Bissau', N'غينيا-بيساو', N'Guinea-Bissauan', N'غيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (93, N'GY', N'Guyana', N'غيانا', N'Guyanese', N'غياني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (94, N'HK', N'Hong Kong', N'هونغ كونغ', N'Hongkongese', N'هونغ كونغي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (95, N'HM', N'Heard and Mc Donald Islands', N'جزيرة هيرد وجزر ماكدونالد', N'Heard and Mc Donald Islanders', N'جزيرة هيرد وجزر ماكدونالد')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (96, N'HN', N'Honduras', N'هندوراس', N'Honduran', N'هندوراسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (97, N'HR', N'Croatia', N'كرواتيا', N'Croatian', N'كوراتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (98, N'HT', N'Haiti', N'هايتي', N'Haitian', N'هايتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (99, N'HU', N'Hungary', N'المجر', N'Hungarian', N'مجري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (100, N'ID', N'Indonesia', N'أندونيسيا', N'Indonesian', N'أندونيسيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (101, N'IE', N'Ireland', N'إيرلندا', N'Irish', N'إيرلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (102, N'IL', N'Israel', N'إسرائيل', N'Israeli', N'إسرائيلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (103, N'IM', N'Isle of Man', N'جزيرة مان', N'Manx', N'ماني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (104, N'IN', N'India', N'الهند', N'Indian', N'هندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (105, N'IO', N'British Indian Ocean Territory', N'إقليم المحيط الهندي البريطاني', N'British Indian Ocean Territory', N'إقليم المحيط الهندي البريطاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (106, N'IQ', N'Iraq', N'العراق', N'Iraqi', N'عراقي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (107, N'IR', N'Iran', N'إيران', N'Iranian', N'إيراني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (108, N'IS', N'Iceland', N'آيسلندا', N'Icelandic', N'آيسلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (109, N'IT', N'Italy', N'إيطاليا', N'Italian', N'إيطالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (110, N'JE', N'Jersey', N'جيرزي', N'Jersian', N'جيرزي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (111, N'JM', N'Jamaica', N'جمايكا', N'Jamaican', N'جمايكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (112, N'JO', N'Jordan', N'الأردن', N'Jordanian', N'أردني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (113, N'JP', N'Japan', N'اليابان', N'Japanese', N'ياباني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (114, N'KE', N'Kenya', N'كينيا', N'Kenyan', N'كيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (115, N'KG', N'Kyrgyzstan', N'قيرغيزستان', N'Kyrgyzstani', N'قيرغيزستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (116, N'KH', N'Cambodia', N'كمبوديا', N'Cambodian', N'كمبودي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (117, N'KI', N'Kiribati', N'كيريباتي', N'I-Kiribati', N'كيريباتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (118, N'KM', N'Comoros', N'جزر القمر', N'Comorian', N'جزر القمر')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (119, N'KN', N'Saint Kitts and Nevis', N'سانت كيتس ونيفس,', N'Kittitian/Nevisian', N'سانت كيتس ونيفس')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (120, N'KP', N'Korea(North Korea)', N'كوريا الشمالية', N'North Korean', N'كوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (121, N'KR', N'Korea(South Korea)', N'كوريا الجنوبية', N'South Korean', N'كوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (122, N'KW', N'Kuwait', N'الكويت', N'Kuwaiti', N'كويتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (123, N'KY', N'Cayman Islands', N'جزر كايمان', N'Caymanian', N'كايماني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (124, N'KZ', N'Kazakhstan', N'كازاخستان', N'Kazakh', N'كازاخستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (125, N'LA', N'Lao PDR', N'لاوس', N'Laotian', N'لاوسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (126, N'LB', N'Lebanon', N'لبنان', N'Lebanese', N'لبناني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (127, N'LC', N'Saint Pierre and Miquelon', N'سان بيير وميكلون', N'St. Pierre and Miquelon', N'سان بيير وميكلوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (128, N'LI', N'Liechtenstein', N'ليختنشتين', N'Liechtenstein', N'ليختنشتيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (129, N'LK', N'Sri Lanka', N'سريلانكا', N'Sri Lankian', N'سريلانكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (130, N'LR', N'Liberia', N'ليبيريا', N'Liberian', N'ليبيري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (131, N'LS', N'Lesotho', N'ليسوتو', N'Basotho', N'ليوسيتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (132, N'LT', N'Lithuania', N'لتوانيا', N'Lithuanian', N'لتوانيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (133, N'LU', N'Luxembourg', N'لوكسمبورغ', N'Luxembourger', N'لوكسمبورغي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (134, N'LV', N'Latvia', N'لاتفيا', N'Latvian', N'لاتيفي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (135, N'LY', N'Libya', N'ليبيا', N'Libyan', N'ليبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (136, N'MA', N'Morocco', N'المغرب', N'Moroccan', N'مغربي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (137, N'MC', N'Monaco', N'موناكو', N'Monacan', N'مونيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (138, N'MD', N'Moldova', N'مولدافيا', N'Moldovan', N'مولديفي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (139, N'ME', N'Montenegro', N'الجبل الأسود', N'Montenegrin', N'الجبل الأسود')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (140, N'MF', N'Saint Martin (French part)', N'ساينت مارتن فرنسي', N'St. Martian(French)', N'ساينت مارتني فرنسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (141, N'MG', N'Madagascar', N'مدغشقر', N'Malagasy', N'مدغشقري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (142, N'MH', N'Marshall Islands', N'جزر مارشال', N'Marshallese', N'مارشالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (143, N'MK', N'Macedonia', N'مقدونيا', N'Macedonian', N'مقدوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (144, N'ML', N'Mali', N'مالي', N'Malian', N'مالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (145, N'MM', N'Myanmar', N'ميانمار', N'Myanmarian', N'ميانماري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (146, N'MN', N'Mongolia', N'منغوليا', N'Mongolian', N'منغولي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (147, N'MO', N'Macau', N'ماكاو', N'Macanese', N'ماكاوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (148, N'MP', N'Northern Mariana Islands', N'جزر ماريانا الشمالية', N'Northern Marianan', N'ماريني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (149, N'MQ', N'Martinique', N'مارتينيك', N'Martiniquais', N'مارتينيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (150, N'MR', N'Mauritania', N'موريتانيا', N'Mauritanian', N'موريتانيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (151, N'MS', N'Montserrat', N'مونتسيرات', N'Montserratian', N'مونتسيراتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (152, N'MT', N'Malta', N'مالطا', N'Maltese', N'مالطي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (153, N'MU', N'Mauritius', N'موريشيوس', N'Mauritian', N'موريشيوسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (154, N'MV', N'Maldives', N'المالديف', N'Maldivian', N'مالديفي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (155, N'MW', N'Malawi', N'مالاوي', N'Malawian', N'مالاوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (156, N'MX', N'Mexico', N'المكسيك', N'Mexican', N'مكسيكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (157, N'MY', N'Malaysia', N'ماليزيا', N'Malaysian', N'ماليزي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (158, N'MZ', N'Mozambique', N'موزمبيق', N'Mozambican', N'موزمبيقي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (159, N'NA', N'Namibia', N'ناميبيا', N'Namibian', N'ناميبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (160, N'NC', N'New Caledonia', N'كاليدونيا الجديدة', N'New Caledonian', N'كاليدوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (161, N'NE', N'Niger', N'النيجر', N'Nigerien', N'نيجيري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (162, N'NF', N'Norfolk Island', N'جزيرة نورفولك', N'Norfolk Islander', N'نورفوليكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (163, N'NG', N'Nigeria', N'نيجيريا', N'Nigerian', N'نيجيري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (164, N'NI', N'Nicaragua', N'نيكاراجوا', N'Nicaraguan', N'نيكاراجوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (165, N'NL', N'Netherlands', N'هولندا', N'Dutch', N'هولندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (166, N'NO', N'Norway', N'النرويج', N'Norwegian', N'نرويجي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (167, N'NP', N'Nepal', N'نيبال', N'Nepalese', N'نيبالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (168, N'NR', N'Nauru', N'نورو', N'Nauruan', N'نوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (169, N'NU', N'Niue', N'ني', N'Niuean', N'ني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (170, N'NZ', N'New Zealand', N'نيوزيلندا', N'New Zealander', N'نيوزيلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (171, N'OM', N'Oman', N'عمان', N'Omani', N'عماني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (172, N'PA', N'Panama', N'بنما', N'Panamanian', N'بنمي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (173, N'PE', N'Peru', N'بيرو', N'Peruvian', N'بيري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (174, N'PF', N'French Polynesia', N'بولينيزيا الفرنسية', N'French Polynesian', N'بولينيزيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (175, N'PG', N'Papua New Guinea', N'بابوا غينيا الجديدة', N'Papua New Guinean', N'بابوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (176, N'PH', N'Philippines', N'الفليبين', N'Filipino', N'فلبيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (177, N'PK', N'Pakistan', N'باكستان', N'Pakistani', N'باكستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (178, N'PL', N'Poland', N'بولونيا', N'Polish', N'بوليني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (179, N'PN', N'Pitcairn', N'بيتكيرن', N'Pitcairn Islander', N'بيتكيرني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (180, N'PR', N'Puerto Rico', N'بورتو ريكو', N'Puerto Rican', N'بورتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (181, N'PS', N'Palestine', N'فلسطين', N'Palestinian', N'فلسطيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (182, N'PT', N'Portugal', N'البرتغال', N'Portuguese', N'برتغالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (183, N'PW', N'Palau', N'بالاو', N'Palauan', N'بالاوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (184, N'PY', N'Paraguay', N'باراغواي', N'Paraguayan', N'بارغاوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (185, N'QA', N'Qatar', N'قطر', N'Qatari', N'قطري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (186, N'RE', N'Reunion Island', N'ريونيون', N'Reunionese', N'ريونيوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (187, N'RO', N'Romania', N'رومانيا', N'Romanian', N'روماني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (188, N'RS', N'Serbia', N'صربيا', N'Serbian', N'صربي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (189, N'RU', N'Russian', N'روسيا', N'Russian', N'روسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (190, N'RW', N'Rwanda', N'رواندا', N'Rwandan', N'رواندا')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (191, N'SA', N'Saudi Arabia', N'المملكة العربية السعودية', N'Saudi Arabian', N'سعودي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (192, N'SB', N'Solomon Islands', N'جزر سليمان', N'Solomon Island', N'جزر سليمان')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (193, N'SC', N'Seychelles', N'سيشيل', N'Seychellois', N'سيشيلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (194, N'SD', N'Sudan', N'السودان', N'Sudanese', N'سوداني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (195, N'SE', N'Sweden', N'السويد', N'Swedish', N'سويدي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (196, N'SG', N'Singapore', N'سنغافورة', N'Singaporean', N'سنغافوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (197, N'SH', N'Saint Helena', N'سانت هيلانة', N'St. Helenian', N'هيلاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (198, N'SI', N'Slovenia', N'سلوفينيا', N'Slovenian', N'سولفيني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (199, N'SJ', N'Svalbard and Jan Mayen', N'سفالبارد ويان ماين', N'Svalbardian/Jan Mayenian', N'سفالبارد ويان ماين')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (200, N'SK', N'Slovakia', N'سلوفاكيا', N'Slovak', N'سولفاكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (201, N'SL', N'Sierra Leone', N'سيراليون', N'Sierra Leonean', N'سيراليوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (202, N'SM', N'San Marino', N'سان مارينو', N'Sammarinese', N'ماريني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (203, N'SN', N'Senegal', N'السنغال', N'Senegalese', N'سنغالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (204, N'SO', N'Somalia', N'الصومال', N'Somali', N'صومالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (205, N'SR', N'Suriname', N'سورينام', N'Surinamese', N'سورينامي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (206, N'SS', N'South Sudan', N'السودان الجنوبي', N'South Sudanese', N'سوادني جنوبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (207, N'ST', N'Sao Tome and Principe', N'ساو تومي وبرينسيبي', N'Sao Tomean', N'ساو تومي وبرينسيبي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (208, N'SV', N'El Salvador', N'إلسلفادور', N'Salvadoran', N'سلفادوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (209, N'SX', N'Sint Maarten (Dutch part)', N'ساينت مارتن هولندي', N'St. Martian(Dutch)', N'ساينت مارتني هولندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (210, N'SY', N'Syria', N'سوريا', N'Syrian', N'سوري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (211, N'SZ', N'Swaziland', N'سوازيلند', N'Swazi', N'سوازيلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (212, N'TC', N'Turks and Caicos Islands', N'جزر توركس وكايكوس', N'Turks and Caicos Islands', N'جزر توركس وكايكوس')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (213, N'TD', N'Chad', N'تشاد', N'Chadian', N'تشادي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (214, N'TF', N'French Southern and Antarctic Lands', N'أراض فرنسية جنوبية وأنتارتيكية', N'French', N'أراض فرنسية جنوبية وأنتارتيكية')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (215, N'TG', N'Togo', N'توغو', N'Togolese', N'توغي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (216, N'TH', N'Thailand', N'تايلندا', N'Thai', N'تايلندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (217, N'TJ', N'Tajikistan', N'طاجيكستان', N'Tajikistani', N'طاجيكستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (218, N'TK', N'Tokelau', N'توكيلاو', N'Tokelaian', N'توكيلاوي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (219, N'TL', N'Timor-Leste', N'تيمور الشرقية', N'Timor-Lestian', N'تيموري')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (220, N'TM', N'Turkmenistan', N'تركمانستان', N'Turkmen', N'تركمانستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (221, N'TN', N'Tunisia', N'تونس', N'Tunisian', N'تونسي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (222, N'TO', N'Tonga', N'تونغا', N'Tongan', N'تونغي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (223, N'TR', N'Turkey', N'تركيا', N'Turkish', N'تركي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (224, N'TT', N'Trinidad and Tobago', N'ترينيداد وتوباغو', N'Trinidadian/Tobagonian', N'ترينيداد وتوباغو')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (225, N'TV', N'Tuvalu', N'توفالو', N'Tuvaluan', N'توفالي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (226, N'TW', N'Taiwan', N'تايوان', N'Taiwanese', N'تايواني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (227, N'TZ', N'Tanzania', N'تنزانيا', N'Tanzanian', N'تنزانيي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (228, N'UA', N'Ukraine', N'أوكرانيا', N'Ukrainian', N'أوكراني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (229, N'UG', N'Uganda', N'أوغندا', N'Ugandan', N'أوغندي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (230, N'UM', N'US Minor Outlying Islands', N'قائمة الولايات والمناطق الأمريكية', N'US Minor Outlying Islander', N'أمريكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (231, N'US', N'United States', N'الولايات المتحدة', N'American', N'أمريكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (232, N'UY', N'Uruguay', N'أورغواي', N'Uruguayan', N'أورغواي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (233, N'UZ', N'Uzbekistan', N'أوزباكستان', N'Uzbek', N'أوزباكستاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (234, N'VA', N'Vatican City', N'فنزويلا', N'Vatican', N'فاتيكاني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (235, N'VC', N'Saint Vincent and the Grenadines', N'سانت فنسنت وجزر غرينادين', N'Saint Vincent and the Grenadines', N'سانت فنسنت وجزر غرينادين')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (236, N'VE', N'Venezuela', N'فنزويلا', N'Venezuelan', N'فنزويلي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (237, N'VI', N'Virgin Islands (U.S.)', N'الجزر العذراء الأمريكي', N'American Virgin Islander', N'أمريكي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (238, N'VN', N'Vietnam', N'فيتنام', N'Vietnamese', N'فيتنامي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (239, N'VU', N'Vanuatu', N'فانواتو', N'Vanuatuan', N'فانواتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (240, N'WF', N'Wallis and Futuna Islands', N'والس وفوتونا', N'Wallisian/Futunan', N'فوتوني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (241, N'WS', N'Samoa', N'ساموا', N'Samoan', N'ساموي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (242, N'XK', N'Kosovo', N'كوسوفو', N'Kosovar', N'كوسيفي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (243, N'YE', N'Yemen', N'اليمن', N'Yemeni', N'يمني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (244, N'YT', N'Mayotte', N'مايوت', N'Mahoran', N'مايوتي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (245, N'ZA', N'South Africa', N'جنوب أفريقيا', N'South African', N'أفريقي')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (246, N'ZM', N'Zambia', N'زامبيا', N'Zambian', N'زامبياني')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Country_code], [Country_Name_En], [Country_Name_Ar], [Nationality_Name_En], [Nationality_Name_Ar]) VALUES (247, N'ZW', N'Zimbabwe', N'زمبابوي', N'Zimbabwean', N'زمبابوي')
GO
SET IDENTITY_INSERT [dbo].[Nationality] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Process] ON 

GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (7, 23, 1, N'Registration Fees', CAST(0x0000ABE900EE7EE8 AS DateTime), N'8ac7a4c87284f6c901728e6183ff150e', 1000, N'SAR', N'DB', N'000.200.100', N'successfully created checkout', N'5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000', N'2020-06-29 11:29:20+0000', N'A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03', N'A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03', CAST(0x0000ABE900EEE920 AS DateTime), 1, N'7XRV8235IZ-1558081140CU3BR', 0, N'{"id":"8ac7a4a072f0cc0b0172ffd701bd6600","paymentType":"DB","paymentBrand":"VISA","amount":"1000.00","currency":"SAR","descriptor":"0627.2299.1319 Riyadh Elm University","merchantTransactionId":"MSSHZ23XRX-943289611WDOX7","result":{"code":"000.100.112","description":"Request successfully processed in ''Merchant in Connector Test Mode''"},"resultDetails":{"3DSecure.acsEci":"05","ConnectorTxID1":"8ac7a4a072f0cc0b0172ffd701bd6600","connectorId":"8ac7a4a072f0cc0b0172ffd701bd6600","authorizationResponse.stan":"73195","transaction.acquirer.settlementDate":"2020-06-29","transaction.receipt":"018111073195","reconciliationId":"0627.2299.1319","transaction.authorizationCode":"073195","sourceOfFunds.provided.card.issuer":"JPMORGAN CHASE BANK, N.A.","response.acquirerMessage":"Approved","response.acquirerCode":"00"},"card":{"bin":"411111","binCountry":"US","last4Digits":"1111","holder":"cw2","expiryMonth":"05","expiryYear":"2021"},"customer":{"givenName":"Ayman amin Alicustomer.surname=Ayman","email":"ayman@softwarecornerit.com","ip":"95.187.206.127","ipCountry":"SA"},"billing":{"street1":"60 street","city":"Riyadh","state":"RIYADH","postcode":"00000","country":"SA"},"customParameters":{"SHOPPER_EndToEndIdentity":"0b8b7c44dca8313493c3b30c0bca8907b562f2c096c0e4466608a190be378ef6","CTPE_DESCRIPTOR_TEMPLATE":""},"risk":{"score":"100"},"buildNumber":"5710385f2ade2f8ad226ebe463e505def77cf482@2020-06-29 07:32:01 +0000","timestamp":"2020-06-29 11:29:49+0000","ndc":"A4BC4A2383D11687AFAADC7C58B3BDB9.uat01-vm-tx03"}', NULL)
GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (1007, 23, 0, N'Registration Fees', CAST(0x0000ABEB00FCCBA9 AS DateTime), N'', 1000, N'SAR', N'DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'PMV8E23VAF13102808915FK5P', 1, NULL, NULL)
GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (1008, 23, 0, N'Registration Fees', CAST(0x0000ABEB0102BA82 AS DateTime), N'', 1000, N'SAR', N'DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'K4W8S230CJ1133537433WOHHH', 1, NULL, NULL)
GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (1009, 23, 0, N'Registration Fees', CAST(0x0000ABEB010D0D3E AS DateTime), N'', 1000, N'SAR', N'DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'3VGDT23CBS-2085983254PVH9M', 1, NULL, NULL)
GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (1010, 23, 0, N'Registration Fees', CAST(0x0000ABEB0119143B AS DateTime), N'', 1000, N'SAR', N'DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'687MO23IMM-1587887470I0A93', 1, NULL, NULL)
GO
INSERT [dbo].[Payment_Process] ([Payment_Id], [Student_Id], [Payment_IsPaid], [Comment], [DateCreation], [Send_EntityId], [Send_Amount], [Send_Currency], [Send_PaymentType], [Result_Code], [Result_Description], [Result_BuildNumber], [Result_Timestamp], [Result_Ndc], [Result_Id], [Payment_Date], [Payment_Type_Id], [Payment_Trackingkey], [Payment_URL_IsValid], [Payment_Result_Json], [Payment_SMS_Result]) VALUES (1011, 23, 0, N'Registration Fees', CAST(0x0000ABEB0119816C AS DateTime), N'', 1000, N'SAR', N'DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'DQW86237UY-372196513M13E0', 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Payment_Process] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Type] ON 

GO
INSERT [dbo].[Payment_Type] ([Payment_Type_Id], [Payment_Name_Ar], [Payment_Name_En]) VALUES (1, N'تسجيل', N'Registration')
GO
INSERT [dbo].[Payment_Type] ([Payment_Type_Id], [Payment_Name_Ar], [Payment_Name_En]) VALUES (2, N'دراسة', N'Study')
GO
SET IDENTITY_INSERT [dbo].[Payment_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (1, N'ادارة ملفات الطلاب', N'Manage students', 0, NULL, N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (2, N'عرض الملف', N'View Student File', 11, N'Pages/RegistrationProcess/view.aspx', N'icofont icofont-listing-box', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (3, N'الصلاحيات', N'Permissions', 0, NULL, N'icofont icofont-ui-settings', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (4, N'الصلاحيات', N'Permissions', 3, N'Pages/UserManagment/Permissions.aspx', N'icofont icofont-fix-tools', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (5, N'المجموعات', N'Groups', 3, N'Pages/UserManagment/PermissionGroups.aspx', N'icofont icofont-ui-user-group', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (6, N'قائمة الطلاب', N'Students List', 1, N'Pages/RegistrationProcess/ListView.aspx', N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (7, N'اعدادات القوائم', N'Lookup Forms', 19, N'Pages/Setting/', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (8, N'الكليات', N'Collage', 7, N'Pages/Setting/FormCollege.aspx', N'icofont icofont-university', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (9, N'المصادر', N'Resource', 7, N'Pages/Setting/FormResource.aspx', N'icofont icofont-ui-social-link', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (10, N'التخصصات', N'Specialization', 7, N'Pages/Setting/FormSpecialization.aspx', N'icofont icofont-notebook', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (11, N'بعض الصفحات', N'SomePage', 19, N'', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (12, N'بيانات الطالب', N'Students Data', 1, N'Pages/RegistrationProcess/StudentInfo.aspx', N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (13, N'حذف طالب', N'Delete Student', 11, N'Pages/RegistrationProcess/DeleteStudent.ashx', N'icofont icofont-delete-alt', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (14, N'ادارة الموظفين', N'Employees Managment', 0, NULL, N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (15, N'الصفحة الشخصية', N'My Profile', 14, N'Pages/UserManagment/Profile.aspx', N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (16, N'الموظفين', N'Employees', 14, N'Pages/UserManagment/Employees.aspx', N'icofont icofont-ui-contact-list', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (17, N'الجنسيات', N'Nationality', 7, N'Pages/Setting/FormNationality.aspx', N'icofont icofont-native-american', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (18, N'سلة المحذوفات', N'Recycle', 1, N'Pages/RegistrationProcess/RestoreStudent.aspx', N'icofont icofont-recycle-alt', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (19, N'مدير النظام', N'Adminstrator', 0, N'', N'icofont icofont-tools-alt-2', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (20, N'ملف التتبع', N'Log File', 19, N'Pages/Admin/LogFile.aspx', N'icofont icofont-frog-tracks', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (21, N'اللغة', N'Language', 19, N'Pages/Admin/Language.aspx', N'icofont icofont-flag', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (22, N'نشاطاتي', N'My Activity', 14, N'Pages/UserManagment/MyNotifications.aspx', N'icofont icofont-notification', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (23, N'كل الملفات', N'All Student Files', 1, N'Pages/RegistrationProcess/AllRecords.aspx', N'icofont icofont-history', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (24, N'لوحة المعلومات', N'Control Panel', 1, N'default.aspx', N'icofont icofont-listing-box', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (25, N'الإتصال', N'Contact', 0, N'Pages/Contact', N'icofont icofont-ui-contact-list', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (26, N'قائمة الإتصال', N'Contact List', 25, N'Pages/Contact/ListContact.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (27, N'عرض معلومات الإتصال', N'View Contact  Info', 11, N'Pages/Contact/ViewContact.aspx', N'icofont icofont-contacts', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (28, N'تسجيل دخول', N'Login', 11, N'Pages/Auth/Login.aspx', N'icofont icofont-login', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (29, N'تعليق النظام', N'Lock Screen', 11, N'Pages/Auth/LockScreen.aspx', N'icofont icofont-lock', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (30, N'استعادة كلمة السر', N'Reset Password', 11, N'Pages/Auth/ResetPassword.aspx', N'icofont icofont-cloud-refresh', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (31, N'معلومات اخرى', N'Other Informations', 1, N'Pages/RegistrationProcess/OtherInfo.aspx', N'icofont icofont-info-circle', 1)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1672, 1, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1673, 2, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1674, 6, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1675, 12, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1676, 13, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1677, 14, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1678, 15, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1679, 18, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1680, 22, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1681, 23, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1682, 28, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1683, 29, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1684, 30, 5)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1698, 1, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1699, 2, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1700, 6, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1701, 12, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1702, 13, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1703, 14, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1704, 15, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1705, 18, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1706, 22, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1707, 23, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1708, 28, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1709, 29, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1710, 30, 6)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1741, 1, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1742, 2, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1743, 6, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1744, 7, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1745, 12, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1746, 13, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1747, 14, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1748, 15, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1749, 18, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1750, 22, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1751, 23, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1752, 25, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1753, 26, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1754, 27, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1755, 29, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1756, 28, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1757, 30, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1758, 31, 2)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1759, 1, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1760, 2, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1761, 6, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1762, 7, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1763, 12, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1764, 13, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1765, 14, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1766, 15, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1767, 16, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1768, 18, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1769, 22, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1770, 23, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1771, 25, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1772, 26, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1773, 27, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1774, 29, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1775, 30, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1776, 28, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1777, 31, 3)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1778, 1, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1779, 2, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1780, 6, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1781, 12, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1782, 13, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1783, 14, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1784, 15, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1785, 16, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1786, 18, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1787, 22, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1788, 23, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1789, 31, 4)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1820, 1, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1821, 2, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1822, 3, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1823, 4, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1824, 5, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1825, 6, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1826, 7, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1827, 8, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1828, 9, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1829, 10, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1830, 12, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1831, 13, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1832, 14, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1833, 15, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1834, 16, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1835, 28, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1836, 17, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1837, 18, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1838, 19, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1839, 20, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1840, 21, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1841, 22, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1842, 23, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1843, 24, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1844, 25, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1845, 26, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1846, 27, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1847, 29, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1848, 30, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1849, 31, 1)
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Resource] ON 

GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (1, N'فيس بوك                                                                                             ', N'Facebook')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (2, N'تويتر                                                                                               ', N'Tiweter')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (3, N'انستقرام                                                                                            ', N'Instegram')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (4, N'صديق                                                                                                ', N'Friends')
GO
SET IDENTITY_INSERT [dbo].[Resource] OFF
GO
SET IDENTITY_INSERT [dbo].[Sequence] ON 

GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2265, 1, 5, 23, CAST(0x0000ABEB01190849 AS DateTime), N'')
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2266, 1, 6, 23, CAST(0x0000ABEB0119141A AS DateTime), N'')
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2267, 1, 7, 23, CAST(0x0000ABEB01192397 AS DateTime), N'')
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2268, 1, 6, 23, CAST(0x0000ABEB0119813F AS DateTime), N'')
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2269, 1, 7, 23, CAST(0x0000ABEB01198D09 AS DateTime), N'')
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation], [Note]) VALUES (2270, 1, 19, 23, CAST(0x0000ABEB0119A975 AS DateTime), N'')
GO
SET IDENTITY_INSERT [dbo].[Sequence] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON 

GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (1, N'بكالوريوس طب و جراحه الفم و الأسنان', N'Bachelor of Dental Surgery', 1, N'<p dir="rtl">1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul dir="rtl">
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">80</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي [ على أن ال تقل درجة االختبار التحصيلي عن ) 70</li>
	</ul>
	</li>
</ul>

<p dir="rtl">2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p dir="rtl">3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p dir="rtl">4-&nbsp;أن يكون الئقاً طبياً.</p>

<p dir="rtl">5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'80', N'fa fa-user-md', N'dental-surgery.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">80%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement, provided that the achievement test score is not less than (70).</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'منذ إعتماد هذا البرنامج بموجب موافقة وزير التعليم بالرقم / 32630 وتاريخ 16/1/1426 هـ وقبلت الدفعة الأولى فيه مع بداية الفصل الدراسي الثاني من العام الدراسي 1424 – 1425 .هـ (2003 – 2004 مـ)تتكون الخطة الدراسية للبرنامج من 212 ساعة موزعة على اثنى عشر مستوى دراسي و تستغرق الدراسة ست سنوات بالإضافة لسنة الإمتياز
هو برنامج لمدة ست سنوات في طب الأسنان و يهتم بالحفاظ على صحة الأسنان واللثة ، و الأنسجة المحيطة في الفم. 

 و تماشياً مع النهضة كان لابد من تطوير عملية ووسائل التعليم المختلفة و مواكبة آخر المستجدات في علوم طب الفم و الاسنان. لذلك حرصت جامعة رياض العلم على أن تكون خطة البرنامج مواكبة للتطور العلمي بتقديم منهجاً تعليماً لمختلف المراحل الدراسية في جامعة رياض العلم ويهدف إلى  تعزيزالمهارات العلمية و العملية اللازمة لتحقيق أفضل استخدام للمواد و التقنيات الجديدة.', N'The six-year Bachelor of Dental Surgery Program at Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy is a professional dentistry program where students are involved with clinical procedures from the outset of the program, with an emphasis on the recognition and prevention of oral diseases.
The Department of Dentistry aims towards presenting a program that is stimulating and enjoyable and one that develops skills and attitudes to continue learning after graduation; in other words to become life-long learners.
The curriculum enjoys a balance of problem-based, self-directed, traditional and hands-on learning approaches with early exposure of students to clinical dental practice. The curriculum provides students with a broad dental education that encourages continual professional development and produces graduates that are well-rounded, thinking and mature clinicians.
In today’s exciting and challenging era for dentistry, much of dental disease can be prevented. Although there is now a wide array of techniques to alleviate pain and treat dental disease, there is still that need for further improvements and better ways to prevent and treat these diseases. With this also comes the need to develop new teaching methods for the dental student of today.
At RCDP, we are trying to meet these challenges with undergraduate and postgraduate courses designed to provide both the scientific background and the practical skills needed to make the best use of new materials and put into practice the most up-to-date advances in dentistry. It is RCDP’s goal to provide our dental students with the basic understanding of oral diseases and the skills for applied aspects of their prevention and treatment in order to prepare them to practice dentistry in the 21st Century.
The curriculum is a competency based curriculum. It has been designed and modified over the years to reflect the changing needs of the dental profession and public. The school’s primary mission is patient centered. Our goal is to develop dental practitioners who are able to utilize the basic principles of human biology and human behavior in conjunction with their technical skills in diagnosing, treating, and preventing oral disease. The RCDP graduate should be able to integrate knowledge across disciplines and perform procedures with patient well-being in mind. They should understand the importance of life-long learning to continually improve their knowledge and skill base.
The B.D.S. program, which extends over a six- year period, consists of a series of:

Didactic (lecture and seminar),
Patient simulation (patient simulation clinic, introductory clinical experience, and workshop), and
Clinical (group practice, rotations and Community Service Learning Internship) experiences. These are designed and sequenced to result in the logical development of concepts and skills from simple to advanced procedures. Included in the curriculum is an awareness of research methodology and the search techniques to support Evidence-Based Dentistry. Also included is a sense of community responsibility so that all patients can access needed care.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (2, N'بكالوريوس علوم الصيدلة', N'Bachelor of Pharmacy Science', 2, N'<p dir="rtl">1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul dir="rtl">
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">70</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p dir="rtl">2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p dir="rtl">3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p dir="rtl">4-&nbsp;أن يكون الئقاً طبياً.</p>

<p dir="rtl">5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'70', N'fa fa-eraser', N'Pharmaceutical-Chemistry-1024x630.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">70%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'يتميز خريج برنامج البكالوريوس في علوم الصيدلة بما لدية من خبرات نظرية وعملية, وبقدرته على القيام بدور فعال ضمن الفريق الطب يالعلاجي من حيث العمل في المستشفيات و الصيدليات العامه و الخاصة بالاضافة الى كونه لديه القدرة على العمل في مؤسسات تصنيع الادوية و مراكز البحوث العلمية المهتمة في العلوم الصيدلانية.
 
المقررات التي تقدمها كلية الرياض للصيدلة و العلوم الطبية تهدف إلى تزويد الطلاب بالمعرفة والمهارات اللازمة من اجل الممارسة العملية. هذه المقررات من شأنها تعريف الطلاب على سيناريوهات مختلفة قد يواجهها الطلبة أثناء الممارسة, و يتم ذلك من خلال دراسة حالات, ومناقشات المجموعة، و التدرب في مستشفى اوصيدلية، الخ.
 
كما و يهدف البرنامج إلى تزويد الطلاب بالتعليم الجامعي المتميز مع التركيز على العلوم الصيدلية ودمج المعرفة مع التدريب العملي لتعزيز وتنمية المسار الوظيفي.
 
يمتد برنامج البكالوريوس في علوم الصيدلة لمدة خمس سنوات, السنة الاولى يبدأ فيها الطالب بالمقررات الدراسية الاساسية مثل الرياضيات والعلوم الأساسية (الكيمياء والأحياء والفيزياء). ومع تقدم الطالب في البرنامج سوف يأخذ العديد من المقررات الدراسية المتخصصة في العلوم الصيدلية، بما في ذلك جوانب تصميم الادوية والتوليف، وآلية عمل الدواء، علم العقاقير، وعلم الصيدلة وعلم السموم، ووضع الدواء والصناعات التحويلية.', N'The courses at Riyadh Elm University (REU), Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) under the practice of pharmacy aims to equip the students with the necessary knowledge and skills that will be utilized when they go into hospital or community pharmacy practice. These courses also expose the students to different scenarios that they may encounter during their practice through case studies, small group discussions, hospital and community pharmacy exposures, etc., thus ensuring that they would know how to respond when they face similar settings.
The program aims to provide the students a well-rounded undergraduate education with an emphasis on the pharmaceutical sciences and to integrate knowledge with practical hands-on experience to enhance career path development.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (3, N'بكالوريوس التمريض', N'Bachelor of Nursing', 3, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-stethoscope', N'Nursing-Stethoscope-1.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تقدم جامعة رياض العلم برنامج الدراسة لمدة أربع سنوات والذي يؤدي إلى منح درجة البكالوريوس في التمريض وبرنامج تدريب الامتياز لمدة سنة واحدة (12 شهرا). من أجل التأهل للحصول على درجة البكالوريوس، يجب على الطلبة المسجلين إتمام مهام البرنامج الموصوف بنجاح، التدريب السريري، وغيرها من المتطلبات أثناء برنامج التدريب. ويعد برنامج بكالوريوس التمريض في كليات الرياض لطب الأسنان والصيدلة أحد برامج التدريب المهني المتعددة في الرعاية الصحية التي أقرتها وزارة التعليم العالي والهيئة السعودية للتخصصات الصحية تباعاً.', N'Riyadh Elm University (REU) offers a four-year study program that leads to the award of the degree of Bachelor of Science Nursing and 1 year (12 months) Internship. To be eligible for the award of the degree, an enrolled student must have successfully completed the prescribed course work, clinical training and other requirements during the course of training. Nursing education at Riyadh Elm University (REU) is one of the several health care professional training programs approved by the Ministry of Education and Saudi Commission for Health Specialties respectively.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (4, N'بكالوريوس مساعد طبيب الأسنان', N'Bachelor of Dental Assisting', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-medkit', N'dental-assistant.png', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'برنامج بكالوريوس مساعد طبيب أسنان سيزود الطالب بالمواصفات و العلوم الأساسية لمساعد طبيب الاسنان. و يشمل هذا البرنامج تدريبا مهنيا يهدف الى تحسين و رفع أداء جودة رعاية المرضى, بالإضافة إلى مجموعة متنوعة وواسعة من المهام المكتبية ومهام مختبرات الأسنان.
 
احد اهم و ابرز أدوار مساعد طبيب الاسنان هو مساعدة المرضى كي يشعروا بالراحة و تخفيف حدة القلق لديهم خلال جميع مراحل إجراءات العلاج.
 
في جامعة رياض العلم, طلبة برنامج مساعد طبيب أسنان يتم تدريبهم على تقديم المساعد السريرية حيث يقوم مساعد طبيب الأسنان بالعمل مباشرة مع طبيب الأسنان على إجراءات تجري في فم المريض. إضافة الى ذلك يتم تدريبهم على كيفية استخدام الأشعة ومواد طب الأسنان. ويشمل برنامج التدريب عدد من المهام الإدارية مثل(إدارة السجلات المالية، وملء استمارات التأمين وجدولة المرضى). و يضمن هذا البرنامج تأهيل مساعد طبيب الاسنان للحصول على شهادة وطنية، قيمة لصاحب العمل وللمشاركة في عضوية الجهات المناسبة.
 
تم أعتماد برنامج مساعد طبيب الاسنان بموجب موافقة وزارة التعليم العالي بتاريخ 1/1/1429هجري و هو مخصص للطالبات فقط. تتكون الخطة الدراسية لهذا البرنامج من 140 ساعة معتمدة و موزعة على ثمانية مستويات دراسية تستغرق أربع سنوات و يضاف لها سنة الامتياز.', N'A dental assistant education will provide the essential characteristics of a great dental assistant.
The dental assistant’s most important role is to help patients feel comfortable as he/she strives to reduce their anxiety through all stages of dental procedures.
In Riyadh Elm University, students who would be dental assistants are trained in chair side assisting, four-handed dentistry, radiology, and the use of dental materials. Dental assistant training in Riyadh Elm University includes areas of study such as administrative tasks (managing financial records, completing insurance forms, and scheduling patients), The dental assistant education program includes practical instruction or supervised training in a dental clinic.
Dental assistant education in Riyadh Elm University prepares the students for these tasks and a successful career.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (14, N'بكالوريوس تقنية الأسنان', N'Bachelor of Dental Laboratory Technology', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-stethoscope', N'iStock.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'طالب تقنية الأسنان في جامعة رياض العلم يتعلم كل المهارات التقنية اللازمة للعمل مع القوالب والمعادن وغيرها من المواد لعمل تركيبات مخصصة. ويتعلم الطلاب كيفية تركيب وإصلاح أجهزة تقويم الأسنان، التيجان ,الجسور وأطقم الأسنان الكاملة، وأطقم الأسنان الجزئية، وغيرها.
 
كما يتعلم الطالب/الطالبة كيفية تعبئة الطلبات من أطباء الأسنان لمجموعة متنوعة من أجهزة طب الأسنان. ويتم تدريبهم على كيفية استخدام الإرشادات التفصيلية المكتوبة وقوالب اسنان المرضى و كيفية التعامل مع الأنسجة الرخوة في الفم', N'A Dental Technology student in Riyadh Elm University learns all the technical skills necessary to work with molds, metals, and other materials to create customized fixtures for the perfect fit. Students learn how to make and repair orthodontic appliances, crowns and bridges, complete dentures, partial dentures, and other dental appliances.
They also learn how to fill orders from dentists for a variety of dental appliances. They are trained how to use the dentists’ detailed written directions and molds of the patient’s teeth or oral soft tissues and therefrom, how to make the following items:', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (15, N'بكالوريوس صحة الفم والأسنان', N'Bachelor in Oral and Dental Health', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-university', N'dentalhygiene.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تم اعتماد هذا البرنامج بموجب موافقة وزارة التعليم العالي بتاريخ 25/7/ 1427هجري و قبلت اول دفعة من الطالبات مع بداية الفصل الدراسي من العام الدراسي 2005-2006م.


تتكون الخطة الدراسية لهذا البرنامج من 124 ساعة معتمدة و موزعة عل ثماني مستويات دراسية تستغرق اربع سنوات و يضاف لها سنة الإمتياز. البرنامج يدمج التعليم النظري والتدريب التجريبي والممارسة السريرية لإعداد الطلاب للعمل مع طبيب الأسنان وفريق طب الأسنان لعلاج جميع أنواع المرضى. صحة الأسنان تعمل جنبا إلى جنب مع أطباء الأسنان لمنع وتشخيص وعلاج أمراض الفم.', N'The Riyadh Elm University program has established a (48) – month program of studies leading to a bachelor of science degree in dental hygiene. This four year (8 Semesters).
The program integrates education, experiential learning and clinical practice to prepare the students to work with the dentist and the dental team to treat all kinds of patients. Dental hygienists work hand in hand with dentists to prevent, diagnose and treat oral diseases.
Students of the dental hygiene program are trained to provide quality dental hygiene care, in general. They are trained to assess, plan, implement and evaluate dental hygiene services for individual patients and community oral health programs; develop patient counseling programs to encourage disease prevention and good oral health; and provide prescribed clinical patient care for patients of all ages and backgrounds, including those with special needs.
They are also expected to continuously improve and enhance their professional development and face the challenges of the dental hygiene profession.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (16, N'بكالوريوس المختبرات الإكلينيكية', N'Bachelor of Clinical Laboratory', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-flask', N'biotech.jpeg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'تم اعتماد هذا البرنامج بموجب موافقة وزارة التعليم العالي بتاريخ 8/5/1426هجري وهو مخصص للطالبات فقط و قد قبلت اول دفعة من الطالبات في الفصل الاول من العام الدراسي 2005-2006م.
تتكون الخطة الدراسية لهذا البرنامج من 132 ساعة معتمدة وموزعة على ثمانية مستويات دراسية تستغرق اربع سنوات و يضاف لها سنة امتياز للتدريب في المعامل و المختبرات الطبية. وتشمل الخطة الدراسية لهذا البرنامج مجموعة من المواد المتخصصة مثل الكيمياء والعلوم البيولوجية وعلم الأحياء المجهرية، والرياضيات، والإحصاء، وكذلك مقررات متخصصة مكرسة للعلوم والمهارات المستخدمة في المختبرات الطبية.', N'Graduates of the Riyadh Elm University’s Clinical Laboratory Sciences program emerge with the knowledge and skills necessary for a successful career in the field. Bachelor’s degree programs in clinical laboratory sciences include courses in chemistry, biological sciences, microbiology, mathematics, and statistics, as well as specialized courses devoted to knowledge and skills used in the clinical laboratory.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (17, N'إدارة الخدمات الصحية والمستشفيات', N'Health Services and Hospitals Department', 4, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">65</span> ) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'65', N'fa fa-hospital-o', N'blue-and-silver.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">65%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (18, N'بكالوريوس الحاسب الآلي', N'Bachelor of Computer', 6, N'<p>1-&nbsp;أن يكون الطالب/الطالبة حاصل على شهادة الثانوية العامة أو ما يعادلها من داخل المملكة أو من خارجها واختبار القدرات والتحصيلي وفق النسب التالية: -</p>

<ul>
	<li>أن ال تقل النسبة الموزونة عن ) <span style="color:#2980b9">70</span>&nbsp;) % موزعة على النحو التالي:

	<ul>
		<li>) 30 ) % ثانوية عامة.</li>
		<li>) 30 ) % قدرات</li>
		<li>) 40 ) % تحصيلي</li>
	</ul>
	</li>
</ul>

<p>2-&nbsp;أن يكون حسن السيرة والسلوك.</p>

<p>3-&nbsp;أن يجتاز بنجاح امتحانات القبول المشتملة على اللغة اإلنجليزية والمقابلة الشخصية واالمتحان العملي.</p>

<p>4-&nbsp;أن يكون الئقاً طبياً.</p>

<p>5-&nbsp;أن ال يكون مفصوالً من جامعة أو كلية أخرى ألسباب تأديبية</p>
', N'30', N'30', N'40', N'70', N'fa fa-desktop', N'christopher-gower.jpg', N'<p>1- The male / female student must have a high school diploma or equivalent from within The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:</p>

<p>The weighted percentage should not be less than (<span style="color:#2980b9">70%</span>) distributed as follows:</p>

<ul>
	<li>(30%) of high school.</li>
	<li>(30%) capabilities.</li>
	<li>(40%) achievement.</li>
</ul>

<p>2- To be of good conduct and behavior.</p>

<p>3- He has successfully passed the entrance exams, which include English and a personal interview And the practical exam.</p>

<p>4- To be medically fit.</p>

<p>5- He must not be dismissed from any other university or college for disciplinary reasons.</p>
', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (19, N' شهادة الاختصاص السعودي في برنامج طب الأسنان الترميمي', N'The Saudi Specialty Certificate in Restorative Dentistry Program', 5, N'', N'30', N'30', N'40', N'150', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في طب الأسنان الترميمي هو برنامج للتعليم المتقدم في طب الأسنان الترميمي, بدأ في أكتوبر 1999, وهو برنامج مصمم لتوفير التعليم المتخصص التدريبي والسريري لرفع مستوى مهنة طب الأسنان في المملكة العربية السعودية. يقدم برنامج البورد السعودي SBARD التعليمات, المعرفة, والخبرات المتقدمة لغاية تجهيز اطباء اسنان على درجة عالية من الكفاءة في مجال طب الأسنان الترميمي، حشو الأسنان والتركيبات الثابتة.', N'The Saudi Specialty Certificate in Restorative Dentistry [SSC-(Dent) Resto] former SBARD is an advanced education program in restorative dentistry started October 1999 designed to provide didactic, clinical and hospital training to upgrade the level of dental profession in Saudi Arabia. The instruction and experience provided in SBARD prepare residents to be highly qualified restorative dentists who are able to treat complex restorative cases of the following disciplines; Restorative dentistry, Endodontics and Fixed Prosthodontics.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (20, N'شهادة الاختصاص السعودي في برنامج الاستعاضة السنية', N'The Saudi Specialty Certificate in Prosthodontics Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في الاستعاضة السنية هو عبارة عن برنامج تدريب لمدة أربع سنوات ويقدم التدريب التعليمي السريري والمختبري في مجال التعويضات السنية. يقدم برنامج البورد السعودي SBARD التعليمات, المعرفة, والخبرات المتقدمة لغاية تجهيز اطباء اسنان على درجة عالية من الكفاءة في توفير هذه الرعاية التعويضية المثلى للمجتمع.', N'The Saudi Specialty Certificate in Prosthodontics (SSC-Dent (Prosth) program is a four-year training program that offers didactic, clinical and laboratory training in the field of prosthodontics. As the adult population in the Kingdom of Saudi Arabia increases, there will be a proportional increase in need for high quality trained Prosthodontists becomes evident. Graduates of the Saudi Specialty Certificate in Prosthodontics (SSC-Dent (Prosth) program will contribute in providing such optimal prosthodontic care.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (21, N'شهادة الاختصاص السعودي في برنامج اللبية', N'The Saudi Specialty Certificate in Endodontic Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في علاج الجذور و عصب الاسنان هو فرع من فروع طب الأسنان يعنى بمورفولوجيا، فسيولوجيا، والخواص الباثولوجية للب السني البشري والأنسجة المحيطه بالجذر. كما و يشمل الدراسة و التدريب على العلوم الإكلينيكية الأساسية بما في ذلك بيولوجيا اللب العادي، والأسباب المرضية والتشخيص والوقاية والعلاج من الأمراض والإصابات.
 
يمتد البرنامج لمدة أربع سنوات، وقد تم تصميمه لتلبية احتياجات الذين يرغبون في اكتساب المزيد من المهارات والمعرفة والخبرة في علاج الجذور الإكلينيكية، فضلا عن خلفية في العلوم البيولوجية. ويتضمن البرنامج مشاركة فاعلة في المحاضرات والندوات والكتب.', N'The Saudi Specialty Certificate in Endodontics [SSC-(Dent) Endo] is the branch of dentistry, which is concerned with the morphology, physiology, and pathology of the human dental pulp and periradicular tissues. Its studies and practice encompass the basic clinical sciences, including biology of the normal pulp, the etiology, diagnosis, prevention and treatment of diseases and injuries of the pulp and associated periradicular conditions. The program extends for four years and it has been designed to satisfy the needs for those who wish to acquire greater skill, knowledge, and experience in clinical Endodontics, as well as a background in biological sciences. The program includes participation in formal lectures, seminars, book and literature reviews.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (22, N'شهادة الاختصاص السعودي في برنامج اللثة', N'The Saudi Specialty Certificate in Periodontics Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في برنامج اللثة هو برنامج لمدة أربع سنوات يهدف إلى تلبية احتياجات أولئك الذين يرغبون في اكتساب مهارات عالية ومعرفة وخبرة في علوم اللثة, فضلا عن خلفية في العلوم البيولوجية. سيتم تقديم تدريب متقدم في impantology، الجراحة التجميلية للثة، الجراحة الترميمية للثة. يتم إنجاز الأهداف التعليمية من خلال المحاضرات والندوات والعروض التعليمية, والمؤتمرات والممارسة السريرية.', N'The Saudi Specialty Certificate in Periodontics [SSC-Dent (Perio)] Program is a four year program designed to satisfy the needs of those who wish to acquire high skills, knowledge and experience in clinical Periodontics, as well as a background in biological sciences. Significant training will be given in impantology, periodontal plastic surgery, oral reconstructive surgery, and periodontal medicine. Educational objectives are accomplished through lectures, seminars, case presentation, conferences and clinical practice.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (23, N'برنامج شهادة الاختصاص السعودي في تقويم الأسنان', N'The Saudi Specialty Certificate Program in Orthodontics', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'برنامج شهادة الاختصاص السعودي في تقويم الأسنان هو برنامج للتدريب السريري لمدة 5 سنوات في مجال تقويم الأسنان. وتم الموافقة عليه من قبل الهيئة السعودية للتخصصات الصحية (SCHS). حيث ان المرشحين الذين يتم قبولهم في البرنامج ينالون تدريبا تعليما وسريريا مكثفا في تقويم الأسنان.', N'The Saudi Specialty Certificate Program in Orthodontics (SSCPO) is a 5-year clinical training program in the field of orthodontics approved by the Saudi Commission for Health Specialties (SCHS). Candidates who are accepted into the program undergo intensive didactic and clinical orthodontic training.', 1000, 90000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En], [Specialization_Registeration_Payment], [Specialization_Study_Payment], [Specialization_Suspend], [Specialization_Study_Payment_Semester], [Specialization_Study_Payment_Contract], [Specialization_Study_Payment_Equation]) VALUES (24, N'شهادة الاختصاص السعودي في برنامج طب اسنان الأطفال', N'The Saudi Specialty Certificate in Pediatric Dentistry Program', 5, N'', N'30', N'30', N'40', N'100', N'fa fa-stethoscope', NULL, N'', N'شهادة الاختصاص السعودي في طب أسنان الأطفال هو برنامج لمدة أربع سنوات مصمم لتلبية المعايير التعليمية وفقا للهيئة السعودية للتخصصات الصحية. عند الانتهاء من البرنامج، يحصل المقيم على شهادة الاختصاص السعودي في طب أسنان الأطفال.
 
ويتضمن البرنامج تدريبا سريريا مكثفا في طب أسنان الأطفال, ويشمل توفير الرعاية الصحية الأولية والشاملة لمرضى أسنان الأطفال من الرضع والأطفال والمراهقين وللمرضى من ذوي الاحتياجات الخاصة. وبالإضافة إلى ذلك، يشمل التشخيص والعلاج من مشاكل الإطباق في الأسنان. يتم تحقيق اهداف البرنامج من خلال المحاضرات والندوات والعروض التعليمية, والمؤتمرات والممارسة السريرية.', N'The Saudi Specialty Certificate in Pediatric Dentistry is a four years program designed to meet the educational standards of the Saudi Commission for Health Specialties. Upon completion of the program, the resident receives a Saudi Specialty Certificate in Pediatric Dentistry.
The Program involves intensive clinical training in Pediatric Dentistry which includes providing primary and comprehensive dental care for pediatric patients from infant, child, adolescents and for patients with special needs. In addition, it includes diagnosis and treatment of occlusal problems in the primary, mixed and young permanent dentition. The program will also include Pediatric Dentistry literature review and basic sciences.', 1000, 90000, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Specialization] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1, 1, N'جديدة', N'New', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (2, 2, N'قيد الانتظار', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (3, 3, N'مخصصة', N'Assigned', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (4, 4, N'غير مكتملة', N'Not Complete', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (5, 5, N'مكتملة البيانات', N'Data Completed', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (6, 6, N'جاهز للدفع (التسجيل)', N'Ready to pay (Registration)', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (7, 7, N'تم الدفع (التسجيل)', N'Paid (Registration)', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (8, 8, N'حجز موعد', N'Appointment Booking', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (9, 9, N'فشل في الامتحان', N'Failure in Exam', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (10, 10, N'نجح في الامتحان', N'Successful in Exam', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (11, 11, N'جاهز للدفع (الدراسة)', N'Ready to pay (study)', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (12, 12, N'تم الدفع (الدراسة)', N'Paid (study)', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (13, 13, N'اصدار الرقم الجامعي', N'Issuance University ID', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (14, 14, N'اكتمال الملف بنجاح', N'File Completed Successfully', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (15, 15, N'اكتمال الملف بالفشل', N'File Completed with Failure', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (16, 16, N'اكمال ملفات العقد', N'Complete Contract Files', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (17, 17, N'تم تكملة الملف', N'Files Contract Completed', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (18, 18, N'مرحلة العقد', N'Contract Stage', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (19, 19, N'معادلة الشهادة', N'Certificate Equation', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1016, 20, N'تم معادلة الشهادة', N'Certificate Equation Completed', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([Student_Id], [Student_SSN], [Student_Name_En], [Student_Name_Ar], [Student_Address], [Student_Phone], [Student_Email], [Student_High_School_Degree], [Student_Capabilities_Degree], [Student_My_Achievement_Degree], [Student_CreationDate], [Student_Employee_Id], [Student_Assign_Date], [Student_Image_Profile], [Student_Specialization_Id], [Student_Nationality_Id], [Student_Resource_Id], [Student_Status_Id], [Student_Total], [Suspended], [Notes], [Student_URL_Video], [Student_Type_Id]) VALUES (23, N'1234567895', N'Ayman amin Ali', N'ايمن امين علي', N'السودان الخرطوم ، بحري ، الحاج يوسف ، شارع واحد ، محطة 24', N'0550932548', N'ayman@softwarecornerit.com', N'100', N'100', N'99', CAST(0x0000ABE900000000 AS DateTime), 1, NULL, N'Profile.JPG', 18, 194, 1, 19, N'99.6', 0, N'Meeting Date:  Meeting Time: ', N'', 2)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Student_Other_Info] ON 

GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 6/29/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABE900EE5EED AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (2, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=7XRV8235IZ-1558081140CU3BR <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 6/29/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABE900EE8252 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (3, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=7XRV8235IZ-1558081140CU3BR', CAST(0x0000ABE900EE82F9 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1002, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 15:57<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00D502BB AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1003, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23

Meeting Date: 2020-07-02 Meeting Time: 15:57

Please Check Your Email.', CAST(0x0000ABEB00D5034B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1004, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Not Complete stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00D97E2B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1005, 23, N'E-mail', N' <Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Please complete the missing data in your file as soon as posible Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23 <br /> <Strong>Current Status:</Strong> Not Complete <br /> <Strong>Note:</Strong>  <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00D981A1 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1006, 23, N'SMS', N'Dear Ayman amin Ali
Please complete the missing data in your file as soon as posible Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23

Please Check Your Email', CAST(0x0000ABEB00D9820F AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1007, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00D98EB7 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1008, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Complete Contract Files stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DA6E36 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1009, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DB0DBC AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1010, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DB3302 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1011, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DBB0AA AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1012, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DBD635 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1013, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00DBE2B8 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1014, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FC4FE2 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1015, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=PMV8E23VAF13102808915FK5P <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FCCEFA AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1016, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=PMV8E23VAF13102808915FK5P', CAST(0x0000ABEB00FCCF8C AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1017, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FCDB2C AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1018, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 17:23<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FCF2CD AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1019, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23

Meeting Date: 2020-07-02 Meeting Time: 17:23

Please Check Your Email.', CAST(0x0000ABEB00FCF33E AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1020, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FCFCFC AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1021, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Complete Contract Files stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE0C90 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1022, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE4E48 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1023, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE6FF8 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1024, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE7DDD AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1025, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE87DB AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1026, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB00FE9281 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1027, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0102B52F AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1028, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=K4W8S230CJ1133537433WOHHH <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0102BD93 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1029, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=K4W8S230CJ1133537433WOHHH', CAST(0x0000ABEB0102BE6B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1030, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0102C692 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1031, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 17:42<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0102EC3B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1032, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23

Meeting Date: 2020-07-02 Meeting Time: 17:42

Please Check Your Email.', CAST(0x0000ABEB0102ECA8 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1033, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010316D5 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1034, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23<br /> 1- صورة من شهادة الثانوية
2- صورة من الجنسية 
3- صورة من البطاقة الشخصية<br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB01034D0B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1035, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB01040C11 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1036, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23<br /> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB01045D1C AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1037, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to upload the required files Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23

Please Check Your Email.', CAST(0x0000ABEB010472ED AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1038, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0104A55F AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1039, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0104B89F AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1040, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D029E AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1041, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=3VGDT23CBS-2085983254PVH9M <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D1089 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1042, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=3VGDT23CBS-2085983254PVH9M', CAST(0x0000ABEB010D10F5 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1043, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D19E7 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1044, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Appointment Booking stage </Strong> <br /><Strong>Meeting Date:</Strong> 2020-07-02<br /><Strong>Meeting Timme:</Strong> 18:19<br /><Strong>URL Meeting:</Strong> http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D3678 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1045, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to attend the exam Link:http://localhost:10600/Pages/RegistrationProcess/view.aspx?StudentID=23

Meeting Date: 2020-07-02 Meeting Time: 18:19

Please Check Your Email.', CAST(0x0000ABEB010D36E5 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1046, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Successful in Exam stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D4160 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1047, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> http://localhost:10600/StudentSubmitting.aspx?Student_Id=23<br /> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D5931 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1048, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to upload the required files Link:http://localhost:10600/StudentSubmitting.aspx?Student_Id=23

Please Check Your Email.', CAST(0x0000ABEB010D599B AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1049, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Files Contract Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D67A0 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1050, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Contract Stage stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D73AC AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1051, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (study) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010D9C15 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1052, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Issuance University ID stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010DAAAA AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1053, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the File Completed Successfully stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB010DB5AC AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1054, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Data Completed stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB01190D0D AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1055, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=687MO23IMM-1587887470I0A93 <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB01191776 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1056, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=687MO23IMM-1587887470I0A93', CAST(0x0000ABEB01191828 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1057, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB011926F3 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1058, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>Now you can pay the fees of Registration: </Strong> http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=DQW86237UY-372196513M13E0 <br /> <Strong>Current Status:</Strong> Ready to pay (Registration) <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB011984C4 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1059, 23, N'SMS', N'Dear Ayman amin Ali

Now you can pay the fees of Registration

Please use this link: http://localhost:10600/Payment/PaymentProcessDetails.aspx?Trackingkey=DQW86237UY-372196513M13E0', CAST(0x0000ABEB01198574 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1060, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Paid (Registration) stage </Strong> <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0119900A AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1061, 23, N'E-mail', N'<Strong style=''font-size:18;''>Dear Ayman amin Ali</Strong><br /><br /><Strong>TrackId : </Strong>  23 <br /> <Strong>Your file has now reached the Certificate Equation stage </Strong> <br /><Strong>Meeting Date:</Strong> <br /><Strong>Meeting Timme:</Strong> <br /><Strong>URL Meeting:</Strong> <br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM <br /> <Strong>Date:</Strong> 7/1/2020<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ', CAST(0x0000ABEB0119AC85 AS DateTime), N'')
GO
INSERT [dbo].[Student_Other_Info] ([Id], [Student_Id], [MessageType], [Message], [DateCreation], [Note]) VALUES (1062, 23, N'SMS', N'Dear Ayman amin Ali

Use the link that sent with the message to attend the exam Link:

Meeting Date:  Meeting Time: 

Please Check Your Email.', CAST(0x0000ABEB0119ACF5 AS DateTime), N'')
GO
SET IDENTITY_INSERT [dbo].[Student_Other_Info] OFF
GO
SET IDENTITY_INSERT [dbo].[Student_Type] ON 

GO
INSERT [dbo].[Student_Type] ([Student_Type_Id], [Student_Type_Name_Ar], [Student_Type_Name_En]) VALUES (1, N'جديد', N'New')
GO
INSERT [dbo].[Student_Type] ([Student_Type_Id], [Student_Type_Name_Ar], [Student_Type_Name_En]) VALUES (2, N'تجسير', N'Tajseer')
GO
INSERT [dbo].[Student_Type] ([Student_Type_Id], [Student_Type_Name_Ar], [Student_Type_Name_En]) VALUES (3, N'محول', N'Mohawl')
GO
SET IDENTITY_INSERT [dbo].[Student_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[VISA_MADA] ON 

GO
INSERT [dbo].[VISA_MADA] ([VISA_MADA_Id], [PaymentProcess_Id], [Trackingkey], [UUID], [Result_JSON], [DateCreation]) VALUES (1, 7, N'7XRV8235IZ-1558081140CU3BR', N'MSSHZ23XRX-943289611WDOX7', N'', CAST(0x0000ABE900EEC44D AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VISA_MADA] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Student__E5578F5802305CC1]    Script Date: 7/1/2020 5:25:26 PM ******/
ALTER TABLE [dbo].[Student] ADD UNIQUE NONCLUSTERED 
(
	[Student_SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5A4F643B]  DEFAULT ('') FOR [Country_code]
GO
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5B438874]  DEFAULT ('') FOR [Country_Name_En]
GO
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5C37ACAD]  DEFAULT ('') FOR [Country_Name_Ar]
GO
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5D2BD0E6]  DEFAULT ('') FOR [Nationality_Name_En]
GO
ALTER TABLE [dbo].[Nationality] ADD  CONSTRAINT [DF__countries__count__5E1FF51F]  DEFAULT ('') FOR [Nationality_Name_Ar]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Group]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LanguageMaster] FOREIGN KEY([Language_id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LanguageMaster]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Student]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Group]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Status]
GO
ALTER TABLE [dbo].[Lanuage_Detials]  WITH CHECK ADD  CONSTRAINT [FK_Lanuage_Detials_LanguageMaster] FOREIGN KEY([Language_Master_Id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Lanuage_Detials] CHECK CONSTRAINT [FK_Lanuage_Detials_LanguageMaster]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Employee] FOREIGN KEY([Login_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Employee]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Permission] FOREIGN KEY([Form_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Permission]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_Nationality] FOREIGN KEY([Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_Nationality]
GO
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Employee]
GO
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Notification_Show] FOREIGN KEY([NotificationShow_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Notification_Show]
GO
ALTER TABLE [dbo].[Notification_Master]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Master_Notification_Show] FOREIGN KEY([Notification_Show_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Master] CHECK CONSTRAINT [FK_Notification_Master_Notification_Show]
GO
ALTER TABLE [dbo].[Payment_Process]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Process_Payment_Type] FOREIGN KEY([Payment_Type_Id])
REFERENCES [dbo].[Payment_Type] ([Payment_Type_Id])
GO
ALTER TABLE [dbo].[Payment_Process] CHECK CONSTRAINT [FK_Payment_Process_Payment_Type]
GO
ALTER TABLE [dbo].[Payment_Process]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Study_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Payment_Process] CHECK CONSTRAINT [FK_Payment_Study_Student]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Group]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Permission]
GO
ALTER TABLE [dbo].[Rosom_Request]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Request_Payment_Process] FOREIGN KEY([Payment_Process_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[Rosom_Request] CHECK CONSTRAINT [FK_Rosom_Request_Payment_Process]
GO
ALTER TABLE [dbo].[Rosom_Response]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Response_Payment_Process] FOREIGN KEY([Payment_Process_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[Rosom_Response] CHECK CONSTRAINT [FK_Rosom_Response_Payment_Process]
GO
ALTER TABLE [dbo].[Rosom_Response]  WITH CHECK ADD  CONSTRAINT [FK_Rosom_Response_Rosom_Request] FOREIGN KEY([Rosom_Request_Id])
REFERENCES [dbo].[Rosom_Request] ([Id])
GO
ALTER TABLE [dbo].[Rosom_Response] CHECK CONSTRAINT [FK_Rosom_Response_Rosom_Request]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Employee] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Employee]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Status]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Student]
GO
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_Collage] FOREIGN KEY([Collage_Id])
REFERENCES [dbo].[Collage] ([Collage_ID])
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_Collage]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Employee] FOREIGN KEY([Student_Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Employee]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality] FOREIGN KEY([Student_Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Nationality]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Resource] FOREIGN KEY([Student_Resource_Id])
REFERENCES [dbo].[Resource] ([ResourceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Resource]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([Student_Specialization_Id])
REFERENCES [dbo].[Specialization] ([Specialization_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Status] FOREIGN KEY([Student_Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Status]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student_Type] FOREIGN KEY([Student_Type_Id])
REFERENCES [dbo].[Student_Type] ([Student_Type_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Student_Type]
GO
ALTER TABLE [dbo].[Student_Concat]  WITH CHECK ADD  CONSTRAINT [FK_Student_Concat_Status] FOREIGN KEY([Student_Concat_Status])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Student_Concat] CHECK CONSTRAINT [FK_Student_Concat_Status]
GO
ALTER TABLE [dbo].[Student_Other_Info]  WITH CHECK ADD  CONSTRAINT [FK_Student_Other_Info_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Student_Other_Info] CHECK CONSTRAINT [FK_Student_Other_Info_Student]
GO
ALTER TABLE [dbo].[VISA_MADA]  WITH CHECK ADD  CONSTRAINT [FK_VISA_MADA_Payment_Process] FOREIGN KEY([PaymentProcess_Id])
REFERENCES [dbo].[Payment_Process] ([Payment_Id])
GO
ALTER TABLE [dbo].[VISA_MADA] CHECK CONSTRAINT [FK_VISA_MADA_Payment_Process]
GO
