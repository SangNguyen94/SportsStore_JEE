USE [master]
GO
/****** Object:  Database [SportsStoreJEE]    Script Date: 26-Jun-20 8:03:15 PM ******/
CREATE DATABASE [SportsStoreJEE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportsStoreJEE', FILENAME = N'G:\Program File\SQL Sever\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SportsStoreJEE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportsStoreJEE_log', FILENAME = N'G:\Program File\SQL Sever\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SportsStoreJEE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
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
/****** Object:  Table [dbo].[Order]    Script Date: 26-Jun-20 8:03:15 PM ******/
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
/****** Object:  Table [dbo].[OrderedProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 26-Jun-20 8:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (1, CAST(N'2020-02-01' AS Date), N'A', N'A', N'123456')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (2, CAST(N'2020-05-01' AS Date), N'AA', N'AA', N'1231241241')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (3, CAST(N'2020-12-11' AS Date), N'C', N'C', N'6363')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (4, CAST(N'2020-12-11' AS Date), N'C', N'C', N'1122')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (5, CAST(N'2020-06-11' AS Date), N'E', N'E', N'2244')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (6, CAST(N'2020-06-12' AS Date), N'D', N'D', N'3344')
INSERT [dbo].[Order] ([ID], [PlacementDate], [RecipientName], [RecipientAddress], [RecipientPhone]) VALUES (7, CAST(N'2020-06-13' AS Date), N'F', N'F', N'5566')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (1, 3, 15)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (2, 1, 5)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (3, 2, 1)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (4, 2, 10)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 1, 3)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (5, 3, 15)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (6, 4, 20)
INSERT [dbo].[OrderedProduct] ([ProductID], [OrderID], [Quantity]) VALUES (7, 5, 25)
GO
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'czv21jwu18ifc6r7nvxw', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592921921/czv21jwu18ifc6r7nvxw.jpg', 1, 3)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'kixjupgkaax6qdc3eyaw', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592472946/kixjupgkaax6qdc3eyaw.jpg', 0, 1)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'l63xao7eyxv0z4rysqwo', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592924262/l63xao7eyxv0z4rysqwo.jpg', 1, 5)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'mreidramncazkfvti5je', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592919761/mreidramncazkfvti5je.jpg', 0, 2)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'prttuspwwclf7otzyv3s', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592923294/prttuspwwclf7otzyv3s.jpg', 1, 4)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'rumoz46dqmeap0vw8ljy', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592494173/rumoz46dqmeap0vw8ljy.jpg', 1, 2)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'ugb1duxknnofdcr2czun', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592924564/ugb1duxknnofdcr2czun.jpg', 1, 6)
INSERT [dbo].[Photo] ([Id], [Url], [IsMain], [ProductId]) VALUES (N'wbocnguj4fonrpec6haf', N'http://res.cloudinary.com/dufu5w88w/image/upload/v1592474948/wbocnguj4fonrpec6haf.jpg', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (1, N'Test api', N'Test api', N'Test  rest', CAST(100.00 AS Decimal(18, 2)), 150, 200, CAST(N'2020-05-05' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (2, N'Tạ', N'Tạ tay', N'Bro', CAST(50.00 AS Decimal(18, 2)), 40, 200, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (3, N'Tạ tay', N'Bro', N'Tạ', CAST(100.00 AS Decimal(18, 2)), 50, 100, CAST(N'2020-04-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (4, N'Tạ đòn', N'Bros', N'Tạ', CAST(150.00 AS Decimal(18, 2)), 80, 8, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (5, N'Ghế ngang', N'Steel', N'Ghế', CAST(200.00 AS Decimal(18, 2)), 150, 15, CAST(N'2020-04-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (6, N'Ghế đứng', N'Steels', N'Ghế', CAST(250.00 AS Decimal(18, 2)), 200, 200, CAST(N'2020-03-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (7, N'Máy đi bộ', N'Jog', N'Máy cardio', CAST(300.00 AS Decimal(18, 2)), 200, 50, CAST(N'2020-04-02' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (8, N'Máy chạy bộ edit', N'Jogss', N'Máy cardio', CAST(350.00 AS Decimal(18, 2)), 250, 50, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (9, N'Xà đơn', N'Adidas', N'Xà', CAST(200.00 AS Decimal(18, 2)), 150, 145, CAST(N'2020-02-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (10, N'Test editing', N'API', N'Delete', CAST(200.00 AS Decimal(18, 2)), 50, 100, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (11, N'Test input', N'API', N'Test', CAST(70.00 AS Decimal(18, 2)), 50, 10, CAST(N'2020-06-18' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (14, N'Test Api edit', N'Test', N'Test', CAST(150.00 AS Decimal(18, 2)), 100, 15, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (15, N'Test jersey 2.0', N'Test', N'Test', CAST(20.00 AS Decimal(18, 2)), 10, 10, CAST(N'2020-06-23' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (16, N'Test jersey part 2', N'Test', N'Test', CAST(20.00 AS Decimal(18, 2)), 10, 20, CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Category], [Price], [ImportPrice], [Stock], [DateAdded]) VALUES (17, N'test 5', N'test api 5', N'test 5', CAST(100.00 AS Decimal(18, 2)), 50, 15, CAST(N'2020-06-23' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (3, N'testing', N'test@gmail.com', N'$2a$10$Lh4JeqeXmXtOv4dkQ2AxZuq5446jh3s.Ambja0mzZPlaxdw5xpeHy', 1)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (4, N'employee1', N'employee1@gmail.com', N'$2a$10$z6/w/q.SFxBEWMLDmfw3D.7y.PBvGkhk1aPNOUSb1iKZDCq1o5syG', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (5, N'employee2', N'employee2@gmail.com', N'$2a$10$JL/agAsJXTZxgpWfMxde3eTD2c9UXIfsKzve5J7AMcXFKDkoIh5Cm', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (7, N'employee30', N'employee3@gmail.com', N'$2a$10$n3MK9T0lnlkg2tWvdwV2z.ZiKRGdewfxL4SXcnXmZhPa4vjkUYb9C', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (8, N'kaos', N'kaos@gmail.com', N'$2a$10$yCH8H1C3KbXy.WbwBZQ9YOoRZEwlIP7d9v4EVVGEwzf5Q8eGo.k/6', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (9, N'troll', N'troll@gmail.com', N'$2a$10$6BiFt97iiSn2B9xzv3Zw.urxeGYBji7MQD/b/I39zQP9w6isw3XkW', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (10, N'test1', N'test1@gmail.com', N'$2a$10$AVCeFaRbkaCZFnSBwazedOEU/cDNCp16UUVwS2cpV8SS/ytnf.nAO', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Password], [IsAdmin]) VALUES (11, N'test2', N'test2@gmail.com', N'$2a$10$G/650NXoitvZGssEG4djOe4YZhl.A4UZ6zCLHE1DEmM86aN2X8aoW', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0.0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('0001-01-01') FOR [DateAdded]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('FALSE') FOR [IsAdmin]
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
/****** Object:  StoredProcedure [dbo].[USP_DeleteOrder]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
EXEC USP_InsertOrderedProduct 3, 14, 15
GO
/****** Object:  StoredProcedure [dbo].[USP_FilterOrder]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_FilterProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_GetProductsInOrder]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertOrder]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertOrderedProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertPhoto]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_InsertUser]    Script Date: 26-Jun-20 8:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_InsertUser] 
@userName nvarchar(max), @email nvarchar(max), @password nvarchar(max)
as
begin
insert into Users(UserName, Email, Password) values (@userName, @email, @password)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateOrder]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateOrderedProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateProduct]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UpdateUser]    Script Date: 26-Jun-20 8:03:16 PM ******/
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
