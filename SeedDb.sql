USE [master]
GO
/****** Object:  Database [SportsStoreJEE]    Script Date: 01-Jul-20 11:52:25 PM ******/
CREATE DATABASE [SportsStoreJEE]
 CONTAINMENT = NONE
ALTER DATABASE [SportsStoreJEE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportsStoreJEE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportsStoreJEE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportsStoreJEE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportsStoreJEE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportsStoreJEE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportsStoreJEE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportsStoreJEE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportsStoreJEE] SET  MULTI_USER 
GO
ALTER DATABASE [SportsStoreJEE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportsStoreJEE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportsStoreJEE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportsStoreJEE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportsStoreJEE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportsStoreJEE] SET QUERY_STORE = OFF
GO
USE [SportsStoreJEE]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlacementDate] [date] NOT NULL,
	[WholesalerName] [nvarchar](50) NOT NULL,
	[WholesalerAddress] [nvarchar](150) NOT NULL,
	[WholesalerPhone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedProduct](
	[ProductID] [int] NOT NULL,
	[ImportID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ImportedProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ImportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlacementDate] [date] NOT NULL,
	[RecipientName] [nvarchar](50) NOT NULL,
	[RecipientAddress] [nvarchar](150) NOT NULL,
	[RecipientPhone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedProduct](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderedProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [nvarchar](450) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[IsMain] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](50) NULL,
	[Category] [nvarchar](30) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[ImportPrice] [bigint] NOT NULL,
	[Stock] [bigint] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Import] ON 

INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (1, CAST(N'2020-02-01' AS Date), N'An', N'An', N'123456')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (2, CAST(N'2020-03-05' AS Date), N'B', N'B', N'125125')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (4, CAST(N'2020-12-11' AS Date), N'C', N'C', N'1122')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (5, CAST(N'2020-06-11' AS Date), N'E', N'E', N'2244')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (7, CAST(N'2020-06-13' AS Date), N'F', N'F', N'5566')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (8, CAST(N'2020-04-01' AS Date), N'T', N'T', N'534621356')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (9, CAST(N'2020-06-10' AS Date), N'Danh', N'Danh', N'12233445566')
INSERT [dbo].[Import] ([ID], [PlacementDate], [WholesalerName], [WholesalerAddress], [WholesalerPhone]) VALUES (10, CAST(N'2020-06-24' AS Date), N'S', N'S', N'112233445566')
SET IDENTITY_INSERT [dbo].[Import] OFF
GO
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (2, 1, 50)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (3, 2, 10)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (4, 2, 100)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (5, 1, 30)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (6, 4, 200)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (7, 5, 250)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (8, 8, 10)
INSERT [dbo].[ImportedProduct] ([ProductID], [ImportID], [Quantity]) VALUES (11, 7, 10)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (1, CAST(N'2020-02-01' AS Date), N'AA', N'A', N'123456')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (2, CAST(N'2020-05-01' AS Date), N'B', N'B', N'0332198693')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (3, CAST(N'2020-12-11' AS Date), N'C', N'C', N'6363')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (4, CAST(N'2020-12-11' AS Date), N'C', N'C', N'1122')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (5, CAST(N'2020-06-11' AS Date), N'E', N'E', N'2244')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (6, CAST(N'2020-05-01' AS Date), N'DD', N'DD', N'33443344')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (7, CAST(N'2020-06-13' AS Date), N'F', N'F', N'5566')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (9, CAST(N'2020-06-28' AS Date), N'G', N'G', N'111222333')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (10, CAST(N'2020-06-29' AS Date), N'H', N'H', N'122334455')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (1, 3, 15)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (2, 1, 5)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (2, 7, 10)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (3, 2, 1)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (3, 6, 40)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (3, 7, 20)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (4, 2, 10)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (4, 6, 15)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 1, 3)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 3, 15)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 6, 20)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 9, 5)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (6, 4, 20)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (6, 9, 5)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (6, 10, 10)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (7, 5, 25)
GO
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'czv21jwu18ifc6r7nvxw', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592921921/czv21jwu18ifc6r7nvxw.jpg', 1, 3)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'kixjupgkaax6qdc3eyaw', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592472946/kixjupgkaax6qdc3eyaw.jpg', 0, 1)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'l63xao7eyxv0z4rysqwo', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592924262/l63xao7eyxv0z4rysqwo.jpg', 0, 5)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'mreidramncazkfvti5je', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592919761/mreidramncazkfvti5je.jpg', 0, 2)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'ogqpeicvie65zpkid58j', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1593329802/ogqpeicvie65zpkid58j.jpg', 1, 7)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'prttuspwwclf7otzyv3s', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592923294/prttuspwwclf7otzyv3s.jpg', 1, 4)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'rumoz46dqmeap0vw8ljy', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592494173/rumoz46dqmeap0vw8ljy.jpg', 1, 2)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'u88xswfxjxm6sh8oyekn', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1593329729/u88xswfxjxm6sh8oyekn.jpg', 1, 6)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'ugb1duxknnofdcr2czun', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592924564/ugb1duxknnofdcr2czun.jpg', 0, 6)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'vrpaczpcwzuqyljjiqmv', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1593329415/vrpaczpcwzuqyljjiqmv.jpg', 1, 5)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'wbocnguj4fonrpec6haf', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592474948/wbocnguj4fonrpec6haf.jpg', 1, 1)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'xrem7akiatgrzrijt3qi', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1593535082/xrem7akiatgrzrijt3qi.jpg', 1, 11)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'zioeeup4bw8kg2mzkwbm', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1593535209/zioeeup4bw8kg2mzkwbm.jpg', 1, 8)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (1, N'Test api ', N'Test api', N'Test  rest', CAST(100.00 AS Decimal(18, 2)), 150, 250, CAST(N'2020-05-05' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (2, N'Tạ', N'Tạ tay', N'Bro', CAST(50.00 AS Decimal(18, 2)), 40, 190, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (3, N'Tạ tay', N'Bro', N'Tạ', CAST(100.00 AS Decimal(18, 2)), 50, 80, CAST(N'2020-04-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (4, N'Tạ đòn', N'Bros', N'Tạ', CAST(150.00 AS Decimal(18, 2)), 80, 8, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (5, N'Ghế ngang', N'Steel', N'Ghế', CAST(200.00 AS Decimal(18, 2)), 150, 10, CAST(N'2020-04-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (6, N'Ghế đứng', N'Steels', N'Ghế', CAST(250.00 AS Decimal(18, 2)), 200, 185, CAST(N'2020-03-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (7, N'Máy đi bộ', N'Jog', N'Máy cardio', CAST(300.00 AS Decimal(18, 2)), 200, 50, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (8, N'Máy chạy bộ edit', N'Jogss', N'Máy cardio', CAST(350.00 AS Decimal(18, 2)), 250, 60, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (9, N'Xà đơn', N'Adidas', N'Xà', CAST(200.00 AS Decimal(18, 2)), 150, 145, CAST(N'2020-02-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (10, N'Test editing', N'API', N'Delete', CAST(200.00 AS Decimal(18, 2)), 50, 100, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (11, N'Test input', N'API', N'Test', CAST(70.00 AS Decimal(18, 2)), 50, 20, CAST(N'2020-06-18' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (14, N'Test Api edit', N'Test', N'Test', CAST(150.00 AS Decimal(18, 2)), 100, 15, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (15, N'Test jersey 2.0', N'Test', N'Test', CAST(20.00 AS Decimal(18, 2)), 10, 10, CAST(N'2020-06-23' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (16, N'Test jersey part 2', N'Test', N'Test', CAST(20.00 AS Decimal(18, 2)), 10, 20, CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (17, N'test 5', N'test api 5', N'test 5', CAST(100.00 AS Decimal(18, 2)), 50, 15, CAST(N'2020-06-23' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (1, N'Admin', N'admin@gmail.com', N'$2a$10$FqAQj6gfqiIfeYsbm6Rat.N9Ymn6iqoUBxeyELgTQp6gpvE8SEdT6', N'Admin')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (2, N'Employee1', N'employee1@gmail.com', N'$2a$10$l6xBCYGJqNTESZp9CKc8h.oyKG2vDIOqIlRFkZIaS59uim0YBuTze', N'Employee')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (3, N'employee20', N'employee2@gmail.com', N'$2a$10$i.LpYNAxNUDXnKEE.uc.0.b1fRR.elICQV09z18uCAJRYesetOzMW', N'Employee')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (4, N'Employee3', N'employee3@gmail.com', N'$2a$10$7RYCTbjIfeSXGj714DF9S.Z5g40poNi9yRKHRXzEoVXXJUlvj1c2e', N'Employee')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (5, N'Employee4', N'employee4@gmail.com', N'$2a$10$84wg9/kUB8iaDDefzAGtO.oT4rXASAdio5BdkfVeOeCfa1hDb5nrq', N'Employee')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (6, N'Employee5', N'employee5@gmail.com', N'$2a$10$BJHKYZeQgjTjB4vmQeabR.NsnZDRXX54I5O/QcmqcVZciK1YAG7LK', N'Employee')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [Role]) VALUES (7, N'test', N'test@gmail.com', N'$2a$10$jfTJ0/3BP/kWZWFo/zatFuZqsjqp64RmzyX93u4H004MyoKwiK3ty', N'Employee')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0.0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('0001-01-01') FOR [DateAdded]
GO
ALTER TABLE [dbo].[ImportedProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImportImportedProduct] FOREIGN KEY([ImportID])
REFERENCES [dbo].[Import] ([ID])
GO
ALTER TABLE [dbo].[ImportedProduct] CHECK CONSTRAINT [FK_ImportImportedProduct]
GO
ALTER TABLE [dbo].[ImportedProduct]  WITH CHECK ADD  CONSTRAINT [FK_ProductImportedProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ImportedProduct] CHECK CONSTRAINT [FK_ProductImportedProduct]
GO
ALTER TABLE [dbo].[OrderedProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderOrderedProduct] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderedProduct] CHECK CONSTRAINT [FK_OrderOrderedProduct]
GO
ALTER TABLE [dbo].[OrderedProduct]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderedProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderedProduct] CHECK CONSTRAINT [FK_ProductOrderedProduct]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Product_ProductId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteImport]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_DeleteImport]
	@ID int
AS
BEGIN
	DELETE FROM [ImportedProduct] WHERE ImportID = @ID
	DELETE FROM [Import] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteImportedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_DeleteImportedProduct]
	@ImportID int
AS
BEGIN
	DELETE FROM [ImportedProduct] WHERE ImportID = @ImportID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteOrder]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_DeleteOrder]
	@ID int
AS
BEGIN
	DELETE FROM [OrderedProduct] WHERE OrderID = @ID
	DELETE FROM [Order] WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteOrderedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_DeleteOrderedProduct]
	@ID int
AS
BEGIN
	DELETE FROM [OrderedProduct] WHERE OrderID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FilterImport]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_FilterImport]
	@WholesalerName nvarchar(50) NULL,
	@WholesalerAddress nvarchar(150) NULL,
	@WholesalerPhone nvarchar(20) NULL,
	@PlacementDate date NULL
AS
BEGIN
	SELECT * FROM [Import]
	WHERE (@PlacementDate is NULL OR PlacementDate = @PlacementDate)
		AND (@WholesalerName is NULL OR @WholesalerName = '' OR WholesalerName LIKE '%' + @WholesalerName + '%')
		AND (@WholesalerAddress is NULL OR @WholesalerAddress = '' OR WholesalerAddress LIKE '%' + @WholesalerAddress + '%')
		AND (@WholesalerPhone is NULL OR @WholesalerPhone = '' OR WholesalerPhone LIKE '%' + @WholesalerPhone + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FilterOrder]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_FilterOrder] @name nvarchar(256) NULL,
	@address nvarchar(256) NULL,
	@phone nvarchar(256) NULL,
	@date Date null
AS
BEGIN
	SELECT * FROM [Order] WHERE 
	(@name is null or @name = '' or RecipientName like '%' + @name + '%') and
	(@address is null or @address = '' or RecipientAddress like '%' + @address + '%') and
	(@phone is null or @phone = '' or RecipientPhone like '%' + @phone + '%') and
	(@date is null or PlacementDate = @date)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FilterProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_FilterProduct]
	@name nvarchar(256) NULL,
	@brand nvarchar(256) NULL,
	@category nvarchar(256) NULL,
	@stock int null
AS
BEGIN
	SELECT * FROM [dbo].Product
	WHERE 
	(@name is null or @name = '' or Name like '%' + @name + '%') and
	(@brand is null or @brand = '' or Brand like '%' + @brand + '%') and
	(@category is null or @category = '' or Category like '%' + @category + '%') and
	(@stock is null or @stock=0 or Stock = @stock)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetProductsInImport]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_GetProductsInImport] @id int
AS
BEGIN
	SELECT Product.*, [ImportedProduct].ImportID, [ImportedProduct].Quantity 
	FROM [ImportedProduct]
	LEFT JOIN Product ON [ImportedProduct].ProductID = Product.ID
	WHERE ImportID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetProductsInOrder]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_GetProductsInOrder] @id int
AS
BEGIN
	SELECT Product.*, OrderedProduct.OrderID, OrderedProduct.Quantity 
	FROM OrderedProduct
	LEFT JOIN Product ON OrderedProduct.ProductID = Product.ID
	WHERE OrderID = @id
END

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertImport]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_InsertImport] 
	@PlacementDate date,
	@WholesalerName nvarchar(50),
	@WholesalerAddress nvarchar(150),
	@WholesalerPhone nvarchar(20)
AS
BEGIN
	INSERT INTO [dbo].[Import] (PlacementDate, WholesalerName, WholesalerAddress, WholesalerPhone) VALUES (@PlacementDate, @WholesalerName, @WholesalerAddress, @WholesalerPhone)
	SELECT @@IDENTITY AS ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertImportedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_InsertImportedProduct] 
	@ImportID int,
	@ProductID int,
	@Quantity int
AS
BEGIN
	INSERT INTO [dbo].[ImportedProduct] (ImportID, ProductID, Quantity) VALUES (@ImportID, @ProductID, @Quantity)
END

-- Update
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertOrder]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_InsertOrder] 
	@PlacementDate date,
	@RecipientName nvarchar(50),
	@RecipientAddress nvarchar(150),
	@RecipientPhone nvarchar(20)
AS
BEGIN
	INSERT INTO [dbo].[Order] (PlacementDate, RecipientName, RecipientAddress, RecipientPhone) VALUES (@PlacementDate, @RecipientName, @RecipientAddress, @RecipientPhone)
	SELECT @@IDENTITY AS ID
END

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertOrderedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_InsertOrderedProduct] 
	@ProductID int,
	@OrderID int,
	@Quantity int
AS
BEGIN
	INSERT INTO [dbo].[OrderedProduct] (OrderID, ProductID, Quantity) VALUES (@OrderID, @ProductID, @Quantity)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertPhoto]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_InsertPhoto] 
@id nvarchar(450), @url nvarchar(max), @isMain bit, @productId int   
as
begin
insert into Photo(Id, Url, IsMain, ProductId) values (@id, @url, @isMain, @productId)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_InsertProduct] 
@name nvarchar(100), @brand nvarchar(100), @category nvarchar(100), @price bigint, @importprice bigint, @stock int, @dateAdded Datetime          
as
begin
insert into Product(Name, Brand, Category, Price, ImportPrice, Stock, DateAdded) values (@name, @brand, @category, @price, @importprice, @stock, @dateAdded)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertUser]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[USP_InsertUser] 
@userName nvarchar(max), @email nvarchar(max), @password nvarchar(max), @role nvarchar(max)
as
begin
insert into Users(UserName, Email, Password, Role) values (@userName, @email, @password, @role)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateImport]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_UpdateImport]
	@ID int,
	@PlacementDate date,
	@WholesalerName nvarchar(50),
	@WholesalerAddress nvarchar(150),
	@WholesalerPhone nvarchar(20)
AS
BEGIN
	UPDATE [dbo].[Import] SET PlacementDate=@PlacementDate, WholesalerName=@WholesalerName, WholesalerAddress=@WholesalerAddress, WholesalerPhone=@WholesalerPhone WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateImportedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_UpdateImportedProduct]
	@ImportID int,
	@ProductID int,
	@Quantity int
AS
BEGIN
	UPDATE [ImportedProduct] SET Quantity=@Quantity WHERE ProductID = @ProductID AND ImportID = @ImportID
END

-- Delete
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateOrder]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_UpdateOrder] 
	@ID int,
	@PlacementDate date,
	@RecipientName nvarchar(50),
	@RecipientAddress nvarchar(150),
	@RecipientPhone nvarchar(20)
AS
BEGIN
	UPDATE [Order] SET PlacementDate=@PlacementDate, RecipientName=@RecipientName, RecipientAddress=@RecipientAddress, RecipientPhone=@RecipientPhone WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateOrderedProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[USP_UpdateOrderedProduct]
	@ProductID int,
	@OrderID int,
	@Quantity int
AS
BEGIN
	UPDATE [OrderedProduct] SET Quantity=@Quantity WHERE ProductID = @ProductID AND OrderID = @OrderID
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateProduct]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_UpdateProduct] @id int, 
@name nvarchar(100), @brand nvarchar(100), @category nvarchar(100), @price bigint, @importprice bigint, @stock int, @dateAdded Datetime         
as
begin
update Product set Name=@name, Brand=@brand, Category=@category, Price=@price, ImportPrice=@importprice, Stock=@stock, DateAdded=@dateAdded where Id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateRole]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_UpdateRole] 
 @email nvarchar(max),  @role nvarchar(max)
as
begin
update Users set Role=@role where Email=@email
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateUser]    Script Date: 01-Jul-20 11:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateUser] @userName nvarchar(max), @email nvarchar(max), @password nvarchar(max)
as
begin
if(@password!='')
update Users set UserName=@userName, Password=@password where Email=@email
else
update Users set UserName=@userName where Email=@email
end
GO
USE [master]
GO
ALTER DATABASE [SportsStoreJEE] SET  READ_WRITE 
GO
