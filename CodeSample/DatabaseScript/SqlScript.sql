﻿
USE [NorthWindAzure]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[ContactTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerIdentifier] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[ContactTypeIdentifier] [int] NULL,
 CONSTRAINT [PK_Customers_1] PRIMARY KEY CLUSTERED 
(
	[CustomerIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)),
	[Quantity] [smallint] NOT NULL CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)),
	[Discount] [real] NOT NULL CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)),
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerIdentifier] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)),
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)),
	[UnitsInStock] [smallint] NULL CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)),
	[UnitsOnOrder] [smallint] NULL CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)),
	[ReorderLevel] [smallint] NULL CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)),
	[Discontinued] [bit] NOT NULL CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)),
	[DiscontinuedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportParameters]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportParameters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StatementId] [int] NULL,
	[ParameterName] [nvarchar](max) NULL,
	[ParameterValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportParameters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportStatements]    Script Date: 11/17/2017 6:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportStatements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NULL,
	[Statement] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportStatements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ContactType] ON 

GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (1, N'Accounting Manager')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (2, N'Assistant Sales Agent')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (3, N'Assistant Sales Representative')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (4, N'Marketing Assistant')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (5, N'Marketing Manager')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (6, N'Order Administrator')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (7, N'Owner')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (8, N'Owner/Marketing Assistant')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (9, N'Sales Agent')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (10, N'Sales Associate')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (11, N'Sales Manager')
GO
INSERT [dbo].[ContactType] ([ContactTypeIdentifier], [ContactTitle]) VALUES (12, N'Sales Representative')
GO
SET IDENTITY_INSERT [dbo].[ContactType] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (1, N'Alfreds Futterkiste', N'Maria Anders', N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany', N'030-0074321', N'030-0076545', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (2, N'Ana Trujillo Emparedados y helados', N'Ana Trujillo', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'Mexico', N'(5) 555-4729', N'(5) 555-3745', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (3, N'Antonio Moreno Taquería', N'Antonio Moreno', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico', N'(5) 555-3932', NULL, 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (4, N'Around the Horn', N'Thomas Hardy', N'120 Hanover Sq.', N'London', NULL, N'WA1 1DP', N'UK', N'(171) 555-7788', N'(171) 555-6750', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (5, N'Berglunds snabbköp', N'Christina Berglund', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden', N'0921-12 34 65', N'0921-12 34 67', 6)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (6, N'Blauer See Delikatessen', N'Hanna Moos', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany', N'0621-08460', N'0621-08924', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (7, N'Blondesddsl père et fils', N'Frédérique Citeaux', N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France', N'88.60.15.31', N'88.60.15.32', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (8, N'Bólido Comidas preparadas', N'Martín Sommer', N'C/ Araquil, 67', N'Madrid', NULL, N'28023', N'Spain', N'(91) 555 22 82', N'(91) 555 91 99', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (9, N'Bon app''', N'Laurence Lebihan', N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France', N'91.24.45.40', N'91.24.45.41', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (10, N'B''s Beverages', N'Victoria Ashworth', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK', N'(171) 555-1212', NULL, 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (11, N'Cactus Comidas para llevar', N'Patricio Simpson', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 135-5555', N'(1) 135-4892', 9)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (12, N'Centro comercial Moctezuma', N'Francisco Chang', N'Sierras de Granada 9993', N'México D.F.', NULL, N'05022', N'Mexico', N'(5) 555-3392', N'(5) 555-7293', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (13, N'Chop-suey Chinese', N'Yang Wang', N'Hauptstr. 29', N'Bern', NULL, N'3012', N'Switzerland', N'0452-076545', NULL, 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (14, N'Consolidated Holdings', N'Elizabeth Brown', N'Berkeley Gardens 12  Brewery', N'London', NULL, N'WX1 6LT', N'UK', N'(171) 555-2282', N'(171) 555-9199', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (15, N'Drachenblut Delikatessen', N'Sven Ottlieb', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany', N'0241-039123', N'0241-059428', 6)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (16, N'Du monde entier', N'Janine Labrune', N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'France', N'40.67.88.88', N'40.67.89.89', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (17, N'Eastern Connection', N'Ann Devon', N'35 King George', N'London', NULL, N'WX3 6FW', N'UK', N'(171) 555-0297', N'(171) 555-3373', 9)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (18, N'Ernst Handel', N'Roland Mendel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', N'7675-3425', N'7675-3426', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (19, N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'C/ Moralzarzal, 86', N'Madrid', NULL, N'28034', N'Spain', N'(91) 555 94 44', N'(91) 555 55 93', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (20, N'Folies gourmandes', N'Martine Rancé', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France', N'20.16.10.16', N'20.16.10.17', 2)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (21, N'Folk och fä HB', N'Maria Larsson', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', N'0695-34 67 21', NULL, 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (22, N'Frankenversand', N'Peter Franken', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', N'089-0877310', N'089-0877451', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (23, N'France restauration', N'Carine Schmitt', N'54, rue Royale', N'Nantes', NULL, N'44000', N'France', N'40.32.21.21', N'40.32.21.20', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (24, N'Franchi S.p.A.', N'Paolo Accorti', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy', N'011-4988260', N'011-4988261', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (25, N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', N'(1) 354-2534', N'(1) 354-2535', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (26, N'Galería del gastrónomo', N'Eduardo Saavedra', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'08022', N'Spain', N'(93) 203 4560', N'(93) 203 4561', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (27, N'Godos Cocina Típica', N'José Pedro Freyre', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain', N'(95) 555 82 82', NULL, 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (28, N'Königlich Essen', N'Philip Cramer', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany', N'0555-09876', NULL, 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (29, N'La corne d''abondance', N'Daniel Tonini', N'67, avenue de l''Europe', N'Versailles', NULL, N'78000', N'France', N'30.59.84.10', N'30.59.85.11', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (30, N'La maison d''Asie', N'Annette Roulet', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France', N'61.77.61.10', N'61.77.61.11', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (31, N'Lehmanns Marktstand', N'Renate Messner', N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany', N'069-0245984', N'069-0245874', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (32, N'Magazzini Alimentari Riuniti', N'Giovanni Rovelli', N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy', N'035-640230', N'035-640231', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (33, N'Maison Dewey', N'Catherine Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium', N'(02) 201 24 67', N'(02) 201 24 68', 9)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (34, N'Morgenstern Gesundkost', N'Alexander Feuer', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany', N'0342-023176', NULL, 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (35, N'North/South', N'Simon Crowther', N'South House 300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'UK', N'(171) 555-7733', N'(171) 555-2530', 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (36, N'Océano Atlántico Ltda.', N'Yvonne Moncada', N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 135-5333', N'(1) 135-5535', 9)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (37, N'Ottilies Käseladen', N'Henriette Pfalzheim', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany', N'0221-0644327', N'0221-0765721', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (38, N'Paris spécialités', N'Marie Bertrand', N'265, boulevard Charonne', N'Paris', NULL, N'75012', N'France', N'(1) 42.34.22.66', N'(1) 42.34.22.77', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (39, N'Pericles Comidas clásicas', N'Guillermo Fernández', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico', N'(5) 552-3745', N'(5) 545-3745', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (40, N'Piccolo und mehr', N'Georg Pipps', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria', N'6562-9722', N'6562-9723', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (41, N'Princesa Isabel Vinhos', N'Isabel de Castro', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal', N'(1) 356-5634', NULL, 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (42, N'QUICK Stop', N'Horst Kloss', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany', N'0372-035188', NULL, 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (43, N'Rancho grande', N'Sergio Gutiérrez', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 123-5555', N'(1) 123-5556', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (44, N'Reggiani Caseifici', N'Maurizio Moroni', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy', N'0522-556721', N'0522-556722', 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (45, N'Richter Supermarkt', N'Michael Holz', N'Grenzacherweg 237', N'Genève', NULL, N'1203', N'Switzerland', N'0897-034214', NULL, 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (46, N'Romero y tomillo', N'Alejandra Camino', N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain', N'(91) 745 6200', N'(91) 745 6210', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (47, N'Santé Gourmet', N'Jonas Bergulfsen', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway', N'07-98 92 35', N'07-98 92 47', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (48, N'Seven Seas Imports', N'Hari Kumar', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK', N'(171) 555-1717', N'(171) 555-5646', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (49, N'Simons bistro', N'Jytte Petersen', N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark', N'31 12 34 56', N'31 13 35 57', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (50, N'Spécialités du monde', N'Dominique Perrier', N'25, rue Lauriston', N'Paris', NULL, N'75016', N'France', N'(1) 47.55.60.10', N'(1) 47.55.60.20', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (51, N'Suprêmes délices', N'Pascale Cartrain', N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium', N'(071) 23 67 22 20', N'(071) 23 67 22 21', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (52, N'Toms Spezialitäten', N'Karin Josephs', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany', N'0251-031259', N'0251-035695', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (53, N'Tortuga Restaurante', N'Miguel Angel Paolino', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico', N'(5) 555-2933', NULL, 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (54, N'Vaffeljernet', N'Palle Ibsen', N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark', N'86 21 32 43', N'86 22 33 44', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (55, N'Victuailles en stock', N'Mary Saveley', N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France', N'78.32.54.86', N'78.32.54.87', 9)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (56, N'Vins et alcools Chevalier', N'Paul Henriot', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France', N'26.47.15.10', N'26.47.15.11', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (57, N'Die Wandernde Kuh', N'Rita Müller', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany', N'0711-020361', N'0711-035428', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (58, N'Wartian Herkku', N'Pirkko Koskitalo', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland', N'981-443655', N'981-443655', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (59, N'Wilman Kala', N'Matti Karttunen', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland', N'90-224 8858', N'90-224 8858', 8)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (60, N'Wolski  Zajazd', N'Zbyszek Piestrzeniewicz', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland', N'(26) 642-7012', N'(26) 642-7012', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (61, N'Old World Delicatessen', N'Rene Phillips', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA', N'(907) 555-7584', N'(907) 555-2880', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (62, N'Bottom-Dollar Markets', N'Elizabeth Lincoln', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada', N'(604) 555-4729', N'(604) 555-3745', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (63, N'Laughing Bacchus Wine Cellars', N'Yoshi Tannamuri', N'1900 Oak St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada', N'(604) 555-3392', N'(604) 555-7293', 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (64, N'Let''s Stop N Shop', N'Jaime Yorres', N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA', N'(415) 555-5938', NULL, 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (65, N'Hungry Owl All-Night Grocers', N'Patricia McKenna', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland', N'2967 542', N'2967 3333', 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (66, N'GROSELLA-Restaurante', N'Manuel Pereira', N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela', N'(2) 283-2951', N'(2) 283-3397', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (67, N'Save-a-lot Markets', N'Jose Pavarotti', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA', N'(208) 555-8097', NULL, 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (68, N'Island Trading', N'Helen Bennett', N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK', N'(198) 555-8888', NULL, 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (69, N'LILA-Supermercado', N'Carlos González', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela', N'(9) 331-6954', N'(9) 331-7256', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (70, N'The Cracker Box', N'Liu Wong', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'USA', N'(406) 555-5834', N'(406) 555-8083', 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (71, N'Rattlesnake Canyon Grocery', N'Paula Wilson', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA', N'(505) 555-5939', N'(505) 555-3620', 3)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (72, N'LINO-Delicateses', N'Felipe Izquierdo', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela', N'(8) 34-56-12', N'(8) 34-93-93', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (73, N'Great Lakes Food Market', N'Howard Snyder', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA', N'(503) 555-7555', NULL, 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (74, N'Hungry Coyote Import Store', N'Yoshi Latimer', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA', N'(503) 555-6874', N'(503) 555-2376', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (75, N'Lonesome Pine Restaurant', N'Fran Wilson', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA', N'(503) 555-9573', N'(503) 555-9646', 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (76, N'The Big Cheese', N'Liz Nixon', N'89 Jefferson Way Suite 2', N'Portland', N'OR', N'97201', N'USA', N'(503) 555-3612', NULL, 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (77, N'Mère Paillarde', N'Jean Fresnière', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada', N'(514) 555-8054', N'(514) 555-8055', 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (78, N'Hanari Carnes', N'Mario Pontes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil', N'(21) 555-0091', N'(21) 555-8765', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (79, N'Que Delícia', N'Bernardo Batista', N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil', N'(21) 555-4252', N'(21) 555-4545', 1)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (80, N'Ricardo Adocicados', N'Janete Limeira', N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil', N'(21) 555-3412', NULL, 2)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (81, N'Comércio Mineiro', N'Pedro Afonso', N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil', N'(11) 555-7647', NULL, 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (82, N'Familia Arquibaldo', N'Aria Cruz', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', N'(11) 555-9857', NULL, 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (83, N'Gourmet Lanchonetes', N'André Fonseca', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil', N'(11) 555-9482', NULL, 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (84, N'Queen Cozinha', N'Lúcia Carvalho', N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil', N'(11) 555-1189', NULL, 4)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (85, N'Tradição Hipermercados', N'Anabela Domingues', N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil', N'(11) 555-2167', N'(11) 555-2168', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (86, N'Wellington Importadora', N'Paula Parente', N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil', N'(14) 555-8122', NULL, 11)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (87, N'HILARION-Abastos', N'Carlos Hernández', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', N'(5) 555-1340', N'(5) 555-1948', 12)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (88, N'Lazy K Kountry Store', N'John Steel', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'USA', N'(509) 555-7969', N'(509) 555-6221', 5)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (89, N'Trail''s Head Gourmet Provisioners', N'Helvetius Nagy', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA', N'(206) 555-8257', N'(206) 555-2174', 10)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (90, N'White Clover Markets', N'Karl Jablonski', N'305 - 14th Ave. S. Suite 3B', N'Seattle', N'WA', N'98128', N'USA', N'(206) 555-4112', N'(206) 555-4115', 7)
GO
INSERT [dbo].[Customers] ([CustomerIdentifier], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [ContactTypeIdentifier]) VALUES (91, N'Split Rail Beer & Ale', N'Art Braunschweiger', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA', N'(307) 555-4680', N'(307) 555-6525', 11)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10248, 11, 14.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10248, 42, 9.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10248, 72, 34.8000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10249, 14, 18.6000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10249, 51, 42.4000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10250, 41, 7.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10250, 51, 42.4000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10250, 65, 16.8000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10251, 22, 16.8000, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10251, 57, 15.6000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10251, 65, 16.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10252, 20, 64.8000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10252, 33, 2.0000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10252, 60, 27.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10253, 31, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10253, 39, 14.4000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10253, 49, 16.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10254, 24, 3.6000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10254, 55, 19.2000, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10254, 74, 8.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10255, 2, 15.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10255, 16, 13.9000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10255, 36, 15.2000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10255, 59, 44.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10256, 53, 26.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10256, 77, 10.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10257, 27, 35.1000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10257, 39, 14.4000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10257, 77, 10.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10258, 2, 15.2000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10258, 5, 17.0000, 65, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10258, 32, 25.6000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10259, 21, 8.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10259, 37, 20.8000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10260, 41, 7.7000, 16, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10260, 57, 15.6000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10260, 62, 39.4000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10260, 70, 12.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10261, 21, 8.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10261, 35, 14.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10262, 5, 17.0000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10262, 7, 24.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10262, 56, 30.4000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10263, 16, 13.9000, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10263, 24, 3.6000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10263, 30, 20.7000, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10263, 74, 8.0000, 36, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10264, 2, 15.2000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10264, 41, 7.7000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10265, 17, 31.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10265, 70, 12.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10266, 12, 30.4000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10267, 40, 14.7000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10267, 59, 44.0000, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10267, 76, 14.4000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10268, 29, 99.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10268, 72, 27.8000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10269, 33, 2.0000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10269, 72, 27.8000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10270, 36, 15.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10270, 43, 36.8000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10271, 33, 2.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10272, 20, 64.8000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10272, 31, 10.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10272, 72, 27.8000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10273, 10, 24.8000, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10273, 31, 10.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10273, 33, 2.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10273, 40, 14.7000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10273, 76, 14.4000, 33, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10274, 71, 17.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10274, 72, 27.8000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10275, 24, 3.6000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10275, 59, 44.0000, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10276, 10, 24.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10276, 13, 4.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10277, 28, 36.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10277, 62, 39.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10278, 44, 15.5000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10278, 59, 44.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10278, 63, 35.1000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10278, 73, 12.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10279, 17, 31.2000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10280, 24, 3.6000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10280, 55, 19.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10280, 75, 6.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10281, 19, 7.3000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10281, 24, 3.6000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10281, 35, 14.4000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10282, 30, 20.7000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10282, 57, 15.6000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10283, 15, 12.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10283, 19, 7.3000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10283, 60, 27.2000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10283, 72, 27.8000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10284, 27, 35.1000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10284, 44, 15.5000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10284, 60, 27.2000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10284, 67, 11.2000, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10285, 1, 14.4000, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10285, 40, 14.7000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10285, 53, 26.2000, 36, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10286, 35, 14.4000, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10286, 62, 39.4000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10287, 16, 13.9000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10287, 34, 11.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10287, 46, 9.6000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10288, 54, 5.9000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10288, 68, 10.0000, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10289, 3, 8.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10289, 64, 26.6000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10290, 5, 17.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10290, 29, 99.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10290, 49, 16.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10290, 77, 10.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10291, 13, 4.8000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10291, 44, 15.5000, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10291, 51, 42.4000, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10292, 20, 64.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10293, 18, 50.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10293, 24, 3.6000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10293, 63, 35.1000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10293, 75, 6.2000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10294, 1, 14.4000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10294, 17, 31.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10294, 43, 36.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10294, 60, 27.2000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10294, 75, 6.2000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10295, 56, 30.4000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10296, 11, 16.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10296, 16, 13.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10296, 69, 28.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10297, 39, 14.4000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10297, 72, 27.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10298, 2, 15.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10298, 36, 15.2000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10298, 59, 44.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10298, 62, 39.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10299, 19, 7.3000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10299, 70, 12.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10300, 66, 13.6000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10300, 68, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10301, 40, 14.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10301, 56, 30.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10302, 17, 31.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10302, 28, 36.4000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10302, 43, 36.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 40, 14.7000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 65, 16.8000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 68, 10.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10304, 49, 16.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10304, 59, 44.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10304, 71, 17.2000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10305, 18, 50.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10305, 29, 99.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10305, 39, 14.4000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10306, 30, 20.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10306, 53, 26.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10306, 54, 5.9000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10307, 62, 39.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10307, 68, 10.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10308, 69, 28.8000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10308, 70, 12.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10309, 4, 17.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10309, 6, 20.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10309, 42, 11.2000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10309, 43, 36.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10309, 71, 17.2000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10310, 16, 13.9000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10310, 62, 39.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10311, 42, 11.2000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10311, 69, 28.8000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10312, 28, 36.4000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10312, 43, 36.8000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10312, 53, 26.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10312, 75, 6.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10313, 36, 15.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10314, 32, 25.6000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10314, 58, 10.6000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10314, 62, 39.4000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10315, 34, 11.2000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10315, 70, 12.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10316, 41, 7.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10316, 62, 39.4000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10317, 1, 14.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10318, 41, 7.7000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10318, 76, 14.4000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10319, 17, 31.2000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10319, 28, 36.4000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10319, 76, 14.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10320, 71, 17.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10321, 35, 14.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10322, 52, 5.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10323, 15, 12.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10323, 25, 11.2000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10323, 39, 14.4000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10324, 16, 13.9000, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10324, 35, 14.4000, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10324, 46, 9.6000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10324, 59, 44.0000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10324, 63, 35.1000, 80, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10325, 6, 20.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10325, 13, 4.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10325, 14, 18.6000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10325, 31, 10.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10325, 72, 27.8000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10326, 4, 17.6000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10326, 57, 15.6000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10326, 75, 6.2000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 2, 15.2000, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 11, 16.8000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 30, 20.7000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 58, 10.6000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10328, 59, 44.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10328, 65, 16.8000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10328, 68, 10.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10329, 19, 7.3000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10329, 30, 20.7000, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10329, 38, 210.8000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10329, 56, 30.4000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10330, 26, 24.9000, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10330, 72, 27.8000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10331, 54, 5.9000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10332, 18, 50.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10332, 42, 11.2000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10332, 47, 7.6000, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10333, 14, 18.6000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10333, 21, 8.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10333, 71, 17.2000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10334, 52, 5.6000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10334, 68, 10.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10335, 2, 15.2000, 7, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10335, 31, 10.0000, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10335, 32, 25.6000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10335, 51, 42.4000, 48, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10336, 4, 17.6000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 23, 7.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 26, 24.9000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 36, 15.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 37, 20.8000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 72, 27.8000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10338, 17, 31.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10338, 30, 20.7000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10339, 4, 17.6000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10339, 17, 31.2000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10339, 62, 39.4000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10340, 18, 50.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10340, 41, 7.7000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10340, 43, 36.8000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10341, 33, 2.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10341, 59, 44.0000, 9, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 2, 15.2000, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 31, 10.0000, 56, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 36, 15.2000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 55, 19.2000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10343, 64, 26.6000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10343, 68, 10.0000, 4, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10343, 76, 14.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10344, 4, 17.6000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10344, 8, 32.0000, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10345, 8, 32.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10345, 19, 7.3000, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10345, 42, 11.2000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10346, 17, 31.2000, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10346, 56, 30.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 25, 11.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 39, 14.4000, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 40, 14.7000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 75, 6.2000, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10348, 1, 14.4000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10348, 23, 7.2000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10349, 54, 5.9000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10350, 50, 13.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10350, 69, 28.8000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10351, 38, 210.8000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10351, 41, 7.7000, 13, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10351, 44, 15.5000, 77, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10351, 65, 16.8000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10352, 24, 3.6000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10352, 54, 5.9000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10353, 11, 16.8000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10353, 38, 210.8000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10354, 1, 14.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10354, 29, 99.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10355, 24, 3.6000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10355, 57, 15.6000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10356, 31, 10.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10356, 55, 19.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10356, 69, 28.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10357, 10, 24.8000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10357, 26, 24.9000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10357, 60, 27.2000, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10358, 24, 3.6000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10358, 34, 11.2000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10358, 36, 15.2000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10359, 16, 13.9000, 56, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10359, 31, 10.0000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10359, 60, 27.2000, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10360, 28, 36.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10360, 29, 99.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10360, 38, 210.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10360, 49, 16.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10360, 54, 5.9000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10361, 39, 14.4000, 54, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10361, 60, 27.2000, 55, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10362, 25, 11.2000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10362, 51, 42.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10362, 54, 5.9000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10363, 31, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10363, 75, 6.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10363, 76, 14.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10364, 69, 28.8000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10364, 71, 17.2000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10365, 11, 16.8000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10366, 65, 16.8000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10366, 77, 10.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10367, 34, 11.2000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10367, 54, 5.9000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10367, 65, 16.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10367, 77, 10.4000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 21, 8.0000, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 28, 36.4000, 13, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 57, 15.6000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 64, 26.6000, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10369, 29, 99.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10369, 56, 30.4000, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10370, 1, 14.4000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10370, 64, 26.6000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10370, 74, 8.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10371, 36, 15.2000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10372, 20, 64.8000, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10372, 38, 210.8000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10372, 60, 27.2000, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10372, 72, 27.8000, 42, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10373, 58, 10.6000, 80, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10373, 71, 17.2000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10374, 31, 10.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10374, 58, 10.6000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10375, 14, 18.6000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10375, 54, 5.9000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10376, 31, 10.0000, 42, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10377, 28, 36.4000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10377, 39, 14.4000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10378, 71, 17.2000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10379, 41, 7.7000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10379, 63, 35.1000, 16, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10379, 65, 16.8000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10380, 30, 20.7000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10380, 53, 26.2000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10380, 60, 27.2000, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10380, 70, 12.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10381, 74, 8.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 5, 17.0000, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 18, 50.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 29, 99.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 33, 2.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 74, 8.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10383, 13, 4.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10383, 50, 13.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10383, 56, 30.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10384, 20, 64.8000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10384, 60, 27.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10385, 7, 24.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10385, 60, 27.2000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10385, 68, 10.0000, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10386, 24, 3.6000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10386, 34, 11.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10387, 24, 3.6000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10387, 28, 36.4000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10387, 59, 44.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10387, 71, 17.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10388, 45, 7.6000, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10388, 52, 5.6000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10388, 53, 26.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10389, 10, 24.8000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10389, 55, 19.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10389, 62, 39.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10389, 70, 12.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 31, 10.0000, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 35, 14.4000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 46, 9.6000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 72, 27.8000, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10391, 13, 4.8000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10392, 69, 28.8000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10393, 2, 15.2000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10393, 14, 18.6000, 42, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10393, 25, 11.2000, 7, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10393, 26, 24.9000, 70, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10393, 31, 10.0000, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10394, 13, 4.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10394, 62, 39.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 46, 9.6000, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 53, 26.2000, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 69, 28.8000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 23, 7.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 71, 17.2000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 72, 27.8000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10397, 21, 8.0000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10397, 51, 42.4000, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10398, 35, 14.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10398, 55, 19.2000, 120, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10399, 68, 10.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10399, 71, 17.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10399, 76, 14.4000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10399, 77, 10.4000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10400, 29, 99.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10400, 35, 14.4000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10400, 49, 16.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10401, 30, 20.7000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10401, 56, 30.4000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10401, 65, 16.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10401, 71, 17.2000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10402, 23, 7.2000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10402, 63, 35.1000, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10403, 16, 13.9000, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10403, 48, 10.2000, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10404, 26, 24.9000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10404, 42, 11.2000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10404, 49, 16.0000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10405, 3, 8.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10406, 1, 14.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10406, 21, 8.0000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10406, 28, 36.4000, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10406, 36, 15.2000, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10406, 40, 14.7000, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10407, 11, 16.8000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10407, 69, 28.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10407, 71, 17.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 37, 20.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 54, 5.9000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 62, 39.4000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10409, 14, 18.6000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10409, 21, 8.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10410, 33, 2.0000, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10410, 59, 44.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10411, 41, 7.7000, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10411, 44, 15.5000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10411, 59, 44.0000, 9, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10412, 14, 18.6000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10413, 1, 14.4000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10413, 62, 39.4000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10413, 76, 14.4000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10414, 19, 7.3000, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10414, 33, 2.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10415, 17, 31.2000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10415, 33, 2.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10416, 19, 7.3000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10416, 53, 26.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10416, 57, 15.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10417, 38, 210.8000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10417, 46, 9.6000, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10417, 68, 10.0000, 36, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10417, 77, 10.4000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10418, 2, 15.2000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10418, 47, 7.6000, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10418, 61, 22.8000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10418, 74, 8.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10419, 60, 27.2000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10419, 69, 28.8000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10420, 9, 77.6000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10420, 13, 4.8000, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10420, 70, 12.0000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10420, 73, 12.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10421, 19, 7.3000, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10421, 26, 24.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10421, 53, 26.2000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10421, 77, 10.4000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10422, 26, 24.9000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10423, 31, 10.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10423, 59, 44.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10424, 35, 14.4000, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10424, 38, 210.8000, 49, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10424, 68, 10.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10425, 55, 19.2000, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10425, 76, 14.4000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10426, 56, 30.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10426, 64, 26.6000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10427, 14, 18.6000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10428, 46, 9.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10429, 50, 13.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10429, 63, 35.1000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 17, 31.2000, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 21, 8.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 56, 30.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 59, 44.0000, 70, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10431, 17, 31.2000, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10431, 40, 14.7000, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10431, 47, 7.6000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10432, 26, 24.9000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10432, 54, 5.9000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10433, 56, 30.4000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10434, 11, 16.8000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10434, 76, 14.4000, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10435, 2, 15.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10435, 22, 16.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10435, 72, 27.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10436, 46, 9.6000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10436, 56, 30.4000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10436, 64, 26.6000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10436, 75, 6.2000, 24, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10437, 53, 26.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10438, 19, 7.3000, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10438, 34, 11.2000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10438, 57, 15.6000, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10439, 12, 30.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10439, 16, 13.9000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10439, 64, 26.6000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10439, 74, 8.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10440, 2, 15.2000, 45, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10440, 16, 13.9000, 49, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10440, 29, 99.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10440, 61, 22.8000, 90, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10441, 27, 35.1000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 11, 16.8000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 54, 5.9000, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 66, 13.6000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10443, 11, 16.8000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10443, 28, 36.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10444, 17, 31.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10444, 26, 24.9000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10444, 35, 14.4000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10444, 41, 7.7000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10445, 39, 14.4000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10445, 54, 5.9000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10446, 19, 7.3000, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10446, 24, 3.6000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10446, 31, 10.0000, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10446, 52, 5.6000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10447, 19, 7.3000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10447, 65, 16.8000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10447, 71, 17.2000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10448, 26, 24.9000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10448, 40, 14.7000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10449, 10, 24.8000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10449, 52, 5.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10449, 62, 39.4000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10450, 10, 24.8000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10450, 54, 5.9000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10451, 55, 19.2000, 120, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10451, 64, 26.6000, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10451, 65, 16.8000, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10451, 77, 10.4000, 55, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10452, 28, 36.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10452, 44, 15.5000, 100, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10453, 48, 10.2000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10453, 70, 12.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10454, 16, 13.9000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10454, 33, 2.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10454, 46, 9.6000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10455, 39, 14.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10455, 53, 26.2000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10455, 61, 22.8000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10455, 71, 17.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10456, 21, 8.0000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10456, 49, 16.0000, 21, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10457, 59, 44.0000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10458, 26, 24.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10458, 28, 36.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10458, 43, 36.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10458, 56, 30.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10458, 71, 17.2000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10459, 7, 24.0000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10459, 46, 9.6000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10459, 72, 27.8000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10460, 68, 10.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10460, 75, 6.2000, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10461, 21, 8.0000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10461, 30, 20.7000, 28, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10461, 55, 19.2000, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10462, 13, 4.8000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10462, 23, 7.2000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10463, 19, 7.3000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10463, 42, 11.2000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 4, 17.6000, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 43, 36.8000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 56, 30.4000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 60, 27.2000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10465, 24, 3.6000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10465, 29, 99.0000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10465, 40, 14.7000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10465, 45, 7.6000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10465, 50, 13.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10466, 11, 16.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10466, 46, 9.6000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10467, 24, 3.6000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10467, 25, 11.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10468, 30, 20.7000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10468, 43, 36.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10469, 2, 15.2000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10469, 16, 13.9000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10469, 44, 15.5000, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10470, 18, 50.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10470, 23, 7.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10470, 64, 26.6000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10471, 7, 24.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10471, 56, 30.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10472, 24, 3.6000, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10472, 51, 42.4000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10473, 33, 2.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10473, 71, 17.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10474, 14, 18.6000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10474, 28, 36.4000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10474, 40, 14.7000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10474, 75, 6.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10475, 31, 10.0000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10475, 66, 13.6000, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10475, 76, 14.4000, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10476, 55, 19.2000, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10476, 70, 12.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10477, 1, 14.4000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10477, 21, 8.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10477, 39, 14.4000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10478, 10, 24.8000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10479, 38, 210.8000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10479, 53, 26.2000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10479, 59, 44.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10479, 64, 26.6000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10480, 47, 7.6000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10480, 59, 44.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10481, 49, 16.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10481, 60, 27.2000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10482, 40, 14.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10483, 34, 11.2000, 35, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10483, 77, 10.4000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10484, 21, 8.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10484, 40, 14.7000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10484, 51, 42.4000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10485, 2, 15.2000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10485, 3, 8.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10485, 55, 19.2000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10485, 70, 12.0000, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 11, 16.8000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 51, 42.4000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 74, 8.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10487, 19, 7.3000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10487, 26, 24.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10487, 54, 5.9000, 24, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10488, 59, 44.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10488, 73, 12.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10489, 11, 16.8000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10489, 16, 13.9000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 59, 44.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 68, 10.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 75, 6.2000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10491, 44, 15.5000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10491, 77, 10.4000, 7, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10492, 25, 11.2000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10492, 42, 11.2000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10493, 65, 16.8000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10493, 66, 13.6000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10493, 69, 28.8000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10494, 56, 30.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10495, 23, 7.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10495, 41, 7.7000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10495, 77, 10.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10496, 31, 10.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10497, 56, 30.4000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10497, 72, 27.8000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10497, 77, 10.4000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 24, 4.5000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 40, 18.4000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 42, 14.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10499, 28, 45.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10499, 49, 20.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10500, 15, 15.5000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10500, 28, 45.6000, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10501, 54, 7.4500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10502, 45, 9.5000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10502, 53, 32.8000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10502, 67, 14.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10503, 14, 23.2500, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10503, 65, 21.0500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10504, 2, 19.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10504, 21, 10.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10504, 53, 32.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10504, 61, 28.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10505, 62, 49.3000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10506, 25, 14.0000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10506, 70, 15.0000, 14, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10507, 43, 46.0000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10507, 48, 12.7500, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10508, 13, 6.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10508, 39, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10509, 28, 45.6000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10510, 29, 123.7900, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10510, 75, 7.7500, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10511, 4, 22.0000, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10511, 7, 30.0000, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10511, 8, 40.0000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 24, 4.5000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 46, 12.0000, 9, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 47, 9.5000, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 60, 34.0000, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10513, 21, 10.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10513, 32, 32.0000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10513, 61, 28.5000, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 20, 81.0000, 39, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 28, 45.6000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 56, 38.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 65, 21.0500, 39, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 75, 7.7500, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10515, 9, 97.0000, 16, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10515, 16, 17.4500, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10515, 27, 43.9000, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10515, 33, 2.5000, 16, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10515, 60, 34.0000, 84, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10516, 18, 62.5000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10516, 41, 9.6500, 80, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10516, 42, 14.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10517, 52, 7.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10517, 59, 55.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10517, 70, 15.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10518, 24, 4.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10518, 38, 263.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10518, 44, 19.4500, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10519, 10, 31.0000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10519, 56, 38.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10519, 60, 34.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10520, 24, 4.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10520, 53, 32.8000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10521, 35, 18.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10521, 41, 9.6500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10521, 68, 12.5000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10522, 1, 18.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10522, 8, 40.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10522, 30, 25.8900, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10522, 40, 18.4000, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10523, 17, 39.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10523, 20, 81.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10523, 37, 26.0000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10523, 41, 9.6500, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10524, 10, 31.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10524, 30, 25.8900, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10524, 43, 46.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10524, 54, 7.4500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10525, 36, 19.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10525, 40, 18.4000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10526, 1, 18.0000, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10526, 13, 6.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10526, 56, 38.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10527, 4, 22.0000, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10527, 36, 19.0000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 11, 21.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 33, 2.5000, 8, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 72, 34.8000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10529, 55, 24.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10529, 68, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10529, 69, 36.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10530, 17, 39.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10530, 43, 46.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10530, 61, 28.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10530, 76, 18.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10531, 59, 55.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10532, 30, 25.8900, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10532, 66, 17.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 4, 22.0000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 72, 34.8000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 73, 15.0000, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10534, 30, 25.8900, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10534, 40, 18.4000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10534, 54, 7.4500, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10535, 11, 21.0000, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10535, 40, 18.4000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10535, 57, 19.5000, 5, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10535, 59, 55.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10536, 12, 38.0000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10536, 31, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10536, 33, 2.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10536, 60, 34.0000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10537, 31, 12.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10537, 51, 53.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10537, 58, 13.2500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10537, 72, 34.8000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10537, 73, 15.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10538, 70, 15.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10538, 72, 34.8000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10539, 13, 6.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10539, 21, 10.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10539, 33, 2.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10539, 49, 20.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10540, 3, 10.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10540, 26, 31.2300, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10540, 38, 263.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10540, 68, 12.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 24, 4.5000, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 38, 263.5000, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 65, 21.0500, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 71, 21.5000, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10542, 11, 21.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10542, 54, 7.4500, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10543, 12, 38.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10543, 23, 9.0000, 70, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10544, 28, 45.6000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10544, 67, 14.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10545, 11, 21.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10546, 7, 30.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10546, 35, 18.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10546, 62, 49.3000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10547, 32, 32.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10547, 36, 19.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10548, 34, 14.0000, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10548, 41, 9.6500, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10549, 31, 12.5000, 55, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10549, 45, 9.5000, 100, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10549, 51, 53.0000, 48, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 17, 39.0000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 19, 9.2000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 21, 10.0000, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 61, 28.5000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 16, 17.4500, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 35, 18.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 44, 19.4500, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10552, 69, 36.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10552, 75, 7.7500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10553, 11, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10553, 16, 17.4500, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10553, 22, 21.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10553, 31, 12.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10553, 35, 18.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10554, 16, 17.4500, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10554, 23, 9.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10554, 62, 49.3000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10554, 77, 13.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10555, 14, 23.2500, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10555, 19, 9.2000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10555, 24, 4.5000, 18, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10555, 51, 53.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10555, 56, 38.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10556, 72, 34.8000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10557, 64, 33.2500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10557, 75, 7.7500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10558, 47, 9.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10558, 51, 53.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10558, 52, 7.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10558, 53, 32.8000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10558, 73, 15.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10559, 41, 9.6500, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10559, 55, 24.0000, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10560, 30, 25.8900, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10560, 62, 49.3000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10561, 44, 19.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10561, 51, 53.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10562, 33, 2.5000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10562, 62, 49.3000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10563, 36, 19.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10563, 52, 7.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10564, 17, 39.0000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10564, 31, 12.5000, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10564, 55, 24.0000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10565, 24, 4.5000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10565, 64, 33.2500, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10566, 11, 21.0000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10566, 18, 62.5000, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10566, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10567, 31, 12.5000, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10567, 51, 53.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10567, 59, 55.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10568, 10, 31.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10569, 31, 12.5000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10569, 76, 18.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10570, 11, 21.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10570, 56, 38.0000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10571, 14, 23.2500, 11, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10571, 42, 14.0000, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10572, 16, 17.4500, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10572, 32, 32.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10572, 40, 18.4000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10572, 75, 7.7500, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10573, 17, 39.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10573, 34, 14.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10573, 53, 32.8000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10574, 33, 2.5000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10574, 40, 18.4000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10574, 62, 49.3000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10574, 64, 33.2500, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10575, 59, 55.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10575, 63, 43.9000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10575, 72, 34.8000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10575, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10576, 1, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10576, 31, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10576, 44, 19.4500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10577, 39, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10577, 75, 7.7500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10577, 77, 13.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10578, 35, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10578, 57, 19.5000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10579, 15, 15.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10579, 75, 7.7500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10580, 14, 23.2500, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10580, 41, 9.6500, 9, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10580, 65, 21.0500, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10581, 75, 7.7500, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10582, 57, 19.5000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10582, 76, 18.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10583, 29, 123.7900, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10583, 60, 34.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10583, 69, 36.0000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10584, 31, 12.5000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10585, 47, 9.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10586, 52, 7.0000, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10587, 26, 31.2300, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10587, 35, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10587, 77, 13.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10588, 18, 62.5000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10588, 42, 14.0000, 100, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10589, 35, 18.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10590, 1, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10590, 77, 13.0000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10591, 3, 10.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10591, 7, 30.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10591, 54, 7.4500, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10592, 15, 15.5000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10592, 26, 31.2300, 5, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10593, 20, 81.0000, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10593, 69, 36.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10593, 76, 18.0000, 4, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10594, 52, 7.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10594, 58, 13.2500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 35, 18.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 61, 28.5000, 120, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 69, 36.0000, 65, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10596, 56, 38.0000, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10596, 63, 43.9000, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10596, 75, 7.7500, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10597, 24, 4.5000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10597, 57, 19.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10597, 65, 21.0500, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10598, 27, 43.9000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10598, 71, 21.5000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10599, 62, 49.3000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10600, 54, 7.4500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10600, 73, 15.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10601, 13, 6.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10601, 59, 55.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10602, 77, 13.0000, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10603, 22, 21.0000, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10603, 49, 20.0000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10604, 48, 12.7500, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10604, 76, 18.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10605, 16, 17.4500, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10605, 59, 55.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10605, 60, 34.0000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10605, 71, 21.5000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10606, 4, 22.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10606, 55, 24.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10606, 62, 49.3000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10607, 7, 30.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10607, 17, 39.0000, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10607, 33, 2.5000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10607, 40, 18.4000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10607, 72, 34.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10608, 56, 38.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10609, 1, 18.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10609, 10, 31.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10609, 21, 10.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10610, 36, 19.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10611, 1, 18.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10611, 2, 19.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10611, 60, 34.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10612, 10, 31.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10612, 36, 19.0000, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10612, 49, 20.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10612, 60, 34.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10612, 76, 18.0000, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10613, 13, 6.0000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10613, 75, 7.7500, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10614, 11, 21.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10614, 21, 10.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10614, 39, 18.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10615, 55, 24.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 38, 263.5000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 56, 38.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 70, 15.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 71, 21.5000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10617, 59, 55.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10618, 6, 25.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10618, 56, 38.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10618, 68, 12.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10619, 21, 10.0000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10619, 22, 21.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10620, 24, 4.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10620, 52, 7.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10621, 19, 9.2000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10621, 23, 9.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10621, 70, 15.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10621, 71, 21.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10622, 2, 19.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10622, 68, 12.5000, 18, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 14, 23.2500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 19, 9.2000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 21, 10.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 24, 4.5000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 35, 18.0000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10624, 28, 45.6000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10624, 29, 123.7900, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10624, 44, 19.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10625, 14, 23.2500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10625, 42, 14.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10625, 60, 34.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10626, 53, 32.8000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10626, 60, 34.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10626, 71, 21.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10627, 62, 49.3000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10627, 73, 15.0000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10628, 1, 18.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10629, 29, 123.7900, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10629, 64, 33.2500, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10630, 55, 24.0000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10630, 76, 18.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10631, 75, 7.7500, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10632, 2, 19.0000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10632, 33, 2.5000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 12, 38.0000, 36, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 13, 6.0000, 13, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 26, 31.2300, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 62, 49.3000, 80, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 7, 30.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 18, 62.5000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 51, 53.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 75, 7.7500, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10635, 4, 22.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10635, 5, 21.3500, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10635, 22, 21.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10636, 4, 22.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10636, 58, 13.2500, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10637, 11, 21.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10637, 50, 16.2500, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10637, 56, 38.0000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10638, 45, 9.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10638, 65, 21.0500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10638, 72, 34.8000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10639, 18, 62.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10640, 69, 36.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10640, 70, 15.0000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10641, 2, 19.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10641, 40, 18.4000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10642, 21, 10.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10642, 61, 28.5000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10643, 28, 45.6000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10643, 39, 18.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10643, 46, 12.0000, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10644, 18, 62.5000, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10644, 43, 46.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10644, 46, 12.0000, 21, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10645, 18, 62.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10645, 36, 19.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10646, 1, 18.0000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10646, 10, 31.0000, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10646, 71, 21.5000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10646, 77, 13.0000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10647, 19, 9.2000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10647, 39, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10648, 22, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10648, 24, 4.5000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10649, 28, 45.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10649, 72, 34.8000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 30, 25.8900, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 53, 32.8000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 54, 7.4500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10651, 19, 9.2000, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10651, 22, 21.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10652, 30, 25.8900, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10652, 42, 14.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10653, 16, 17.4500, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10653, 60, 34.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10654, 4, 22.0000, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10654, 39, 18.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10654, 54, 7.4500, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10655, 41, 9.6500, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 14, 23.2500, 3, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 44, 19.4500, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 47, 9.5000, 6, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 15, 15.5000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 41, 9.6500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 46, 12.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 47, 9.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 56, 38.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10657, 60, 34.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10658, 21, 10.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10658, 40, 18.4000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10658, 60, 34.0000, 55, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10658, 77, 13.0000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10659, 31, 12.5000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10659, 40, 18.4000, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10659, 70, 15.0000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10660, 20, 81.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10661, 39, 18.0000, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10661, 58, 13.2500, 49, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10662, 68, 12.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10663, 40, 18.4000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10663, 42, 14.0000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10663, 51, 53.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 10, 31.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 56, 38.0000, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 65, 21.0500, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10665, 51, 53.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10665, 59, 55.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10665, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10666, 29, 123.7900, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10666, 65, 21.0500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10667, 69, 36.0000, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10667, 71, 21.5000, 14, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10668, 31, 12.5000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10668, 55, 24.0000, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10668, 64, 33.2500, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10669, 36, 19.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 23, 9.0000, 32, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 46, 12.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 67, 14.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 73, 15.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 75, 7.7500, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 16, 17.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 62, 49.3000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 65, 21.0500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10672, 38, 263.5000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10672, 71, 21.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10673, 16, 17.4500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10673, 42, 14.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10673, 43, 46.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10674, 23, 9.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 14, 23.2500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 53, 32.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 58, 13.2500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10676, 10, 31.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10676, 19, 9.2000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10676, 44, 19.4500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10677, 26, 31.2300, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10677, 33, 2.5000, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10678, 12, 38.0000, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10678, 33, 2.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10678, 41, 9.6500, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10678, 54, 7.4500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10679, 59, 55.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10680, 16, 17.4500, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10680, 31, 12.5000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10680, 42, 14.0000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 19, 9.2000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 21, 10.0000, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 64, 33.2500, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10682, 33, 2.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10682, 66, 17.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10682, 75, 7.7500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10683, 52, 7.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10684, 40, 18.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10684, 47, 9.5000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10684, 60, 34.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 10, 31.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 41, 9.6500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 47, 9.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10686, 17, 39.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10686, 26, 31.2300, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10687, 9, 97.0000, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10687, 29, 123.7900, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10687, 36, 19.0000, 6, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10688, 10, 31.0000, 18, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10688, 28, 45.6000, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10688, 34, 14.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10689, 1, 18.0000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10690, 56, 38.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10690, 77, 13.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10691, 1, 18.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10691, 29, 123.7900, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10691, 43, 46.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10691, 44, 19.4500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10691, 62, 49.3000, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10692, 63, 43.9000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10693, 9, 97.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10693, 54, 7.4500, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10693, 69, 36.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10693, 73, 15.0000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10694, 7, 30.0000, 90, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10694, 59, 55.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10694, 70, 15.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10695, 8, 40.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10695, 12, 38.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10695, 24, 4.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10696, 17, 39.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10696, 46, 12.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10697, 19, 9.2000, 7, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10697, 35, 18.0000, 9, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10697, 58, 13.2500, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10697, 70, 15.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 11, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 17, 39.0000, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 29, 123.7900, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 65, 21.0500, 65, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 70, 15.0000, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10699, 47, 9.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10700, 1, 18.0000, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10700, 34, 14.0000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10700, 68, 12.5000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10700, 71, 21.5000, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10701, 59, 55.0000, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10701, 71, 21.5000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10701, 76, 18.0000, 35, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10702, 3, 10.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10702, 76, 18.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 2, 19.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 59, 55.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 73, 15.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10704, 4, 22.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10704, 24, 4.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10704, 48, 12.7500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10705, 31, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10705, 32, 32.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10706, 16, 17.4500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10706, 43, 46.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10706, 59, 55.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10707, 55, 24.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10707, 57, 19.5000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10707, 70, 15.0000, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10708, 5, 21.3500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10708, 36, 19.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 8, 40.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 51, 53.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 60, 34.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10710, 19, 9.2000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10710, 47, 9.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10711, 19, 9.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10711, 41, 9.6500, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10711, 53, 32.8000, 120, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10712, 53, 32.8000, 3, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10712, 56, 38.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10713, 10, 31.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10713, 26, 31.2300, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10713, 45, 9.5000, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10713, 46, 12.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10714, 2, 19.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10714, 17, 39.0000, 27, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10714, 47, 9.5000, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10714, 56, 38.0000, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10714, 58, 13.2500, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10715, 10, 31.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10715, 71, 21.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10716, 21, 10.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10716, 51, 53.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10716, 61, 28.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 21, 10.0000, 32, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 54, 7.4500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 69, 36.0000, 25, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10718, 12, 38.0000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10718, 16, 17.4500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10718, 36, 19.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10718, 62, 49.3000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10719, 18, 62.5000, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10719, 30, 25.8900, 3, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10719, 54, 7.4500, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10720, 35, 18.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10720, 71, 21.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10721, 44, 19.4500, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10722, 2, 19.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10722, 31, 12.5000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10722, 68, 12.5000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10722, 75, 7.7500, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10723, 26, 31.2300, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10724, 10, 31.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10724, 61, 28.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 41, 9.6500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 52, 7.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 55, 24.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10726, 4, 22.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10726, 11, 21.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10727, 17, 39.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10727, 56, 38.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10727, 59, 55.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10728, 30, 25.8900, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10728, 40, 18.4000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10728, 55, 24.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10728, 60, 34.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10729, 1, 18.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10729, 21, 10.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10729, 50, 16.2500, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10730, 16, 17.4500, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10730, 31, 12.5000, 3, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10730, 65, 21.0500, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10731, 21, 10.0000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10731, 51, 53.0000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10732, 76, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10733, 14, 23.2500, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10733, 28, 45.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10733, 52, 7.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 6, 25.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 30, 25.8900, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 76, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10735, 61, 28.5000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10735, 77, 13.0000, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10736, 65, 21.0500, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10736, 75, 7.7500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10737, 13, 6.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10737, 41, 9.6500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10738, 16, 17.4500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10739, 36, 19.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10739, 52, 7.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10740, 28, 45.6000, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10740, 35, 18.0000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10740, 45, 9.5000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10740, 56, 38.0000, 14, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10741, 2, 19.0000, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10742, 3, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10742, 60, 34.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10742, 72, 34.8000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10743, 46, 12.0000, 28, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10744, 40, 18.4000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10745, 18, 62.5000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10745, 44, 19.4500, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10745, 59, 55.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10745, 72, 34.8000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10746, 13, 6.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10746, 42, 14.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10746, 62, 49.3000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10746, 69, 36.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10747, 31, 12.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10747, 41, 9.6500, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10747, 63, 43.9000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10747, 69, 36.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10748, 23, 9.0000, 44, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10748, 40, 18.4000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10748, 56, 38.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10749, 56, 38.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10749, 59, 55.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10749, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10750, 14, 23.2500, 5, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10750, 45, 9.5000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10750, 59, 55.0000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10751, 26, 31.2300, 12, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10751, 30, 25.8900, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10751, 50, 16.2500, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10751, 73, 15.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10752, 1, 18.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10752, 69, 36.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10753, 45, 9.5000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10753, 74, 10.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10754, 40, 18.4000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10755, 47, 9.5000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10755, 56, 38.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10755, 57, 19.5000, 14, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10755, 69, 36.0000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10756, 18, 62.5000, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10756, 36, 19.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10756, 68, 12.5000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10756, 69, 36.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10757, 34, 14.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10757, 59, 55.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10757, 62, 49.3000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10757, 64, 33.2500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10758, 26, 31.2300, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10758, 52, 7.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10758, 70, 15.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10759, 32, 32.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10760, 25, 14.0000, 12, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10760, 27, 43.9000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10760, 43, 46.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10761, 25, 14.0000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10761, 75, 7.7500, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 39, 18.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 47, 9.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 51, 53.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 56, 38.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 21, 10.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 22, 21.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 24, 4.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10764, 3, 10.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10764, 39, 18.0000, 130, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10765, 65, 21.0500, 80, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10766, 2, 19.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10766, 7, 30.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10766, 68, 12.5000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10767, 42, 14.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10768, 22, 21.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10768, 31, 12.5000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10768, 60, 34.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10768, 71, 21.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10769, 41, 9.6500, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10769, 52, 7.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10769, 61, 28.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10769, 62, 49.3000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10770, 11, 21.0000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10771, 71, 21.5000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10772, 29, 123.7900, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10772, 59, 55.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 17, 39.0000, 33, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 31, 12.5000, 70, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 75, 7.7500, 7, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10774, 31, 12.5000, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10774, 66, 17.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10775, 10, 31.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10775, 67, 14.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 31, 12.5000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 42, 14.0000, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 45, 9.5000, 27, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 51, 53.0000, 120, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10777, 42, 14.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10778, 41, 9.6500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10779, 16, 17.4500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10779, 62, 49.3000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10780, 70, 15.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10780, 77, 13.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10781, 54, 7.4500, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10781, 56, 38.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10781, 74, 10.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10782, 31, 12.5000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10783, 31, 12.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10783, 38, 263.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10784, 36, 19.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10784, 39, 18.0000, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10784, 72, 34.8000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10785, 10, 31.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10785, 75, 7.7500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10786, 8, 40.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10786, 30, 25.8900, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10786, 75, 7.7500, 42, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10787, 2, 19.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10787, 29, 123.7900, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10788, 19, 9.2000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10788, 75, 7.7500, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 18, 62.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 35, 18.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 63, 43.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 68, 12.5000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10790, 7, 30.0000, 3, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10790, 56, 38.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10791, 29, 123.7900, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10791, 41, 9.6500, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10792, 2, 19.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10792, 54, 7.4500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10792, 68, 12.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10793, 41, 9.6500, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10793, 52, 7.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10794, 14, 23.2500, 15, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10794, 54, 7.4500, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10795, 16, 17.4500, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10795, 17, 39.0000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 26, 31.2300, 21, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 44, 19.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 64, 33.2500, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 69, 36.0000, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10797, 11, 21.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10798, 62, 49.3000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10798, 72, 34.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10799, 13, 6.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10799, 24, 4.5000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10799, 59, 55.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10800, 11, 21.0000, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10800, 51, 53.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10800, 54, 7.4500, 7, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10801, 17, 39.0000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10801, 29, 123.7900, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10802, 30, 25.8900, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10802, 51, 53.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10802, 55, 24.0000, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10802, 62, 49.3000, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10803, 19, 9.2000, 24, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10803, 25, 14.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10803, 59, 55.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10804, 10, 31.0000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10804, 28, 45.6000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10804, 49, 20.0000, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10805, 34, 14.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10805, 38, 263.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10806, 2, 19.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10806, 65, 21.0500, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10806, 74, 10.0000, 15, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10807, 40, 18.4000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10808, 56, 38.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10808, 76, 18.0000, 50, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10809, 52, 7.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10810, 13, 6.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10810, 25, 14.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10810, 70, 15.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10811, 19, 9.2000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10811, 23, 9.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10811, 40, 18.4000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10812, 31, 12.5000, 16, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10812, 72, 34.8000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10812, 77, 13.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10813, 2, 19.0000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10813, 46, 12.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10814, 41, 9.6500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10814, 43, 46.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10814, 48, 12.7500, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10814, 61, 28.5000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10815, 33, 2.5000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10816, 38, 263.5000, 30, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10816, 62, 49.3000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10817, 26, 31.2300, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10817, 38, 263.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10817, 40, 18.4000, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10817, 62, 49.3000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10818, 32, 32.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10818, 41, 9.6500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10819, 43, 46.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10819, 75, 7.7500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10820, 56, 38.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10821, 35, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10821, 51, 53.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10822, 62, 49.3000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10822, 70, 15.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10823, 11, 21.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10823, 57, 19.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10823, 59, 55.0000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10823, 77, 13.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10824, 41, 9.6500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10824, 70, 15.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10825, 26, 31.2300, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10825, 53, 32.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10826, 31, 12.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10826, 57, 19.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10827, 10, 31.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10827, 39, 18.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10828, 20, 81.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10828, 38, 263.5000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10829, 2, 19.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10829, 8, 40.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10829, 13, 6.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10829, 60, 34.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10830, 6, 25.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10830, 39, 18.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10830, 60, 34.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10830, 68, 12.5000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10831, 19, 9.2000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10831, 35, 18.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10831, 38, 263.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10831, 43, 46.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10832, 13, 6.0000, 3, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10832, 25, 14.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10832, 44, 19.4500, 16, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10832, 64, 33.2500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10833, 7, 30.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10833, 31, 12.5000, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10833, 53, 32.8000, 9, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10834, 29, 123.7900, 8, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10834, 30, 25.8900, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10835, 59, 55.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10835, 77, 13.0000, 2, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 22, 21.0000, 52, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 35, 18.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 57, 19.5000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 60, 34.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 64, 33.2500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10837, 13, 6.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10837, 40, 18.4000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10837, 47, 9.5000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10837, 76, 18.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10838, 1, 18.0000, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10838, 18, 62.5000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10838, 36, 19.0000, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10839, 58, 13.2500, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10839, 72, 34.8000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10840, 25, 14.0000, 6, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10840, 39, 18.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10841, 10, 31.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10841, 56, 38.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10841, 59, 55.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10841, 77, 13.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10842, 11, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10842, 43, 46.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10842, 68, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10842, 70, 15.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10843, 51, 53.0000, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10844, 22, 21.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10845, 23, 9.0000, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10845, 35, 18.0000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10845, 42, 14.0000, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10845, 58, 13.2500, 60, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10845, 64, 33.2500, 48, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10846, 4, 22.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10846, 70, 15.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10846, 74, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 1, 18.0000, 80, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 19, 9.2000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 37, 26.0000, 60, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 45, 9.5000, 36, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 60, 34.0000, 45, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10847, 71, 21.5000, 55, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10848, 5, 21.3500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10848, 9, 97.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10849, 3, 10.0000, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10849, 26, 31.2300, 18, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10850, 25, 14.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10850, 33, 2.5000, 4, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10850, 70, 15.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10851, 2, 19.0000, 5, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10851, 25, 14.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10851, 57, 19.5000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10851, 59, 55.0000, 42, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10852, 2, 19.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10852, 17, 39.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10852, 62, 49.3000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10853, 18, 62.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10854, 10, 31.0000, 100, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10854, 13, 6.0000, 65, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10855, 16, 17.4500, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10855, 31, 12.5000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10855, 56, 38.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10855, 65, 21.0500, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10856, 2, 19.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10856, 42, 14.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10857, 3, 10.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10857, 26, 31.2300, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10857, 29, 123.7900, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10858, 7, 30.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10858, 27, 43.9000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10858, 70, 15.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 24, 4.5000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 54, 7.4500, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 64, 33.2500, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10860, 51, 53.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10860, 76, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10861, 17, 39.0000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10861, 18, 62.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10861, 21, 10.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10861, 33, 2.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10861, 62, 49.3000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10862, 11, 21.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10862, 52, 7.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10863, 1, 18.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10863, 58, 13.2500, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10864, 35, 18.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10864, 67, 14.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10865, 38, 263.5000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10865, 39, 18.0000, 80, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10866, 2, 19.0000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10866, 24, 4.5000, 6, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10866, 30, 25.8900, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10867, 53, 32.8000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10868, 26, 31.2300, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10868, 35, 18.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10868, 49, 20.0000, 42, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10869, 1, 18.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10869, 11, 21.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10869, 23, 9.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10869, 68, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10870, 35, 18.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10870, 51, 53.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10871, 6, 25.0000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10871, 16, 17.4500, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10871, 17, 39.0000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 55, 24.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 62, 49.3000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 64, 33.2500, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 65, 21.0500, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10873, 21, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10873, 28, 45.6000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10874, 10, 31.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10875, 19, 9.2000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10875, 47, 9.5000, 21, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10875, 49, 20.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10876, 46, 12.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10876, 64, 33.2500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10877, 16, 17.4500, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10877, 18, 62.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10878, 20, 81.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10879, 40, 18.4000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10879, 65, 21.0500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10879, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 23, 9.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 61, 28.5000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 70, 15.0000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10881, 73, 15.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10882, 42, 14.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10882, 49, 20.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10882, 54, 7.4500, 32, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10883, 24, 4.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10884, 21, 10.0000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10884, 56, 38.0000, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10884, 65, 21.0500, 12, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10885, 2, 19.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10885, 24, 4.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10885, 70, 15.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10885, 77, 13.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 10, 31.0000, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 31, 12.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 77, 13.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10887, 25, 14.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10888, 2, 19.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10888, 68, 12.5000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10889, 11, 21.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10889, 38, 263.5000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10890, 17, 39.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10890, 34, 14.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10890, 41, 9.6500, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10891, 30, 25.8900, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10892, 59, 55.0000, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10893, 8, 40.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10893, 24, 4.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10893, 29, 123.7900, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10893, 30, 25.8900, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10893, 36, 19.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10894, 13, 6.0000, 28, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10894, 69, 36.0000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10894, 75, 7.7500, 120, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 24, 4.5000, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 39, 18.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 40, 18.4000, 91, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 60, 34.0000, 100, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10896, 45, 9.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10896, 56, 38.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10897, 29, 123.7900, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10897, 30, 25.8900, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10898, 13, 6.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10899, 39, 18.0000, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10900, 70, 15.0000, 3, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10901, 41, 9.6500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10901, 71, 21.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10902, 55, 24.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10902, 62, 49.3000, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 13, 6.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 65, 21.0500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 68, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10904, 58, 13.2500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10904, 62, 49.3000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10905, 1, 18.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10906, 61, 28.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10907, 75, 7.7500, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10908, 7, 30.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10908, 52, 7.0000, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10909, 7, 30.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10909, 16, 17.4500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10909, 41, 9.6500, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10910, 19, 9.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10910, 49, 20.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10910, 61, 28.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 1, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 17, 39.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 67, 14.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10912, 11, 21.0000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10912, 29, 123.7900, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10913, 4, 22.0000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10913, 33, 2.5000, 40, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10913, 58, 13.2500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10914, 71, 21.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10915, 17, 39.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10915, 33, 2.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10915, 54, 7.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10916, 16, 17.4500, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10916, 32, 32.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10916, 57, 19.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10917, 30, 25.8900, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10917, 60, 34.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10918, 1, 18.0000, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10918, 60, 34.0000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10919, 16, 17.4500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10919, 25, 14.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10919, 40, 18.4000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10920, 50, 16.2500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10921, 35, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10921, 63, 43.9000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10922, 17, 39.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10922, 24, 4.5000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10923, 42, 14.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10923, 43, 46.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10923, 67, 14.0000, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10924, 10, 31.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10924, 28, 45.6000, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10924, 75, 7.7500, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10925, 36, 19.0000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10925, 52, 7.0000, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10926, 11, 21.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10926, 13, 6.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10926, 19, 9.2000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10926, 72, 34.8000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10927, 20, 81.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10927, 52, 7.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10927, 76, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10928, 47, 9.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10928, 76, 18.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 21, 10.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 75, 7.7500, 49, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 77, 13.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10930, 21, 10.0000, 36, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10930, 27, 43.9000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10930, 55, 24.0000, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10930, 58, 13.2500, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10931, 13, 6.0000, 42, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10931, 57, 19.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10932, 16, 17.4500, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10932, 62, 49.3000, 14, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10932, 72, 34.8000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10932, 75, 7.7500, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10933, 53, 32.8000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10933, 61, 28.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10934, 6, 25.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10935, 1, 18.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10935, 18, 62.5000, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10935, 23, 9.0000, 8, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10936, 36, 19.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10937, 28, 45.6000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10937, 34, 14.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10938, 13, 6.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10938, 43, 46.0000, 24, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10938, 60, 34.0000, 49, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10938, 71, 21.5000, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10939, 2, 19.0000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10939, 67, 14.0000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10940, 7, 30.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10940, 13, 6.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10941, 31, 12.5000, 44, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10941, 62, 49.3000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10941, 68, 12.5000, 80, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10941, 72, 34.8000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10942, 49, 20.0000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10943, 13, 6.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10943, 22, 21.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10943, 46, 12.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10944, 11, 21.0000, 5, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10944, 44, 19.4500, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10944, 56, 38.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10945, 13, 6.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10945, 31, 12.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10946, 10, 31.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10946, 24, 4.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10946, 77, 13.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10947, 59, 55.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 50, 16.2500, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 51, 53.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 55, 24.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10949, 6, 25.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10949, 10, 31.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10949, 17, 39.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10949, 62, 49.3000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10950, 4, 22.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10951, 33, 2.5000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10951, 41, 9.6500, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10951, 75, 7.7500, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10952, 6, 25.0000, 16, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10952, 28, 45.6000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10953, 20, 81.0000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10953, 31, 12.5000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10954, 16, 17.4500, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10954, 31, 12.5000, 25, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10954, 45, 9.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10954, 60, 34.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10955, 75, 7.7500, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10956, 21, 10.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10956, 47, 9.5000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10956, 51, 53.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 30, 25.8900, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 35, 18.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 64, 33.2500, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10958, 5, 21.3500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10958, 7, 30.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10958, 72, 34.8000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10959, 75, 7.7500, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10960, 24, 4.5000, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10960, 41, 9.6500, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10961, 52, 7.0000, 6, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10961, 76, 18.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10962, 7, 30.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10962, 13, 6.0000, 77, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10962, 53, 32.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10962, 69, 36.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10962, 76, 18.0000, 44, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10963, 60, 34.0000, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10964, 18, 62.5000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10964, 38, 263.5000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10964, 69, 36.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10965, 51, 53.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10966, 37, 26.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10966, 56, 38.0000, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10966, 62, 49.3000, 12, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10967, 19, 9.2000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10967, 49, 20.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 12, 38.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 24, 4.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 64, 33.2500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10969, 46, 12.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10970, 52, 7.0000, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10971, 29, 123.7900, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10972, 17, 39.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10972, 33, 2.5000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10973, 26, 31.2300, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10973, 41, 9.6500, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10973, 75, 7.7500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10974, 63, 43.9000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10975, 8, 40.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10975, 75, 7.7500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10976, 28, 45.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 39, 18.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 47, 9.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 51, 53.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 63, 43.9000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10978, 8, 40.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10978, 21, 10.0000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10978, 40, 18.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10978, 44, 19.4500, 6, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 7, 30.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 12, 38.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 24, 4.5000, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 27, 43.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 31, 12.5000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 63, 43.9000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10980, 75, 7.7500, 40, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10981, 38, 263.5000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10982, 7, 30.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10982, 43, 46.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10983, 13, 6.0000, 84, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10983, 57, 19.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10984, 16, 17.4500, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10984, 24, 4.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10984, 36, 19.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10985, 16, 17.4500, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10985, 18, 62.5000, 8, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10985, 32, 32.0000, 35, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10986, 11, 21.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10986, 20, 81.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10986, 76, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10986, 77, 13.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10987, 7, 30.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10987, 43, 46.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10987, 72, 34.8000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10988, 7, 30.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10988, 62, 49.3000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10989, 6, 25.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10989, 11, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10989, 41, 9.6500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 21, 10.0000, 65, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 34, 14.0000, 60, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 55, 24.0000, 65, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 61, 28.5000, 66, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10991, 2, 19.0000, 50, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10991, 70, 15.0000, 20, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10991, 76, 18.0000, 90, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10992, 72, 34.8000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10993, 29, 123.7900, 50, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10993, 41, 9.6500, 35, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10994, 59, 55.0000, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10995, 51, 53.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10995, 60, 34.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10996, 42, 14.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10997, 32, 32.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10997, 46, 12.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10997, 52, 7.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10998, 24, 4.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10998, 61, 28.5000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10998, 74, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10998, 75, 7.7500, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10999, 41, 9.6500, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10999, 51, 53.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10999, 77, 13.0000, 21, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11000, 4, 22.0000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11000, 24, 4.5000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11000, 77, 13.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 7, 30.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 22, 21.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 46, 12.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 55, 24.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11002, 13, 6.0000, 56, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11002, 35, 18.0000, 15, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11002, 42, 14.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11002, 55, 24.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11003, 1, 18.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11003, 40, 18.4000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11003, 52, 7.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11004, 26, 31.2300, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11004, 76, 18.0000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11005, 1, 18.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11005, 59, 55.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11006, 1, 18.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11006, 29, 123.7900, 2, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11007, 8, 40.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11007, 29, 123.7900, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11007, 42, 14.0000, 14, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 28, 45.6000, 70, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 34, 14.0000, 90, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 71, 21.5000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 24, 4.5000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 36, 19.0000, 18, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 60, 34.0000, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11010, 7, 30.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11010, 24, 4.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11011, 58, 13.2500, 40, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11011, 71, 21.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 19, 9.2000, 50, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 60, 34.0000, 36, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 71, 21.5000, 60, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11013, 23, 9.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11013, 42, 14.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11013, 45, 9.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11013, 68, 12.5000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11014, 41, 9.6500, 28, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11015, 30, 25.8900, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11015, 77, 13.0000, 18, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11016, 31, 12.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11016, 36, 19.0000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 3, 10.0000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 59, 55.0000, 110, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 70, 15.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11018, 12, 38.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11018, 18, 62.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11018, 56, 38.0000, 5, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11019, 46, 12.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11019, 49, 20.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11020, 10, 31.0000, 24, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11021, 2, 19.0000, 11, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11021, 20, 81.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11021, 26, 31.2300, 63, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11021, 51, 53.0000, 44, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11021, 72, 34.8000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11022, 19, 9.2000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11022, 69, 36.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11023, 7, 30.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11023, 43, 46.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11024, 26, 31.2300, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11024, 33, 2.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11024, 65, 21.0500, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11024, 71, 21.5000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11025, 1, 18.0000, 10, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11025, 13, 6.0000, 20, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11026, 18, 62.5000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11026, 51, 53.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11027, 24, 4.5000, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11027, 62, 49.3000, 21, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11028, 55, 24.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11028, 59, 55.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11029, 56, 38.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11029, 63, 43.9000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11030, 2, 19.0000, 100, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11030, 5, 21.3500, 70, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11030, 29, 123.7900, 60, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11030, 59, 55.0000, 100, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11031, 1, 18.0000, 45, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11031, 13, 6.0000, 80, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11031, 24, 4.5000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11031, 64, 33.2500, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11031, 71, 21.5000, 16, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11032, 36, 19.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11032, 38, 263.5000, 25, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11032, 59, 55.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11033, 53, 32.8000, 70, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11033, 69, 36.0000, 36, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11034, 21, 10.0000, 15, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11034, 44, 19.4500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11034, 61, 28.5000, 6, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11035, 1, 18.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11035, 35, 18.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11035, 42, 14.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11035, 54, 7.4500, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11036, 13, 6.0000, 7, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11036, 59, 55.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11037, 70, 15.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11038, 40, 18.4000, 5, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11038, 52, 7.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11038, 71, 21.5000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11039, 28, 45.6000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11039, 35, 18.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11039, 49, 20.0000, 60, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11039, 57, 19.5000, 28, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11040, 21, 10.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11041, 2, 19.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11041, 63, 43.9000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11042, 44, 19.4500, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11042, 61, 28.5000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11043, 11, 21.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11044, 62, 49.3000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11045, 33, 2.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11045, 51, 53.0000, 24, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11046, 12, 38.0000, 20, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11046, 32, 32.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11046, 35, 18.0000, 18, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11047, 1, 18.0000, 25, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11047, 5, 21.3500, 30, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11048, 68, 12.5000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11049, 2, 19.0000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11049, 12, 38.0000, 4, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11050, 76, 18.0000, 50, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11051, 24, 4.5000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11052, 43, 46.0000, 30, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11052, 61, 28.5000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11053, 18, 62.5000, 35, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11053, 32, 32.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11053, 64, 33.2500, 25, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11054, 33, 2.5000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11054, 67, 14.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 24, 4.5000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 25, 14.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 51, 53.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 57, 19.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11056, 7, 30.0000, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11056, 55, 24.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11056, 60, 34.0000, 50, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11057, 70, 15.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11058, 21, 10.0000, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11058, 60, 34.0000, 21, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11058, 61, 28.5000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11059, 13, 6.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11059, 17, 39.0000, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11059, 60, 34.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11060, 60, 34.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11060, 77, 13.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11061, 60, 34.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11062, 53, 32.8000, 10, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11062, 70, 15.0000, 12, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11063, 34, 14.0000, 30, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11063, 40, 18.4000, 40, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11063, 41, 9.6500, 30, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11064, 17, 39.0000, 77, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11064, 41, 9.6500, 12, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11064, 53, 32.8000, 25, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11064, 55, 24.0000, 4, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11064, 68, 12.5000, 55, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11065, 30, 25.8900, 4, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11065, 54, 7.4500, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11066, 16, 17.4500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11066, 19, 9.2000, 42, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11066, 34, 14.0000, 35, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11067, 41, 9.6500, 9, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11068, 28, 45.6000, 8, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11068, 43, 46.0000, 36, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11068, 77, 13.0000, 28, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11069, 39, 18.0000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11070, 1, 18.0000, 40, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11070, 2, 19.0000, 20, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11070, 16, 17.4500, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11070, 31, 12.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11071, 7, 30.0000, 15, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11071, 13, 6.0000, 10, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 2, 19.0000, 8, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 41, 9.6500, 40, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 50, 16.2500, 22, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 64, 33.2500, 130, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11073, 11, 21.0000, 10, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11073, 24, 4.5000, 20, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11074, 16, 17.4500, 14, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11075, 2, 19.0000, 10, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11075, 46, 12.0000, 30, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11075, 76, 18.0000, 2, 0.15)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11076, 6, 25.0000, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11076, 14, 23.2500, 20, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11076, 19, 9.2000, 10, 0.25)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 2, 19.0000, 24, 0.2)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 3, 10.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 4, 22.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 6, 25.0000, 1, 0.02)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 7, 30.0000, 1, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 8, 40.0000, 2, 0.1)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 10, 31.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 12, 38.0000, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 13, 6.0000, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 14, 23.2500, 1, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 16, 17.4500, 2, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 20, 81.0000, 1, 0.04)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 23, 9.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 32, 32.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 39, 18.0000, 2, 0.05)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 41, 9.6500, 3, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 46, 12.0000, 3, 0.02)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 52, 7.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 55, 24.0000, 2, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 60, 34.0000, 2, 0.06)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 64, 33.2500, 2, 0.03)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 66, 17.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 73, 15.0000, 2, 0.01)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 75, 7.7500, 4, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 77, 13.0000, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10248, 56, 5, CAST(N'2015-07-04 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), CAST(N'2015-07-16 00:00:00.000' AS DateTime), 3, 32.3800, N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10249, 52, 6, CAST(N'2014-07-05 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), CAST(N'2014-07-10 00:00:00.000' AS DateTime), 1, 11.6100, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10250, 78, 4, CAST(N'2014-07-08 00:00:00.000' AS DateTime), CAST(N'2014-08-05 00:00:00.000' AS DateTime), CAST(N'2014-07-12 00:00:00.000' AS DateTime), 2, 65.8300, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10251, 55, 3, CAST(N'2014-07-08 00:00:00.000' AS DateTime), CAST(N'2014-08-05 00:00:00.000' AS DateTime), CAST(N'2014-07-15 00:00:00.000' AS DateTime), 1, 41.3400, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10252, 51, 4, CAST(N'2014-07-09 00:00:00.000' AS DateTime), CAST(N'2014-08-06 00:00:00.000' AS DateTime), CAST(N'2014-07-11 00:00:00.000' AS DateTime), 2, 51.3000, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10253, 78, 3, CAST(N'2014-07-10 00:00:00.000' AS DateTime), CAST(N'2014-07-24 00:00:00.000' AS DateTime), CAST(N'2017-07-16 00:00:00.000' AS DateTime), 2, 58.1700, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10254, 13, 5, CAST(N'2014-07-11 00:00:00.000' AS DateTime), CAST(N'2014-08-08 00:00:00.000' AS DateTime), CAST(N'2014-07-23 00:00:00.000' AS DateTime), 2, 22.9800, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10255, 45, 9, CAST(N'2014-07-12 00:00:00.000' AS DateTime), CAST(N'2014-08-09 00:00:00.000' AS DateTime), CAST(N'2014-07-15 00:00:00.000' AS DateTime), 3, 148.3300, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10256, 86, 3, CAST(N'2014-07-15 00:00:00.000' AS DateTime), CAST(N'2014-08-12 00:00:00.000' AS DateTime), CAST(N'2014-07-17 00:00:00.000' AS DateTime), 2, 13.9700, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10257, 87, 4, CAST(N'2014-07-16 00:00:00.000' AS DateTime), CAST(N'2014-08-13 00:00:00.000' AS DateTime), CAST(N'2014-07-22 00:00:00.000' AS DateTime), 3, 81.9100, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10258, 18, 1, CAST(N'2014-07-17 00:00:00.000' AS DateTime), CAST(N'2014-08-14 00:00:00.000' AS DateTime), CAST(N'2014-07-23 00:00:00.000' AS DateTime), 1, 140.5100, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10259, 12, 4, CAST(N'2014-07-18 00:00:00.000' AS DateTime), CAST(N'2014-08-15 00:00:00.000' AS DateTime), CAST(N'2014-07-25 00:00:00.000' AS DateTime), 3, 3.2500, N'Sierras de Granada 9993', N'México D.F.', NULL, N'05022', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10260, 37, 4, CAST(N'2014-07-19 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), CAST(N'2014-07-29 00:00:00.000' AS DateTime), 1, 55.0900, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10261, 79, 4, CAST(N'2014-07-19 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), CAST(N'2014-07-30 00:00:00.000' AS DateTime), 2, 3.0500, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10262, 71, 8, CAST(N'2014-07-22 00:00:00.000' AS DateTime), CAST(N'2014-08-19 00:00:00.000' AS DateTime), CAST(N'2014-07-25 00:00:00.000' AS DateTime), 3, 48.2900, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10263, 18, 9, CAST(N'2014-07-23 00:00:00.000' AS DateTime), CAST(N'2014-08-20 00:00:00.000' AS DateTime), CAST(N'2014-07-31 00:00:00.000' AS DateTime), 3, 146.0600, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10264, 21, 6, CAST(N'2014-07-24 00:00:00.000' AS DateTime), CAST(N'2014-08-21 00:00:00.000' AS DateTime), CAST(N'2014-08-23 00:00:00.000' AS DateTime), 3, 3.6700, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10265, 7, 2, CAST(N'2014-07-25 00:00:00.000' AS DateTime), CAST(N'2014-08-22 00:00:00.000' AS DateTime), CAST(N'2014-08-12 00:00:00.000' AS DateTime), 1, 55.2800, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10266, 58, 3, CAST(N'2014-07-26 00:00:00.000' AS DateTime), CAST(N'2014-09-06 00:00:00.000' AS DateTime), CAST(N'2014-07-31 00:00:00.000' AS DateTime), 3, 25.7300, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10267, 22, 4, CAST(N'2014-07-29 00:00:00.000' AS DateTime), CAST(N'2014-08-26 00:00:00.000' AS DateTime), CAST(N'2014-08-06 00:00:00.000' AS DateTime), 1, 208.5800, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10268, 66, 8, CAST(N'2014-07-30 00:00:00.000' AS DateTime), CAST(N'2014-08-27 00:00:00.000' AS DateTime), CAST(N'2014-08-02 00:00:00.000' AS DateTime), 3, 66.2900, N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10269, 90, 5, CAST(N'2014-07-31 00:00:00.000' AS DateTime), CAST(N'2014-08-14 00:00:00.000' AS DateTime), CAST(N'2014-08-09 00:00:00.000' AS DateTime), 1, 4.5600, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10270, 58, 1, CAST(N'2014-08-01 00:00:00.000' AS DateTime), CAST(N'2014-08-29 00:00:00.000' AS DateTime), CAST(N'2014-08-02 00:00:00.000' AS DateTime), 1, 136.5400, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10271, 91, 6, CAST(N'2014-08-01 00:00:00.000' AS DateTime), CAST(N'2014-08-29 00:00:00.000' AS DateTime), CAST(N'2014-08-30 00:00:00.000' AS DateTime), 2, 4.5400, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10272, 71, 6, CAST(N'2014-08-02 00:00:00.000' AS DateTime), CAST(N'2014-08-30 00:00:00.000' AS DateTime), CAST(N'2014-08-06 00:00:00.000' AS DateTime), 2, 98.0300, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10273, 42, 3, CAST(N'2014-08-05 00:00:00.000' AS DateTime), CAST(N'2014-09-02 00:00:00.000' AS DateTime), CAST(N'2014-08-12 00:00:00.000' AS DateTime), 3, 76.0700, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10274, 56, 6, CAST(N'2014-08-06 00:00:00.000' AS DateTime), CAST(N'2014-09-03 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), 1, 6.0100, N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10275, 32, 1, CAST(N'2014-08-07 00:00:00.000' AS DateTime), CAST(N'2014-09-04 00:00:00.000' AS DateTime), CAST(N'2014-08-09 00:00:00.000' AS DateTime), 1, 26.9300, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10276, 53, 8, CAST(N'2014-08-08 00:00:00.000' AS DateTime), CAST(N'2014-08-22 00:00:00.000' AS DateTime), CAST(N'2014-08-14 00:00:00.000' AS DateTime), 3, 13.8400, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10277, 34, 2, CAST(N'2014-08-09 00:00:00.000' AS DateTime), CAST(N'2014-09-06 00:00:00.000' AS DateTime), CAST(N'2014-08-13 00:00:00.000' AS DateTime), 3, 125.7700, N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10278, 5, 8, CAST(N'2014-08-12 00:00:00.000' AS DateTime), CAST(N'2014-09-09 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), 2, 92.6900, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10279, 31, 8, CAST(N'2014-08-13 00:00:00.000' AS DateTime), CAST(N'2014-09-10 00:00:00.000' AS DateTime), CAST(N'2014-08-16 00:00:00.000' AS DateTime), 2, 25.8300, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10280, 5, 2, CAST(N'2014-08-14 00:00:00.000' AS DateTime), CAST(N'2014-09-11 00:00:00.000' AS DateTime), CAST(N'2014-09-12 00:00:00.000' AS DateTime), 1, 8.9800, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10281, 46, 4, CAST(N'2014-08-14 00:00:00.000' AS DateTime), CAST(N'2014-08-28 00:00:00.000' AS DateTime), CAST(N'2014-08-21 00:00:00.000' AS DateTime), 1, 2.9400, N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10282, 46, 4, CAST(N'2014-08-15 00:00:00.000' AS DateTime), CAST(N'2014-09-12 00:00:00.000' AS DateTime), CAST(N'2014-08-21 00:00:00.000' AS DateTime), 1, 12.6900, N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10283, 69, 3, CAST(N'2014-08-16 00:00:00.000' AS DateTime), CAST(N'2014-09-13 00:00:00.000' AS DateTime), CAST(N'2014-08-23 00:00:00.000' AS DateTime), 3, 84.8100, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10284, 31, 4, CAST(N'2014-08-19 00:00:00.000' AS DateTime), CAST(N'2014-09-16 00:00:00.000' AS DateTime), CAST(N'2014-08-27 00:00:00.000' AS DateTime), 1, 76.5600, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10285, 42, 1, CAST(N'2014-08-20 00:00:00.000' AS DateTime), CAST(N'2014-09-17 00:00:00.000' AS DateTime), CAST(N'2014-08-26 00:00:00.000' AS DateTime), 2, 76.8300, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10286, 42, 8, CAST(N'2014-08-21 00:00:00.000' AS DateTime), CAST(N'2014-09-18 00:00:00.000' AS DateTime), CAST(N'2014-08-30 00:00:00.000' AS DateTime), 3, 229.2400, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10287, 80, 8, CAST(N'2014-08-22 00:00:00.000' AS DateTime), CAST(N'2014-09-19 00:00:00.000' AS DateTime), CAST(N'2014-08-28 00:00:00.000' AS DateTime), 3, 12.7600, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10288, 44, 4, CAST(N'2014-08-23 00:00:00.000' AS DateTime), CAST(N'2014-09-20 00:00:00.000' AS DateTime), CAST(N'2014-09-03 00:00:00.000' AS DateTime), 1, 7.4500, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10289, 10, 7, CAST(N'2014-08-26 00:00:00.000' AS DateTime), CAST(N'2014-09-23 00:00:00.000' AS DateTime), CAST(N'2014-08-28 00:00:00.000' AS DateTime), 3, 22.7700, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10290, 81, 8, CAST(N'2014-08-27 00:00:00.000' AS DateTime), CAST(N'2014-09-24 00:00:00.000' AS DateTime), CAST(N'2014-09-03 00:00:00.000' AS DateTime), 1, 79.7000, N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10291, 79, 6, CAST(N'2014-08-27 00:00:00.000' AS DateTime), CAST(N'2014-09-24 00:00:00.000' AS DateTime), CAST(N'2014-09-04 00:00:00.000' AS DateTime), 2, 6.4000, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10292, 85, 1, CAST(N'2014-08-28 00:00:00.000' AS DateTime), CAST(N'2014-09-25 00:00:00.000' AS DateTime), CAST(N'2014-09-02 00:00:00.000' AS DateTime), 2, 1.3500, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10293, 53, 1, CAST(N'2014-08-29 00:00:00.000' AS DateTime), CAST(N'2014-09-26 00:00:00.000' AS DateTime), CAST(N'2014-09-11 00:00:00.000' AS DateTime), 3, 21.1800, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10294, 71, 4, CAST(N'2014-08-30 00:00:00.000' AS DateTime), CAST(N'2014-09-27 00:00:00.000' AS DateTime), CAST(N'2014-09-05 00:00:00.000' AS DateTime), 2, 147.2600, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10295, 56, 2, CAST(N'2014-09-02 00:00:00.000' AS DateTime), CAST(N'2014-09-30 00:00:00.000' AS DateTime), CAST(N'2014-09-10 00:00:00.000' AS DateTime), 2, 1.1500, N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10296, 69, 6, CAST(N'2014-09-03 00:00:00.000' AS DateTime), CAST(N'2014-10-01 00:00:00.000' AS DateTime), CAST(N'2014-09-11 00:00:00.000' AS DateTime), 1, 0.1200, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10297, 7, 5, CAST(N'2014-09-04 00:00:00.000' AS DateTime), CAST(N'2014-10-16 00:00:00.000' AS DateTime), CAST(N'2014-09-10 00:00:00.000' AS DateTime), 2, 5.7400, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10298, 65, 6, CAST(N'2014-09-05 00:00:00.000' AS DateTime), CAST(N'2014-10-03 00:00:00.000' AS DateTime), CAST(N'2014-09-11 00:00:00.000' AS DateTime), 2, 168.2200, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10299, 80, 4, CAST(N'2014-09-06 00:00:00.000' AS DateTime), CAST(N'2014-10-04 00:00:00.000' AS DateTime), CAST(N'2014-09-13 00:00:00.000' AS DateTime), 2, 29.7600, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10300, 32, 2, CAST(N'2014-09-09 00:00:00.000' AS DateTime), CAST(N'2014-10-07 00:00:00.000' AS DateTime), CAST(N'2014-09-18 00:00:00.000' AS DateTime), 2, 17.6800, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10301, 57, 8, CAST(N'2014-09-09 00:00:00.000' AS DateTime), CAST(N'2014-10-07 00:00:00.000' AS DateTime), CAST(N'2014-09-17 00:00:00.000' AS DateTime), 2, 45.0800, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10302, 51, 4, CAST(N'2014-09-10 00:00:00.000' AS DateTime), CAST(N'2014-10-08 00:00:00.000' AS DateTime), CAST(N'2014-10-09 00:00:00.000' AS DateTime), 2, 6.2700, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10303, 27, 7, CAST(N'2014-09-11 00:00:00.000' AS DateTime), CAST(N'2014-10-09 00:00:00.000' AS DateTime), CAST(N'2014-09-18 00:00:00.000' AS DateTime), 2, 107.8300, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10304, 53, 1, CAST(N'2014-09-12 00:00:00.000' AS DateTime), CAST(N'2014-10-10 00:00:00.000' AS DateTime), CAST(N'2014-09-17 00:00:00.000' AS DateTime), 2, 63.7900, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10305, 61, 8, CAST(N'2014-09-13 00:00:00.000' AS DateTime), CAST(N'2014-10-11 00:00:00.000' AS DateTime), CAST(N'2014-10-09 00:00:00.000' AS DateTime), 3, 257.6200, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10306, 46, 1, CAST(N'2014-09-16 00:00:00.000' AS DateTime), CAST(N'2014-10-14 00:00:00.000' AS DateTime), CAST(N'2014-09-23 00:00:00.000' AS DateTime), 3, 7.5600, N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10307, 75, 2, CAST(N'2014-09-17 00:00:00.000' AS DateTime), CAST(N'2014-10-15 00:00:00.000' AS DateTime), CAST(N'2014-09-25 00:00:00.000' AS DateTime), 2, 0.5600, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10308, 2, 7, CAST(N'2014-09-18 00:00:00.000' AS DateTime), CAST(N'2014-10-16 00:00:00.000' AS DateTime), CAST(N'2014-09-24 00:00:00.000' AS DateTime), 3, 1.6100, N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10309, 65, 3, CAST(N'2014-09-19 00:00:00.000' AS DateTime), CAST(N'2014-10-17 00:00:00.000' AS DateTime), CAST(N'2014-10-23 00:00:00.000' AS DateTime), 1, 47.3000, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10310, 76, 8, CAST(N'2014-09-20 00:00:00.000' AS DateTime), CAST(N'2014-10-18 00:00:00.000' AS DateTime), CAST(N'2014-09-27 00:00:00.000' AS DateTime), 2, 17.5200, N'89 Jefferson Way Suite 2', N'Portland', N'OR', N'97201', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10311, 16, 1, CAST(N'2014-09-20 00:00:00.000' AS DateTime), CAST(N'2014-10-04 00:00:00.000' AS DateTime), CAST(N'2014-09-26 00:00:00.000' AS DateTime), 3, 24.6900, N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10312, 57, 2, CAST(N'2014-09-23 00:00:00.000' AS DateTime), CAST(N'2014-10-21 00:00:00.000' AS DateTime), CAST(N'2014-10-03 00:00:00.000' AS DateTime), 2, 40.2600, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10313, 42, 2, CAST(N'2014-09-24 00:00:00.000' AS DateTime), CAST(N'2014-10-22 00:00:00.000' AS DateTime), CAST(N'2014-10-04 00:00:00.000' AS DateTime), 2, 1.9600, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10314, 71, 1, CAST(N'2014-09-25 00:00:00.000' AS DateTime), CAST(N'2014-10-23 00:00:00.000' AS DateTime), CAST(N'2014-10-04 00:00:00.000' AS DateTime), 2, 74.1600, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10315, 68, 4, CAST(N'2014-09-26 00:00:00.000' AS DateTime), CAST(N'2014-10-24 00:00:00.000' AS DateTime), CAST(N'2014-10-03 00:00:00.000' AS DateTime), 2, 41.7600, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10316, 71, 1, CAST(N'2014-09-27 00:00:00.000' AS DateTime), CAST(N'2014-10-25 00:00:00.000' AS DateTime), CAST(N'2014-10-08 00:00:00.000' AS DateTime), 3, 150.1500, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10317, 75, 6, CAST(N'2014-09-30 00:00:00.000' AS DateTime), CAST(N'2014-10-28 00:00:00.000' AS DateTime), CAST(N'2014-10-10 00:00:00.000' AS DateTime), 1, 12.6900, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10318, 68, 8, CAST(N'2014-10-01 00:00:00.000' AS DateTime), CAST(N'2014-10-29 00:00:00.000' AS DateTime), CAST(N'2014-10-04 00:00:00.000' AS DateTime), 2, 4.7300, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10319, 53, 7, CAST(N'2014-10-02 00:00:00.000' AS DateTime), CAST(N'2014-10-30 00:00:00.000' AS DateTime), CAST(N'2014-10-11 00:00:00.000' AS DateTime), 3, 64.5000, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10320, 58, 5, CAST(N'2014-10-03 00:00:00.000' AS DateTime), CAST(N'2014-10-17 00:00:00.000' AS DateTime), CAST(N'2014-10-18 00:00:00.000' AS DateTime), 3, 34.5700, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10321, 68, 3, CAST(N'2014-10-03 00:00:00.000' AS DateTime), CAST(N'2014-10-31 00:00:00.000' AS DateTime), CAST(N'2014-10-11 00:00:00.000' AS DateTime), 2, 3.4300, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10322, 39, 7, CAST(N'2014-10-04 00:00:00.000' AS DateTime), CAST(N'2014-11-01 00:00:00.000' AS DateTime), CAST(N'2014-10-23 00:00:00.000' AS DateTime), 3, 0.4000, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10323, 28, 4, CAST(N'2014-10-07 00:00:00.000' AS DateTime), CAST(N'2014-11-04 00:00:00.000' AS DateTime), CAST(N'2014-10-14 00:00:00.000' AS DateTime), 1, 4.8800, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10324, 67, 9, CAST(N'2014-10-08 00:00:00.000' AS DateTime), CAST(N'2014-11-05 00:00:00.000' AS DateTime), CAST(N'2014-10-10 00:00:00.000' AS DateTime), 1, 214.2700, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10325, 28, 1, CAST(N'2014-10-09 00:00:00.000' AS DateTime), CAST(N'2014-10-23 00:00:00.000' AS DateTime), CAST(N'2014-10-14 00:00:00.000' AS DateTime), 3, 64.8600, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10326, 8, 4, CAST(N'2014-10-10 00:00:00.000' AS DateTime), CAST(N'2014-11-07 00:00:00.000' AS DateTime), CAST(N'2014-10-14 00:00:00.000' AS DateTime), 2, 77.9200, N'C/ Araquil, 67', N'Madrid', NULL, N'28023', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10327, 21, 2, CAST(N'2014-10-11 00:00:00.000' AS DateTime), CAST(N'2014-11-08 00:00:00.000' AS DateTime), CAST(N'2014-10-14 00:00:00.000' AS DateTime), 1, 63.3600, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10328, 25, 4, CAST(N'2014-10-14 00:00:00.000' AS DateTime), CAST(N'2014-11-11 00:00:00.000' AS DateTime), CAST(N'2014-10-17 00:00:00.000' AS DateTime), 3, 87.0300, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10329, 91, 4, CAST(N'2014-10-15 00:00:00.000' AS DateTime), CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2014-10-23 00:00:00.000' AS DateTime), 2, 191.6700, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10330, 69, 3, CAST(N'2014-10-16 00:00:00.000' AS DateTime), CAST(N'2014-11-13 00:00:00.000' AS DateTime), CAST(N'2014-10-28 00:00:00.000' AS DateTime), 1, 12.7500, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10331, 9, 9, CAST(N'2014-10-16 00:00:00.000' AS DateTime), CAST(N'2014-11-27 00:00:00.000' AS DateTime), CAST(N'2014-10-21 00:00:00.000' AS DateTime), 1, 10.1900, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10332, 77, 3, CAST(N'2014-10-17 00:00:00.000' AS DateTime), CAST(N'2014-11-28 00:00:00.000' AS DateTime), CAST(N'2014-10-21 00:00:00.000' AS DateTime), 2, 52.8400, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10333, 58, 5, CAST(N'2014-10-18 00:00:00.000' AS DateTime), CAST(N'2014-11-15 00:00:00.000' AS DateTime), CAST(N'2014-10-25 00:00:00.000' AS DateTime), 3, 0.5900, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10334, 55, 8, CAST(N'2014-10-21 00:00:00.000' AS DateTime), CAST(N'2014-11-18 00:00:00.000' AS DateTime), CAST(N'2014-10-28 00:00:00.000' AS DateTime), 2, 8.5600, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10335, 65, 7, CAST(N'2014-10-22 00:00:00.000' AS DateTime), CAST(N'2014-11-19 00:00:00.000' AS DateTime), CAST(N'2014-10-24 00:00:00.000' AS DateTime), 2, 42.1100, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10336, 41, 7, CAST(N'2014-10-23 00:00:00.000' AS DateTime), CAST(N'2014-11-20 00:00:00.000' AS DateTime), CAST(N'2014-10-25 00:00:00.000' AS DateTime), 2, 15.5100, N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10337, 22, 4, CAST(N'2014-10-24 00:00:00.000' AS DateTime), CAST(N'2014-11-21 00:00:00.000' AS DateTime), CAST(N'2014-10-29 00:00:00.000' AS DateTime), 3, 108.2600, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10338, 61, 4, CAST(N'2014-10-25 00:00:00.000' AS DateTime), CAST(N'2014-11-22 00:00:00.000' AS DateTime), CAST(N'2014-10-29 00:00:00.000' AS DateTime), 3, 84.2100, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10339, 77, 2, CAST(N'2014-10-28 00:00:00.000' AS DateTime), CAST(N'2014-11-25 00:00:00.000' AS DateTime), CAST(N'2014-11-04 00:00:00.000' AS DateTime), 2, 15.6600, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10340, 9, 1, CAST(N'2014-10-29 00:00:00.000' AS DateTime), CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2014-11-08 00:00:00.000' AS DateTime), 3, 166.3100, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10341, 49, 7, CAST(N'2014-10-29 00:00:00.000' AS DateTime), CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2014-11-05 00:00:00.000' AS DateTime), 3, 26.7800, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10342, 22, 4, CAST(N'2014-10-30 00:00:00.000' AS DateTime), CAST(N'2014-11-13 00:00:00.000' AS DateTime), CAST(N'2014-11-04 00:00:00.000' AS DateTime), 2, 54.8300, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10343, 31, 4, CAST(N'2014-10-31 00:00:00.000' AS DateTime), CAST(N'2014-11-28 00:00:00.000' AS DateTime), CAST(N'2014-11-06 00:00:00.000' AS DateTime), 1, 110.3700, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10344, 90, 4, CAST(N'2014-11-01 00:00:00.000' AS DateTime), CAST(N'2014-11-29 00:00:00.000' AS DateTime), CAST(N'2014-11-05 00:00:00.000' AS DateTime), 2, 23.2900, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10345, 42, 2, CAST(N'2014-11-04 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), CAST(N'2014-11-11 00:00:00.000' AS DateTime), 2, 249.0600, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10346, 71, 3, CAST(N'2014-11-05 00:00:00.000' AS DateTime), CAST(N'2014-12-17 00:00:00.000' AS DateTime), CAST(N'2014-11-08 00:00:00.000' AS DateTime), 3, 142.0800, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10347, 82, 4, CAST(N'2014-11-06 00:00:00.000' AS DateTime), CAST(N'2014-12-04 00:00:00.000' AS DateTime), CAST(N'2014-11-08 00:00:00.000' AS DateTime), 3, 3.1000, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10348, 57, 4, CAST(N'2014-11-07 00:00:00.000' AS DateTime), CAST(N'2014-12-05 00:00:00.000' AS DateTime), CAST(N'2014-11-15 00:00:00.000' AS DateTime), 2, 0.7800, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10349, 91, 7, CAST(N'2014-11-08 00:00:00.000' AS DateTime), CAST(N'2014-12-06 00:00:00.000' AS DateTime), CAST(N'2014-11-15 00:00:00.000' AS DateTime), 1, 8.6300, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10350, 30, 6, CAST(N'2014-11-11 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2014-12-03 00:00:00.000' AS DateTime), 2, 64.1900, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10351, 18, 1, CAST(N'2014-11-11 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2014-11-20 00:00:00.000' AS DateTime), 1, 162.3300, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10352, 25, 3, CAST(N'2014-11-12 00:00:00.000' AS DateTime), CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2014-11-18 00:00:00.000' AS DateTime), 3, 1.3000, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10353, 40, 7, CAST(N'2014-11-13 00:00:00.000' AS DateTime), CAST(N'2014-12-11 00:00:00.000' AS DateTime), CAST(N'2014-11-25 00:00:00.000' AS DateTime), 3, 360.6300, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10354, 39, 8, CAST(N'2014-11-14 00:00:00.000' AS DateTime), CAST(N'2014-12-12 00:00:00.000' AS DateTime), CAST(N'2014-11-20 00:00:00.000' AS DateTime), 3, 53.8000, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10355, 4, 6, CAST(N'2014-11-15 00:00:00.000' AS DateTime), CAST(N'2014-12-13 00:00:00.000' AS DateTime), CAST(N'2014-11-20 00:00:00.000' AS DateTime), 1, 41.9500, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10356, 57, 6, CAST(N'2014-11-18 00:00:00.000' AS DateTime), CAST(N'2014-12-16 00:00:00.000' AS DateTime), CAST(N'2014-11-27 00:00:00.000' AS DateTime), 2, 36.7100, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10357, 69, 1, CAST(N'2014-11-19 00:00:00.000' AS DateTime), CAST(N'2014-12-17 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), 3, 34.8800, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10358, 30, 5, CAST(N'2014-11-20 00:00:00.000' AS DateTime), CAST(N'2014-12-18 00:00:00.000' AS DateTime), CAST(N'2014-11-27 00:00:00.000' AS DateTime), 1, 19.6400, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10359, 48, 5, CAST(N'2014-11-21 00:00:00.000' AS DateTime), CAST(N'2014-12-19 00:00:00.000' AS DateTime), CAST(N'2014-11-26 00:00:00.000' AS DateTime), 3, 288.4300, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10360, 7, 4, CAST(N'2014-11-22 00:00:00.000' AS DateTime), CAST(N'2014-12-20 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), 3, 131.7000, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10361, 42, 1, CAST(N'2014-11-22 00:00:00.000' AS DateTime), CAST(N'2014-12-20 00:00:00.000' AS DateTime), CAST(N'2014-12-03 00:00:00.000' AS DateTime), 2, 183.1700, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10362, 9, 3, CAST(N'2014-11-25 00:00:00.000' AS DateTime), CAST(N'2014-12-23 00:00:00.000' AS DateTime), CAST(N'2014-11-28 00:00:00.000' AS DateTime), 1, 96.0400, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10363, 15, 4, CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2014-12-24 00:00:00.000' AS DateTime), CAST(N'2014-12-04 00:00:00.000' AS DateTime), 3, 30.5400, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10364, 17, 1, CAST(N'2014-11-26 00:00:00.000' AS DateTime), CAST(N'2015-01-07 00:00:00.000' AS DateTime), CAST(N'2014-12-04 00:00:00.000' AS DateTime), 1, 71.9700, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10365, 3, 3, CAST(N'2014-11-27 00:00:00.000' AS DateTime), CAST(N'2014-12-25 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), 2, 22.0000, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10366, 26, 8, CAST(N'2014-11-28 00:00:00.000' AS DateTime), CAST(N'2015-01-09 00:00:00.000' AS DateTime), CAST(N'2014-12-30 00:00:00.000' AS DateTime), 2, 10.1400, N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10367, 54, 7, CAST(N'2014-11-28 00:00:00.000' AS DateTime), CAST(N'2014-12-26 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), 3, 13.5500, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10368, 18, 2, CAST(N'2014-11-29 00:00:00.000' AS DateTime), CAST(N'2014-12-27 00:00:00.000' AS DateTime), CAST(N'2014-12-02 00:00:00.000' AS DateTime), 2, 101.9500, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10369, 91, 8, CAST(N'2014-12-02 00:00:00.000' AS DateTime), CAST(N'2014-12-30 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), 2, 195.6800, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10370, 13, 6, CAST(N'2014-12-03 00:00:00.000' AS DateTime), CAST(N'2014-12-31 00:00:00.000' AS DateTime), CAST(N'2014-12-27 00:00:00.000' AS DateTime), 2, 1.1700, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10371, 30, 1, CAST(N'2014-12-03 00:00:00.000' AS DateTime), CAST(N'2014-12-31 00:00:00.000' AS DateTime), CAST(N'2014-12-24 00:00:00.000' AS DateTime), 1, 0.4500, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10372, 84, 5, CAST(N'2014-12-04 00:00:00.000' AS DateTime), CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), 2, 890.7800, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10373, 65, 4, CAST(N'2014-12-05 00:00:00.000' AS DateTime), CAST(N'2015-01-02 00:00:00.000' AS DateTime), CAST(N'2014-12-11 00:00:00.000' AS DateTime), 3, 124.1200, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10374, 60, 1, CAST(N'2014-12-05 00:00:00.000' AS DateTime), CAST(N'2015-01-02 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), 3, 3.9400, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10375, 74, 3, CAST(N'2014-12-06 00:00:00.000' AS DateTime), CAST(N'2015-01-03 00:00:00.000' AS DateTime), CAST(N'2014-12-09 00:00:00.000' AS DateTime), 2, 20.1200, N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10376, 77, 1, CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2015-01-06 00:00:00.000' AS DateTime), CAST(N'2014-12-13 00:00:00.000' AS DateTime), 2, 20.3900, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10377, 48, 1, CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2015-01-06 00:00:00.000' AS DateTime), CAST(N'2014-12-13 00:00:00.000' AS DateTime), 3, 22.2100, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10378, 21, 5, CAST(N'2014-12-10 00:00:00.000' AS DateTime), CAST(N'2015-01-07 00:00:00.000' AS DateTime), CAST(N'2014-12-19 00:00:00.000' AS DateTime), 3, 5.4400, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10379, 79, 2, CAST(N'2014-12-11 00:00:00.000' AS DateTime), CAST(N'2015-01-08 00:00:00.000' AS DateTime), CAST(N'2014-12-13 00:00:00.000' AS DateTime), 1, 45.0300, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10380, 65, 8, CAST(N'2014-12-12 00:00:00.000' AS DateTime), CAST(N'2015-01-09 00:00:00.000' AS DateTime), CAST(N'2015-01-16 00:00:00.000' AS DateTime), 3, 35.0300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10381, 69, 3, CAST(N'2014-12-12 00:00:00.000' AS DateTime), CAST(N'2015-01-09 00:00:00.000' AS DateTime), CAST(N'2014-12-13 00:00:00.000' AS DateTime), 3, 7.9900, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10382, 18, 4, CAST(N'2014-12-13 00:00:00.000' AS DateTime), CAST(N'2015-01-10 00:00:00.000' AS DateTime), CAST(N'2014-12-16 00:00:00.000' AS DateTime), 1, 94.7700, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10383, 4, 8, CAST(N'2014-12-16 00:00:00.000' AS DateTime), CAST(N'2015-01-13 00:00:00.000' AS DateTime), CAST(N'2014-12-18 00:00:00.000' AS DateTime), 3, 34.2400, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10384, 5, 3, CAST(N'2014-12-16 00:00:00.000' AS DateTime), CAST(N'2015-01-13 00:00:00.000' AS DateTime), CAST(N'2014-12-20 00:00:00.000' AS DateTime), 3, 168.6400, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10385, 91, 1, CAST(N'2014-12-17 00:00:00.000' AS DateTime), CAST(N'2015-01-14 00:00:00.000' AS DateTime), CAST(N'2014-12-23 00:00:00.000' AS DateTime), 2, 30.9600, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10386, 82, 9, CAST(N'2014-12-18 00:00:00.000' AS DateTime), CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2014-12-25 00:00:00.000' AS DateTime), 3, 13.9900, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10387, 47, 1, CAST(N'2014-12-18 00:00:00.000' AS DateTime), CAST(N'2015-01-15 00:00:00.000' AS DateTime), CAST(N'2014-12-20 00:00:00.000' AS DateTime), 2, 93.6300, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10388, 48, 2, CAST(N'2014-12-19 00:00:00.000' AS DateTime), CAST(N'2015-01-16 00:00:00.000' AS DateTime), CAST(N'2014-12-20 00:00:00.000' AS DateTime), 1, 34.8600, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10389, 62, 4, CAST(N'2014-12-20 00:00:00.000' AS DateTime), CAST(N'2015-01-17 00:00:00.000' AS DateTime), CAST(N'2014-12-24 00:00:00.000' AS DateTime), 2, 47.4200, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10390, 18, 6, CAST(N'2014-12-23 00:00:00.000' AS DateTime), CAST(N'2015-01-20 00:00:00.000' AS DateTime), CAST(N'2014-12-26 00:00:00.000' AS DateTime), 1, 126.3800, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10391, 15, 3, CAST(N'2014-12-23 00:00:00.000' AS DateTime), CAST(N'2015-01-20 00:00:00.000' AS DateTime), CAST(N'2014-12-31 00:00:00.000' AS DateTime), 3, 5.4500, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10392, 40, 2, CAST(N'2014-12-24 00:00:00.000' AS DateTime), CAST(N'2015-01-21 00:00:00.000' AS DateTime), CAST(N'2015-01-01 00:00:00.000' AS DateTime), 3, 122.4600, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10393, 67, 1, CAST(N'2014-12-25 00:00:00.000' AS DateTime), CAST(N'2015-01-22 00:00:00.000' AS DateTime), CAST(N'2015-01-03 00:00:00.000' AS DateTime), 3, 126.5600, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10394, 74, 1, CAST(N'2014-12-25 00:00:00.000' AS DateTime), CAST(N'2015-01-22 00:00:00.000' AS DateTime), CAST(N'2015-01-03 00:00:00.000' AS DateTime), 3, 30.3400, N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10395, 87, 6, CAST(N'2014-12-26 00:00:00.000' AS DateTime), CAST(N'2015-01-23 00:00:00.000' AS DateTime), CAST(N'2015-01-03 00:00:00.000' AS DateTime), 1, 184.4100, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10396, 22, 1, CAST(N'2014-12-27 00:00:00.000' AS DateTime), CAST(N'2015-01-10 00:00:00.000' AS DateTime), CAST(N'2015-01-06 00:00:00.000' AS DateTime), 3, 135.3500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10397, 41, 5, CAST(N'2014-12-27 00:00:00.000' AS DateTime), CAST(N'2015-01-24 00:00:00.000' AS DateTime), CAST(N'2015-01-02 00:00:00.000' AS DateTime), 1, 60.2600, N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10398, 67, 2, CAST(N'2014-12-30 00:00:00.000' AS DateTime), CAST(N'2015-01-27 00:00:00.000' AS DateTime), CAST(N'2015-01-09 00:00:00.000' AS DateTime), 3, 89.1600, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10399, 54, 8, CAST(N'2014-12-31 00:00:00.000' AS DateTime), CAST(N'2015-01-14 00:00:00.000' AS DateTime), CAST(N'2015-01-08 00:00:00.000' AS DateTime), 3, 27.3600, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10400, 17, 1, CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2015-01-29 00:00:00.000' AS DateTime), CAST(N'2015-01-16 00:00:00.000' AS DateTime), 3, 83.9300, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10401, 71, 1, CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2015-01-29 00:00:00.000' AS DateTime), CAST(N'2015-01-10 00:00:00.000' AS DateTime), 1, 12.5100, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10402, 18, 8, CAST(N'2015-01-02 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-01-10 00:00:00.000' AS DateTime), 2, 67.8800, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10403, 18, 4, CAST(N'2015-01-03 00:00:00.000' AS DateTime), CAST(N'2015-01-31 00:00:00.000' AS DateTime), CAST(N'2015-01-09 00:00:00.000' AS DateTime), 3, 73.7900, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10404, 32, 2, CAST(N'2015-01-03 00:00:00.000' AS DateTime), CAST(N'2015-01-31 00:00:00.000' AS DateTime), CAST(N'2015-01-08 00:00:00.000' AS DateTime), 1, 155.9700, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10405, 72, 1, CAST(N'2015-01-06 00:00:00.000' AS DateTime), CAST(N'2015-02-03 00:00:00.000' AS DateTime), CAST(N'2015-01-22 00:00:00.000' AS DateTime), 1, 34.8200, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10406, 84, 7, CAST(N'2015-01-07 00:00:00.000' AS DateTime), CAST(N'2015-02-18 00:00:00.000' AS DateTime), CAST(N'2015-01-13 00:00:00.000' AS DateTime), 1, 108.0400, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10407, 37, 2, CAST(N'2015-01-07 00:00:00.000' AS DateTime), CAST(N'2015-02-04 00:00:00.000' AS DateTime), CAST(N'2015-01-30 00:00:00.000' AS DateTime), 2, 91.4800, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10408, 20, 8, CAST(N'2015-01-08 00:00:00.000' AS DateTime), CAST(N'2015-02-05 00:00:00.000' AS DateTime), CAST(N'2015-01-14 00:00:00.000' AS DateTime), 1, 11.2600, N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10409, 36, 3, CAST(N'2015-01-09 00:00:00.000' AS DateTime), CAST(N'2015-02-06 00:00:00.000' AS DateTime), CAST(N'2015-01-14 00:00:00.000' AS DateTime), 1, 29.8300, N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10410, 62, 3, CAST(N'2015-01-10 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), CAST(N'2015-01-15 00:00:00.000' AS DateTime), 3, 2.4000, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10411, 62, 9, CAST(N'2015-01-10 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), CAST(N'2015-01-21 00:00:00.000' AS DateTime), 3, 23.6500, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10412, 58, 8, CAST(N'2015-01-13 00:00:00.000' AS DateTime), CAST(N'2015-02-10 00:00:00.000' AS DateTime), CAST(N'2015-01-15 00:00:00.000' AS DateTime), 2, 3.7700, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10413, 30, 3, CAST(N'2015-01-14 00:00:00.000' AS DateTime), CAST(N'2015-02-11 00:00:00.000' AS DateTime), CAST(N'2015-01-16 00:00:00.000' AS DateTime), 2, 95.6600, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10414, 82, 2, CAST(N'2015-01-14 00:00:00.000' AS DateTime), CAST(N'2015-02-11 00:00:00.000' AS DateTime), CAST(N'2015-01-17 00:00:00.000' AS DateTime), 3, 21.4800, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10415, 74, 3, CAST(N'2015-01-15 00:00:00.000' AS DateTime), CAST(N'2015-02-12 00:00:00.000' AS DateTime), CAST(N'2015-01-24 00:00:00.000' AS DateTime), 1, 0.2000, N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10416, 58, 8, CAST(N'2015-01-16 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-01-27 00:00:00.000' AS DateTime), 3, 22.7200, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10417, 49, 4, CAST(N'2015-01-16 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-01-28 00:00:00.000' AS DateTime), 3, 70.2900, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10418, 42, 4, CAST(N'2015-01-17 00:00:00.000' AS DateTime), CAST(N'2015-02-14 00:00:00.000' AS DateTime), CAST(N'2015-01-24 00:00:00.000' AS DateTime), 1, 17.5500, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10419, 45, 4, CAST(N'2015-01-20 00:00:00.000' AS DateTime), CAST(N'2015-02-17 00:00:00.000' AS DateTime), CAST(N'2015-01-30 00:00:00.000' AS DateTime), 2, 137.3500, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10420, 86, 3, CAST(N'2015-01-21 00:00:00.000' AS DateTime), CAST(N'2015-02-18 00:00:00.000' AS DateTime), CAST(N'2015-01-27 00:00:00.000' AS DateTime), 1, 44.1200, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10421, 79, 8, CAST(N'2015-01-21 00:00:00.000' AS DateTime), CAST(N'2015-03-04 00:00:00.000' AS DateTime), CAST(N'2015-01-27 00:00:00.000' AS DateTime), 1, 99.2300, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10422, 24, 2, CAST(N'2015-01-22 00:00:00.000' AS DateTime), CAST(N'2015-02-19 00:00:00.000' AS DateTime), CAST(N'2015-01-31 00:00:00.000' AS DateTime), 1, 3.0200, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10423, 83, 6, CAST(N'2015-01-23 00:00:00.000' AS DateTime), CAST(N'2015-02-06 00:00:00.000' AS DateTime), CAST(N'2015-02-24 00:00:00.000' AS DateTime), 3, 24.5000, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10424, 77, 7, CAST(N'2015-01-23 00:00:00.000' AS DateTime), CAST(N'2015-02-20 00:00:00.000' AS DateTime), CAST(N'2015-01-27 00:00:00.000' AS DateTime), 2, 370.6100, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10425, 30, 6, CAST(N'2015-01-24 00:00:00.000' AS DateTime), CAST(N'2015-02-21 00:00:00.000' AS DateTime), CAST(N'2015-02-14 00:00:00.000' AS DateTime), 2, 7.9300, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10426, 26, 4, CAST(N'2015-01-27 00:00:00.000' AS DateTime), CAST(N'2015-02-24 00:00:00.000' AS DateTime), CAST(N'2015-02-06 00:00:00.000' AS DateTime), 1, 18.6900, N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10427, 40, 4, CAST(N'2015-01-27 00:00:00.000' AS DateTime), CAST(N'2015-02-24 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), 2, 31.2900, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10428, 44, 7, CAST(N'2015-01-28 00:00:00.000' AS DateTime), CAST(N'2015-02-25 00:00:00.000' AS DateTime), CAST(N'2015-02-04 00:00:00.000' AS DateTime), 1, 11.0900, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10429, 65, 3, CAST(N'2015-01-29 00:00:00.000' AS DateTime), CAST(N'2015-03-12 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), 2, 56.6300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10430, 18, 4, CAST(N'2015-01-30 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-02-03 00:00:00.000' AS DateTime), 1, 458.7800, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10431, 62, 4, CAST(N'2015-01-30 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), 2, 44.1700, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10432, 91, 3, CAST(N'2015-01-31 00:00:00.000' AS DateTime), CAST(N'2015-02-14 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), 2, 4.3400, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10433, 41, 3, CAST(N'2015-02-03 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), CAST(N'2015-03-04 00:00:00.000' AS DateTime), 3, 73.8300, N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10434, 21, 3, CAST(N'2015-02-03 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), CAST(N'2015-02-13 00:00:00.000' AS DateTime), 2, 17.9200, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10435, 14, 8, CAST(N'2015-02-04 00:00:00.000' AS DateTime), CAST(N'2015-03-18 00:00:00.000' AS DateTime), CAST(N'2015-02-07 00:00:00.000' AS DateTime), 2, 9.2100, N'Berkeley Gardens 12  Brewery', N'London', NULL, N'WX1 6LT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10436, 7, 3, CAST(N'2015-02-05 00:00:00.000' AS DateTime), CAST(N'2015-03-05 00:00:00.000' AS DateTime), CAST(N'2015-02-11 00:00:00.000' AS DateTime), 2, 156.6600, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10437, 58, 8, CAST(N'2015-02-05 00:00:00.000' AS DateTime), CAST(N'2015-03-05 00:00:00.000' AS DateTime), CAST(N'2015-02-12 00:00:00.000' AS DateTime), 1, 19.9700, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10438, 52, 3, CAST(N'2015-02-06 00:00:00.000' AS DateTime), CAST(N'2015-03-06 00:00:00.000' AS DateTime), CAST(N'2015-02-14 00:00:00.000' AS DateTime), 2, 8.2400, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10439, 77, 6, CAST(N'2015-02-07 00:00:00.000' AS DateTime), CAST(N'2015-03-07 00:00:00.000' AS DateTime), CAST(N'2015-02-10 00:00:00.000' AS DateTime), 3, 4.0700, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10440, 67, 4, CAST(N'2015-02-10 00:00:00.000' AS DateTime), CAST(N'2015-03-10 00:00:00.000' AS DateTime), CAST(N'2015-02-28 00:00:00.000' AS DateTime), 2, 86.5300, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10441, 61, 3, CAST(N'2015-02-10 00:00:00.000' AS DateTime), CAST(N'2015-03-24 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), 2, 73.0200, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10442, 18, 3, CAST(N'2015-02-11 00:00:00.000' AS DateTime), CAST(N'2015-03-11 00:00:00.000' AS DateTime), CAST(N'2015-02-18 00:00:00.000' AS DateTime), 2, 47.9400, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10443, 44, 8, CAST(N'2015-02-12 00:00:00.000' AS DateTime), CAST(N'2015-03-12 00:00:00.000' AS DateTime), CAST(N'2015-02-14 00:00:00.000' AS DateTime), 1, 13.9500, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10444, 5, 3, CAST(N'2015-02-12 00:00:00.000' AS DateTime), CAST(N'2015-03-12 00:00:00.000' AS DateTime), CAST(N'2015-02-21 00:00:00.000' AS DateTime), 3, 3.5000, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10445, 5, 3, CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-03-13 00:00:00.000' AS DateTime), CAST(N'2015-02-20 00:00:00.000' AS DateTime), 1, 9.3000, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10446, 52, 6, CAST(N'2015-02-14 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), CAST(N'2015-02-19 00:00:00.000' AS DateTime), 1, 14.6800, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10447, 80, 4, CAST(N'2015-02-14 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), CAST(N'2015-03-07 00:00:00.000' AS DateTime), 2, 68.6600, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10448, 43, 4, CAST(N'2015-02-17 00:00:00.000' AS DateTime), CAST(N'2015-03-17 00:00:00.000' AS DateTime), CAST(N'2015-02-24 00:00:00.000' AS DateTime), 2, 38.8200, N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10449, 7, 3, CAST(N'2015-02-18 00:00:00.000' AS DateTime), CAST(N'2015-03-18 00:00:00.000' AS DateTime), CAST(N'2015-02-27 00:00:00.000' AS DateTime), 2, 53.3000, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10450, 55, 8, CAST(N'2015-02-19 00:00:00.000' AS DateTime), CAST(N'2015-03-19 00:00:00.000' AS DateTime), CAST(N'2015-03-11 00:00:00.000' AS DateTime), 2, 7.2300, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10451, 42, 4, CAST(N'2015-02-19 00:00:00.000' AS DateTime), CAST(N'2015-03-05 00:00:00.000' AS DateTime), CAST(N'2015-03-12 00:00:00.000' AS DateTime), 3, 189.0900, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10452, 67, 8, CAST(N'2015-02-20 00:00:00.000' AS DateTime), CAST(N'2015-03-20 00:00:00.000' AS DateTime), CAST(N'2015-02-26 00:00:00.000' AS DateTime), 1, 140.2600, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10453, 4, 1, CAST(N'2015-02-21 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), CAST(N'2015-02-26 00:00:00.000' AS DateTime), 2, 25.3600, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10454, 30, 4, CAST(N'2015-02-21 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), CAST(N'2015-02-25 00:00:00.000' AS DateTime), 3, 2.7400, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10455, 58, 8, CAST(N'2015-02-24 00:00:00.000' AS DateTime), CAST(N'2015-04-07 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), 2, 180.4500, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10456, 28, 8, CAST(N'2015-02-25 00:00:00.000' AS DateTime), CAST(N'2015-04-08 00:00:00.000' AS DateTime), CAST(N'2015-02-28 00:00:00.000' AS DateTime), 2, 8.1200, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10457, 28, 2, CAST(N'2015-02-25 00:00:00.000' AS DateTime), CAST(N'2015-03-25 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), 1, 11.5700, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10458, 51, 7, CAST(N'2015-02-26 00:00:00.000' AS DateTime), CAST(N'2015-03-26 00:00:00.000' AS DateTime), CAST(N'2015-03-04 00:00:00.000' AS DateTime), 3, 147.0600, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10459, 55, 4, CAST(N'2015-02-27 00:00:00.000' AS DateTime), CAST(N'2015-03-27 00:00:00.000' AS DateTime), CAST(N'2015-02-28 00:00:00.000' AS DateTime), 2, 25.0900, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10460, 21, 8, CAST(N'2015-02-28 00:00:00.000' AS DateTime), CAST(N'2015-03-28 00:00:00.000' AS DateTime), CAST(N'2015-03-03 00:00:00.000' AS DateTime), 1, 16.2700, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10461, 69, 1, CAST(N'2015-02-28 00:00:00.000' AS DateTime), CAST(N'2015-03-28 00:00:00.000' AS DateTime), CAST(N'2015-03-05 00:00:00.000' AS DateTime), 3, 148.6100, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10462, 14, 2, CAST(N'2015-03-03 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime), CAST(N'2015-03-18 00:00:00.000' AS DateTime), 1, 6.1700, N'Berkeley Gardens 12  Brewery', N'London', NULL, N'WX1 6LT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10463, 51, 5, CAST(N'2015-03-04 00:00:00.000' AS DateTime), CAST(N'2015-04-01 00:00:00.000' AS DateTime), CAST(N'2015-03-06 00:00:00.000' AS DateTime), 3, 14.7800, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10464, 25, 4, CAST(N'2015-03-04 00:00:00.000' AS DateTime), CAST(N'2015-04-01 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), 2, 89.0000, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10465, 54, 1, CAST(N'2015-03-05 00:00:00.000' AS DateTime), CAST(N'2015-04-02 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), 3, 145.0400, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10466, 81, 4, CAST(N'2015-03-06 00:00:00.000' AS DateTime), CAST(N'2015-04-03 00:00:00.000' AS DateTime), CAST(N'2015-03-13 00:00:00.000' AS DateTime), 1, 11.9300, N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10467, 32, 8, CAST(N'2015-03-06 00:00:00.000' AS DateTime), CAST(N'2015-04-03 00:00:00.000' AS DateTime), CAST(N'2015-03-11 00:00:00.000' AS DateTime), 2, 4.9300, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10468, 28, 3, CAST(N'2015-03-07 00:00:00.000' AS DateTime), CAST(N'2015-04-04 00:00:00.000' AS DateTime), CAST(N'2015-03-12 00:00:00.000' AS DateTime), 3, 44.1200, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10469, 90, 1, CAST(N'2015-03-10 00:00:00.000' AS DateTime), CAST(N'2015-04-07 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), 1, 60.1800, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10470, 9, 4, CAST(N'2015-03-11 00:00:00.000' AS DateTime), CAST(N'2015-04-08 00:00:00.000' AS DateTime), CAST(N'2015-03-14 00:00:00.000' AS DateTime), 2, 64.5600, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10471, 10, 2, CAST(N'2015-03-11 00:00:00.000' AS DateTime), CAST(N'2015-04-08 00:00:00.000' AS DateTime), CAST(N'2015-03-18 00:00:00.000' AS DateTime), 3, 45.5900, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10472, 48, 8, CAST(N'2015-03-12 00:00:00.000' AS DateTime), CAST(N'2015-04-09 00:00:00.000' AS DateTime), CAST(N'2015-03-19 00:00:00.000' AS DateTime), 1, 4.2000, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10473, 68, 1, CAST(N'2015-03-13 00:00:00.000' AS DateTime), CAST(N'2015-03-27 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), 3, 16.3700, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10474, 39, 5, CAST(N'2015-03-13 00:00:00.000' AS DateTime), CAST(N'2015-04-10 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), 2, 83.4900, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10475, 51, 9, CAST(N'2015-03-14 00:00:00.000' AS DateTime), CAST(N'2015-04-11 00:00:00.000' AS DateTime), CAST(N'2015-04-04 00:00:00.000' AS DateTime), 1, 68.5200, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10476, 87, 8, CAST(N'2015-03-17 00:00:00.000' AS DateTime), CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2015-03-24 00:00:00.000' AS DateTime), 3, 4.4100, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10477, 41, 5, CAST(N'2015-03-17 00:00:00.000' AS DateTime), CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2015-03-25 00:00:00.000' AS DateTime), 2, 13.0200, N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10478, 55, 2, CAST(N'2015-03-18 00:00:00.000' AS DateTime), CAST(N'2015-04-01 00:00:00.000' AS DateTime), CAST(N'2015-03-26 00:00:00.000' AS DateTime), 3, 4.8100, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10479, 71, 3, CAST(N'2015-03-19 00:00:00.000' AS DateTime), CAST(N'2015-04-16 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), 3, 708.9500, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10480, 20, 6, CAST(N'2015-03-20 00:00:00.000' AS DateTime), CAST(N'2015-04-17 00:00:00.000' AS DateTime), CAST(N'2015-03-24 00:00:00.000' AS DateTime), 2, 1.3500, N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10481, 80, 8, CAST(N'2015-03-20 00:00:00.000' AS DateTime), CAST(N'2015-04-17 00:00:00.000' AS DateTime), CAST(N'2015-03-25 00:00:00.000' AS DateTime), 2, 64.3300, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10482, 88, 1, CAST(N'2015-03-21 00:00:00.000' AS DateTime), CAST(N'2015-04-18 00:00:00.000' AS DateTime), CAST(N'2015-04-10 00:00:00.000' AS DateTime), 3, 7.4800, N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10483, 90, 7, CAST(N'2015-03-24 00:00:00.000' AS DateTime), CAST(N'2015-04-21 00:00:00.000' AS DateTime), CAST(N'2015-04-25 00:00:00.000' AS DateTime), 2, 15.2800, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10484, 10, 3, CAST(N'2015-03-24 00:00:00.000' AS DateTime), CAST(N'2015-04-21 00:00:00.000' AS DateTime), CAST(N'2015-04-01 00:00:00.000' AS DateTime), 3, 6.8800, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10485, 72, 4, CAST(N'2015-03-25 00:00:00.000' AS DateTime), CAST(N'2015-04-08 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime), 2, 64.4500, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10486, 87, 1, CAST(N'2015-03-26 00:00:00.000' AS DateTime), CAST(N'2015-04-23 00:00:00.000' AS DateTime), CAST(N'2015-04-02 00:00:00.000' AS DateTime), 2, 30.5300, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10487, 84, 2, CAST(N'2015-03-26 00:00:00.000' AS DateTime), CAST(N'2015-04-23 00:00:00.000' AS DateTime), CAST(N'2015-03-28 00:00:00.000' AS DateTime), 2, 71.0700, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10488, 22, 8, CAST(N'2015-03-27 00:00:00.000' AS DateTime), CAST(N'2015-04-24 00:00:00.000' AS DateTime), CAST(N'2015-04-02 00:00:00.000' AS DateTime), 2, 4.9300, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10489, 40, 6, CAST(N'2015-03-28 00:00:00.000' AS DateTime), CAST(N'2015-04-25 00:00:00.000' AS DateTime), CAST(N'2015-04-09 00:00:00.000' AS DateTime), 2, 5.2900, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10490, 87, 7, CAST(N'2015-03-31 00:00:00.000' AS DateTime), CAST(N'2015-04-28 00:00:00.000' AS DateTime), CAST(N'2015-04-03 00:00:00.000' AS DateTime), 2, 210.1900, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10491, 25, 8, CAST(N'2015-03-31 00:00:00.000' AS DateTime), CAST(N'2015-04-28 00:00:00.000' AS DateTime), CAST(N'2015-04-08 00:00:00.000' AS DateTime), 3, 16.9600, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10492, 62, 3, CAST(N'2015-04-01 00:00:00.000' AS DateTime), CAST(N'2015-04-29 00:00:00.000' AS DateTime), CAST(N'2015-04-11 00:00:00.000' AS DateTime), 1, 62.8900, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10493, 30, 4, CAST(N'2015-04-02 00:00:00.000' AS DateTime), CAST(N'2015-04-30 00:00:00.000' AS DateTime), CAST(N'2015-04-10 00:00:00.000' AS DateTime), 3, 10.6400, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10494, 81, 4, CAST(N'2015-04-02 00:00:00.000' AS DateTime), CAST(N'2015-04-30 00:00:00.000' AS DateTime), CAST(N'2015-04-09 00:00:00.000' AS DateTime), 2, 65.9900, N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10495, 63, 3, CAST(N'2015-04-03 00:00:00.000' AS DateTime), CAST(N'2015-05-01 00:00:00.000' AS DateTime), CAST(N'2015-04-11 00:00:00.000' AS DateTime), 3, 4.6500, N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10496, 85, 7, CAST(N'2015-04-04 00:00:00.000' AS DateTime), CAST(N'2015-05-02 00:00:00.000' AS DateTime), CAST(N'2015-04-07 00:00:00.000' AS DateTime), 2, 46.7700, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10497, 31, 7, CAST(N'2015-04-04 00:00:00.000' AS DateTime), CAST(N'2015-05-02 00:00:00.000' AS DateTime), CAST(N'2015-04-07 00:00:00.000' AS DateTime), 1, 36.2100, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10498, 87, 8, CAST(N'2015-04-07 00:00:00.000' AS DateTime), CAST(N'2015-05-05 00:00:00.000' AS DateTime), CAST(N'2015-04-11 00:00:00.000' AS DateTime), 2, 29.7500, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10499, 69, 4, CAST(N'2015-04-08 00:00:00.000' AS DateTime), CAST(N'2015-05-06 00:00:00.000' AS DateTime), CAST(N'2015-04-16 00:00:00.000' AS DateTime), 2, 102.0200, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10500, 30, 6, CAST(N'2015-04-09 00:00:00.000' AS DateTime), CAST(N'2015-05-07 00:00:00.000' AS DateTime), CAST(N'2015-04-17 00:00:00.000' AS DateTime), 1, 42.6800, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10501, 6, 9, CAST(N'2015-04-09 00:00:00.000' AS DateTime), CAST(N'2015-05-07 00:00:00.000' AS DateTime), CAST(N'2015-04-16 00:00:00.000' AS DateTime), 3, 8.8500, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10502, 39, 2, CAST(N'2015-04-10 00:00:00.000' AS DateTime), CAST(N'2015-05-08 00:00:00.000' AS DateTime), CAST(N'2015-04-29 00:00:00.000' AS DateTime), 1, 69.3200, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10503, 65, 6, CAST(N'2015-04-11 00:00:00.000' AS DateTime), CAST(N'2015-05-09 00:00:00.000' AS DateTime), CAST(N'2015-04-16 00:00:00.000' AS DateTime), 2, 16.7400, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10504, 90, 4, CAST(N'2015-04-11 00:00:00.000' AS DateTime), CAST(N'2015-05-09 00:00:00.000' AS DateTime), CAST(N'2015-04-18 00:00:00.000' AS DateTime), 3, 59.1300, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10505, 77, 3, CAST(N'2015-04-14 00:00:00.000' AS DateTime), CAST(N'2015-05-12 00:00:00.000' AS DateTime), CAST(N'2015-04-21 00:00:00.000' AS DateTime), 3, 7.1300, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10506, 28, 9, CAST(N'2015-04-15 00:00:00.000' AS DateTime), CAST(N'2015-05-13 00:00:00.000' AS DateTime), CAST(N'2015-05-02 00:00:00.000' AS DateTime), 2, 21.1900, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10507, 3, 7, CAST(N'2015-04-15 00:00:00.000' AS DateTime), CAST(N'2015-05-13 00:00:00.000' AS DateTime), CAST(N'2015-04-22 00:00:00.000' AS DateTime), 1, 47.4500, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10508, 37, 1, CAST(N'2015-04-16 00:00:00.000' AS DateTime), CAST(N'2015-05-14 00:00:00.000' AS DateTime), CAST(N'2015-05-13 00:00:00.000' AS DateTime), 2, 4.9900, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10509, 6, 4, CAST(N'2015-04-17 00:00:00.000' AS DateTime), CAST(N'2015-05-15 00:00:00.000' AS DateTime), CAST(N'2015-04-29 00:00:00.000' AS DateTime), 1, 0.1500, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10510, 67, 6, CAST(N'2015-04-18 00:00:00.000' AS DateTime), CAST(N'2015-05-16 00:00:00.000' AS DateTime), CAST(N'2015-04-28 00:00:00.000' AS DateTime), 3, 367.6300, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10511, 9, 4, CAST(N'2015-04-18 00:00:00.000' AS DateTime), CAST(N'2015-05-16 00:00:00.000' AS DateTime), CAST(N'2015-04-21 00:00:00.000' AS DateTime), 3, 350.6400, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10512, 82, 7, CAST(N'2015-04-21 00:00:00.000' AS DateTime), CAST(N'2015-05-19 00:00:00.000' AS DateTime), CAST(N'2015-04-24 00:00:00.000' AS DateTime), 2, 3.5300, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10513, 57, 7, CAST(N'2015-04-22 00:00:00.000' AS DateTime), CAST(N'2015-06-03 00:00:00.000' AS DateTime), CAST(N'2015-04-28 00:00:00.000' AS DateTime), 1, 105.6500, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10514, 18, 3, CAST(N'2015-04-22 00:00:00.000' AS DateTime), CAST(N'2015-05-20 00:00:00.000' AS DateTime), CAST(N'2015-05-16 00:00:00.000' AS DateTime), 2, 789.9500, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10515, 42, 2, CAST(N'2015-04-23 00:00:00.000' AS DateTime), CAST(N'2015-05-07 00:00:00.000' AS DateTime), CAST(N'2015-05-23 00:00:00.000' AS DateTime), 1, 204.4700, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10516, 65, 2, CAST(N'2015-04-24 00:00:00.000' AS DateTime), CAST(N'2015-05-22 00:00:00.000' AS DateTime), CAST(N'2015-05-01 00:00:00.000' AS DateTime), 3, 62.7800, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10517, 35, 3, CAST(N'2015-04-24 00:00:00.000' AS DateTime), CAST(N'2015-05-22 00:00:00.000' AS DateTime), CAST(N'2015-04-29 00:00:00.000' AS DateTime), 3, 32.0700, N'South House 300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10518, 53, 4, CAST(N'2015-04-25 00:00:00.000' AS DateTime), CAST(N'2015-05-09 00:00:00.000' AS DateTime), CAST(N'2015-05-05 00:00:00.000' AS DateTime), 2, 218.1500, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10519, 13, 6, CAST(N'2015-04-28 00:00:00.000' AS DateTime), CAST(N'2015-05-26 00:00:00.000' AS DateTime), CAST(N'2015-05-01 00:00:00.000' AS DateTime), 3, 91.7600, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10520, 47, 7, CAST(N'2015-04-29 00:00:00.000' AS DateTime), CAST(N'2015-05-27 00:00:00.000' AS DateTime), CAST(N'2015-05-01 00:00:00.000' AS DateTime), 1, 13.3700, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10521, 11, 8, CAST(N'2015-04-29 00:00:00.000' AS DateTime), CAST(N'2015-05-27 00:00:00.000' AS DateTime), CAST(N'2015-05-02 00:00:00.000' AS DateTime), 2, 17.2200, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10522, 31, 4, CAST(N'2015-04-30 00:00:00.000' AS DateTime), CAST(N'2015-05-28 00:00:00.000' AS DateTime), CAST(N'2015-05-06 00:00:00.000' AS DateTime), 1, 45.3300, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10523, 48, 7, CAST(N'2015-05-01 00:00:00.000' AS DateTime), CAST(N'2015-05-29 00:00:00.000' AS DateTime), CAST(N'2015-05-30 00:00:00.000' AS DateTime), 2, 77.6300, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10524, 5, 1, CAST(N'2015-05-01 00:00:00.000' AS DateTime), CAST(N'2015-05-29 00:00:00.000' AS DateTime), CAST(N'2015-05-07 00:00:00.000' AS DateTime), 2, 244.7900, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10525, 9, 1, CAST(N'2015-05-02 00:00:00.000' AS DateTime), CAST(N'2015-05-30 00:00:00.000' AS DateTime), CAST(N'2015-05-23 00:00:00.000' AS DateTime), 2, 11.0600, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10526, 58, 4, CAST(N'2015-05-05 00:00:00.000' AS DateTime), CAST(N'2015-06-02 00:00:00.000' AS DateTime), CAST(N'2015-05-15 00:00:00.000' AS DateTime), 2, 58.5900, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10527, 42, 7, CAST(N'2015-05-05 00:00:00.000' AS DateTime), CAST(N'2015-06-02 00:00:00.000' AS DateTime), CAST(N'2015-05-07 00:00:00.000' AS DateTime), 1, 41.9000, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10528, 73, 6, CAST(N'2015-05-06 00:00:00.000' AS DateTime), CAST(N'2015-05-20 00:00:00.000' AS DateTime), CAST(N'2015-05-09 00:00:00.000' AS DateTime), 2, 3.3500, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10529, 33, 5, CAST(N'2015-05-07 00:00:00.000' AS DateTime), CAST(N'2015-06-04 00:00:00.000' AS DateTime), CAST(N'2015-05-09 00:00:00.000' AS DateTime), 2, 66.6900, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10530, 40, 3, CAST(N'2015-05-08 00:00:00.000' AS DateTime), CAST(N'2015-06-05 00:00:00.000' AS DateTime), CAST(N'2015-05-12 00:00:00.000' AS DateTime), 2, 339.2200, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10531, 36, 7, CAST(N'2015-05-08 00:00:00.000' AS DateTime), CAST(N'2015-06-05 00:00:00.000' AS DateTime), CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 8.1200, N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10532, 17, 7, CAST(N'2015-05-09 00:00:00.000' AS DateTime), CAST(N'2015-06-06 00:00:00.000' AS DateTime), CAST(N'2015-05-12 00:00:00.000' AS DateTime), 3, 74.4600, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10533, 21, 8, CAST(N'2015-05-12 00:00:00.000' AS DateTime), CAST(N'2015-06-09 00:00:00.000' AS DateTime), CAST(N'2015-05-22 00:00:00.000' AS DateTime), 1, 188.0400, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10534, 31, 8, CAST(N'2015-05-12 00:00:00.000' AS DateTime), CAST(N'2015-06-09 00:00:00.000' AS DateTime), CAST(N'2015-05-14 00:00:00.000' AS DateTime), 2, 27.9400, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10535, 3, 4, CAST(N'2015-05-13 00:00:00.000' AS DateTime), CAST(N'2015-06-10 00:00:00.000' AS DateTime), CAST(N'2015-05-21 00:00:00.000' AS DateTime), 1, 15.6400, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10536, 31, 3, CAST(N'2015-05-14 00:00:00.000' AS DateTime), CAST(N'2015-06-11 00:00:00.000' AS DateTime), CAST(N'2015-06-06 00:00:00.000' AS DateTime), 2, 58.8800, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10537, 45, 1, CAST(N'2015-05-14 00:00:00.000' AS DateTime), CAST(N'2015-05-28 00:00:00.000' AS DateTime), CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 78.8500, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10538, 10, 9, CAST(N'2015-05-15 00:00:00.000' AS DateTime), CAST(N'2015-06-12 00:00:00.000' AS DateTime), CAST(N'2015-05-16 00:00:00.000' AS DateTime), 3, 4.8700, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10539, 10, 6, CAST(N'2015-05-16 00:00:00.000' AS DateTime), CAST(N'2015-06-13 00:00:00.000' AS DateTime), CAST(N'2015-05-23 00:00:00.000' AS DateTime), 3, 12.3600, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10540, 42, 3, CAST(N'2015-05-19 00:00:00.000' AS DateTime), CAST(N'2015-06-16 00:00:00.000' AS DateTime), CAST(N'2015-06-13 00:00:00.000' AS DateTime), 3, 1007.6400, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10541, 78, 2, CAST(N'2015-05-19 00:00:00.000' AS DateTime), CAST(N'2015-06-16 00:00:00.000' AS DateTime), CAST(N'2015-05-29 00:00:00.000' AS DateTime), 1, 68.6500, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10542, 28, 1, CAST(N'2015-05-20 00:00:00.000' AS DateTime), CAST(N'2015-06-17 00:00:00.000' AS DateTime), CAST(N'2015-05-26 00:00:00.000' AS DateTime), 3, 10.9500, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10543, 69, 8, CAST(N'2015-05-21 00:00:00.000' AS DateTime), CAST(N'2015-06-18 00:00:00.000' AS DateTime), CAST(N'2015-05-23 00:00:00.000' AS DateTime), 2, 48.1700, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10544, 75, 4, CAST(N'2015-05-21 00:00:00.000' AS DateTime), CAST(N'2015-06-18 00:00:00.000' AS DateTime), CAST(N'2015-05-30 00:00:00.000' AS DateTime), 1, 24.9100, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10545, 88, 8, CAST(N'2015-05-22 00:00:00.000' AS DateTime), CAST(N'2015-06-19 00:00:00.000' AS DateTime), CAST(N'2015-06-26 00:00:00.000' AS DateTime), 2, 11.9200, N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10546, 55, 1, CAST(N'2015-05-23 00:00:00.000' AS DateTime), CAST(N'2015-06-20 00:00:00.000' AS DateTime), CAST(N'2015-05-27 00:00:00.000' AS DateTime), 3, 194.7200, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10547, 48, 3, CAST(N'2015-05-23 00:00:00.000' AS DateTime), CAST(N'2015-06-20 00:00:00.000' AS DateTime), CAST(N'2015-06-02 00:00:00.000' AS DateTime), 2, 178.4300, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10548, 52, 3, CAST(N'2015-05-26 00:00:00.000' AS DateTime), CAST(N'2015-06-23 00:00:00.000' AS DateTime), CAST(N'2015-06-02 00:00:00.000' AS DateTime), 2, 1.4300, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10549, 42, 5, CAST(N'2015-05-27 00:00:00.000' AS DateTime), CAST(N'2015-06-10 00:00:00.000' AS DateTime), CAST(N'2015-05-30 00:00:00.000' AS DateTime), 1, 171.2400, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10550, 27, 7, CAST(N'2015-05-28 00:00:00.000' AS DateTime), CAST(N'2015-06-25 00:00:00.000' AS DateTime), CAST(N'2015-06-06 00:00:00.000' AS DateTime), 3, 4.3200, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10551, 25, 4, CAST(N'2015-05-28 00:00:00.000' AS DateTime), CAST(N'2015-07-09 00:00:00.000' AS DateTime), CAST(N'2015-06-06 00:00:00.000' AS DateTime), 3, 72.9500, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10552, 87, 2, CAST(N'2015-05-29 00:00:00.000' AS DateTime), CAST(N'2015-06-26 00:00:00.000' AS DateTime), CAST(N'2015-06-05 00:00:00.000' AS DateTime), 1, 83.2200, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10553, 58, 2, CAST(N'2015-05-30 00:00:00.000' AS DateTime), CAST(N'2015-06-27 00:00:00.000' AS DateTime), CAST(N'2015-06-03 00:00:00.000' AS DateTime), 2, 149.4900, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10554, 37, 4, CAST(N'2015-05-30 00:00:00.000' AS DateTime), CAST(N'2015-06-27 00:00:00.000' AS DateTime), CAST(N'2015-06-05 00:00:00.000' AS DateTime), 3, 120.9700, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10555, 67, 6, CAST(N'2015-06-02 00:00:00.000' AS DateTime), CAST(N'2015-06-30 00:00:00.000' AS DateTime), CAST(N'2015-06-04 00:00:00.000' AS DateTime), 3, 252.4900, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10556, 49, 2, CAST(N'2015-06-03 00:00:00.000' AS DateTime), CAST(N'2015-07-15 00:00:00.000' AS DateTime), CAST(N'2015-06-13 00:00:00.000' AS DateTime), 1, 9.8000, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10557, 31, 9, CAST(N'2015-06-03 00:00:00.000' AS DateTime), CAST(N'2015-06-17 00:00:00.000' AS DateTime), CAST(N'2015-06-06 00:00:00.000' AS DateTime), 2, 96.7200, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10558, 4, 1, CAST(N'2015-06-04 00:00:00.000' AS DateTime), CAST(N'2015-07-02 00:00:00.000' AS DateTime), CAST(N'2015-06-10 00:00:00.000' AS DateTime), 2, 72.9700, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10559, 7, 6, CAST(N'2015-06-05 00:00:00.000' AS DateTime), CAST(N'2015-07-03 00:00:00.000' AS DateTime), CAST(N'2015-06-13 00:00:00.000' AS DateTime), 1, 8.0500, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10560, 22, 8, CAST(N'2015-06-06 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), CAST(N'2015-06-09 00:00:00.000' AS DateTime), 1, 36.6500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10561, 21, 2, CAST(N'2015-06-06 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), CAST(N'2015-06-09 00:00:00.000' AS DateTime), 2, 242.2100, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10562, 44, 1, CAST(N'2015-06-09 00:00:00.000' AS DateTime), CAST(N'2015-07-07 00:00:00.000' AS DateTime), CAST(N'2015-06-12 00:00:00.000' AS DateTime), 1, 22.9500, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10563, 80, 2, CAST(N'2015-06-10 00:00:00.000' AS DateTime), CAST(N'2015-07-22 00:00:00.000' AS DateTime), CAST(N'2015-06-24 00:00:00.000' AS DateTime), 2, 60.4300, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10564, 71, 4, CAST(N'2015-06-10 00:00:00.000' AS DateTime), CAST(N'2015-07-08 00:00:00.000' AS DateTime), CAST(N'2015-06-16 00:00:00.000' AS DateTime), 3, 13.7500, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10565, 77, 8, CAST(N'2015-06-11 00:00:00.000' AS DateTime), CAST(N'2015-07-09 00:00:00.000' AS DateTime), CAST(N'2015-06-18 00:00:00.000' AS DateTime), 2, 7.1500, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10566, 7, 9, CAST(N'2015-06-12 00:00:00.000' AS DateTime), CAST(N'2015-07-10 00:00:00.000' AS DateTime), CAST(N'2015-06-18 00:00:00.000' AS DateTime), 1, 88.4000, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10567, 65, 1, CAST(N'2015-06-12 00:00:00.000' AS DateTime), CAST(N'2015-07-10 00:00:00.000' AS DateTime), CAST(N'2015-06-17 00:00:00.000' AS DateTime), 1, 33.9700, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10568, 26, 3, CAST(N'2015-06-13 00:00:00.000' AS DateTime), CAST(N'2015-07-11 00:00:00.000' AS DateTime), CAST(N'2015-07-09 00:00:00.000' AS DateTime), 3, 6.5400, N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10569, 71, 5, CAST(N'2015-06-16 00:00:00.000' AS DateTime), CAST(N'2015-07-14 00:00:00.000' AS DateTime), CAST(N'2015-07-11 00:00:00.000' AS DateTime), 1, 58.9800, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10570, 77, 3, CAST(N'2015-06-17 00:00:00.000' AS DateTime), CAST(N'2015-07-15 00:00:00.000' AS DateTime), CAST(N'2015-06-19 00:00:00.000' AS DateTime), 3, 188.9900, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10571, 18, 8, CAST(N'2015-06-17 00:00:00.000' AS DateTime), CAST(N'2015-07-29 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), 3, 26.0600, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10572, 5, 3, CAST(N'2015-06-18 00:00:00.000' AS DateTime), CAST(N'2015-07-16 00:00:00.000' AS DateTime), CAST(N'2015-06-25 00:00:00.000' AS DateTime), 2, 116.4300, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10573, 3, 7, CAST(N'2015-06-19 00:00:00.000' AS DateTime), CAST(N'2015-07-17 00:00:00.000' AS DateTime), CAST(N'2015-06-20 00:00:00.000' AS DateTime), 3, 84.8400, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10574, 89, 4, CAST(N'2015-06-19 00:00:00.000' AS DateTime), CAST(N'2015-07-17 00:00:00.000' AS DateTime), CAST(N'2015-06-30 00:00:00.000' AS DateTime), 2, 37.6000, N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10575, 34, 5, CAST(N'2015-06-20 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), CAST(N'2015-06-30 00:00:00.000' AS DateTime), 1, 127.3400, N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10576, 53, 3, CAST(N'2015-06-23 00:00:00.000' AS DateTime), CAST(N'2015-07-07 00:00:00.000' AS DateTime), CAST(N'2015-06-30 00:00:00.000' AS DateTime), 3, 18.5600, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10577, 89, 9, CAST(N'2015-06-23 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-06-30 00:00:00.000' AS DateTime), 2, 25.4100, N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10578, 10, 4, CAST(N'2015-06-24 00:00:00.000' AS DateTime), CAST(N'2015-07-22 00:00:00.000' AS DateTime), CAST(N'2015-07-25 00:00:00.000' AS DateTime), 3, 29.6000, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10579, 64, 1, CAST(N'2015-06-25 00:00:00.000' AS DateTime), CAST(N'2015-07-23 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), 2, 13.7300, N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10580, 37, 4, CAST(N'2015-06-26 00:00:00.000' AS DateTime), CAST(N'2015-07-24 00:00:00.000' AS DateTime), CAST(N'2015-07-01 00:00:00.000' AS DateTime), 3, 75.8900, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10581, 82, 3, CAST(N'2015-06-26 00:00:00.000' AS DateTime), CAST(N'2015-07-24 00:00:00.000' AS DateTime), CAST(N'2015-07-02 00:00:00.000' AS DateTime), 1, 3.0100, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10582, 6, 3, CAST(N'2015-06-27 00:00:00.000' AS DateTime), CAST(N'2015-07-25 00:00:00.000' AS DateTime), CAST(N'2015-07-14 00:00:00.000' AS DateTime), 2, 27.7100, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10583, 58, 2, CAST(N'2015-06-30 00:00:00.000' AS DateTime), CAST(N'2015-07-28 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), 2, 7.2800, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10584, 7, 4, CAST(N'2015-06-30 00:00:00.000' AS DateTime), CAST(N'2015-07-28 00:00:00.000' AS DateTime), CAST(N'2015-07-04 00:00:00.000' AS DateTime), 1, 59.1400, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10585, 86, 7, CAST(N'2015-07-01 00:00:00.000' AS DateTime), CAST(N'2015-07-29 00:00:00.000' AS DateTime), CAST(N'2015-07-10 00:00:00.000' AS DateTime), 1, 13.4100, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10586, 44, 9, CAST(N'2015-07-02 00:00:00.000' AS DateTime), CAST(N'2015-07-30 00:00:00.000' AS DateTime), CAST(N'2015-07-09 00:00:00.000' AS DateTime), 1, 0.4800, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10587, 79, 1, CAST(N'2015-07-02 00:00:00.000' AS DateTime), CAST(N'2015-07-30 00:00:00.000' AS DateTime), CAST(N'2015-07-09 00:00:00.000' AS DateTime), 1, 62.5200, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10588, 42, 2, CAST(N'2015-07-03 00:00:00.000' AS DateTime), CAST(N'2015-07-31 00:00:00.000' AS DateTime), CAST(N'2015-07-10 00:00:00.000' AS DateTime), 3, 194.6700, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10589, 73, 8, CAST(N'2015-07-04 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), CAST(N'2015-07-14 00:00:00.000' AS DateTime), 2, 4.4200, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10590, 77, 4, CAST(N'2015-07-07 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-07-14 00:00:00.000' AS DateTime), 3, 44.7700, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10591, 54, 1, CAST(N'2015-07-07 00:00:00.000' AS DateTime), CAST(N'2015-07-21 00:00:00.000' AS DateTime), CAST(N'2015-07-16 00:00:00.000' AS DateTime), 1, 55.9200, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10592, 31, 3, CAST(N'2015-07-08 00:00:00.000' AS DateTime), CAST(N'2015-08-05 00:00:00.000' AS DateTime), CAST(N'2015-07-16 00:00:00.000' AS DateTime), 1, 32.1000, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10593, 31, 7, CAST(N'2015-07-09 00:00:00.000' AS DateTime), CAST(N'2015-08-06 00:00:00.000' AS DateTime), CAST(N'2015-08-13 00:00:00.000' AS DateTime), 2, 174.2000, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10594, 61, 3, CAST(N'2015-07-09 00:00:00.000' AS DateTime), CAST(N'2015-08-06 00:00:00.000' AS DateTime), CAST(N'2015-07-16 00:00:00.000' AS DateTime), 2, 5.2400, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10595, 18, 2, CAST(N'2015-07-10 00:00:00.000' AS DateTime), CAST(N'2015-08-07 00:00:00.000' AS DateTime), CAST(N'2015-07-14 00:00:00.000' AS DateTime), 1, 96.7800, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10596, 90, 8, CAST(N'2015-07-11 00:00:00.000' AS DateTime), CAST(N'2015-08-08 00:00:00.000' AS DateTime), CAST(N'2015-08-12 00:00:00.000' AS DateTime), 1, 16.3400, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10597, 40, 7, CAST(N'2015-07-11 00:00:00.000' AS DateTime), CAST(N'2015-08-08 00:00:00.000' AS DateTime), CAST(N'2015-07-18 00:00:00.000' AS DateTime), 3, 35.1200, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10598, 71, 1, CAST(N'2015-07-14 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), CAST(N'2015-07-18 00:00:00.000' AS DateTime), 3, 44.4200, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10599, 10, 6, CAST(N'2015-07-15 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), CAST(N'2015-07-21 00:00:00.000' AS DateTime), 3, 29.9800, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10600, 74, 4, CAST(N'2015-07-16 00:00:00.000' AS DateTime), CAST(N'2015-08-13 00:00:00.000' AS DateTime), CAST(N'2015-07-21 00:00:00.000' AS DateTime), 1, 45.1300, N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10601, 87, 7, CAST(N'2015-07-16 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), CAST(N'2015-07-22 00:00:00.000' AS DateTime), 1, 58.3000, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10602, 54, 8, CAST(N'2015-07-17 00:00:00.000' AS DateTime), CAST(N'2015-08-14 00:00:00.000' AS DateTime), CAST(N'2015-07-22 00:00:00.000' AS DateTime), 2, 2.9200, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10603, 67, 8, CAST(N'2015-07-18 00:00:00.000' AS DateTime), CAST(N'2015-08-15 00:00:00.000' AS DateTime), CAST(N'2015-08-08 00:00:00.000' AS DateTime), 2, 48.7700, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10604, 25, 1, CAST(N'2015-07-18 00:00:00.000' AS DateTime), CAST(N'2015-08-15 00:00:00.000' AS DateTime), CAST(N'2015-07-29 00:00:00.000' AS DateTime), 1, 7.4600, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10605, 77, 1, CAST(N'2015-07-21 00:00:00.000' AS DateTime), CAST(N'2015-08-18 00:00:00.000' AS DateTime), CAST(N'2015-07-29 00:00:00.000' AS DateTime), 2, 379.1300, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10606, 85, 4, CAST(N'2015-07-22 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-07-31 00:00:00.000' AS DateTime), 3, 79.4000, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10607, 67, 5, CAST(N'2015-07-22 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-07-25 00:00:00.000' AS DateTime), 1, 200.2400, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10608, 52, 4, CAST(N'2015-07-23 00:00:00.000' AS DateTime), CAST(N'2015-08-20 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), 2, 27.7900, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10609, 16, 7, CAST(N'2015-07-24 00:00:00.000' AS DateTime), CAST(N'2015-08-21 00:00:00.000' AS DateTime), CAST(N'2015-07-30 00:00:00.000' AS DateTime), 2, 1.8500, N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10610, 30, 8, CAST(N'2015-07-25 00:00:00.000' AS DateTime), CAST(N'2015-08-22 00:00:00.000' AS DateTime), CAST(N'2015-08-06 00:00:00.000' AS DateTime), 1, 26.7800, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10611, 60, 6, CAST(N'2015-07-25 00:00:00.000' AS DateTime), CAST(N'2015-08-22 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), 2, 80.6500, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10612, 67, 1, CAST(N'2015-07-28 00:00:00.000' AS DateTime), CAST(N'2015-08-25 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), 2, 544.0800, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10613, 87, 4, CAST(N'2015-07-29 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), 2, 8.1100, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10614, 6, 8, CAST(N'2015-07-29 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), CAST(N'2015-08-01 00:00:00.000' AS DateTime), 3, 1.9300, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10615, 59, 2, CAST(N'2015-07-30 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), CAST(N'2015-08-06 00:00:00.000' AS DateTime), 3, 0.7500, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10616, 73, 1, CAST(N'2015-07-31 00:00:00.000' AS DateTime), CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2015-08-05 00:00:00.000' AS DateTime), 2, 116.5300, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10617, 73, 4, CAST(N'2015-07-31 00:00:00.000' AS DateTime), CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2015-08-04 00:00:00.000' AS DateTime), 2, 18.5300, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10618, 77, 1, CAST(N'2015-08-01 00:00:00.000' AS DateTime), CAST(N'2015-09-12 00:00:00.000' AS DateTime), CAST(N'2015-08-08 00:00:00.000' AS DateTime), 1, 154.6800, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10619, 77, 3, CAST(N'2015-08-04 00:00:00.000' AS DateTime), CAST(N'2015-09-01 00:00:00.000' AS DateTime), CAST(N'2015-08-07 00:00:00.000' AS DateTime), 3, 91.0500, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10620, 63, 2, CAST(N'2015-08-05 00:00:00.000' AS DateTime), CAST(N'2015-09-02 00:00:00.000' AS DateTime), CAST(N'2015-08-14 00:00:00.000' AS DateTime), 3, 0.9400, N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10621, 68, 4, CAST(N'2015-08-05 00:00:00.000' AS DateTime), CAST(N'2015-09-02 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 2, 23.7300, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10622, 80, 4, CAST(N'2015-08-06 00:00:00.000' AS DateTime), CAST(N'2015-09-03 00:00:00.000' AS DateTime), CAST(N'2015-08-11 00:00:00.000' AS DateTime), 3, 50.9700, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10623, 22, 8, CAST(N'2015-08-07 00:00:00.000' AS DateTime), CAST(N'2015-09-04 00:00:00.000' AS DateTime), CAST(N'2015-08-12 00:00:00.000' AS DateTime), 2, 97.1800, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10624, 70, 4, CAST(N'2015-08-07 00:00:00.000' AS DateTime), CAST(N'2015-09-04 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), 2, 94.8000, N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10625, 2, 3, CAST(N'2015-08-08 00:00:00.000' AS DateTime), CAST(N'2015-09-05 00:00:00.000' AS DateTime), CAST(N'2015-08-14 00:00:00.000' AS DateTime), 1, 43.9000, N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10626, 5, 1, CAST(N'2015-08-11 00:00:00.000' AS DateTime), CAST(N'2015-09-08 00:00:00.000' AS DateTime), CAST(N'2015-08-20 00:00:00.000' AS DateTime), 2, 138.6900, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10627, 67, 8, CAST(N'2015-08-11 00:00:00.000' AS DateTime), CAST(N'2015-09-22 00:00:00.000' AS DateTime), CAST(N'2015-08-21 00:00:00.000' AS DateTime), 3, 107.4600, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10628, 7, 4, CAST(N'2015-08-12 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-08-20 00:00:00.000' AS DateTime), 3, 30.3600, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10629, 27, 4, CAST(N'2015-08-12 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-08-20 00:00:00.000' AS DateTime), 3, 85.4600, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10630, 28, 1, CAST(N'2015-08-13 00:00:00.000' AS DateTime), CAST(N'2015-09-10 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), 2, 32.3500, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10631, 30, 8, CAST(N'2015-08-14 00:00:00.000' AS DateTime), CAST(N'2015-09-11 00:00:00.000' AS DateTime), CAST(N'2015-08-15 00:00:00.000' AS DateTime), 1, 0.8700, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10632, 57, 8, CAST(N'2015-08-14 00:00:00.000' AS DateTime), CAST(N'2015-09-11 00:00:00.000' AS DateTime), CAST(N'2015-08-19 00:00:00.000' AS DateTime), 1, 41.3800, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10633, 18, 7, CAST(N'2015-08-15 00:00:00.000' AS DateTime), CAST(N'2015-09-12 00:00:00.000' AS DateTime), CAST(N'2015-08-18 00:00:00.000' AS DateTime), 3, 477.9000, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10634, 20, 4, CAST(N'2015-08-15 00:00:00.000' AS DateTime), CAST(N'2015-09-12 00:00:00.000' AS DateTime), CAST(N'2015-08-21 00:00:00.000' AS DateTime), 3, 487.3800, N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10635, 32, 8, CAST(N'2015-08-18 00:00:00.000' AS DateTime), CAST(N'2015-09-15 00:00:00.000' AS DateTime), CAST(N'2015-08-21 00:00:00.000' AS DateTime), 3, 47.4600, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10636, 58, 4, CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-09-16 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), 1, 1.1500, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10637, 84, 6, CAST(N'2015-08-19 00:00:00.000' AS DateTime), CAST(N'2015-09-16 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), 1, 201.2900, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10638, 72, 3, CAST(N'2015-08-20 00:00:00.000' AS DateTime), CAST(N'2015-09-17 00:00:00.000' AS DateTime), CAST(N'2015-09-01 00:00:00.000' AS DateTime), 1, 158.4400, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10639, 47, 7, CAST(N'2015-08-20 00:00:00.000' AS DateTime), CAST(N'2015-09-17 00:00:00.000' AS DateTime), CAST(N'2015-08-27 00:00:00.000' AS DateTime), 3, 38.6400, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10640, 57, 4, CAST(N'2015-08-21 00:00:00.000' AS DateTime), CAST(N'2015-09-18 00:00:00.000' AS DateTime), CAST(N'2015-08-28 00:00:00.000' AS DateTime), 1, 23.5500, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10641, 87, 4, CAST(N'2015-08-22 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), CAST(N'2015-08-26 00:00:00.000' AS DateTime), 2, 179.6100, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10642, 49, 7, CAST(N'2015-08-22 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), CAST(N'2015-09-05 00:00:00.000' AS DateTime), 3, 41.8900, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10643, 1, 6, CAST(N'2015-08-25 00:00:00.000' AS DateTime), CAST(N'2015-09-22 00:00:00.000' AS DateTime), CAST(N'2015-09-02 00:00:00.000' AS DateTime), 1, 29.4600, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10644, 86, 3, CAST(N'2015-08-25 00:00:00.000' AS DateTime), CAST(N'2015-09-22 00:00:00.000' AS DateTime), CAST(N'2015-09-01 00:00:00.000' AS DateTime), 2, 0.1400, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10645, 78, 4, CAST(N'2015-08-26 00:00:00.000' AS DateTime), CAST(N'2015-09-23 00:00:00.000' AS DateTime), CAST(N'2015-09-02 00:00:00.000' AS DateTime), 1, 12.4100, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10646, 65, 9, CAST(N'2015-08-27 00:00:00.000' AS DateTime), CAST(N'2015-10-08 00:00:00.000' AS DateTime), CAST(N'2015-09-03 00:00:00.000' AS DateTime), 3, 142.3300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10647, 79, 4, CAST(N'2015-08-27 00:00:00.000' AS DateTime), CAST(N'2015-09-10 00:00:00.000' AS DateTime), CAST(N'2015-09-03 00:00:00.000' AS DateTime), 2, 45.5400, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10648, 80, 5, CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2015-10-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 2, 14.2500, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10649, 33, 5, CAST(N'2015-08-28 00:00:00.000' AS DateTime), CAST(N'2015-09-25 00:00:00.000' AS DateTime), CAST(N'2015-08-29 00:00:00.000' AS DateTime), 3, 6.2000, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10650, 82, 5, CAST(N'2015-08-29 00:00:00.000' AS DateTime), CAST(N'2015-09-26 00:00:00.000' AS DateTime), CAST(N'2015-09-03 00:00:00.000' AS DateTime), 3, 176.8100, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10651, 57, 8, CAST(N'2015-09-01 00:00:00.000' AS DateTime), CAST(N'2015-09-29 00:00:00.000' AS DateTime), CAST(N'2015-09-11 00:00:00.000' AS DateTime), 2, 20.6000, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10652, 83, 4, CAST(N'2015-09-01 00:00:00.000' AS DateTime), CAST(N'2015-09-29 00:00:00.000' AS DateTime), CAST(N'2015-09-08 00:00:00.000' AS DateTime), 2, 7.1400, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10653, 22, 1, CAST(N'2015-09-02 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), 1, 93.2500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10654, 5, 5, CAST(N'2015-09-02 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), CAST(N'2015-09-11 00:00:00.000' AS DateTime), 1, 55.2600, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10655, 44, 1, CAST(N'2015-09-03 00:00:00.000' AS DateTime), CAST(N'2015-10-01 00:00:00.000' AS DateTime), CAST(N'2015-09-11 00:00:00.000' AS DateTime), 2, 4.4100, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10656, 73, 6, CAST(N'2015-09-04 00:00:00.000' AS DateTime), CAST(N'2015-10-02 00:00:00.000' AS DateTime), CAST(N'2015-09-10 00:00:00.000' AS DateTime), 1, 57.1500, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10657, 67, 2, CAST(N'2015-09-04 00:00:00.000' AS DateTime), CAST(N'2015-10-02 00:00:00.000' AS DateTime), CAST(N'2015-09-15 00:00:00.000' AS DateTime), 2, 352.6900, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10658, 42, 4, CAST(N'2015-09-05 00:00:00.000' AS DateTime), CAST(N'2015-10-03 00:00:00.000' AS DateTime), CAST(N'2015-09-08 00:00:00.000' AS DateTime), 1, 364.1500, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10659, 84, 7, CAST(N'2015-09-05 00:00:00.000' AS DateTime), CAST(N'2015-10-03 00:00:00.000' AS DateTime), CAST(N'2015-09-10 00:00:00.000' AS DateTime), 2, 105.8100, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10660, 74, 8, CAST(N'2015-09-08 00:00:00.000' AS DateTime), CAST(N'2015-10-06 00:00:00.000' AS DateTime), CAST(N'2015-10-15 00:00:00.000' AS DateTime), 1, 111.2900, N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10661, 65, 7, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-10-07 00:00:00.000' AS DateTime), CAST(N'2015-09-15 00:00:00.000' AS DateTime), 3, 17.5500, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10662, 75, 3, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-10-07 00:00:00.000' AS DateTime), CAST(N'2015-09-18 00:00:00.000' AS DateTime), 2, 1.2800, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10663, 9, 2, CAST(N'2015-09-10 00:00:00.000' AS DateTime), CAST(N'2015-09-24 00:00:00.000' AS DateTime), CAST(N'2015-10-03 00:00:00.000' AS DateTime), 2, 113.1500, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10664, 25, 1, CAST(N'2015-09-10 00:00:00.000' AS DateTime), CAST(N'2015-10-08 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), 3, 1.2700, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10665, 75, 1, CAST(N'2015-09-11 00:00:00.000' AS DateTime), CAST(N'2015-10-09 00:00:00.000' AS DateTime), CAST(N'2015-09-17 00:00:00.000' AS DateTime), 2, 26.3100, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10666, 45, 7, CAST(N'2015-09-12 00:00:00.000' AS DateTime), CAST(N'2015-10-10 00:00:00.000' AS DateTime), CAST(N'2015-09-22 00:00:00.000' AS DateTime), 2, 232.4200, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10667, 18, 7, CAST(N'2015-09-12 00:00:00.000' AS DateTime), CAST(N'2015-10-10 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), 1, 78.0900, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10668, 57, 1, CAST(N'2015-09-15 00:00:00.000' AS DateTime), CAST(N'2015-10-13 00:00:00.000' AS DateTime), CAST(N'2015-09-23 00:00:00.000' AS DateTime), 2, 47.2200, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10669, 49, 2, CAST(N'2015-09-15 00:00:00.000' AS DateTime), CAST(N'2015-10-13 00:00:00.000' AS DateTime), CAST(N'2015-09-22 00:00:00.000' AS DateTime), 1, 24.3900, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10670, 22, 4, CAST(N'2015-09-16 00:00:00.000' AS DateTime), CAST(N'2015-10-14 00:00:00.000' AS DateTime), CAST(N'2015-09-18 00:00:00.000' AS DateTime), 1, 203.4800, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10671, 23, 1, CAST(N'2015-09-17 00:00:00.000' AS DateTime), CAST(N'2015-10-15 00:00:00.000' AS DateTime), CAST(N'2015-09-24 00:00:00.000' AS DateTime), 1, 30.3400, N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10672, 5, 9, CAST(N'2015-09-17 00:00:00.000' AS DateTime), CAST(N'2015-10-01 00:00:00.000' AS DateTime), CAST(N'2015-09-26 00:00:00.000' AS DateTime), 2, 95.7500, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10673, 59, 2, CAST(N'2015-09-18 00:00:00.000' AS DateTime), CAST(N'2015-10-16 00:00:00.000' AS DateTime), CAST(N'2015-09-19 00:00:00.000' AS DateTime), 1, 22.7600, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10674, 68, 4, CAST(N'2015-09-18 00:00:00.000' AS DateTime), CAST(N'2015-10-16 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), 2, 0.9000, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10675, 22, 5, CAST(N'2015-09-19 00:00:00.000' AS DateTime), CAST(N'2015-10-17 00:00:00.000' AS DateTime), CAST(N'2015-09-23 00:00:00.000' AS DateTime), 2, 31.8500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10676, 53, 2, CAST(N'2015-09-22 00:00:00.000' AS DateTime), CAST(N'2015-10-20 00:00:00.000' AS DateTime), CAST(N'2015-09-29 00:00:00.000' AS DateTime), 2, 2.0100, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10677, 3, 1, CAST(N'2015-09-22 00:00:00.000' AS DateTime), CAST(N'2015-10-20 00:00:00.000' AS DateTime), CAST(N'2015-09-26 00:00:00.000' AS DateTime), 3, 4.0300, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10678, 67, 7, CAST(N'2015-09-23 00:00:00.000' AS DateTime), CAST(N'2015-10-21 00:00:00.000' AS DateTime), CAST(N'2015-10-16 00:00:00.000' AS DateTime), 3, 388.9800, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10679, 7, 8, CAST(N'2015-09-23 00:00:00.000' AS DateTime), CAST(N'2015-10-21 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), 3, 27.9400, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10680, 61, 1, CAST(N'2015-09-24 00:00:00.000' AS DateTime), CAST(N'2015-10-22 00:00:00.000' AS DateTime), CAST(N'2015-09-26 00:00:00.000' AS DateTime), 1, 26.6100, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10681, 73, 3, CAST(N'2015-09-25 00:00:00.000' AS DateTime), CAST(N'2015-10-23 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), 3, 76.1300, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10682, 3, 3, CAST(N'2015-09-25 00:00:00.000' AS DateTime), CAST(N'2015-10-23 00:00:00.000' AS DateTime), CAST(N'2015-10-01 00:00:00.000' AS DateTime), 2, 36.1300, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10683, 16, 2, CAST(N'2015-09-26 00:00:00.000' AS DateTime), CAST(N'2015-10-24 00:00:00.000' AS DateTime), CAST(N'2015-10-01 00:00:00.000' AS DateTime), 1, 4.4000, N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10684, 37, 3, CAST(N'2015-09-26 00:00:00.000' AS DateTime), CAST(N'2015-10-24 00:00:00.000' AS DateTime), CAST(N'2015-09-30 00:00:00.000' AS DateTime), 1, 145.6300, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10685, 83, 4, CAST(N'2015-09-29 00:00:00.000' AS DateTime), CAST(N'2015-10-13 00:00:00.000' AS DateTime), CAST(N'2015-10-03 00:00:00.000' AS DateTime), 2, 33.7500, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10686, 40, 2, CAST(N'2015-09-30 00:00:00.000' AS DateTime), CAST(N'2015-10-28 00:00:00.000' AS DateTime), CAST(N'2015-10-08 00:00:00.000' AS DateTime), 1, 96.5000, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10687, 65, 9, CAST(N'2015-09-30 00:00:00.000' AS DateTime), CAST(N'2015-10-28 00:00:00.000' AS DateTime), CAST(N'2015-10-30 00:00:00.000' AS DateTime), 2, 296.4300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10688, 54, 4, CAST(N'2015-10-01 00:00:00.000' AS DateTime), CAST(N'2015-10-15 00:00:00.000' AS DateTime), CAST(N'2015-10-07 00:00:00.000' AS DateTime), 2, 299.0900, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10689, 5, 1, CAST(N'2015-10-01 00:00:00.000' AS DateTime), CAST(N'2015-10-29 00:00:00.000' AS DateTime), CAST(N'2015-10-07 00:00:00.000' AS DateTime), 2, 13.4200, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10690, 78, 1, CAST(N'2015-10-02 00:00:00.000' AS DateTime), CAST(N'2015-10-30 00:00:00.000' AS DateTime), CAST(N'2015-10-03 00:00:00.000' AS DateTime), 1, 15.8000, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10691, 42, 2, CAST(N'2015-10-03 00:00:00.000' AS DateTime), CAST(N'2015-11-14 00:00:00.000' AS DateTime), CAST(N'2015-10-22 00:00:00.000' AS DateTime), 2, 810.0500, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10692, 1, 4, CAST(N'2015-10-03 00:00:00.000' AS DateTime), CAST(N'2015-10-31 00:00:00.000' AS DateTime), CAST(N'2015-10-13 00:00:00.000' AS DateTime), 2, 61.0200, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10693, 90, 3, CAST(N'2015-10-06 00:00:00.000' AS DateTime), CAST(N'2015-10-20 00:00:00.000' AS DateTime), CAST(N'2015-10-10 00:00:00.000' AS DateTime), 3, 139.3400, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10694, 42, 8, CAST(N'2015-10-06 00:00:00.000' AS DateTime), CAST(N'2015-11-03 00:00:00.000' AS DateTime), CAST(N'2015-10-09 00:00:00.000' AS DateTime), 3, 398.3600, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10695, 59, 7, CAST(N'2015-10-07 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), CAST(N'2015-10-14 00:00:00.000' AS DateTime), 1, 16.7200, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10696, 90, 8, CAST(N'2015-10-08 00:00:00.000' AS DateTime), CAST(N'2015-11-19 00:00:00.000' AS DateTime), CAST(N'2015-10-14 00:00:00.000' AS DateTime), 3, 102.5500, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10697, 72, 3, CAST(N'2015-10-08 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), CAST(N'2015-10-14 00:00:00.000' AS DateTime), 1, 45.5200, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10698, 18, 4, CAST(N'2015-10-09 00:00:00.000' AS DateTime), CAST(N'2015-11-06 00:00:00.000' AS DateTime), CAST(N'2015-10-17 00:00:00.000' AS DateTime), 1, 272.4700, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10699, 34, 3, CAST(N'2015-10-09 00:00:00.000' AS DateTime), CAST(N'2015-11-06 00:00:00.000' AS DateTime), CAST(N'2015-10-13 00:00:00.000' AS DateTime), 3, 0.5800, N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10700, 67, 3, CAST(N'2015-10-10 00:00:00.000' AS DateTime), CAST(N'2015-11-07 00:00:00.000' AS DateTime), CAST(N'2015-10-16 00:00:00.000' AS DateTime), 1, 65.1000, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10701, 65, 6, CAST(N'2015-10-13 00:00:00.000' AS DateTime), CAST(N'2015-10-27 00:00:00.000' AS DateTime), CAST(N'2015-10-15 00:00:00.000' AS DateTime), 3, 220.3100, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10702, 1, 4, CAST(N'2015-10-13 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-10-21 00:00:00.000' AS DateTime), 1, 23.9400, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10703, 21, 6, CAST(N'2015-10-14 00:00:00.000' AS DateTime), CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-10-20 00:00:00.000' AS DateTime), 2, 152.3000, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10704, 84, 6, CAST(N'2015-10-14 00:00:00.000' AS DateTime), CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-11-07 00:00:00.000' AS DateTime), 1, 4.7800, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10705, 87, 9, CAST(N'2015-10-15 00:00:00.000' AS DateTime), CAST(N'2015-11-12 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), 2, 3.5200, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10706, 61, 8, CAST(N'2015-10-16 00:00:00.000' AS DateTime), CAST(N'2015-11-13 00:00:00.000' AS DateTime), CAST(N'2015-10-21 00:00:00.000' AS DateTime), 3, 135.6300, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10707, 4, 4, CAST(N'2015-10-16 00:00:00.000' AS DateTime), CAST(N'2015-10-30 00:00:00.000' AS DateTime), CAST(N'2015-10-23 00:00:00.000' AS DateTime), 3, 21.7400, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10708, 76, 6, CAST(N'2015-10-17 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), 2, 2.9600, N'89 Jefferson Way Suite 2', N'Portland', N'OR', N'97201', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10709, 83, 1, CAST(N'2015-10-17 00:00:00.000' AS DateTime), CAST(N'2015-11-14 00:00:00.000' AS DateTime), CAST(N'2015-11-20 00:00:00.000' AS DateTime), 3, 210.8000, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10710, 24, 1, CAST(N'2015-10-20 00:00:00.000' AS DateTime), CAST(N'2015-11-17 00:00:00.000' AS DateTime), CAST(N'2015-10-23 00:00:00.000' AS DateTime), 1, 4.9800, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10711, 67, 5, CAST(N'2015-10-21 00:00:00.000' AS DateTime), CAST(N'2015-12-02 00:00:00.000' AS DateTime), CAST(N'2015-10-29 00:00:00.000' AS DateTime), 2, 52.4100, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10712, 65, 3, CAST(N'2015-10-21 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), CAST(N'2015-10-31 00:00:00.000' AS DateTime), 1, 89.9300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10713, 67, 1, CAST(N'2015-10-22 00:00:00.000' AS DateTime), CAST(N'2015-11-19 00:00:00.000' AS DateTime), CAST(N'2015-10-24 00:00:00.000' AS DateTime), 1, 167.0500, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10714, 67, 5, CAST(N'2015-10-22 00:00:00.000' AS DateTime), CAST(N'2015-11-19 00:00:00.000' AS DateTime), CAST(N'2015-10-27 00:00:00.000' AS DateTime), 3, 24.4900, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10715, 9, 3, CAST(N'2015-10-23 00:00:00.000' AS DateTime), CAST(N'2015-11-06 00:00:00.000' AS DateTime), CAST(N'2015-10-29 00:00:00.000' AS DateTime), 1, 63.2000, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10716, 43, 4, CAST(N'2015-10-24 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), CAST(N'2015-10-27 00:00:00.000' AS DateTime), 2, 22.5700, N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10717, 22, 1, CAST(N'2015-10-24 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), CAST(N'2015-10-29 00:00:00.000' AS DateTime), 2, 59.2500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10718, 28, 1, CAST(N'2015-10-27 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-10-29 00:00:00.000' AS DateTime), 3, 170.8800, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10719, 64, 8, CAST(N'2015-10-27 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), 2, 51.4400, N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10720, 79, 8, CAST(N'2015-10-28 00:00:00.000' AS DateTime), CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), 2, 9.5300, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10721, 42, 5, CAST(N'2015-10-29 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), CAST(N'2015-10-31 00:00:00.000' AS DateTime), 3, 48.9200, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10722, 67, 8, CAST(N'2015-10-29 00:00:00.000' AS DateTime), CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2015-11-04 00:00:00.000' AS DateTime), 1, 74.5800, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10723, 90, 3, CAST(N'2015-10-30 00:00:00.000' AS DateTime), CAST(N'2015-11-27 00:00:00.000' AS DateTime), CAST(N'2015-11-25 00:00:00.000' AS DateTime), 1, 21.7200, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10724, 77, 8, CAST(N'2015-10-30 00:00:00.000' AS DateTime), CAST(N'2015-12-11 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), 2, 57.7500, N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10725, 82, 4, CAST(N'2015-10-31 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-11-05 00:00:00.000' AS DateTime), 3, 10.8300, N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10726, 17, 4, CAST(N'2015-11-03 00:00:00.000' AS DateTime), CAST(N'2015-11-17 00:00:00.000' AS DateTime), CAST(N'2015-12-05 00:00:00.000' AS DateTime), 1, 16.5600, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10727, 44, 2, CAST(N'2015-11-03 00:00:00.000' AS DateTime), CAST(N'2015-12-01 00:00:00.000' AS DateTime), CAST(N'2015-12-05 00:00:00.000' AS DateTime), 1, 89.9000, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10728, 84, 4, CAST(N'2015-11-04 00:00:00.000' AS DateTime), CAST(N'2015-12-02 00:00:00.000' AS DateTime), CAST(N'2015-11-11 00:00:00.000' AS DateTime), 2, 58.3300, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10729, 72, 8, CAST(N'2015-11-04 00:00:00.000' AS DateTime), CAST(N'2015-12-16 00:00:00.000' AS DateTime), CAST(N'2015-11-14 00:00:00.000' AS DateTime), 3, 141.0600, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10730, 9, 5, CAST(N'2015-11-05 00:00:00.000' AS DateTime), CAST(N'2015-12-03 00:00:00.000' AS DateTime), CAST(N'2015-11-14 00:00:00.000' AS DateTime), 1, 20.1200, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10731, 13, 7, CAST(N'2015-11-06 00:00:00.000' AS DateTime), CAST(N'2015-12-04 00:00:00.000' AS DateTime), CAST(N'2015-11-14 00:00:00.000' AS DateTime), 1, 96.6500, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10732, 9, 3, CAST(N'2015-11-06 00:00:00.000' AS DateTime), CAST(N'2015-12-04 00:00:00.000' AS DateTime), CAST(N'2015-11-07 00:00:00.000' AS DateTime), 1, 16.9700, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10733, 5, 1, CAST(N'2015-11-07 00:00:00.000' AS DateTime), CAST(N'2015-12-05 00:00:00.000' AS DateTime), CAST(N'2015-11-10 00:00:00.000' AS DateTime), 3, 110.1100, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10734, 83, 2, CAST(N'2015-11-07 00:00:00.000' AS DateTime), CAST(N'2015-12-05 00:00:00.000' AS DateTime), CAST(N'2015-11-12 00:00:00.000' AS DateTime), 3, 1.6300, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10735, 64, 6, CAST(N'2015-11-10 00:00:00.000' AS DateTime), CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), 2, 45.9700, N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10736, 65, 9, CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-12-09 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), 2, 44.1000, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10737, 56, 2, CAST(N'2015-11-11 00:00:00.000' AS DateTime), CAST(N'2015-12-09 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), 2, 7.7900, N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10738, 50, 2, CAST(N'2015-11-12 00:00:00.000' AS DateTime), CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), 1, 2.9100, N'25, rue Lauriston', N'Paris', NULL, N'75016', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10739, 56, 3, CAST(N'2015-11-12 00:00:00.000' AS DateTime), CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2015-11-17 00:00:00.000' AS DateTime), 3, 11.0800, N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10740, 90, 4, CAST(N'2015-11-13 00:00:00.000' AS DateTime), CAST(N'2015-12-11 00:00:00.000' AS DateTime), CAST(N'2015-11-25 00:00:00.000' AS DateTime), 2, 81.8800, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10741, 4, 4, CAST(N'2015-11-14 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), 3, 10.9600, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10742, 62, 3, CAST(N'2015-11-14 00:00:00.000' AS DateTime), CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2015-11-18 00:00:00.000' AS DateTime), 3, 243.7300, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10743, 4, 1, CAST(N'2015-11-17 00:00:00.000' AS DateTime), CAST(N'2015-12-15 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), 2, 23.7200, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10744, 54, 6, CAST(N'2015-11-17 00:00:00.000' AS DateTime), CAST(N'2015-12-15 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), 1, 69.1900, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10745, 42, 9, CAST(N'2015-11-18 00:00:00.000' AS DateTime), CAST(N'2015-12-16 00:00:00.000' AS DateTime), CAST(N'2015-11-27 00:00:00.000' AS DateTime), 1, 3.5200, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10746, 13, 1, CAST(N'2015-11-19 00:00:00.000' AS DateTime), CAST(N'2015-12-17 00:00:00.000' AS DateTime), CAST(N'2015-11-21 00:00:00.000' AS DateTime), 3, 31.4300, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10747, 40, 6, CAST(N'2015-11-19 00:00:00.000' AS DateTime), CAST(N'2015-12-17 00:00:00.000' AS DateTime), CAST(N'2015-11-26 00:00:00.000' AS DateTime), 1, 117.3300, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10748, 67, 3, CAST(N'2015-11-20 00:00:00.000' AS DateTime), CAST(N'2015-12-18 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), 1, 232.5500, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10749, 68, 4, CAST(N'2015-11-20 00:00:00.000' AS DateTime), CAST(N'2015-12-18 00:00:00.000' AS DateTime), CAST(N'2015-12-19 00:00:00.000' AS DateTime), 2, 61.5300, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10750, 58, 9, CAST(N'2015-11-21 00:00:00.000' AS DateTime), CAST(N'2015-12-19 00:00:00.000' AS DateTime), CAST(N'2015-11-24 00:00:00.000' AS DateTime), 1, 79.3000, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10751, 45, 3, CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2015-12-03 00:00:00.000' AS DateTime), 3, 130.7900, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10752, 35, 2, CAST(N'2015-11-24 00:00:00.000' AS DateTime), CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), 3, 1.3900, N'South House 300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10753, 24, 3, CAST(N'2015-11-25 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), CAST(N'2015-11-27 00:00:00.000' AS DateTime), 1, 7.7000, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10754, 32, 6, CAST(N'2015-11-25 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), CAST(N'2015-11-27 00:00:00.000' AS DateTime), 3, 2.3800, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10755, 9, 4, CAST(N'2015-11-26 00:00:00.000' AS DateTime), CAST(N'2015-12-24 00:00:00.000' AS DateTime), CAST(N'2015-11-28 00:00:00.000' AS DateTime), 2, 16.7100, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10756, 91, 8, CAST(N'2015-11-27 00:00:00.000' AS DateTime), CAST(N'2015-12-25 00:00:00.000' AS DateTime), CAST(N'2015-12-02 00:00:00.000' AS DateTime), 2, 73.2100, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10757, 67, 6, CAST(N'2015-11-27 00:00:00.000' AS DateTime), CAST(N'2015-12-25 00:00:00.000' AS DateTime), CAST(N'2015-12-15 00:00:00.000' AS DateTime), 1, 8.1900, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10758, 45, 3, CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-12-26 00:00:00.000' AS DateTime), CAST(N'2015-12-04 00:00:00.000' AS DateTime), 3, 138.1700, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10759, 2, 3, CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-12-26 00:00:00.000' AS DateTime), CAST(N'2015-12-12 00:00:00.000' AS DateTime), 3, 11.9900, N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10760, 33, 4, CAST(N'2015-12-01 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2015-12-10 00:00:00.000' AS DateTime), 1, 155.6400, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10761, 71, 5, CAST(N'2015-12-02 00:00:00.000' AS DateTime), CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2015-12-08 00:00:00.000' AS DateTime), 2, 18.6600, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10762, 21, 3, CAST(N'2015-12-02 00:00:00.000' AS DateTime), CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2015-12-09 00:00:00.000' AS DateTime), 1, 328.7400, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10763, 20, 3, CAST(N'2015-12-03 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2015-12-08 00:00:00.000' AS DateTime), 3, 37.3500, N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10764, 18, 6, CAST(N'2015-12-03 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2015-12-08 00:00:00.000' AS DateTime), 3, 145.4500, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10765, 42, 3, CAST(N'2015-12-04 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2015-12-09 00:00:00.000' AS DateTime), 3, 42.7400, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10766, 37, 4, CAST(N'2015-12-05 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2015-12-09 00:00:00.000' AS DateTime), 1, 157.5500, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10767, 51, 4, CAST(N'2015-12-05 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2015-12-15 00:00:00.000' AS DateTime), 3, 1.5900, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10768, 4, 3, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2015-12-15 00:00:00.000' AS DateTime), 2, 146.3200, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10769, 54, 3, CAST(N'2015-12-08 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2015-12-12 00:00:00.000' AS DateTime), 1, 65.0600, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10770, 78, 8, CAST(N'2015-12-09 00:00:00.000' AS DateTime), CAST(N'2016-01-06 00:00:00.000' AS DateTime), CAST(N'2015-12-17 00:00:00.000' AS DateTime), 3, 5.3200, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10771, 18, 9, CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), 2, 11.1900, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10772, 31, 3, CAST(N'2015-12-10 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), CAST(N'2015-12-19 00:00:00.000' AS DateTime), 2, 91.2800, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10773, 18, 1, CAST(N'2015-12-11 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), CAST(N'2015-12-16 00:00:00.000' AS DateTime), 3, 96.4300, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10774, 21, 4, CAST(N'2015-12-11 00:00:00.000' AS DateTime), CAST(N'2015-12-25 00:00:00.000' AS DateTime), CAST(N'2015-12-12 00:00:00.000' AS DateTime), 1, 48.2000, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10775, 70, 7, CAST(N'2015-12-12 00:00:00.000' AS DateTime), CAST(N'2016-01-09 00:00:00.000' AS DateTime), CAST(N'2015-12-26 00:00:00.000' AS DateTime), 1, 20.2500, N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10776, 18, 1, CAST(N'2015-12-15 00:00:00.000' AS DateTime), CAST(N'2016-01-12 00:00:00.000' AS DateTime), CAST(N'2015-12-18 00:00:00.000' AS DateTime), 3, 351.5300, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10777, 83, 7, CAST(N'2015-12-15 00:00:00.000' AS DateTime), CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), 2, 3.0100, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10778, 5, 3, CAST(N'2015-12-16 00:00:00.000' AS DateTime), CAST(N'2016-01-13 00:00:00.000' AS DateTime), CAST(N'2015-12-24 00:00:00.000' AS DateTime), 1, 6.7900, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10779, 34, 3, CAST(N'2015-12-16 00:00:00.000' AS DateTime), CAST(N'2016-01-13 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), 2, 58.1300, N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10780, 69, 2, CAST(N'2015-12-16 00:00:00.000' AS DateTime), CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2015-12-25 00:00:00.000' AS DateTime), 1, 42.1300, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10781, 58, 2, CAST(N'2015-12-17 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), CAST(N'2015-12-19 00:00:00.000' AS DateTime), 3, 73.1600, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10782, 11, 9, CAST(N'2015-12-17 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), CAST(N'2015-12-22 00:00:00.000' AS DateTime), 3, 1.1000, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10783, 78, 4, CAST(N'2015-12-18 00:00:00.000' AS DateTime), CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2015-12-19 00:00:00.000' AS DateTime), 2, 124.9800, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10784, 32, 4, CAST(N'2015-12-18 00:00:00.000' AS DateTime), CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2015-12-22 00:00:00.000' AS DateTime), 3, 70.0900, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10785, 66, 1, CAST(N'2015-12-18 00:00:00.000' AS DateTime), CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2015-12-24 00:00:00.000' AS DateTime), 3, 1.5100, N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10786, 84, 8, CAST(N'2015-12-19 00:00:00.000' AS DateTime), CAST(N'2016-01-16 00:00:00.000' AS DateTime), CAST(N'2015-12-23 00:00:00.000' AS DateTime), 1, 110.8700, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10787, 30, 2, CAST(N'2015-12-19 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2015-12-26 00:00:00.000' AS DateTime), 1, 249.9300, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10788, 42, 1, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), 2, 42.7000, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10789, 20, 1, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), 2, 100.6000, N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10790, 83, 6, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2015-12-26 00:00:00.000' AS DateTime), 1, 28.2300, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10791, 22, 6, CAST(N'2015-12-23 00:00:00.000' AS DateTime), CAST(N'2016-01-20 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime), 2, 16.8500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10792, 60, 1, CAST(N'2015-12-23 00:00:00.000' AS DateTime), CAST(N'2016-01-20 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), 3, 23.7900, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10793, 4, 3, CAST(N'2015-12-24 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), 3, 4.5200, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10794, 79, 6, CAST(N'2015-12-24 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), 1, 21.4900, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10795, 18, 8, CAST(N'2015-12-24 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-01-20 00:00:00.000' AS DateTime), 2, 126.6600, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10796, 87, 3, CAST(N'2015-12-25 00:00:00.000' AS DateTime), CAST(N'2016-01-22 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), 1, 26.5200, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10797, 15, 7, CAST(N'2015-12-25 00:00:00.000' AS DateTime), CAST(N'2016-01-22 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), 2, 33.3500, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10798, 68, 2, CAST(N'2015-12-26 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), 1, 2.3300, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10799, 28, 9, CAST(N'2015-12-26 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), 3, 30.7600, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10800, 48, 1, CAST(N'2015-12-26 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), 3, 137.4400, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10801, 8, 4, CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2016-01-26 00:00:00.000' AS DateTime), CAST(N'2015-12-31 00:00:00.000' AS DateTime), 2, 97.0900, N'C/ Araquil, 67', N'Madrid', NULL, N'28023', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10802, 49, 4, CAST(N'2015-12-29 00:00:00.000' AS DateTime), CAST(N'2016-01-26 00:00:00.000' AS DateTime), CAST(N'2016-01-02 00:00:00.000' AS DateTime), 2, 257.2600, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10803, 86, 4, CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-01-06 00:00:00.000' AS DateTime), 1, 55.2300, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10804, 48, 6, CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), 2, 27.3300, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10805, 76, 2, CAST(N'2015-12-30 00:00:00.000' AS DateTime), CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-01-09 00:00:00.000' AS DateTime), 3, 237.3400, N'89 Jefferson Way Suite 2', N'Portland', N'OR', N'97201', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10806, 55, 3, CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2016-01-28 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), 2, 22.1100, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10807, 24, 4, CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2016-01-28 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 1, 1.3600, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10808, 61, 2, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-01-09 00:00:00.000' AS DateTime), 3, 45.5300, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10809, 86, 7, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), 1, 4.8700, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10810, 63, 2, CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), 3, 4.3300, N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10811, 72, 8, CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), 1, 31.2200, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10812, 44, 5, CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), CAST(N'2016-01-12 00:00:00.000' AS DateTime), 1, 59.7800, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10813, 80, 1, CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-01-09 00:00:00.000' AS DateTime), 1, 47.3800, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10814, 55, 3, CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), 3, 130.9400, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10815, 67, 2, CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), 3, 14.6200, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10816, 73, 4, CAST(N'2016-01-06 00:00:00.000' AS DateTime), CAST(N'2016-02-03 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), 2, 719.7800, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10817, 28, 3, CAST(N'2016-01-06 00:00:00.000' AS DateTime), CAST(N'2016-01-20 00:00:00.000' AS DateTime), CAST(N'2016-01-13 00:00:00.000' AS DateTime), 2, 306.0700, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10818, 32, 7, CAST(N'2016-01-07 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-01-12 00:00:00.000' AS DateTime), 3, 65.4800, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10819, 11, 2, CAST(N'2016-01-07 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-01-16 00:00:00.000' AS DateTime), 3, 19.7600, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10820, 71, 3, CAST(N'2016-01-07 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-01-13 00:00:00.000' AS DateTime), 2, 37.5200, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10821, 91, 1, CAST(N'2016-01-08 00:00:00.000' AS DateTime), CAST(N'2016-02-05 00:00:00.000' AS DateTime), CAST(N'2016-01-15 00:00:00.000' AS DateTime), 1, 36.6800, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10822, 89, 6, CAST(N'2016-01-08 00:00:00.000' AS DateTime), CAST(N'2016-02-05 00:00:00.000' AS DateTime), CAST(N'2016-01-16 00:00:00.000' AS DateTime), 3, 7.0000, N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10823, 69, 5, CAST(N'2016-01-09 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-01-13 00:00:00.000' AS DateTime), 2, 163.9700, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10824, 21, 8, CAST(N'2016-01-09 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 1, 1.2300, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10825, 15, 1, CAST(N'2016-01-09 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-01-14 00:00:00.000' AS DateTime), 1, 79.2500, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10826, 7, 6, CAST(N'2016-01-12 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), 1, 7.0900, N'24, place Kléber', N'Strasbourg', NULL, N'67000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10827, 9, 1, CAST(N'2016-01-12 00:00:00.000' AS DateTime), CAST(N'2016-01-26 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), 2, 63.5400, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10828, 43, 9, CAST(N'2016-01-13 00:00:00.000' AS DateTime), CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), 1, 90.8500, N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10829, 68, 9, CAST(N'2016-01-13 00:00:00.000' AS DateTime), CAST(N'2016-02-10 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 1, 154.7200, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10830, 85, 4, CAST(N'2016-01-13 00:00:00.000' AS DateTime), CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), 2, 81.8300, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10831, 47, 3, CAST(N'2016-01-14 00:00:00.000' AS DateTime), CAST(N'2016-02-11 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 2, 72.1900, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10832, 30, 2, CAST(N'2016-01-14 00:00:00.000' AS DateTime), CAST(N'2016-02-11 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), 2, 43.2600, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10833, 37, 6, CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 2, 71.4900, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10834, 85, 1, CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:00:00.000' AS DateTime), 3, 29.7800, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10835, 1, 1, CAST(N'2016-01-15 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), 3, 69.5300, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10836, 18, 7, CAST(N'2016-01-16 00:00:00.000' AS DateTime), CAST(N'2016-02-13 00:00:00.000' AS DateTime), CAST(N'2016-01-21 00:00:00.000' AS DateTime), 1, 411.8800, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10837, 5, 9, CAST(N'2016-01-16 00:00:00.000' AS DateTime), CAST(N'2016-02-13 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 3, 13.3200, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10838, 72, 3, CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 3, 59.2800, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10839, 85, 3, CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-01-22 00:00:00.000' AS DateTime), 3, 35.4300, N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10840, 72, 4, CAST(N'2016-01-19 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-02-16 00:00:00.000' AS DateTime), 2, 2.7100, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10841, 51, 5, CAST(N'2016-01-20 00:00:00.000' AS DateTime), CAST(N'2016-02-17 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), 2, 424.3000, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10842, 53, 1, CAST(N'2016-01-20 00:00:00.000' AS DateTime), CAST(N'2016-02-17 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), 3, 54.4200, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10843, 55, 4, CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), CAST(N'2016-01-26 00:00:00.000' AS DateTime), 2, 9.2600, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10844, 40, 8, CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), CAST(N'2016-01-26 00:00:00.000' AS DateTime), 2, 25.2200, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10845, 42, 8, CAST(N'2016-01-21 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 1, 212.9800, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10846, 51, 2, CAST(N'2016-01-22 00:00:00.000' AS DateTime), CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-01-23 00:00:00.000' AS DateTime), 3, 56.4600, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10847, 67, 4, CAST(N'2016-01-22 00:00:00.000' AS DateTime), CAST(N'2016-02-05 00:00:00.000' AS DateTime), CAST(N'2016-02-10 00:00:00.000' AS DateTime), 3, 487.5700, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10848, 14, 7, CAST(N'2016-01-23 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), CAST(N'2016-01-29 00:00:00.000' AS DateTime), 2, 38.2400, N'Berkeley Gardens 12  Brewery', N'London', NULL, N'WX1 6LT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10849, 28, 9, CAST(N'2016-01-23 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 2, 0.5600, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10850, 55, 1, CAST(N'2016-01-23 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 1, 49.1900, N'2, rue du Commerce', N'Lyon', NULL, N'69004', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10851, 80, 5, CAST(N'2016-01-26 00:00:00.000' AS DateTime), CAST(N'2016-02-23 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), 1, 160.5500, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10852, 71, 8, CAST(N'2016-01-26 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), CAST(N'2016-01-30 00:00:00.000' AS DateTime), 1, 174.0500, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10853, 6, 9, CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-02-03 00:00:00.000' AS DateTime), 2, 53.8300, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10854, 18, 3, CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-02-05 00:00:00.000' AS DateTime), 2, 100.2200, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10855, 61, 3, CAST(N'2016-01-27 00:00:00.000' AS DateTime), CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), 1, 170.9700, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10856, 3, 3, CAST(N'2016-01-28 00:00:00.000' AS DateTime), CAST(N'2016-02-25 00:00:00.000' AS DateTime), CAST(N'2016-02-10 00:00:00.000' AS DateTime), 2, 58.4300, N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10857, 5, 8, CAST(N'2016-01-28 00:00:00.000' AS DateTime), CAST(N'2016-02-25 00:00:00.000' AS DateTime), CAST(N'2016-02-06 00:00:00.000' AS DateTime), 2, 188.8500, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10858, 29, 2, CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-02-03 00:00:00.000' AS DateTime), 1, 52.5100, N'67, avenue de l''Europe', N'Versailles', NULL, N'78000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10859, 22, 1, CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), 2, 76.1000, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10860, 23, 3, CAST(N'2016-01-29 00:00:00.000' AS DateTime), CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-02-04 00:00:00.000' AS DateTime), 3, 19.2600, N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10861, 90, 4, CAST(N'2016-01-30 00:00:00.000' AS DateTime), CAST(N'2016-02-27 00:00:00.000' AS DateTime), CAST(N'2016-02-17 00:00:00.000' AS DateTime), 2, 14.9300, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10862, 31, 8, CAST(N'2016-01-30 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), 2, 53.2300, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10863, 87, 4, CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-02-17 00:00:00.000' AS DateTime), 2, 30.2600, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10864, 4, 4, CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), 2, 3.0400, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10865, 42, 2, CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), 1, 348.1400, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10866, 5, 5, CAST(N'2016-02-03 00:00:00.000' AS DateTime), CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), 1, 109.1100, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10867, 75, 6, CAST(N'2016-02-03 00:00:00.000' AS DateTime), CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-02-11 00:00:00.000' AS DateTime), 1, 1.9300, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10868, 84, 7, CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-02-23 00:00:00.000' AS DateTime), 2, 191.2700, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10869, 48, 5, CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), 1, 143.2800, N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10870, 60, 5, CAST(N'2016-02-04 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-02-13 00:00:00.000' AS DateTime), 3, 12.0400, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10871, 9, 9, CAST(N'2016-02-05 00:00:00.000' AS DateTime), CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-02-10 00:00:00.000' AS DateTime), 2, 112.2700, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10872, 27, 5, CAST(N'2016-02-05 00:00:00.000' AS DateTime), CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), 2, 175.3200, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10873, 59, 4, CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-02-09 00:00:00.000' AS DateTime), 1, 0.8200, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10874, 27, 5, CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-02-11 00:00:00.000' AS DateTime), 2, 19.5800, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10875, 5, 4, CAST(N'2016-02-06 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-03-03 00:00:00.000' AS DateTime), 2, 32.3700, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10876, 9, 7, CAST(N'2016-02-09 00:00:00.000' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), 3, 60.4200, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10877, 80, 1, CAST(N'2016-02-09 00:00:00.000' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2016-02-19 00:00:00.000' AS DateTime), 1, 38.0600, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10878, 42, 4, CAST(N'2016-02-10 00:00:00.000' AS DateTime), CAST(N'2016-03-10 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), 1, 46.6900, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10879, 59, 3, CAST(N'2016-02-10 00:00:00.000' AS DateTime), CAST(N'2016-03-10 00:00:00.000' AS DateTime), CAST(N'2016-02-12 00:00:00.000' AS DateTime), 3, 8.5000, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10880, 21, 7, CAST(N'2016-02-10 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), 1, 88.0100, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10881, 11, 4, CAST(N'2016-02-11 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), 1, 2.8400, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10882, 67, 4, CAST(N'2016-02-11 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), 3, 23.1000, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10883, 75, 8, CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), 3, 0.5300, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10884, 64, 4, CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-02-13 00:00:00.000' AS DateTime), 2, 90.9700, N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10885, 51, 6, CAST(N'2016-02-12 00:00:00.000' AS DateTime), CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), 3, 5.6400, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10886, 78, 1, CAST(N'2016-02-13 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1, 4.9900, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10887, 26, 8, CAST(N'2016-02-13 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-02-16 00:00:00.000' AS DateTime), 3, 1.2500, N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10888, 27, 1, CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-02-23 00:00:00.000' AS DateTime), 2, 51.8700, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10889, 71, 9, CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-02-23 00:00:00.000' AS DateTime), 3, 280.6100, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10890, 16, 7, CAST(N'2016-02-16 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-02-18 00:00:00.000' AS DateTime), 1, 32.7600, N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10891, 31, 7, CAST(N'2016-02-17 00:00:00.000' AS DateTime), CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-02-19 00:00:00.000' AS DateTime), 2, 20.3700, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10892, 33, 4, CAST(N'2016-02-17 00:00:00.000' AS DateTime), CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-02-19 00:00:00.000' AS DateTime), 2, 120.2700, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10893, 28, 9, CAST(N'2016-02-18 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), 2, 77.7800, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10894, 67, 1, CAST(N'2016-02-18 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-02-20 00:00:00.000' AS DateTime), 1, 116.1300, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10895, 18, 3, CAST(N'2016-02-18 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-02-23 00:00:00.000' AS DateTime), 1, 162.7500, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10896, 33, 7, CAST(N'2016-02-19 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-02-27 00:00:00.000' AS DateTime), 3, 32.4500, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10897, 65, 3, CAST(N'2016-02-19 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-02-25 00:00:00.000' AS DateTime), 2, 603.5400, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10898, 36, 4, CAST(N'2016-02-20 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), 2, 1.2700, N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10899, 69, 5, CAST(N'2016-02-20 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-02-26 00:00:00.000' AS DateTime), 3, 1.2100, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10900, 86, 1, CAST(N'2016-02-20 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), 2, 1.6600, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10901, 87, 4, CAST(N'2016-02-23 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-02-26 00:00:00.000' AS DateTime), 1, 62.0900, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10902, 21, 1, CAST(N'2016-02-23 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-03-03 00:00:00.000' AS DateTime), 1, 44.1500, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10903, 78, 3, CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), 3, 36.7100, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10904, 90, 3, CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-02-27 00:00:00.000' AS DateTime), 3, 162.9500, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10905, 86, 9, CAST(N'2016-02-24 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), 2, 13.7200, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10906, 60, 4, CAST(N'2016-02-25 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-03-03 00:00:00.000' AS DateTime), 3, 26.2900, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10907, 50, 6, CAST(N'2016-02-25 00:00:00.000' AS DateTime), CAST(N'2016-03-25 00:00:00.000' AS DateTime), CAST(N'2016-02-27 00:00:00.000' AS DateTime), 3, 9.1900, N'25, rue Lauriston', N'Paris', NULL, N'75016', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10908, 44, 4, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-06 00:00:00.000' AS DateTime), 2, 32.9600, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10909, 47, 1, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-10 00:00:00.000' AS DateTime), 2, 53.0500, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10910, 59, 1, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), 3, 38.1100, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10911, 27, 3, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-05 00:00:00.000' AS DateTime), 1, 38.1900, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10912, 65, 2, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 2, 580.9100, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10913, 84, 4, CAST(N'2016-02-26 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), 1, 33.0500, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10914, 84, 6, CAST(N'2016-02-27 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 1, 21.1900, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10915, 53, 2, CAST(N'2016-02-27 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 2, 3.5100, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10916, 43, 1, CAST(N'2016-02-27 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), 2, 63.7700, N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10917, 46, 4, CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), 2, 8.2900, N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10918, 62, 3, CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), 3, 48.8300, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10919, 72, 2, CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-03-04 00:00:00.000' AS DateTime), 2, 19.8000, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10920, 4, 4, CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-03-31 00:00:00.000' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), 2, 29.6100, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10921, 54, 1, CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-03-09 00:00:00.000' AS DateTime), 1, 176.4800, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10922, 78, 5, CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-03-31 00:00:00.000' AS DateTime), CAST(N'2016-03-05 00:00:00.000' AS DateTime), 3, 62.7400, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10923, 30, 7, CAST(N'2016-03-03 00:00:00.000' AS DateTime), CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), 3, 68.2600, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10924, 5, 3, CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 2, 151.5200, N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10925, 78, 3, CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), 1, 2.2700, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10926, 2, 4, CAST(N'2016-03-04 00:00:00.000' AS DateTime), CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-03-11 00:00:00.000' AS DateTime), 3, 39.9200, N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10927, 29, 4, CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 1, 19.7900, N'67, avenue de l''Europe', N'Versailles', NULL, N'78000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10928, 26, 1, CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 1, 1.3600, N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10929, 22, 6, CAST(N'2016-03-05 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-03-12 00:00:00.000' AS DateTime), 1, 33.9300, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10930, 51, 4, CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 3, 15.5500, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10931, 45, 4, CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), 2, 13.6000, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10932, 9, 8, CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), 1, 134.6400, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10933, 68, 6, CAST(N'2016-03-06 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), 3, 54.1500, N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10934, 31, 3, CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-03-12 00:00:00.000' AS DateTime), 3, 32.0100, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10935, 86, 4, CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 3, 47.5900, N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10936, 73, 3, CAST(N'2016-03-09 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 2, 33.6800, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10937, 11, 7, CAST(N'2016-03-10 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), 3, 31.5100, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10938, 42, 3, CAST(N'2016-03-10 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), 2, 31.8900, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10939, 32, 2, CAST(N'2016-03-10 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), 2, 76.3300, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10940, 9, 8, CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), 3, 19.7700, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10941, 67, 7, CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), 2, 400.8100, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10942, 44, 9, CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 3, 17.9500, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10943, 10, 4, CAST(N'2016-03-11 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), 2, 2.1700, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10944, 62, 6, CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-13 00:00:00.000' AS DateTime), 3, 52.9200, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10945, 34, 4, CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-03-18 00:00:00.000' AS DateTime), 1, 10.2200, N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10946, 54, 1, CAST(N'2016-03-12 00:00:00.000' AS DateTime), CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), 2, 27.2000, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10947, 10, 3, CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-03-16 00:00:00.000' AS DateTime), 2, 3.2600, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10948, 27, 3, CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-03-19 00:00:00.000' AS DateTime), 3, 23.3900, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10949, 62, 2, CAST(N'2016-03-13 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-03-17 00:00:00.000' AS DateTime), 3, 74.4400, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10950, 32, 1, CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2, 2.5000, N'Via Ludovico il Moro 22', N'Bergamo', NULL, N'24100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10951, 45, 9, CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), 2, 30.8500, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10952, 1, 1, CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), 1, 40.4200, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10953, 4, 9, CAST(N'2016-03-16 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-03-25 00:00:00.000' AS DateTime), 2, 23.7200, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10954, 72, 5, CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), 1, 27.9100, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10955, 21, 8, CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), 2, 3.2600, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10956, 6, 6, CAST(N'2016-03-17 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-03-20 00:00:00.000' AS DateTime), 2, 44.6500, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10957, 87, 8, CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), 3, 105.3600, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10958, 36, 7, CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), 2, 49.5600, N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10959, 83, 6, CAST(N'2016-03-18 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2, 4.9800, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10960, 87, 3, CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 1, 2.0800, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10961, 84, 8, CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), 1, 104.4700, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10962, 42, 8, CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2, 275.7900, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10963, 25, 9, CAST(N'2016-03-19 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), 3, 2.7000, N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10964, 50, 3, CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2, 87.3800, N'25, rue Lauriston', N'Paris', NULL, N'75016', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10965, 61, 6, CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), 3, 144.3800, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10966, 13, 4, CAST(N'2016-03-20 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 1, 27.1900, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10967, 52, 2, CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 2, 62.2200, N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10968, 18, 1, CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-04-01 00:00:00.000' AS DateTime), 3, 74.6000, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10969, 81, 1, CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-03-30 00:00:00.000' AS DateTime), 2, 0.2100, N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10970, 8, 9, CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 1, 16.1600, N'C/ Araquil, 67', N'Madrid', NULL, N'28023', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10971, 23, 2, CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 2, 121.8200, N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10972, 29, 4, CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-03-26 00:00:00.000' AS DateTime), 2, 0.0200, N'67, avenue de l''Europe', N'Versailles', NULL, N'78000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10973, 29, 6, CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), 2, 15.1700, N'67, avenue de l''Europe', N'Versailles', NULL, N'78000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10974, 91, 3, CAST(N'2016-03-25 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), 3, 12.9600, N'P.O. Box 555', N'Lander', N'WY', N'82520', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10975, 62, 1, CAST(N'2016-03-25 00:00:00.000' AS DateTime), CAST(N'2016-04-22 00:00:00.000' AS DateTime), CAST(N'2016-03-27 00:00:00.000' AS DateTime), 3, 32.2700, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10976, 87, 1, CAST(N'2016-03-25 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), 1, 37.9700, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10977, 21, 8, CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 3, 208.5000, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10978, 33, 9, CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), 2, 32.8200, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10979, 18, 8, CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-03-31 00:00:00.000' AS DateTime), 2, 353.0700, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10980, 21, 4, CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-05-08 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), 1, 1.2600, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10981, 78, 1, CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 2, 193.3700, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10982, 62, 2, CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 1, 14.0100, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10983, 67, 2, CAST(N'2016-03-27 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), 2, 657.5400, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10984, 67, 1, CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), 3, 211.2200, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10985, 65, 2, CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 1, 91.5100, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10986, 36, 8, CAST(N'2016-03-30 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), 2, 217.8600, N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10987, 17, 8, CAST(N'2016-03-31 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), 1, 185.4800, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10988, 71, 3, CAST(N'2016-03-31 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 2, 61.1400, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10989, 79, 2, CAST(N'2016-03-31 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 1, 34.7600, N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10990, 18, 2, CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-05-13 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), 3, 117.6100, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10991, 42, 1, CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-04-07 00:00:00.000' AS DateTime), 1, 38.5100, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10992, 76, 1, CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-04-03 00:00:00.000' AS DateTime), 3, 4.2700, N'89 Jefferson Way Suite 2', N'Portland', N'OR', N'97201', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10993, 21, 7, CAST(N'2016-04-01 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 3, 8.8100, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10994, 54, 2, CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-04-09 00:00:00.000' AS DateTime), 3, 65.5300, N'Smagsloget 45', N'Århus', NULL, N'8200', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10995, 39, 1, CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-04-06 00:00:00.000' AS DateTime), 3, 46.0000, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10996, 42, 4, CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 2, 1.1200, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10997, 69, 8, CAST(N'2016-04-03 00:00:00.000' AS DateTime), CAST(N'2016-05-15 00:00:00.000' AS DateTime), CAST(N'2016-04-13 00:00:00.000' AS DateTime), 2, 73.9100, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10998, 60, 8, CAST(N'2016-04-03 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), 2, 20.3100, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10999, 37, 6, CAST(N'2016-04-03 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 2, 96.3500, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11000, 71, 2, CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-04-14 00:00:00.000' AS DateTime), 3, 55.1200, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11001, 21, 2, CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-04-14 00:00:00.000' AS DateTime), 2, 197.3000, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11002, 67, 4, CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), 1, 141.1600, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11003, 70, 3, CAST(N'2016-04-06 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-04-08 00:00:00.000' AS DateTime), 3, 14.9100, N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11004, 33, 3, CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), 1, 44.8400, N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11005, 59, 2, CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 1, 0.7500, N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11006, 73, 3, CAST(N'2016-04-07 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-04-15 00:00:00.000' AS DateTime), 2, 25.1900, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11007, 41, 8, CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-04-13 00:00:00.000' AS DateTime), 2, 202.2400, N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11008, 18, 7, CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), NULL, 3, 79.4600, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11009, 27, 2, CAST(N'2016-04-08 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 1, 59.1100, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11010, 44, 2, CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-05-07 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), 2, 28.7100, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11011, 1, 3, CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-05-07 00:00:00.000' AS DateTime), CAST(N'2016-04-13 00:00:00.000' AS DateTime), 1, 1.2100, N'Obere Str. 57', N'Berlin', NULL, N'12209', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11012, 22, 1, CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), 3, 242.9500, N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11013, 46, 2, CAST(N'2016-04-09 00:00:00.000' AS DateTime), CAST(N'2016-05-07 00:00:00.000' AS DateTime), CAST(N'2016-04-10 00:00:00.000' AS DateTime), 1, 32.9900, N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11014, 72, 2, CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-05-08 00:00:00.000' AS DateTime), CAST(N'2016-04-15 00:00:00.000' AS DateTime), 3, 23.6000, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11015, 47, 2, CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), 2, 4.6200, N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Norway')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11016, 4, 9, CAST(N'2016-04-10 00:00:00.000' AS DateTime), CAST(N'2016-05-08 00:00:00.000' AS DateTime), CAST(N'2016-04-13 00:00:00.000' AS DateTime), 2, 33.8000, N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11017, 18, 9, CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2016-05-11 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), 2, 754.2600, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11018, 75, 4, CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2016-05-11 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), 2, 11.6500, N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11019, 43, 6, CAST(N'2016-04-13 00:00:00.000' AS DateTime), CAST(N'2016-05-11 00:00:00.000' AS DateTime), NULL, 3, 3.1700, N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11020, 37, 2, CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-05-12 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), 2, 43.3000, N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11021, 42, 3, CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-05-12 00:00:00.000' AS DateTime), CAST(N'2016-04-21 00:00:00.000' AS DateTime), 1, 297.1800, N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11022, 78, 9, CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-05-12 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 2, 6.2700, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11023, 10, 1, CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 2, 123.8300, N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11024, 17, 4, CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-05-13 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), 1, 74.3600, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11025, 58, 6, CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-05-13 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 3, 29.1700, N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11026, 24, 4, CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-05-13 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), 1, 47.0900, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11027, 62, 1, CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-04-20 00:00:00.000' AS DateTime), 1, 52.5200, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11028, 28, 2, CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-04-22 00:00:00.000' AS DateTime), 1, 29.5900, N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11029, 13, 4, CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-05-14 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), 1, 47.8400, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11030, 67, 7, CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-05-15 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), 2, 830.7500, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11031, 67, 6, CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-05-15 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 2, 227.2200, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11032, 90, 2, CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-05-15 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), 3, 606.1900, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11033, 45, 7, CAST(N'2016-04-17 00:00:00.000' AS DateTime), CAST(N'2016-05-15 00:00:00.000' AS DateTime), CAST(N'2016-04-23 00:00:00.000' AS DateTime), 3, 84.7400, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11034, 61, 8, CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-06-01 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), 1, 40.3200, N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11035, 51, 2, CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-05-18 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 2, 0.1700, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11036, 15, 8, CAST(N'2016-04-20 00:00:00.000' AS DateTime), CAST(N'2016-05-18 00:00:00.000' AS DateTime), CAST(N'2016-04-22 00:00:00.000' AS DateTime), 3, 149.4700, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11037, 27, 7, CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-05-19 00:00:00.000' AS DateTime), CAST(N'2016-04-27 00:00:00.000' AS DateTime), 1, 3.2000, N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11038, 51, 1, CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-05-19 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), 2, 29.5900, N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Belgium')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11039, 72, 1, CAST(N'2016-04-21 00:00:00.000' AS DateTime), CAST(N'2016-05-19 00:00:00.000' AS DateTime), NULL, 2, 65.0000, N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11040, 73, 4, CAST(N'2016-04-22 00:00:00.000' AS DateTime), CAST(N'2016-05-20 00:00:00.000' AS DateTime), NULL, 3, 18.8400, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11041, 13, 3, CAST(N'2016-04-22 00:00:00.000' AS DateTime), CAST(N'2016-05-20 00:00:00.000' AS DateTime), CAST(N'2016-04-28 00:00:00.000' AS DateTime), 2, 48.2200, N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11042, 81, 2, CAST(N'2016-04-22 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 1, 29.9900, N'Av. dos Lusíadas, 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11043, 50, 5, CAST(N'2016-04-22 00:00:00.000' AS DateTime), CAST(N'2016-05-20 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), 2, 8.8000, N'25, rue Lauriston', N'Paris', NULL, N'75016', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11044, 60, 4, CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-05-21 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 1, 8.7200, N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Poland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11045, 62, 6, CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-05-21 00:00:00.000' AS DateTime), NULL, 2, 70.5800, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11046, 57, 8, CAST(N'2016-04-23 00:00:00.000' AS DateTime), CAST(N'2016-05-21 00:00:00.000' AS DateTime), CAST(N'2016-04-24 00:00:00.000' AS DateTime), 2, 71.6400, N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11047, 17, 7, CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-05-22 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 3, 46.6200, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11048, 62, 7, CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-05-22 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), 3, 24.1200, N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11049, 83, 3, CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-05-22 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 1, 8.3400, N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11050, 21, 8, CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), 2, 59.4100, N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11051, 30, 7, CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), NULL, 3, 2.7900, N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11052, 78, 3, CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 1, 67.2600, N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11053, 40, 2, CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), CAST(N'2016-04-29 00:00:00.000' AS DateTime), 2, 53.0500, N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11054, 11, 8, CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-05-26 00:00:00.000' AS DateTime), NULL, 1, 0.3300, N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11055, 87, 7, CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-05-26 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), 2, 120.9200, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11056, 17, 8, CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-05-12 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 2, 278.9600, N'35 King George', N'London', NULL, N'WX3 6FW', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11057, 35, 3, CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-05-27 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), 3, 4.1300, N'South House 300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'UK')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11058, 6, 9, CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-05-27 00:00:00.000' AS DateTime), NULL, 3, 31.1400, N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11059, 80, 2, CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-06-10 00:00:00.000' AS DateTime), NULL, 2, 85.8000, N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11060, 24, 2, CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-28 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 2, 10.9800, N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11061, 73, 4, CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-06-11 00:00:00.000' AS DateTime), NULL, 3, 14.0100, N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11062, 44, 4, CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-28 00:00:00.000' AS DateTime), NULL, 2, 29.9300, N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11063, 65, 3, CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-28 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), 2, 81.7300, N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Ireland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11064, 67, 1, CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-29 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 1, 30.0900, N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11065, 69, 8, CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-29 00:00:00.000' AS DateTime), NULL, 1, 12.9100, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11066, 90, 7, CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-29 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), 2, 44.7200, N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11067, 15, 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-05-18 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), 2, 7.9800, N'Walserweg 21', N'Aachen', NULL, N'52066', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11068, 84, 8, CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-06-01 00:00:00.000' AS DateTime), NULL, 2, 81.7500, N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11069, 53, 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-06-01 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), 2, 15.6700, N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11070, 31, 2, CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-06-02 00:00:00.000' AS DateTime), NULL, 1, 136.0000, N'Magazinweg 7', N'Frankfurt a.M.', NULL, N'60528', N'Germany')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11071, 69, 1, CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-06-02 00:00:00.000' AS DateTime), NULL, 1, 0.9300, N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11072, 18, 4, CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-06-02 00:00:00.000' AS DateTime), NULL, 2, 258.6400, N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11073, 39, 2, CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-06-02 00:00:00.000' AS DateTime), NULL, 2, 24.9500, N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'Mexico')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11074, 49, 7, CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-06-03 00:00:00.000' AS DateTime), NULL, 2, 18.4400, N'Vinbæltet 34', N'Kobenhavn', NULL, N'1734', N'Denmark')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11075, 45, 8, CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-06-03 00:00:00.000' AS DateTime), NULL, 2, 6.1900, N'Starenweg 5', N'Genève', NULL, N'1204', N'Switzerland')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11076, 9, 4, CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-06-03 00:00:00.000' AS DateTime), NULL, 2, 38.2800, N'12, rue des Bouchers', N'Marseille', NULL, N'13008', N'France')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11077, 71, 1, CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-06-03 00:00:00.000' AS DateTime), NULL, 2, 8.5300, N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerIdentifier], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11078, NULL, NULL, CAST(N'2017-11-01 00:00:00.000' AS DateTime), CAST(N'2017-11-20 00:00:00.000' AS DateTime), CAST(N'2017-11-15 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (1, N'Chai', 1, 1, N'10 boxes x 20 bags', 18.0000, 39, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (2, N'Chang', 1, 1, N'24 - 12 oz bottles', 19.0000, 17, 40, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (3, N'Aniseed Syrup', 1, 2, N'12 - 550 ml bottles', 10.0000, 13, 70, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 2, N'48 - 6 oz jars', 22.0000, 53, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 2, N'36 boxes', 21.3500, 0, 0, 0, 1, CAST(N'2001-12-12 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (6, N'Grandma''s Boysenberry Spread', 3, 2, N'12 - 8 oz jars', 25.0000, 120, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 3, 7, N'12 - 1 lb pkgs.', 30.0000, 15, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (8, N'Northwoods Cranberry Sauce', 3, 2, N'12 - 12 oz jars', 40.0000, 6, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (9, N'Mishi Kobe Niku', 4, 6, N'18 - 500 g pkgs.', 97.0000, 29, 0, 0, 1, CAST(N'2012-03-12 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (10, N'Ikura', 4, 8, N'12 - 200 ml jars', 31.0000, 31, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (11, N'Queso Cabrales', 5, 4, N'1 kg pkg.', 21.0000, 22, 30, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (12, N'Queso Manchego La Pastora', 5, 4, N'10 - 500 g pkgs.', 38.0000, 86, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (13, N'Konbu', 6, 8, N'2 kg box', 6.0000, 24, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (14, N'Tofu', 6, 7, N'40 - 100 g pkgs.', 23.2500, 35, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (15, N'Genen Shouyu', 6, 2, N'24 - 250 ml bottles', 15.5000, 39, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (16, N'Pavlova', 7, 3, N'32 - 500 g boxes', 17.4500, 29, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (17, N'Alice Mutton', 7, 6, N'20 - 1 kg tins', 39.0000, 0, 0, 0, 1, CAST(N'2004-09-16 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (18, N'Carnarvon Tigers', 7, 8, N'16 kg pkg.', 62.5000, 42, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (19, N'Teatime Chocolate Biscuits', 8, 3, N'10 boxes x 12 pieces', 9.2000, 25, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (20, N'Sir Rodney''s Marmalade', 8, 3, N'30 gift boxes', 81.0000, 40, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (21, N'Sir Rodney''s Scones', 8, 3, N'24 pkgs. x 4 pieces', 10.0000, 3, 40, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (22, N'Gustaf''s Knäckebröd', 9, 5, N'24 - 500 g pkgs.', 21.0000, 104, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (23, N'Tunnbröd', 9, 5, N'12 - 250 g pkgs.', 9.0000, 61, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (24, N'Guaraná Fantástica', 10, 1, N'12 - 355 ml cans', 4.5000, 20, 0, 0, 1, CAST(N'2015-07-07 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', 11, 3, N'20 - 450 g glasses', 14.0000, 76, 0, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (26, N'Gumbär Gummibärchen', 11, 3, N'100 - 250 g bags', 31.2300, 15, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (27, N'Schoggi Schokolade', 11, 3, N'100 - 100 g pieces', 43.9000, 49, 0, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (28, N'Rössle Sauerkraut', 12, 7, N'25 - 825 g cans', 45.6000, 26, 0, 0, 1, CAST(N'2016-06-30 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (29, N'Thüringer Rostbratwurst', 12, 6, N'50 bags x 30 sausgs.', 123.7900, 0, 0, 0, 1, CAST(N'2003-01-04 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (30, N'Nord-Ost Matjeshering', 13, 8, N'10 - 200 g glasses', 25.8900, 10, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (31, N'Gorgonzola Telino', 14, 4, N'12 - 100 g pkgs', 12.5000, 0, 70, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (32, N'Mascarpone Fabioli', 14, 4, N'24 - 200 g pkgs.', 32.0000, 9, 40, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (33, N'Geitost', 15, 4, N'500 g', 2.5000, 112, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (34, N'Sasquatch Ale', 16, 1, N'24 - 12 oz bottles', 14.0000, 111, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (35, N'Steeleye Stout', 16, 1, N'24 - 12 oz bottles', 18.0000, 20, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (36, N'Inlagd Sill', 17, 8, N'24 - 250 g  jars', 19.0000, 112, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (37, N'Gravad lax', 17, 8, N'12 - 500 g pkgs.', 26.0000, 11, 50, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (38, N'Côte de Blaye', 18, 1, N'12 - 75 cl bottles', 263.5000, 17, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (39, N'Chartreuse verte', 18, 1, N'750 cc per bottle', 18.0000, 69, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (40, N'Boston Crab Meat', 19, 8, N'24 - 4 oz tins', 18.4000, 123, 0, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (41, N'Jack''s New England Clam Chowder', 19, 8, N'12 - 12 oz cans', 9.6500, 85, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (42, N'Singaporean Hokkien Fried Mee', 20, 5, N'32 - 1 kg pkgs.', 14.0000, 26, 0, 0, 1, CAST(N'1999-04-04 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (43, N'Ipoh Coffee', 20, 1, N'16 - 500 g tins', 46.0000, 17, 10, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (44, N'Gula Malacca', 20, 2, N'20 - 2 kg bags', 19.4500, 27, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (45, N'Rogede sild', 21, 8, N'1k pkg.', 9.5000, 5, 70, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (46, N'Spegesild', 21, 8, N'4 - 450 g glasses', 12.0000, 95, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (47, N'Zaanse koeken', 22, 3, N'10 - 4 oz boxes', 9.5000, 36, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (48, N'Chocolade', 22, 3, N'10 pkgs.', 12.7500, 15, 70, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (49, N'Maxilaku', 23, 3, N'24 - 50 g pkgs.', 20.0000, 10, 60, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (50, N'Valkoinen suklaa', 23, 3, N'12 - 100 g bars', 16.2500, 65, 0, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (51, N'Manjimup Dried Apples', 24, 7, N'50 - 300 g pkgs.', 53.0000, 20, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (52, N'Filo Mix', 24, 5, N'16 - 2 kg boxes', 7.0000, 38, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (53, N'Perth Pasties', 24, 6, N'48 pieces', 32.8000, 0, 0, 0, 1, CAST(N'1988-09-23 00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (54, N'Tourtière', 25, 6, N'16 pies', 7.4500, 21, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (55, N'Pâté chinois', 25, 6, N'24 boxes x 2 pies', 24.0000, 115, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (56, N'Gnocchi di nonna Alice', 26, 5, N'24 - 250 g pkgs.', 38.0000, 21, 10, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (57, N'Ravioli Angelo', 26, 5, N'24 - 250 g pkgs.', 19.5000, 36, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (58, N'Escargots de Bourgogne', 27, 8, N'24 pieces', 13.2500, 62, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (59, N'Raclette Courdavault', 28, 4, N'5 kg pkg.', 55.0000, 79, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (60, N'Camembert Pierrot', 28, 4, N'15 - 300 g rounds', 34.0000, 19, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (61, N'Sirop d''érable', 29, 2, N'24 - 500 ml bottles', 28.5000, 113, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (62, N'Tarte au sucre', 29, 3, N'48 pies', 49.3000, 17, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (63, N'Vegie-spread', 7, 2, N'15 - 625 g jars', 43.9000, 24, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (64, N'Wimmers gute Semmelknödel', 12, 5, N'20 bags x 4 pieces', 33.2500, 22, 80, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 2, N'32 - 8 oz bottles', 21.0500, 76, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 2, N'24 - 8 oz jars', 17.0000, 4, 100, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (67, N'Laughing Lumberjack Lager', 16, 1, N'24 - 12 oz bottles', 14.0000, 52, 0, 10, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (68, N'Scottish Longbreads', 8, 3, N'10 boxes x 8 pieces', 12.5000, 6, 10, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (69, N'Gudbrandsdalsost', 15, 4, N'10 kg pkg.', 36.0000, 26, 0, 15, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (70, N'Outback Lager', 7, 1, N'24 - 355 ml bottles', 15.0000, 15, 10, 30, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (71, N'Flotemysost', 15, 4, N'10 - 500 g pkgs.', 21.5000, 26, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (72, N'Mozzarella di Giovanni', 14, 4, N'24 - 200 g pkgs.', 34.8000, 14, 0, 0, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (73, N'Röd Kaviar', 17, 8, N'24 - 150 g jars', 15.0000, 101, 0, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (74, N'Longlife Tofu', 4, 7, N'5 kg pkg.', 10.0000, 4, 20, 5, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (75, N'Rhönbräu Klosterbier', 12, 1, N'24 - 0.5 l bottles', 7.7500, 125, 0, 25, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (76, N'Lakkalikööri', 23, 1, N'500 ml', 18.0000, 57, 0, 20, 0, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [DiscontinuedDate]) VALUES (77, N'Original Frankfurter grüne Soße', 12, 2, N'12 boxes', 13.0000, 32, 0, 15, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

GO
INSERT [dbo].[Report] ([id], [Name], [Description]) VALUES (1, N'Customers by country and contact type', N'Customers by country and contact type')
GO
INSERT [dbo].[Report] ([id], [Name], [Description]) VALUES (2, N'Order details', N'Order details by order id')
GO
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportParameters] ON 

GO
INSERT [dbo].[ReportParameters] ([id], [StatementId], [ParameterName], [ParameterValue]) VALUES (1, 1, N'@ContactTitle', N'Owner')
GO
INSERT [dbo].[ReportParameters] ([id], [StatementId], [ParameterName], [ParameterValue]) VALUES (2, 1, N'@Country', N'Mexico')
GO
INSERT [dbo].[ReportParameters] ([id], [StatementId], [ParameterName], [ParameterValue]) VALUES (3, 2, N'@OrderId', N'10265')
GO
SET IDENTITY_INSERT [dbo].[ReportParameters] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportStatements] ON 

GO
INSERT [dbo].[ReportStatements] ([id], [ReportId], [Statement]) VALUES (1, 1, N'SELECT Cust.CustomerIdentifier, Cust.CompanyName, Cust.ContactName, Cust.Address, Cust.City, Cust.Phone,  Cust.ContactTypeIdentifier FROM  Customers AS Cust INNER JOIN ContactType ON Cust.ContactTypeIdentifier = ContactType.ContactTypeIdentifier WHERE (ContactTitle = @ContactTitle AND Country = @Country)')
GO
INSERT [dbo].[ReportStatements] ([id], [ReportId], [Statement]) VALUES (2, 2, N'SELECT od.OrderID,od.ProductID,od.UnitPrice,od.Quantity,od.Discount,Products.ProductName FROM [Order Details] AS od INNER JOIN Products ON od.ProductID = Products.ProductID WHERE ( od.OrderID = @OrderId );')
GO
SET IDENTITY_INSERT [dbo].[ReportStatements] OFF
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_ContactType] FOREIGN KEY([ContactTypeIdentifier])
REFERENCES [dbo].[ContactType] ([ContactTypeIdentifier])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_ContactType]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers2] FOREIGN KEY([CustomerIdentifier])
REFERENCES [dbo].[Customers] ([CustomerIdentifier])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[ReportParameters]  WITH CHECK ADD  CONSTRAINT [FK_ReportParameters_ReportStatements] FOREIGN KEY([StatementId])
REFERENCES [dbo].[ReportStatements] ([id])
GO
ALTER TABLE [dbo].[ReportParameters] CHECK CONSTRAINT [FK_ReportParameters_ReportStatements]
GO
ALTER TABLE [dbo].[ReportStatements]  WITH CHECK ADD  CONSTRAINT [FK_ReportStatements_Report] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([id])
GO
ALTER TABLE [dbo].[ReportStatements] CHECK CONSTRAINT [FK_ReportStatements_Report]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ReorderLevel]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsOnOrder]
GO
