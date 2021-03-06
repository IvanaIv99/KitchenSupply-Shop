USE [master]
GO
/****** Object:  Database [shop2]    Script Date: 6/17/2021 5:53:33 PM ******/
CREATE DATABASE [shop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\shop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\shop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [shop2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop2] SET  MULTI_USER 
GO
ALTER DATABASE [shop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shop2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shop2] SET QUERY_STORE = OFF
GO
USE [shop2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 5:53:35 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductId] [int] NULL,
	[OrderId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Address] [nvarchar](80) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PaymentOption] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](200) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_PriceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[ImagePath] [nvarchar](200) NOT NULL,
	[Stock] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
	[Pass] [nvarchar](150) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210615115734_initial', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'Tableware and utensils', CAST(N'2021-05-23T14:15:40.7197068' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'Cookery books', CAST(N'2021-05-23T14:17:14.8111563' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'Tea towels and aprons', CAST(N'2021-05-23T14:17:25.3455537' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, N'Storage', CAST(N'2021-05-23T14:17:51.6582005' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, N'New CatName', CAST(N'2021-06-11T17:45:48.6706920' AS DateTime2), CAST(N'2021-06-12T12:07:38.5149839' AS DateTime2), 1, 0, CAST(N'2021-06-12T12:07:38.4314645' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, N'NewCatPut', CAST(N'2021-06-17T16:07:56.4162397' AS DateTime2), CAST(N'2021-06-17T16:09:34.2099359' AS DateTime2), 1, 0, CAST(N'2021-06-17T16:09:34.2096010' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, N'NewCat', CAST(N'2021-06-17T16:09:58.2842329' AS DateTime2), CAST(N'2021-06-17T16:10:08.3635569' AS DateTime2), 1, 0, CAST(N'2021-06-17T16:10:08.3629152' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [Name], [Quantity], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'ENAMELLED SPOON REST', 1, CAST(8.99 AS Decimal(18, 2)), 2, 1, CAST(N'2021-06-15T17:26:37.3514760' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[OrderLines] ([Id], [Name], [Quantity], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'GLASS BOTTLE 1.4L', 2, CAST(3.99 AS Decimal(18, 2)), 10, 2, CAST(N'2021-06-15T17:26:58.7986617' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[OrderLines] ([Id], [Name], [Quantity], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'COTTON LEMON TEA TOWEL (PACK OF 2)', 2, CAST(7.99 AS Decimal(18, 2)), 12, 3, CAST(N'2021-06-15T17:30:50.8041949' AS DateTime2), NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Address], [OrderStatus], [PaymentOption], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, 1, N'Some address', 3, 1, CAST(N'2021-06-15T17:26:36.1703445' AS DateTime2), CAST(N'2021-06-17T16:22:15.5891255' AS DateTime2), 0, 1, NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [OrderStatus], [PaymentOption], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, 1, N'Some address22', 0, 1, CAST(N'2021-06-15T17:26:58.7812504' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [OrderStatus], [PaymentOption], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, 1, N'Some address3', 0, 1, CAST(N'2021-06-15T17:30:50.4455489' AS DateTime2), NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'1525000733_2_1_2.jpg', 1, CAST(N'2021-06-13T17:19:29.5045391' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'1222759733_1_1_1.jpg', 1, CAST(N'2021-06-13T17:20:32.6470836' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'1221759733_1_1_1.jpg', 1, CAST(N'2021-06-13T17:21:05.8139510' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, N'1220759733_1_1_1.jpg', 1, CAST(N'2021-06-13T17:21:16.6033919' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, N'1225041733_2_7_2.jpg', 2, CAST(N'2021-06-13T17:22:33.0936916' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, N'1225041733_1_1_2.jpg', 2, CAST(N'2021-06-13T17:22:53.3760954' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, N'9296752800_2_7_2.jpg', 3, CAST(N'2021-06-13T17:23:36.6338649' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (8, N'9296752800_1_1_2.jpg', 3, CAST(N'2021-06-13T17:23:48.0768912' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (9, N'4284000733_2_1_2.jpg', 4, CAST(N'2021-06-13T17:24:27.6002231' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (10, N'4284000733_1_1_2.jpg', 4, CAST(N'2021-06-13T17:24:39.6464572' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (11, N'5209041052_2_7_2.jpg', 5, CAST(N'2021-06-13T17:25:24.5999573' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (12, N'5209041052_1_1_2.jpg', 5, CAST(N'2021-06-13T17:25:40.5123064' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (13, N'9289428303_2_7_2.jpg', 6, CAST(N'2021-06-13T17:26:32.6903964' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (14, N'9289428303_1_1_2.jpg', 6, CAST(N'2021-06-13T17:26:43.2862636' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (15, N'4213428052_2_7_2.jpg', 7, CAST(N'2021-06-13T17:27:19.2636901' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (16, N'4213428052_1_1_2.jpg', 7, CAST(N'2021-06-13T17:27:31.2457478' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (17, N'9277049733_2_7_2.jpg', 8, CAST(N'2021-06-13T17:28:25.5088443' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (18, N'9277049733_1_1_2.jpg', 8, CAST(N'2021-06-13T17:28:36.0224399' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (19, N'3097428052_2_7_2.jpg', 9, CAST(N'2021-06-13T17:29:39.7766643' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (20, N'3097428052_2_2_2.jpg', 9, CAST(N'2021-06-13T17:29:53.7140664' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (21, N'9224428832_2_7_2.jpg', 10, CAST(N'2021-06-13T17:30:37.0869742' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (22, N'9224428832_1_1_2.jpg', 10, CAST(N'2021-06-13T17:30:46.9820351' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (23, N'3290026440_2_7_2.jpg', 11, CAST(N'2021-06-13T17:31:52.7844040' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (24, N'3290026440_1_1_2.jpg', 11, CAST(N'2021-06-13T17:32:04.7595324' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (25, N'8237026300_2_7_2.jpg', 12, CAST(N'2021-06-13T17:32:44.8754226' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (26, N'8237026300_1_1_2.jpg', 12, CAST(N'2021-06-13T17:32:57.4799682' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (27, N'8208027999_2_7_2.jpg', 13, CAST(N'2021-06-13T17:33:48.3972817' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (28, N'8208027999_1_1_2.jpg', 13, CAST(N'2021-06-13T17:33:58.5116615' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (29, N'4238027800_2_7_2.jpg', 14, CAST(N'2021-06-13T17:36:31.9817389' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (30, N'4238027800_1_1_2.jpg', 14, CAST(N'2021-06-13T17:36:42.5133597' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (31, N'8274027999_2_7_2.jpg', 15, CAST(N'2021-06-13T17:36:55.2351856' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (32, N'8274027999_1_1_2.jpg', 15, CAST(N'2021-06-13T17:37:04.0731413' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (33, N'7221111052_2_7_2.jpg', 16, CAST(N'2021-06-13T17:38:52.3950703' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (34, N'7221111052_1_1_2.jpg', 16, CAST(N'2021-06-13T17:39:04.1826862' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (35, N'7213054406_2_7_1.jpg', 17, CAST(N'2021-06-13T17:41:46.5297075' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (36, N'7213054406_1_1_1.jpg', 17, CAST(N'2021-06-13T17:41:56.3557174' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (37, N'7207054250_2_7_2.jpg', 18, CAST(N'2021-06-13T17:42:29.6624072' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (38, N'7207054250_1_1_2.jpg', 18, CAST(N'2021-06-13T17:42:40.2946403' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (39, N'3094054450_1_1_1.jpg', 19, CAST(N'2021-06-13T17:44:18.3904893' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (40, N'9780714875361-ph-940-9.jpg', 19, CAST(N'2021-06-13T17:44:30.6060950' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (41, N'7206054802_2_7_2.jpg', 20, CAST(N'2021-06-13T17:44:58.9516336' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (42, N'7206054802_1_1_2.jpg', 20, CAST(N'2021-06-13T17:45:18.7591096' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Pictures] ([Id], [ImagePath], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (45, N'9d1e3bf4-66af-4f66-8d66-7a6630737cba.jpg', 21, CAST(N'2021-06-13T23:51:54.9438539' AS DateTime2), NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[PriceHistory] ON 

INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, CAST(10.99 AS Decimal(18, 2)), 1, CAST(N'2021-05-23T14:36:46.1128997' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, CAST(8.99 AS Decimal(18, 2)), 2, CAST(N'2021-05-23T14:36:58.0484460' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, CAST(28.99 AS Decimal(18, 2)), 3, CAST(N'2021-05-23T14:37:12.2691801' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, CAST(15.99 AS Decimal(18, 2)), 4, CAST(N'2021-05-23T14:37:22.7792249' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, CAST(9.99 AS Decimal(18, 2)), 5, CAST(N'2021-05-23T14:37:36.9947790' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, CAST(4.99 AS Decimal(18, 2)), 6, CAST(N'2021-05-23T14:37:46.0970799' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, CAST(4.99 AS Decimal(18, 2)), 7, CAST(N'2021-05-23T14:37:54.9666658' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (8, CAST(10.99 AS Decimal(18, 2)), 8, CAST(N'2021-05-23T14:38:04.1833641' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (9, CAST(8.99 AS Decimal(18, 2)), 9, CAST(N'2021-05-23T14:38:11.9754716' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (10, CAST(3.99 AS Decimal(18, 2)), 10, CAST(N'2021-05-23T14:38:21.6000114' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (11, CAST(10.99 AS Decimal(18, 2)), 11, CAST(N'2021-05-23T14:38:28.5192018' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (12, CAST(7.99 AS Decimal(18, 2)), 12, CAST(N'2021-05-23T14:38:36.2090000' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (13, CAST(12.99 AS Decimal(18, 2)), 13, CAST(N'2021-05-23T14:38:46.0013586' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (14, CAST(13.99 AS Decimal(18, 2)), 14, CAST(N'2021-05-23T14:38:54.3704993' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (15, CAST(13.99 AS Decimal(18, 2)), 15, CAST(N'2021-05-23T14:39:02.9997332' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (16, CAST(7.99 AS Decimal(18, 2)), 16, CAST(N'2021-05-23T14:39:12.5561851' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (17, CAST(20.99 AS Decimal(18, 2)), 17, CAST(N'2021-05-23T14:39:22.1510950' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (18, CAST(21.99 AS Decimal(18, 2)), 18, CAST(N'2021-05-23T14:39:28.8321859' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (19, CAST(21.99 AS Decimal(18, 2)), 19, CAST(N'2021-05-23T14:39:42.0001693' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (20, CAST(20.99 AS Decimal(18, 2)), 20, CAST(N'2021-05-23T14:39:50.2799166' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (21, CAST(25.00 AS Decimal(18, 2)), 21, CAST(N'2021-06-13T23:51:55.0835282' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (22, CAST(55.00 AS Decimal(18, 2)), 60, CAST(N'2021-06-17T16:27:03.3019029' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[PriceHistory] ([Id], [Price], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (23, CAST(22.00 AS Decimal(18, 2)), 60, CAST(N'2021-06-17T16:28:31.0834730' AS DateTime2), NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[PriceHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'SET OF ENAMELLED UTENSILS', N'Set of kitchen utensils made of enamelled steel with a retro design.', N'.. ', 10, 1, CAST(N'2021-05-23T14:22:40.3632610' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'ENAMELLED SPOON REST', N'White enamelled steel spoon rest.', N'.. ', 10, 1, CAST(N'2021-05-23T14:23:46.8618903' AS DateTime2), CAST(N'2021-06-17T16:22:15.5892092' AS DateTime2), 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'ENAMELLED STEEL POT', N'Carbon steel pot in collaboration with the Austrian brand Riess.With a traditional design, enamelled black exterior and white interior', N'.. ', 10, 1, CAST(N'2021-05-23T14:24:10.4166207' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, N'SET OF SILICONE AND WOOD UTENSILS', N'Set of kitchen utensils made of silicone and acacia wood.', N'.. ', 15, 1, CAST(N'2021-05-23T14:24:45.4231537' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, N'CERAMIC AND WOOD PESTLE AND MORTAR', N'Ceramic pestle and mortar with wooden detail.', N'.. ', 22, 1, CAST(N'2021-05-23T14:25:15.6310475' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, N'GLASS STORAGE JAR WITH GOLDEN LID', N'Hermetic storage jar. Made of glass with a raised slogan detail and a golden screw-on lid. Available in three sizes.', N'.. ', 10, 4, CAST(N'2021-05-23T14:26:36.0979193' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, N'BOROSILICATE GLASS AND WOOD STORAGE JAR', N'Borosilicate glass storage jar with an acacia wood lid and brass details. It is characterised by its lightness and aesthetics', N'.. ', 10, 4, CAST(N'2021-05-23T14:27:13.0602441' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (8, N'LACQUERED METALLIC BASKET', N'White lacquered metal basket with a metal handle with wooden trim.', N'.. ', 10, 4, CAST(N'2021-05-23T14:27:42.9368545' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (9, N'BOROSILICATE GLASS AND WOOD DOUBLE JAR', N'Double-height borosilicate glass storage jar with an airtight acacia wood lid and brass details. Total capacity: 1.07 L', N'.. ', 10, 4, CAST(N'2021-05-23T14:28:01.7932304' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (10, N'GLASS BOTTLE 1.4L', N'Glass bottle with an airtight top. Capacity: 1.4 litre.', N'.. ', 8, 4, CAST(N'2021-05-23T14:28:22.0359433' AS DateTime2), CAST(N'2021-06-15T17:26:58.7986747' AS DateTime2), 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (11, N'DYED THREAD TEA TOWEL (PACK OF 2)', N'Cotton tea towel with a dyed thread check design. Sold in packs of 2.', N'.. ', 12, 3, CAST(N'2021-05-23T14:30:02.6725996' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (12, N'COTTON LEMON TEA TOWEL (PACK OF 2)', N'Cotton tea towel with lemon print. Sold in packs of 2. JOIN LIFE Care for water: produced using less water.', N'.. ', 10, 3, CAST(N'2021-05-23T14:30:20.9650227' AS DateTime2), CAST(N'2021-06-15T17:30:50.8042115' AS DateTime2), 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (13, N'DYED THREAD COTTON APRON', N'Cotton apron with dyed thread and check design. Also contains a front pocket.', N'.. ', 12, 3, CAST(N'2021-05-23T14:30:44.9251873' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (14, N'GINGHAM APRON', N'Cotton apron with a check design.', N'.. ', 14, 3, CAST(N'2021-05-23T14:31:15.5081450' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (15, N'COTTON APRON WITH VEGETABLES', N'Cotton apron with a vegetable print. Also featuring a front pocket.', N'.. ', 16, 3, CAST(N'2021-05-23T14:31:40.7919617' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (16, N'RECIPE NOTEBOOK', N'Paper notebook for recipes.', N'.. ', 8, 2, CAST(N'2021-05-23T14:32:22.4252500' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (17, N'PHAIDON “SPIRITED” COCKTAIL BOOK', N'In order to return this item, the plastic wrap must be intact.', N'.. ', 8, 2, CAST(N'2021-05-23T14:32:38.8709562' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (18, N'BOOK "FOOD & DRINKS INFOGRAPHICS" TASCHEN', N'The most complete, visual and attractive culinary guide. ', N'.. ', 10, 2, CAST(N'2021-05-23T14:33:05.8355102' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (19, N'“BREAD IS GOLD” RECIPE BOOK BY PHAIDON', N'The best cooks in the world don’t waste anything. "Bread is Gold" reveals the secrets of more than 50 of the worlds best chefs through simple meals for cooking at home.', N'', 5, 2, CAST(N'2021-05-23T14:33:59.8369989' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (20, N'“SIMPLE & CLASSIC” COOKBOOK BY PHAIDON', N'In order to return this item, the plastic wrap must be intact.', N'', 8, 2, CAST(N'2021-05-23T14:34:24.7952370' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (21, N'New  product
', N'Some description', N'23160a45-b117-4032-8b85-e9d4fa6d1ab2.jpg', 50, 1, CAST(N'2021-06-13T23:51:50.4458147' AS DateTime2), CAST(N'2021-06-13T23:56:30.9739476' AS DateTime2), 1, 0, CAST(N'2021-06-13T23:56:30.9731904' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [ImagePath], [Stock], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (60, N'New Product 2', N'Desc 2', N'c09b71fe-3dd2-4944-b0a7-6098caaeb84e.jpg', 12, 4, CAST(N'2021-06-17T16:27:03.1107435' AS DateTime2), CAST(N'2021-06-17T16:28:56.7316686' AS DateTime2), 1, 0, CAST(N'2021-06-17T16:28:56.7314142' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'user', CAST(N'2021-05-23T16:43:39.0148348' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'admin', CAST(N'2021-05-23T16:43:48.6978946' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'RoleExample', CAST(N'2021-06-11T16:40:34.5951218' AS DateTime2), CAST(N'2021-06-11T16:41:25.4048760' AS DateTime2), 1, 0, CAST(N'2021-06-11T16:41:25.4041610' AS DateTime2))
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, N'New RoleChange', CAST(N'2021-06-12T11:55:24.8673132' AS DateTime2), CAST(N'2021-06-12T11:58:23.0600887' AS DateTime2), 1, 0, CAST(N'2021-06-12T11:58:23.0594705' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2021-06-15T15:30:46.3824089' AS DateTime2), N'Creating order', N'{"UserId":0,"Address":"Some address3","PaymentOption":1,"OrderLines":[{"Name":null,"Quantity":2,"Price":0.0,"ProductId":12,"OrderId":0,"TotalPrice":0.0}]}', N'mark@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2021-06-15T15:32:18.1393107' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":0,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2021-06-15T15:33:04.0785197' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2021-06-15T15:33:20.5704418' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2021-06-15T16:01:29.5253396' AS DateTime2), N'Getting products', N'{"Name":"Set","Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2021-06-15T16:02:56.2281942' AS DateTime2), N'Getting products', N'{"Name":"Set","Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2021-06-15T16:03:21.0083308' AS DateTime2), N'Getting products', N'{"Name":"Set","Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2021-06-15T16:03:28.6523082' AS DateTime2), N'Getting products', N'{"Name":"Set","Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2021-06-15T16:04:02.0353827' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2021-06-15T16:06:15.0917694' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2021-06-15T16:08:19.6474263' AS DateTime2), N'Getting products', N'{"Name":null,"Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2021-06-15T16:14:11.1837002' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2021-06-15T16:19:25.9963671' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2021-06-15T16:29:00.5480449' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2021-06-15T16:39:26.5057543' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2021-06-15T16:39:45.1369424' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2021-06-15T16:40:56.2010254' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2021-06-15T16:45:45.5922571' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2021-06-15T16:46:39.1367302' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2021-06-15T16:47:36.5708864' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2021-06-17T14:07:37.0986411' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2021-06-17T14:07:56.1669902' AS DateTime2), N'Creating new Category', N'{"Name":"NewCat"}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2021-06-17T14:08:18.8106711' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2021-06-17T14:09:17.4129670' AS DateTime2), N'Updating category', N'{"Id":6,"Name":"NewCatPut"}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2021-06-17T14:09:26.0776982' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2021-06-17T14:09:34.1676773' AS DateTime2), N'Deleting category', N'6', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2021-06-17T14:09:40.6046879' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2021-06-17T14:09:58.2674409' AS DateTime2), N'Creating new Category', N'{"Name":"NewCat"}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2021-06-17T14:10:02.5757546' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2021-06-17T14:10:08.3389659' AS DateTime2), N'Deleting category', N'7', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2021-06-17T14:10:16.8582564' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2021-06-17T14:10:35.0624269' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2021-06-17T14:11:20.4999578' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"2021-06-17T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2021-06-17T14:14:13.5823899' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":0,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2021-06-17T14:14:38.9937890' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":0,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2021-06-17T14:14:43.7327504' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":3,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2021-06-17T14:14:57.9975277' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":0,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2021-06-17T14:15:13.0606513' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":2,"PaymentOption":1,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2021-06-17T14:15:26.4420018' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":2,"PaymentOption":1,"PerPage":1,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2021-06-17T14:15:40.6992400' AS DateTime2), N'Getting all orders', N'{"UserName":null,"OrderDate":"0001-01-01T00:00:00","OrderStatus":0,"PaymentOption":0,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2021-06-17T14:21:28.8506455' AS DateTime2), N'Getting one order', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2021-06-17T14:22:15.1823584' AS DateTime2), N'Changing order status', N'{"OrderId":1,"Status":3}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2021-06-17T14:22:22.9111924' AS DateTime2), N'Getting one order', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2021-06-17T14:23:14.5375083' AS DateTime2), N'Getting one product pictures', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2021-06-17T14:24:15.2257269' AS DateTime2), N'Inserting new product pictures', N'{"ProductId":1,"Pictures":[{"ContentDisposition":"form-data; name=\"Pictures\"; filename=\"1222759733_2_7_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Pictures\"; filename=\"1222759733_2_7_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":1178943,"Name":"Pictures","FileName":"1222759733_2_7_1.jpg"}]}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2021-06-17T14:24:21.7191541' AS DateTime2), N'Getting one product pictures', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2021-06-17T14:24:39.2074932' AS DateTime2), N'Deleting one product pictures', N'[{"IdPicture":0}]', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2021-06-17T14:24:56.6968428' AS DateTime2), N'Getting one product pictures', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2021-06-17T14:25:07.9573615' AS DateTime2), N'Deleting one product pictures', N'[{"IdPicture":87}]', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2021-06-17T14:25:13.5128421' AS DateTime2), N'Getting one product pictures', N'1', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2021-06-17T14:26:03.9732247' AS DateTime2), N'Getting products', N'{"Name":null,"Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2021-06-17T14:27:02.9811494' AS DateTime2), N'Create new Product', N'{"Name":"New Product","Description":"Product Description","Stock":2,"Images":[{"ContentDisposition":"form-data; name=\"Images\"; filename=\"1222759733_2_7_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Images\"; filename=\"1222759733_2_7_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":1178943,"Name":"Images","FileName":"1222759733_2_7_1.jpg"}],"Price":55.0,"CategoryId":4}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2021-06-17T14:27:11.3140588' AS DateTime2), N'Getting products', N'{"Name":null,"Description":null,"CategoryId":0,"Stock":true,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2021-06-17T14:27:25.5035926' AS DateTime2), N'Getting products', N'{"Name":null,"Description":null,"CategoryId":0,"Stock":true,"PerPage":25,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2021-06-17T14:28:20.3580173' AS DateTime2), N'Updating product', N'{"Id":60,"Name":"New Product 2","Description":"Desc 2","Image":null,"Stock":0,"Price":22.0}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2021-06-17T14:28:30.7205179' AS DateTime2), N'Updating product', N'{"Id":60,"Name":"New Product 2","Description":"Desc 2","Image":null,"Stock":10,"Price":22.0}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2021-06-17T14:28:39.8333072' AS DateTime2), N'Getting one product', N'60', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2021-06-17T14:28:56.4737264' AS DateTime2), N'Deleting product', N'60', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2021-06-17T14:29:03.3411444' AS DateTime2), N'Getting one product', N'60', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2021-06-17T14:29:41.8289404' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2021-06-17T14:29:59.9817584' AS DateTime2), N'Getting all users by search', N'{"Value":"Mark","PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2021-06-17T14:30:18.7579121' AS DateTime2), N'Updating user info', N'{"Id":0,"FirstName":"string","LastName":"string","Email":"string"}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2021-06-17T14:30:28.0744561' AS DateTime2), N'Getting one user info', N'2', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2021-06-17T14:30:29.3324337' AS DateTime2), N'Getting one user info', N'2', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2021-06-17T14:30:44.8775640' AS DateTime2), N'User registration', N'{"FirstName":"string","LastName":"string","Email":"string","Pass":"string"}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2021-06-17T14:30:58.0411299' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2021-06-17T14:31:09.2502235' AS DateTime2), N'Getting all categories', N'{"Name":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2021-06-17T14:31:20.4774075' AS DateTime2), N'Getting logs', N'{"UserData":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"PerPage":5,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2021-06-17T14:32:57.9690131' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovicc","Email":"ivanovicivana1999@gmail.com","Pass":"ivanovic123456"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2021-06-17T14:33:37.6372328' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovicc","Email":"ivanovicivana1999@gmail.com","Pass":"ivana123456"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2021-06-17T14:33:52.0265944' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovicc","Email":"ivanovicivsssssssssssssssssssana1999@gmail.com","Pass":"ivana123456"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2021-06-17T14:34:19.3075950' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovicc","Email":"ivanovicivsssssssssssssssssssana1999@gmail.com","Pass":"ivana123456"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2021-06-17T14:35:27.4009411' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovicc","Email":"ivanovicivana1999@gmail.com","Pass":"ivana123456"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2021-06-17T14:35:40.4078875' AS DateTime2), N'User registration', N'{"FirstName":"string","LastName":"string","Email":"string","Pass":"string"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2021-06-17T14:36:02.2835453' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string124"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2021-06-17T14:44:29.6444250' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string124"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2021-06-17T14:53:03.8133751' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string124"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2021-06-17T14:54:26.7489688' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2021-06-17T14:54:32.6241544' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":30,"Page":1}', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2021-06-17T14:54:48.9301978' AS DateTime2), N'Deleting user profile', N'27', N'atisdale788@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2021-06-17T15:00:52.8994186' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string123"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2021-06-17T15:03:25.4907479' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string123"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2021-06-17T15:05:09.3426093' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivanovicivana1999@gmail.com","Pass":"string1234"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2021-06-17T15:10:50.9261593' AS DateTime2), N'User registration', N'{"FirstName":"Ivana","LastName":"Ivanovic","Email":"ivana.ivanovic.49.18@ict.edu.rs","Pass":"string554"}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2021-06-17T15:12:49.4826679' AS DateTime2), N'Getting all users by search', N'{"Value":null,"PerPage":5,"Page":1}', N'ivana.ivanovic.49.18@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2021-06-17T15:13:33.3050863' AS DateTime2), N'Updating user info', N'{"Id":31,"FirstName":"Ivanaaa","LastName":"Ivanoviccc","Email":"ivana.ivanovic.49.18@gmail.com"}', N'ivana.ivanovic.49.18@ict.edu.rs')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2021-06-17T15:13:52.1688772' AS DateTime2), N'Deleting user profile', N'31', N'ivana.ivanovic.49.18@ict.edu.rs')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, N'Mark', N'Markers', N'mark@gmail.com', N'mark1111', 1, CAST(N'2021-05-23T16:47:04.7624957' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (2, N'Anna', N'Markers', N'anna@gmail.com', N'anna12311', 1, CAST(N'2021-05-23T16:47:28.7887128' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, N'John', N'nesbit', N'john@gmail.com', N'john12311', 1, CAST(N'2021-05-23T16:47:53.5989549' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, N'Ivana', N'Ivanovic', N'atisdale788@gmail.com', N'iv123456', 2, CAST(N'2021-05-23T16:48:25.6180617' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, N'Joan', N'West', N'joan@gmail.com', N'joe3456', 1, CAST(N'2021-05-23T16:48:53.9172671' AS DateTime2), CAST(N'2021-06-12T11:53:20.2440566' AS DateTime2), 1, 0, CAST(N'2021-06-12T11:53:20.2431428' AS DateTime2))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, N'Emily', N'Cole', N'emily@gmail.com', N'emily34564', 1, CAST(N'2021-05-23T16:52:12.4020194' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, N'Michael', N'Evans', N'michael@gmail.com', N'michael999', 1, CAST(N'2021-05-23T16:52:39.0293584' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (8, N'Robert', N'James', N'robert@gmail.com', N'robert874', 1, CAST(N'2021-05-23T16:53:03.7437514' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (9, N'Chris', N'Baily', N'chris@gmail.com', N'chris222', 1, CAST(N'2021-05-23T20:56:26.4939712' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (10, N'Philip', N'Bailer', N'philip@gmail.com', N'philip555', 1, CAST(N'2021-05-23T20:56:52.7171716' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (11, N'Maria', N'Munch', N'maria55@gmail.com', N'maria4489', 1, CAST(N'2021-05-23T20:57:21.6482535' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (12, N'Zorra', N'Heill', N'zorra@gmail.com', N'zorra899', 1, CAST(N'2021-05-23T20:57:59.4990816' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (13, N'Nicole', N'Spencer', N'nicole@gmail.com', N'nicole878', 1, CAST(N'2021-05-23T20:58:20.3554570' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (14, N'Matthew', N'Harris', N'matthew@gmail.com', N'matthew', 1, CAST(N'2021-05-23T20:58:48.0004715' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (15, N'Olivia', N'Jones', N'olivia@gmail.com', N'olivia', 1, CAST(N'2021-05-23T20:59:12.7160070' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (16, N'Ruby', N'Freeman', N'ruby@gmail.com', N'ruby999', 1, CAST(N'2021-05-23T20:59:51.8486442' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (17, N'Sheldon', N'Freeman', N'sheldon@gmail.com', N'sheldon99', 1, CAST(N'2021-05-23T21:00:19.3774855' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (18, N'Lisa', N'Evans', N'lisa@gmail.com', N'lisaevans87', 1, CAST(N'2021-05-23T21:00:46.0822200' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (19, N'Ksenia', N'Jeckson', N'ksenia@gmail.com', N'ksenia11', 1, CAST(N'2021-05-23T21:01:32.3483713' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (20, N'Katarin', N'Kellvi', N'katrin@gmail.com', N'katrink788', 1, CAST(N'2021-05-23T21:02:11.2548779' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Pass], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (31, N'Ivanaaa', N'Ivanoviccc', N'ivana.ivanovic.49.18@gmail.com', N'string554', 1, CAST(N'2021-06-17T17:11:00.4437830' AS DateTime2), CAST(N'2021-06-17T17:13:52.2844590' AS DateTime2), 1, 0, CAST(N'2021-06-17T17:13:52.2842040' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (1, 4, 22, CAST(N'2021-06-14T14:30:21.2612271' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (3, 4, 6, CAST(N'2021-06-14T15:30:39.7161914' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (4, 4, 10, CAST(N'2021-06-14T15:30:48.9690642' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (5, 4, 3, CAST(N'2021-06-14T15:30:55.0077413' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (6, 4, 1, CAST(N'2021-06-14T15:30:59.3953861' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (7, 4, 14, CAST(N'2021-06-14T15:31:04.9453945' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (8, 4, 11, CAST(N'2021-06-14T15:31:08.7704862' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (9, 4, 13, CAST(N'2021-06-14T15:31:12.5098677' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (10, 4, 12, CAST(N'2021-06-14T15:31:16.3555744' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (11, 4, 15, CAST(N'2021-06-14T15:31:18.3284713' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (12, 4, 18, CAST(N'2021-06-14T15:31:22.7481682' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (13, 4, 21, CAST(N'2021-06-14T15:31:26.1326842' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (14, 4, 19, CAST(N'2021-06-14T15:31:32.7490820' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (15, 4, 24, CAST(N'2021-06-14T15:32:27.7947556' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (16, 4, 23, CAST(N'2021-06-14T15:32:31.8136646' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (17, 4, 5, CAST(N'2021-06-14T15:32:35.1431662' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (18, 4, 7, CAST(N'2021-06-14T15:32:38.5244532' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (19, 4, 8, CAST(N'2021-06-14T15:32:42.9915065' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (20, 4, 9, CAST(N'2021-06-14T15:32:45.4496827' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (21, 4, 4, CAST(N'2021-06-14T15:32:52.0813002' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (22, 4, 17, CAST(N'2021-06-14T15:32:55.4815827' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (23, 4, 16, CAST(N'2021-06-14T15:32:59.0876709' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (24, 1, 20, CAST(N'2021-06-14T16:38:29.2465927' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (25, 1, 25, CAST(N'2021-06-14T16:38:33.5781118' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (26, 1, 4, CAST(N'2021-06-14T16:38:36.9556100' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (27, 1, 17, CAST(N'2021-06-14T16:38:41.9598507' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (28, 1, 16, CAST(N'2021-06-14T16:38:46.7391584' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (29, 1, 26, CAST(N'2021-06-14T16:38:51.7121387' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (30, 2, 20, CAST(N'2021-06-14T16:38:59.2787122' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (31, 2, 25, CAST(N'2021-06-14T16:39:03.6041466' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (32, 2, 4, CAST(N'2021-06-14T16:39:08.5688518' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (33, 2, 17, CAST(N'2021-06-14T16:39:11.9627658' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (34, 2, 16, CAST(N'2021-06-14T16:39:15.9447071' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (35, 2, 26, CAST(N'2021-06-14T16:39:19.8912979' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (36, 3, 20, CAST(N'2021-06-14T16:39:29.5923226' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (37, 3, 25, CAST(N'2021-06-14T16:39:33.4559399' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (38, 3, 4, CAST(N'2021-06-14T16:39:36.9601972' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (39, 3, 17, CAST(N'2021-06-14T16:39:41.1570181' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (40, 3, 16, CAST(N'2021-06-14T16:39:44.6253977' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (41, 3, 26, CAST(N'2021-06-14T16:39:48.6769135' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (42, 5, 20, CAST(N'2021-06-14T16:40:00.4155060' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (43, 5, 25, CAST(N'2021-06-14T16:40:04.7005913' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (44, 5, 4, CAST(N'2021-06-14T16:40:08.9451464' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (45, 5, 17, CAST(N'2021-06-14T16:40:12.7445823' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (46, 5, 16, CAST(N'2021-06-14T16:40:17.2039095' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (47, 5, 26, CAST(N'2021-06-14T16:40:22.1537582' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (48, 6, 20, CAST(N'2021-06-14T16:40:33.0515040' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (49, 6, 25, CAST(N'2021-06-14T16:40:35.0192061' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (50, 6, 4, CAST(N'2021-06-14T16:40:38.0954011' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (51, 6, 17, CAST(N'2021-06-14T16:40:40.4355723' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (52, 6, 16, CAST(N'2021-06-14T16:40:43.2257631' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (53, 6, 26, CAST(N'2021-06-14T16:40:46.2664573' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (54, 7, 20, CAST(N'2021-06-14T16:40:51.7451170' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (55, 7, 25, CAST(N'2021-06-14T16:40:54.2706522' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (56, 7, 4, CAST(N'2021-06-14T16:40:56.2191191' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (57, 7, 17, CAST(N'2021-06-14T16:40:58.8564300' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (58, 7, 16, CAST(N'2021-06-14T16:41:01.6813991' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (59, 7, 26, CAST(N'2021-06-14T16:41:04.1700332' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (60, 8, 20, CAST(N'2021-06-14T16:41:09.5251869' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (61, 8, 25, CAST(N'2021-06-14T16:41:11.7362504' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (62, 8, 4, CAST(N'2021-06-14T16:41:48.7300539' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (63, 8, 17, CAST(N'2021-06-14T16:41:51.8045065' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (64, 8, 16, CAST(N'2021-06-14T16:41:54.8943294' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (65, 8, 26, CAST(N'2021-06-14T16:41:57.4744341' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (66, 9, 20, CAST(N'2021-06-14T16:42:03.0256756' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (67, 9, 25, CAST(N'2021-06-14T16:42:05.8091288' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (68, 9, 4, CAST(N'2021-06-14T16:42:08.2318590' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (69, 9, 17, CAST(N'2021-06-14T16:42:11.0556522' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (70, 9, 16, CAST(N'2021-06-14T16:42:14.3367913' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (71, 9, 26, CAST(N'2021-06-14T16:42:17.2988071' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (72, 10, 20, CAST(N'2021-06-14T16:42:23.0749917' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (73, 10, 25, CAST(N'2021-06-14T16:42:25.2078465' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (74, 10, 4, CAST(N'2021-06-14T16:42:27.4332015' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (75, 10, 17, CAST(N'2021-06-14T16:42:29.4780592' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (76, 10, 16, CAST(N'2021-06-14T16:42:32.9762147' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (77, 10, 26, CAST(N'2021-06-14T16:42:35.5266542' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (78, 11, 20, CAST(N'2021-06-14T16:42:40.4768050' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (79, 11, 25, CAST(N'2021-06-14T16:42:42.4733326' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (80, 11, 4, CAST(N'2021-06-14T16:42:45.6358109' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (81, 11, 17, CAST(N'2021-06-14T16:42:49.0126286' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (82, 11, 16, CAST(N'2021-06-14T16:42:51.4135630' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (83, 11, 26, CAST(N'2021-06-14T16:42:54.4696199' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (84, 12, 20, CAST(N'2021-06-14T16:43:01.5993278' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (85, 12, 25, CAST(N'2021-06-14T16:43:03.7488383' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (86, 12, 4, CAST(N'2021-06-14T16:43:06.2040401' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (87, 12, 17, CAST(N'2021-06-14T16:43:07.9909348' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (88, 12, 16, CAST(N'2021-06-14T16:43:09.8475434' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (89, 12, 26, CAST(N'2021-06-14T16:43:12.6257332' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (90, 13, 20, CAST(N'2021-06-14T16:43:52.1626033' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (91, 13, 25, CAST(N'2021-06-14T16:43:56.0546442' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (92, 13, 4, CAST(N'2021-06-14T16:43:58.4880516' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (93, 13, 17, CAST(N'2021-06-14T16:44:01.5259766' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (94, 13, 16, CAST(N'2021-06-14T16:44:04.0507936' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (95, 13, 26, CAST(N'2021-06-14T16:44:06.3239575' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (96, 14, 20, CAST(N'2021-06-14T16:44:11.3840653' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (97, 14, 25, CAST(N'2021-06-14T16:44:14.5098753' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (98, 14, 4, CAST(N'2021-06-14T16:44:16.6350618' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (99, 14, 17, CAST(N'2021-06-14T16:44:18.6873925' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (100, 14, 16, CAST(N'2021-06-14T16:44:22.3897873' AS DateTime2), NULL, 0, 1, NULL)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (101, 14, 26, CAST(N'2021-06-14T16:44:24.5573604' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (102, 15, 20, CAST(N'2021-06-14T16:44:30.1459725' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (103, 15, 25, CAST(N'2021-06-14T16:44:33.0191141' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (104, 15, 4, CAST(N'2021-06-14T16:44:35.4544768' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (105, 15, 17, CAST(N'2021-06-14T16:44:38.7005168' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (106, 15, 16, CAST(N'2021-06-14T16:44:41.5719272' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (107, 15, 26, CAST(N'2021-06-14T16:44:44.3669611' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (108, 16, 20, CAST(N'2021-06-14T16:44:49.9218255' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (109, 16, 25, CAST(N'2021-06-14T16:44:51.5837900' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (110, 16, 4, CAST(N'2021-06-14T16:44:53.4225817' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (111, 16, 17, CAST(N'2021-06-14T16:44:56.3512047' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (112, 16, 16, CAST(N'2021-06-14T16:44:58.5670760' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (113, 16, 26, CAST(N'2021-06-14T16:45:01.7625151' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (114, 17, 20, CAST(N'2021-06-14T16:45:06.1485050' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (115, 17, 25, CAST(N'2021-06-14T16:45:08.9229405' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (116, 17, 4, CAST(N'2021-06-14T16:45:10.6636403' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (117, 17, 17, CAST(N'2021-06-14T16:45:14.0687064' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (118, 17, 16, CAST(N'2021-06-14T16:45:15.7407162' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (119, 17, 26, CAST(N'2021-06-14T16:45:19.6757577' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (120, 18, 20, CAST(N'2021-06-14T16:45:26.9664152' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (121, 18, 25, CAST(N'2021-06-14T16:45:30.0109373' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (122, 18, 4, CAST(N'2021-06-14T16:45:32.6944568' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (123, 18, 17, CAST(N'2021-06-14T16:45:35.8041375' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (124, 18, 16, CAST(N'2021-06-14T16:45:39.1261403' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (125, 18, 26, CAST(N'2021-06-14T16:45:42.4766979' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (126, 19, 20, CAST(N'2021-06-14T16:45:47.8007666' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (127, 19, 25, CAST(N'2021-06-14T16:45:49.5800153' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (128, 19, 4, CAST(N'2021-06-14T16:45:52.6532329' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (129, 19, 17, CAST(N'2021-06-14T16:45:54.6970117' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (130, 19, 16, CAST(N'2021-06-14T16:45:57.4457137' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (131, 19, 26, CAST(N'2021-06-14T16:46:00.1943741' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (132, 20, 20, CAST(N'2021-06-14T16:46:13.6566244' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (133, 20, 25, CAST(N'2021-06-14T16:46:16.4302805' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (134, 20, 4, CAST(N'2021-06-14T16:46:18.7887660' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (135, 20, 17, CAST(N'2021-06-14T16:46:21.3532746' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (136, 20, 16, CAST(N'2021-06-14T16:46:22.8186475' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (137, 20, 26, CAST(N'2021-06-14T16:46:26.5496104' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (162, 31, 20, CAST(N'2021-06-17T17:11:00.5862594' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (163, 31, 25, CAST(N'2021-06-17T17:11:00.5862730' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (164, 31, 4, CAST(N'2021-06-17T17:11:00.5862741' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (165, 31, 17, CAST(N'2021-06-17T17:11:00.5862749' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (166, 31, 16, CAST(N'2021-06-17T17:11:00.5862757' AS DateTime2), NULL, 0, 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [DeletedAt]) VALUES (167, 31, 26, CAST(N'2021-06-17T17:11:00.5862764' AS DateTime2), NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ProductId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ProductId] ON [dbo].[OrderLines]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Pictures_ImagePath]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Pictures_ImagePath] ON [dbo].[Pictures]
(
	[ImagePath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pictures_ProductId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pictures_ProductId] ON [dbo].[Pictures]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceHistory_ProductId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_PriceHistory_ProductId] ON [dbo].[PriceHistory]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/17/2021 5:53:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [PaymentOption]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Products_ProductId]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriceHistory_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PriceHistory_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [shop2] SET  READ_WRITE 
GO
