USE [MyAppDb1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-07-28 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstNames] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[DateofBirth] [datetime2](7) NOT NULL,
	[Mobile] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ProgramsId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[GameDayID] [int] NOT NULL,
	[GameTypeID] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Amount] [float] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[No1] [int] NULL,
	[No2] [int] NULL,
	[No3] [int] NULL,
	[No4] [int] NULL,
	[No5] [int] NULL,
	[No6] [int] NULL,
	[No7] [int] NULL,
	[No8] [int] NULL,
	[No9] [int] NULL,
	[No10] [int] NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ProgramsId] [int] NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerActivation]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerActivation](
	[UserID] [nvarchar](450) NOT NULL,
	[Activation] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CustomerActivation] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Start] [datetime2](7) NOT NULL,
	[End] [datetime2](7) NULL,
	[ThemeColor] [nvarchar](max) NULL,
	[IsFullDay] [bit] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[ProgramsId] [int] NULL,
	[CoursesId] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[FavouriteID] [int] IDENTITY(1,1) NOT NULL,
	[GameDayID] [int] NOT NULL,
	[GameTypeID] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Remarks] [nvarchar](max) NULL,
	[No1] [int] NULL,
	[No2] [int] NULL,
	[No3] [int] NULL,
	[No4] [int] NULL,
	[No5] [int] NULL,
	[No6] [int] NULL,
	[No7] [int] NULL,
	[No8] [int] NULL,
	[No9] [int] NULL,
	[No10] [int] NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[FavouriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameCounts]    Script Date: 2022-07-28 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameCounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GameCounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDays]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[GameDate] [datetime2](7) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GameDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[CloseDate] [datetime2](7) NOT NULL,
	[GameDayId] [int] NULL,
	[GameCountId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[No1] [int] NULL,
	[No2] [int] NULL,
	[No3] [int] NULL,
	[No4] [int] NULL,
	[No5] [int] NULL,
	[No6] [int] NULL,
	[No7] [int] NULL,
	[No8] [int] NULL,
	[No9] [int] NULL,
	[No10] [int] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameTypes]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MiniNumbers] [int] NOT NULL,
	[MaxNumbers] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GameTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderLineID] [int] IDENTITY(1,1) NOT NULL,
	[GameStatusId] [int] NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[GameDayID] [int] NOT NULL,
	[GameTypeID] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[OrderID] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
	[No1] [int] NULL,
	[No2] [int] NULL,
	[No3] [int] NULL,
	[No4] [int] NULL,
	[No5] [int] NULL,
	[No6] [int] NULL,
	[No7] [int] NULL,
	[No8] [int] NULL,
	[No9] [int] NULL,
	[No10] [int] NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[OrderLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NULL,
	[OrderTotal] [decimal](18, 4) NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[GrossTotal] [decimal](18, 4) NOT NULL,
	[InvoiceNumber] [int] NOT NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[PayerFirstName] [nvarchar](max) NULL,
	[PaymentFee] [decimal](18, 4) NOT NULL,
	[BusinessEmail] [nvarchar](max) NULL,
	[PayerEmail] [nvarchar](max) NULL,
	[TxToken] [nvarchar](max) NULL,
	[ReceiverEmail] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[Custom] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureID] [int] IDENTITY(1,1) NOT NULL,
	[GameDayId] [nvarchar](max) NULL,
	[FileName] [nvarchar](255) NULL,
	[isDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[Token] [nvarchar](max) NULL,
	[JwtID] [nvarchar](max) NULL,
	[IsUsed] [bit] NOT NULL,
	[IsRevoked] [bit] NOT NULL,
	[AddedDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 2022-07-28 21:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220727082423_updatedProgramAndCourseTable', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220728101945_UpdatedProgramIdInUsers', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220728124309_AddedEventTable', N'5.0.10')
INSERT [dbo].[AspNetUsers] ([Id], [FirstNames], [LastName], [PasswordSalt], [DateofBirth], [Mobile], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProgramsId]) VALUES (N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'Mukhtiar', N'Lander', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'03433691042', N'mukhtiar.lander@gmail.com', N'MUKHTIAR.LANDER@GMAIL.COM', N'mukhtiar.lander@gmail.com', N'MUKHTIAR.LANDER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKt2quohoqsLQN3u4UhST6sZ01D4qGPDxE7QIIpOV3CIaOjN6gcvJICX0bxmX8BFWQ==', N'572AZAE7JLFEE5YG7TP735N2UWK47AWJ', N'edb11433-ad51-4c8d-8b52-973afd0f90e3', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [FirstNames], [LastName], [PasswordSalt], [DateofBirth], [Mobile], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ProgramsId]) VALUES (N'7115b63b-7062-43df-bc02-19f976dc377f', N'zain', N'chandio', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'03433691042', N'zain@gmail.com', N'ZAIN@GMAIL.COM', N'zain@gmail.com', N'ZAIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEG/OlImqp5sxVmDIdE5GmDeQzeaaR9j0fRc30dhvPgPcbGrAWErK3ksNI1uSUhjPVQ==', N'JV3CCXSGJLODSY37MYPEXINLJCVBBEQB', N'a37e0c3e-ac1f-48ce-ad5f-e22f4fcb070b', NULL, 0, 0, NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Name], [Description], [ProgramsId], [IsActive], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'PHP', N'Preprocessor Hyper Text Course', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [ProgramsId], [IsActive], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Basic Electoric', N'Electronic Subject', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [ProgramsId], [IsActive], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'C#', N'Programing Language', 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay], [UserId], [ProgramsId], [CoursesId]) VALUES (1, N'Teacher1 Basic Electronic Daily', N'BSCS Basic Electronic Teacher1', CAST(N'2022-07-28T18:26:26.5550000' AS DateTime2), CAST(N'2022-07-31T18:26:26.5550000' AS DateTime2), N'Red', 1, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', 1, 1)
INSERT [dbo].[Event] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay], [UserId], [ProgramsId], [CoursesId]) VALUES (2, N'Teacher2 PHP Daily', N'BSCS Basic Electronic Teacher2', CAST(N'2022-07-29T19:26:26.5550000' AS DateTime2), CAST(N'2022-08-05T18:26:26.5550000' AS DateTime2), N'Red', 1, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', 1, 2)
INSERT [dbo].[Event] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay], [UserId], [ProgramsId], [CoursesId]) VALUES (3, N'Teacher3 PHP Daily', N'BSCS Basic Electronic Teacher3', CAST(N'2022-07-30T19:26:26.5550000' AS DateTime2), CAST(N'2022-08-10T18:26:26.5550000' AS DateTime2), N'Red', 1, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', 1, 3)
INSERT [dbo].[Event] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay], [UserId], [ProgramsId], [CoursesId]) VALUES (4, N'Teacher4 C# Daily', N'BSCS Basic Electronic Teacher4', CAST(N'2022-07-31T20:26:26.5550000' AS DateTime2), CAST(N'2022-08-15T18:52:00.0000000' AS DateTime2), NULL, 1, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[Programs] ON 

INSERT [dbo].[Programs] ([Id], [Name], [Description], [IsActive], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'BSCS', N'Bachelor of Computer Science', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Programs] ([Id], [Name], [Description], [IsActive], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'MSCS', N'Masters Of Computer Science', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Programs] OFF
SET IDENTITY_INSERT [dbo].[RefreshTokens] ON 

INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (1, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'SF4RBGE762OEFN3H51WIYG9587QTC3NN9XK723e8d20-2f77-433b-b022-fd0eaef634aa', N'3c004452-9d3d-4bc7-b0c5-1af632888833', 0, 0, CAST(N'2022-07-27T08:59:24.3493886' AS DateTime2), CAST(N'2023-01-27T08:59:24.3494421' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (2, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'FZGO9Q3LR1KPGIGVD3SC95BZKULFKOX31RFf2f8fd2a-ec89-4688-836e-0ff8a5231740', N'50d761da-8eb6-4178-a1da-af8edf258afd', 0, 0, CAST(N'2022-07-27T09:13:10.2141552' AS DateTime2), CAST(N'2023-01-27T09:13:10.2141566' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (3, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'YUREL8N531SBLM2LGW30E040ZHW6C3N90E42e61e261-aeb8-4ace-bcc9-26d3f411b739', N'028be5b0-e2d5-41be-ad00-af0559bced7c', 0, 0, CAST(N'2022-07-27T09:17:26.8698839' AS DateTime2), CAST(N'2023-01-27T09:17:26.8698852' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (4, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'N3DK8UW5G5VU3BBFC96BFMCNF4K2HQ6O68I775921e4-6bca-464c-8ef4-f8c32fcc1103', N'72bac36d-c330-43fa-8d9b-3a21cbafd998', 0, 0, CAST(N'2022-07-27T09:38:05.2927675' AS DateTime2), CAST(N'2023-01-27T09:38:05.2928388' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (5, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'6KD8GN4CB7BWAHJ9H495YWJZ82UUVEUIEO8337afd76-ac89-4e45-a67e-59a345e1c227', N'a9b8d6a2-48c3-4b4a-a1d0-d0762c095619', 0, 0, CAST(N'2022-07-27T10:03:26.3473486' AS DateTime2), CAST(N'2023-01-27T10:03:26.3474000' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (6, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'HF3I7I589STAYIPST8WPCTQDKPABYPDT8WZeb8be6d3-6f6c-4a13-86bf-be8ce6fc060b', N'e9a80e78-9a32-4aa4-8dc7-e8e4dd2e0d67', 0, 0, CAST(N'2022-07-27T10:21:16.4446252' AS DateTime2), CAST(N'2023-01-27T10:21:16.4446976' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (7, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'DSPRB78CYZNJCEFPLTM8DU6OYY1Z20R8ZJN6ff03ed6-a838-4461-a5a2-4c22a516005d', N'aa35785d-7d5f-4f8b-b5a8-6b3a9c0f62fa', 0, 0, CAST(N'2022-07-27T10:52:20.3621576' AS DateTime2), CAST(N'2023-01-27T10:52:20.3622589' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (8, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'ZDU5R506GJ41FUKB6Y5OMJE0LF4BCQMB2CU717e2303-2742-4272-8aec-842788452e9c', N'04826117-b78a-42fc-b046-01d5c3bd6a1f', 0, 0, CAST(N'2022-07-27T11:14:42.9652842' AS DateTime2), CAST(N'2023-01-27T11:14:42.9653305' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (9, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'9C3U9DQHQL690XM6L7QNVVUSTJ7ELIWNJBZd133fee6-99a6-41be-98b2-ab5476f2d48c', N'e83c65bb-9563-4376-8a60-ee131988248d', 0, 0, CAST(N'2022-07-27T11:17:11.5627211' AS DateTime2), CAST(N'2023-01-27T11:17:11.5627830' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (10, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'WN730VNF9I16Z2ADQ4YPIOIGJPLRV9RNEQ2ac113251-492d-4403-b848-678fa89feedd', N'a2c6365c-cad6-4c31-9932-20027b102d47', 0, 0, CAST(N'2022-07-27T11:39:40.5249014' AS DateTime2), CAST(N'2023-01-27T11:39:40.5249829' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (11, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'ADW68UY8Y6SORLT54B66WXGZRRWX036F56G25860349-0d96-415f-8ed4-06633f316ead', N'0ee16142-3cad-4386-8ad4-be452f26a893', 0, 0, CAST(N'2022-07-27T11:48:06.5586066' AS DateTime2), CAST(N'2023-01-27T11:48:06.5586672' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (12, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'CNCZLPLOJ07YMTGSMDEUP1UW2UYFZ0DTN7R141a23e2-8766-438a-a32b-dd2acdd1d327', N'5f6ce878-b43e-41e8-a098-164a96b09eb1', 0, 0, CAST(N'2022-07-27T11:48:49.8996835' AS DateTime2), CAST(N'2023-01-27T11:48:49.8996847' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (13, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'STXY1LAOP39ZN5RLGN284N4WS7NBYR222P35bd05577-18da-4ec0-8dc3-a3ec8b22bb89', N'440e1828-797c-45f5-a05e-2a7341e09b98', 0, 0, CAST(N'2022-07-27T11:52:52.2933829' AS DateTime2), CAST(N'2023-01-27T11:52:52.2933833' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (14, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'5FEMPJODS7NZ81UND5STYEK1RVOZ3JZFLZ4dc0786d3-08a4-4650-925f-ae4f6e84d96e', N'a3fbd7a4-15da-4f8d-8a4c-af7f4dad49c2', 0, 0, CAST(N'2022-07-27T13:16:40.9886895' AS DateTime2), CAST(N'2023-01-27T13:16:40.9887461' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (15, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'LPHB83FAJNU6YVNU15Q3POZTC7GWFTZAKDQ470c5d4b-1920-4441-9021-8b87ff5d36cf', N'6b1fd703-370a-4b0b-8240-aad32c3bd804', 0, 0, CAST(N'2022-07-27T13:34:33.5243435' AS DateTime2), CAST(N'2023-01-27T13:34:33.5244337' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (16, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'J2QVUKUW0WQD0O7AXJ3B4TQVYE3OTF0645U82961e96-6538-4a2d-b3d9-b16206a7a992', N'dc05b78d-61b5-4cee-a5f9-0016374d7572', 0, 0, CAST(N'2022-07-27T16:27:41.3741188' AS DateTime2), CAST(N'2023-01-27T16:27:41.3741633' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (17, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'CSQK1YIH9TURTSM5G1I8LGWVEHIN3LIX2VS14547453-e02d-462c-ba98-a457f760635f', N'af07b8b3-7956-42e5-93f7-3a56a84c8f53', 0, 0, CAST(N'2022-07-27T16:29:24.0506007' AS DateTime2), CAST(N'2023-01-27T16:29:24.0506477' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (18, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'SJ517ZT30RCD9CTW78W8PC123CYW4DWZMQ28e23fa54-ebec-4c41-a040-52e765c7d449', N'b5d69979-665e-4ba5-9da0-5b35446a848a', 0, 0, CAST(N'2022-07-27T17:08:43.8715922' AS DateTime2), CAST(N'2023-01-27T17:08:43.8716824' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (19, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'6152GGCHXZRWA1CA7X95UVN32473YZK21YO4fa37bee-220e-40fb-aa36-7647344e0262', N'1e00e2a6-2d74-4081-b0f2-a6471d426cc0', 0, 0, CAST(N'2022-07-27T17:22:31.1514248' AS DateTime2), CAST(N'2023-01-27T17:22:31.1514727' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (20, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'WNTS32VGEN9E2IPZLD8IQUHIP7PAJ0HXO4247263f72-c92d-45c2-a1b0-05299ebe02bc', N'0b5fb363-70a0-4b24-a409-8baf5f1226d1', 0, 0, CAST(N'2022-07-27T17:31:11.5319236' AS DateTime2), CAST(N'2023-01-27T17:31:11.5319734' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (21, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'H1S8LMXK3671AVEPILE2CPPPJYT22UZQY0I44fcda7d-3867-4844-8100-bb2a3b1778cc', N'0c6bde0f-e286-41c1-b3a3-ebbc4d7ae849', 0, 0, CAST(N'2022-07-28T06:35:31.1455511' AS DateTime2), CAST(N'2023-01-28T06:35:31.1455993' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (22, N'7115b63b-7062-43df-bc02-19f976dc377f', N'2RBU7YYH1G2DJTZU0S4PG8FFHXQ8EH14ZLHc793fa4b-670b-455c-8a29-f7665bfbfa22', N'26f72277-1572-463e-8ac6-55b4038afe21', 0, 0, CAST(N'2022-07-28T10:28:47.1436540' AS DateTime2), CAST(N'2023-01-28T10:28:47.1437415' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (23, N'7115b63b-7062-43df-bc02-19f976dc377f', N'HTSKXH0LBZGFF6TULXHGQVRXXC6OPGU3FL972ad81f5-6134-4484-a74e-8072ae1dac8e', N'daf20da6-0aa8-46f8-8653-e864c9018a08', 0, 0, CAST(N'2022-07-28T10:29:14.7853939' AS DateTime2), CAST(N'2023-01-28T10:29:14.7853943' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (24, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'UYMH9CDE4J6292VG4X2VOZNV6EMDQNDNX62176200c6-2433-49c9-b9a9-7d84b01464aa', N'179d097c-ffc8-4dad-9f21-357113394e2a', 0, 0, CAST(N'2022-07-28T12:46:45.6128476' AS DateTime2), CAST(N'2023-01-28T12:46:45.6129136' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (25, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'DUUA5GJY7HWCQEH2ZYHBREYYW0Z6TE3Y3UOa6e774a9-1b52-4270-83d9-8d2bccbc9df2', N'705edd40-054f-4976-b146-ada3e51746dd', 0, 0, CAST(N'2022-07-28T12:57:50.7380640' AS DateTime2), CAST(N'2023-01-28T12:57:50.7382056' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (26, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'ZGJ6M8QTQUCUVM6QEVMB0A6H5V0UQMQQU6B47b7fa1b-46fc-49b6-87e3-b2fa64fc90ff', N'4cc43beb-8176-4e39-b80d-4fec6e6f004a', 0, 0, CAST(N'2022-07-28T13:02:23.7631983' AS DateTime2), CAST(N'2023-01-28T13:02:23.7632790' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (27, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'HBGDPGG26CRA9WHZW4OVY6A2WAQ9QKOHKAU74c9095d-8b34-4ae4-b911-c486ce69a645', N'5d45a893-3652-4c37-9ad2-02acd5aa2c36', 0, 0, CAST(N'2022-07-28T13:17:13.2245988' AS DateTime2), CAST(N'2023-01-28T13:17:13.2246725' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (28, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'VJSMJPR44GRH3CLDASODWYKQM11VXIDL94M0061c4fc-2dc4-40db-b4f9-c2ac8c2cf28a', N'a36d7853-2bed-4063-8f5c-58e285c53321', 0, 0, CAST(N'2022-07-28T13:51:38.0422183' AS DateTime2), CAST(N'2023-01-28T13:51:38.0423066' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (29, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'ENN9Z69X2HT9P48ZKEY2XDX8LMEN8ZYK4WM6be3ae38-082d-45c0-986b-124bbaae51d5', N'269a56b1-f061-42de-bfc2-33f6efed6991', 0, 0, CAST(N'2022-07-28T14:32:49.8210969' AS DateTime2), CAST(N'2023-01-28T14:32:49.8211457' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (30, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'Q5UCX7G6YYIKQ5RNMPMSKAZ9058FMWHX3J6a158ca82-c27a-45d0-a725-90c35ecc5010', N'acd7e850-9019-4a87-bebe-ed1d13bf40d8', 0, 0, CAST(N'2022-07-28T14:34:33.4707152' AS DateTime2), CAST(N'2023-01-28T14:34:33.4707160' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (31, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'UQ4AQX7P3J17ZWUCY1QCDVNAW2HCM2WB4GTb476fff7-7567-42cf-a929-e703572318bf', N'1a7e6988-41b2-43fb-9dfc-c889e28daf1b', 0, 0, CAST(N'2022-07-28T14:36:18.4664328' AS DateTime2), CAST(N'2023-01-28T14:36:18.4664920' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (32, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'YJKDX8XE05GTBH11287BR13R14RC764TX17f945d6f0-ae75-4f33-bb7a-d9e4848fd3eb', N'd0c9a635-cfcc-4f4c-86dc-4572f5d67b7d', 0, 0, CAST(N'2022-07-28T14:53:35.4792788' AS DateTime2), CAST(N'2023-01-28T14:53:35.4793628' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (33, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'AS4ZMN7PR34BFD9ZQMR57OB38B53BZABQRP78f988b9-a484-4c07-9ff0-e160a1b99051', N'8047b6d7-5601-46e1-b775-5ac250b4bf4f', 0, 0, CAST(N'2022-07-28T15:14:20.9958698' AS DateTime2), CAST(N'2023-01-28T15:14:20.9959449' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [UserID], [Token], [JwtID], [IsUsed], [IsRevoked], [AddedDate], [ExpiryDate]) VALUES (34, N'10a7255d-44ad-476d-8014-06ff5b0f3c01', N'L12ZT7EZCA0XJDK90XZ80CQE54583OSGAOKa551e3fa-3375-4486-8dee-391e32667785', N'4075c5d2-1389-48a2-a069-ce38238cf1ed', 0, 0, CAST(N'2022-07-28T15:20:55.4394855' AS DateTime2), CAST(N'2023-01-28T15:20:55.4394858' AS DateTime2))
SET IDENTITY_INSERT [dbo].[RefreshTokens] OFF
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Programs_ProgramsId] FOREIGN KEY([ProgramsId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Programs_ProgramsId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Programs_ProgramsId] FOREIGN KEY([ProgramsId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Programs_ProgramsId]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Courses_CoursesId] FOREIGN KEY([CoursesId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Courses_CoursesId]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Programs_ProgramsId] FOREIGN KEY([ProgramsId])
REFERENCES [dbo].[Programs] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Programs_ProgramsId]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_GameCounts_GameCountId] FOREIGN KEY([GameCountId])
REFERENCES [dbo].[GameCounts] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_GameCounts_GameCountId]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_GameDays_GameDayId] FOREIGN KEY([GameDayId])
REFERENCES [dbo].[GameDays] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_GameDays_GameDayId]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Statuses_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Statuses_StatusId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_GameDays_GameDayID] FOREIGN KEY([GameDayID])
REFERENCES [dbo].[GameDays] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_GameDays_GameDayID]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_GameTypes_GameTypeID] FOREIGN KEY([GameTypeID])
REFERENCES [dbo].[GameTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_GameTypes_GameTypeID]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Statuses_GameStatusId] FOREIGN KEY([GameStatusId])
REFERENCES [dbo].[Statuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Statuses_GameStatusId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_AspNetUsers_UserID]
GO
