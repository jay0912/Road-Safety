USE [master]
GO
/****** Object:  Database [RoadSafety]    Script Date: 26-02-2023 16:26:07 ******/
CREATE DATABASE [RoadSafety]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RoadSafety', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RoadSafety.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RoadSafety_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RoadSafety_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RoadSafety] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RoadSafety].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RoadSafety] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RoadSafety] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RoadSafety] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RoadSafety] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RoadSafety] SET ARITHABORT OFF 
GO
ALTER DATABASE [RoadSafety] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RoadSafety] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RoadSafety] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RoadSafety] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RoadSafety] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RoadSafety] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RoadSafety] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RoadSafety] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RoadSafety] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RoadSafety] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RoadSafety] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RoadSafety] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RoadSafety] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RoadSafety] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RoadSafety] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RoadSafety] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RoadSafety] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RoadSafety] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RoadSafety] SET  MULTI_USER 
GO
ALTER DATABASE [RoadSafety] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RoadSafety] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RoadSafety] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RoadSafety] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RoadSafety] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RoadSafety]
GO
/****** Object:  Table [dbo].[AccidentData]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccidentData](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[AcccidentDate] [datetime] NOT NULL CONSTRAINT [DF_AccidentData_AcccidentDate]  DEFAULT (getdate()),
	[Cause] [varchar](200) NOT NULL,
	[Casualties] [varchar](80) NOT NULL,
	[WeatherInfo] [varchar](50) NOT NULL,
	[AccidentAddrress] [varchar](80) NOT NULL,
	[LatLng] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccidentData] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccidentData] ON 

INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (1, CAST(N'2003-10-01 00:00:00.000' AS DateTime), N'asas', N'sasas', N'asasassa', N'asasas', N'22.362656,70.8305314')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (2, CAST(N'2003-10-01 00:00:00.000' AS DateTime), N'232', N'hbi', N'bhb', N'ibhnk', N'22.3382814,70.8132519')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (3, CAST(N'2022-10-01 00:00:00.000' AS DateTime), N'ihiykahiu', N'hknkihuukib', N'gihuhnui', N'biubiuhniu', N'22.362656,70.8305314')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (4, CAST(N'2023-02-25 00:00:00.000' AS DateTime), N'sleepy road', N'more times', N'cloudy', N'Swaminarayan mandir', N'22.29445980717913, 70.80775443974409')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (5, CAST(N'2023-02-25 00:00:00.000' AS DateTime), N'sleepy road', N'more times', N'cloudy', N'Swaminarayan mandir', N'22.29445980717913, 70.80775443974409')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (6, CAST(N'2023-02-09 00:00:00.000' AS DateTime), N'dqwd', N'wdasd', N'wdas', N'adsdaw', N'22.29445980717913, 70.80775443974409')
INSERT [dbo].[AccidentData] ([AID], [AcccidentDate], [Cause], [Casualties], [WeatherInfo], [AccidentAddrress], [LatLng]) VALUES (1009, CAST(N'2023-02-28 00:00:00.000' AS DateTime), N'sasaas', N'xaxasaasasa', N'asas', N'xaas', N'22.29445980717913, 71.8077544397')
SET IDENTITY_INSERT [dbo].[AccidentData] OFF
/****** Object:  StoredProcedure [dbo].[AccidentDataDeleteByPK]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[AccidentDataDeleteByPK]

@AID	int

AS

DELETE
FROM   [dbo].[AccidentData]
WHERE  [dbo].[AccidentData].AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[AccidentDataUpdateByPK]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AccidentDataUpdateByPK]

@AID           int,
@AcccidentDate datetime,
@Cause varchar(200),
@Casualties varchar(80),
@WeatherInfo varchar(50),
@AccidentAddrress varchar(80),
@LatLng varchar(50)



AS
UPDATE [dbo].[AccidentData]						
SET    
	   [dbo].[AccidentData].[AcccidentDate]        = @AcccidentDate,
	   [dbo].[AccidentData].[Cause]       = @Cause,
	   [dbo].[AccidentData].[Casualties]         =  @Casualties,
	   [dbo].[AccidentData].[WeatherInfo]        = @WeatherInfo,
	   [dbo].[AccidentData].[AccidentAddrress]	= @AccidentAddrress,
	   [dbo].[AccidentData] .[LatLng] =  @LatLng

WHERE  [dbo].[AccidentData].AID = @AID
GO
/****** Object:  StoredProcedure [dbo].[getAccidentData]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[getAccidentData]
AS
SELECT
	*
FROM [dbo].[AccidentData]
ORDER BY  [dbo].[AccidentData].[AID]

GO
/****** Object:  StoredProcedure [dbo].[getAccidentDataById]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAccidentDataById]
	@AID int
AS
SELECT
*
FROM	[dbo].[AccidentData]
WHERE [dbo].[AccidentData].[AID] = @AID

GO
/****** Object:  StoredProcedure [dbo].[insertAccidentData]    Script Date: 26-02-2023 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[insertAccidentData]
	
    @AcccidentDate datetime,
    @Cause varchar(200),
    @Casualties varchar(80),
    @WeatherInfo varchar(50),
    @AccidentAddrress varchar(80),
    @LatLng varchar(50)
AS
INSERT INTO [dbo].[AccidentData]
(
	
	AcccidentDate,
	Cause,
	Casualties,
	WeatherInfo,
	AccidentAddrress,	
	LatLng
)
VALUES
(

	@AcccidentDate,
	@Cause,
	@Casualties,
	@WeatherInfo,
	@AccidentAddrress,
	@LatLng
)

GO
USE [master]
GO
ALTER DATABASE [RoadSafety] SET  READ_WRITE 
GO
