USE [master]
GO
/****** Object:  Database [kismalib]    Script Date: 3/10/2024 12:19:20 AM ******/
CREATE DATABASE [kismalib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kismalib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\kismalib.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kismalib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\kismalib_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kismalib] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kismalib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kismalib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kismalib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kismalib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kismalib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kismalib] SET ARITHABORT OFF 
GO
ALTER DATABASE [kismalib] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kismalib] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kismalib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kismalib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kismalib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kismalib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kismalib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kismalib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kismalib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kismalib] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kismalib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kismalib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kismalib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kismalib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kismalib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kismalib] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kismalib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kismalib] SET RECOVERY FULL 
GO
ALTER DATABASE [kismalib] SET  MULTI_USER 
GO
ALTER DATABASE [kismalib] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kismalib] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kismalib] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kismalib] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kismalib] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kismalib] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kismalib', N'ON'
GO
ALTER DATABASE [kismalib] SET QUERY_STORE = ON
GO
ALTER DATABASE [kismalib] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [kismalib]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [kismalib]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicYear](
	[AcademicYearID] [int] NOT NULL,
	[AcademicYear] [varchar](9) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AcademicYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accountingclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountingclass](
	[AFclass_id] [int] IDENTITY(1,1) NOT NULL,
	[AFclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_Accountingclass] PRIMARY KEY CLUSTERED 
(
	[AFclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](60) NULL,
	[Lname] [varchar](60) NULL,
	[Address] [varchar](60) NULL,
	[Pass] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAclass](
	[BAclass_id] [int] IDENTITY(1,1) NOT NULL,
	[BAclass_name] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_BAclass] PRIMARY KEY CLUSTERED 
(
	[BAclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[bookid] [int] IDENTITY(1,1) NOT NULL,
	[bookName] [nvarchar](50) NULL,
	[bookDetails] [nvarchar](100) NULL,
	[bookPrice] [float] NULL,
	[bookDepartment] [varchar](1000) NULL,
	[bookFaculty] [varchar](1000) NULL,
	[bookQuantity] [int] NULL,
	[bookImage] [varchar](max) NULL,
	[entryData] [datetime] NULL,
	[available_qty] [int] NULL,
	[rent_qty] [int] NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_classes] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
	[facul_id] [int] NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[depttbll]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depttbll](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[educationclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[educationclass](
	[edcnclass_id] [int] IDENTITY(1,1) NOT NULL,
	[edcnclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_educationclass] PRIMARY KEY CLUSTERED 
(
	[edcnclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facults]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facults](
	[facul_id] [int] NOT NULL,
	[faculty_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_facults] PRIMARY KEY CLUSTERED 
(
	[facul_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generalfiqhiclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generalfiqhiclass](
	[GFclass_id] [int] IDENTITY(1,1) NOT NULL,
	[GFclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_generalfiqhiclass] PRIMARY KEY CLUSTERED 
(
	[GFclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generalnursingclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generalnursingclass](
	[gnclass_id] [int] IDENTITY(1,1) NOT NULL,
	[gnclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_generalnursingclass] PRIMARY KEY CLUSTERED 
(
	[gnclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itclass](
	[Itclass_id] [int] IDENTITY(1,1) NOT NULL,
	[itclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_Itclass] PRIMARY KEY CLUSTERED 
(
	[Itclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medclass](
	[medclass_id] [int] IDENTITY(1,1) NOT NULL,
	[medclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_medclass] PRIMARY KEY CLUSTERED 
(
	[medclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[date] [datetime] NULL,
	[isUnread] [bit] NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicadministrationclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicadministrationclass](
	[PAclass_id] [int] IDENTITY(1,1) NOT NULL,
	[PAclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_publicadministrationclass] PRIMARY KEY CLUSTERED 
(
	[PAclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publichealthclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publichealthclass](
	[PHclass_id] [int] IDENTITY(1,1) NOT NULL,
	[PHclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_Publichealthclass] PRIMARY KEY CLUSTERED 
(
	[PHclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rent]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rent](
	[rent_id] [int] IDENTITY(1,1) NOT NULL,
	[bookname] [nvarchar](100) NULL,
	[std_id] [int] NULL,
	[days] [int] NULL,
	[issuedate] [datetime] NULL,
	[returndate] [datetime] NULL,
	[status] [int] NULL,
	[extra_days] [int] NULL,
 CONSTRAINT [PK_rent] PRIMARY KEY CLUSTERED 
(
	[rent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semesters]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semesters](
	[sem_id] [int] NOT NULL,
	[sem_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_semesters] PRIMARY KEY CLUSTERED 
(
	[sem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sharialawclasss]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sharialawclasss](
	[sharialawclass_id] [int] IDENTITY(1,1) NOT NULL,
	[sharialawclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_sharialawclass] PRIMARY KEY CLUSTERED 
(
	[sharialawclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shlclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shlclass](
	[shl_id] [int] IDENTITY(1,1) NOT NULL,
	[shlclassname] [varchar](50) NOT NULL,
	[dept_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
 CONSTRAINT [PK_shlclass] PRIMARY KEY CLUSTERED 
(
	[shl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_class]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_class](
	[stdclass_id] [int] NOT NULL,
	[std_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
 CONSTRAINT [PK_student_class] PRIMARY KEY CLUSTERED 
(
	[stdclass_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentaccountingclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentaccountingclass](
	[stdaf_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[AFclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentaccountingclass] PRIMARY KEY CLUSTERED 
(
	[stdaf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentBAclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentBAclass](
	[stdba_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[BAclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentBAclass] PRIMARY KEY CLUSTERED 
(
	[stdba_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studenteducationclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studenteducationclass](
	[stdedcn_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[edcnclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studenteducationclass] PRIMARY KEY CLUSTERED 
(
	[stdedcn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentgeneralfiqhiclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentgeneralfiqhiclass](
	[stdgf_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[GFclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentgeneralfiqhiclass] PRIMARY KEY CLUSTERED 
(
	[stdgf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentgeneralnursingclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentgeneralnursingclass](
	[stdgn_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[gnclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentgeneralnursingclass] PRIMARY KEY CLUSTERED 
(
	[stdgn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentIT_class]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentIT_class](
	[stdit_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[itclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentIT_class] PRIMARY KEY CLUSTERED 
(
	[stdit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentMed_class]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentMed_class](
	[stdmed_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[medclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentMed_class] PRIMARY KEY CLUSTERED 
(
	[stdmed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentpublicadministrationclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentpublicadministrationclass](
	[stdpa_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[PAclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentpublicadministrationclass] PRIMARY KEY CLUSTERED 
(
	[stdpa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentpublichealthclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentpublichealthclass](
	[stdph_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[PHclass_id] [int] NOT NULL,
 CONSTRAINT [PK_studentpublichealthclass] PRIMARY KEY CLUSTERED 
(
	[stdph_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[std_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[std_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentsharialawclass]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentsharialawclass](
	[stdsharialaw_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NOT NULL,
	[shl_id] [int] NOT NULL,
 CONSTRAINT [PK_studentsharialawclass] PRIMARY KEY CLUSTERED 
(
	[stdsharialaw_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitation]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitation](
	[stdclass_id] [int] NOT NULL,
	[date_visited] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitertable]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitertable](
	[visit_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[middlename] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
	[details] [varchar](50) NOT NULL,
 CONSTRAINT [PK_visitertable] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitorrent]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitorrent](
	[rent_id] [int] IDENTITY(1,1) NOT NULL,
	[bookname] [nvarchar](100) NULL,
	[phone_number] [int] NULL,
	[days] [int] NULL,
	[issuedate] [datetime] NULL,
	[returndate] [datetime] NULL,
	[status] [int] NULL,
	[extra_days] [int] NULL,
 CONSTRAINT [PK_visitorrent] PRIMARY KEY CLUSTERED 
(
	[rent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visittable]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visittable](
	[visit_id] [int] IDENTITY(1,1) NOT NULL,
	[std_id] [int] NULL,
	[name] [varchar](50) NULL,
	[dept_name] [varchar](50) NULL,
	[facult_name] [varchar](50) NULL,
	[class_name] [varchar](50) NULL,
	[faculty_class] [varchar](50) NULL,
	[sem_name] [varchar](50) NULL,
	[date_visited] [datetime] NULL,
 CONSTRAINT [PK_visittable] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vist_history]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vist_history](
	[dept_name] [varchar](255) NULL,
	[faculty_name] [varchar](255) NULL,
	[class_name] [varchar](255) NULL,
	[itclass_name] [varchar](255) NULL,
	[sem_name] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
	[middle_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[std_id] [int] NULL,
	[date_visited] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[year]    Script Date: 3/10/2024 12:19:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[year](
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[academic_year] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (1, N'2023-2024', CAST(N'2023-09-01' AS Date), CAST(N'2024-01-31' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (2, N'2023-2024', CAST(N'2024-02-01' AS Date), CAST(N'2024-08-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (3, N'2024-2025', CAST(N'2024-09-01' AS Date), CAST(N'2025-01-31' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (4, N'2024-2025', CAST(N'2025-02-01' AS Date), CAST(N'2025-08-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (5, N'2025-2026', CAST(N'2025-09-01' AS Date), CAST(N'2026-01-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (6, N'2025-2026', CAST(N'2026-02-01' AS Date), CAST(N'2026-08-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (7, N'2026-2027', CAST(N'2026-09-01' AS Date), CAST(N'2027-01-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (8, N'2026-2027', CAST(N'2027-02-01' AS Date), CAST(N'2027-08-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (9, N'2027-2028', CAST(N'2027-09-01' AS Date), CAST(N'2028-01-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (10, N'2027-2028', CAST(N'2028-02-01' AS Date), CAST(N'2028-08-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (11, N'2029-2030', CAST(N'2029-09-01' AS Date), CAST(N'2030-01-30' AS Date))
INSERT [dbo].[AcademicYear] ([AcademicYearID], [AcademicYear], [StartDate], [EndDate]) VALUES (12, N'2029-2030', CAST(N'2030-02-01' AS Date), CAST(N'2030-08-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Accountingclass] ON 

INSERT [dbo].[Accountingclass] ([AFclass_id], [AFclassname], [dept_id], [sem_id]) VALUES (1, N'BACF05', 2, 6)
INSERT [dbo].[Accountingclass] ([AFclass_id], [AFclassname], [dept_id], [sem_id]) VALUES (2, N'BACF06', 2, 4)
INSERT [dbo].[Accountingclass] ([AFclass_id], [AFclassname], [dept_id], [sem_id]) VALUES (3, N'BACF07', 2, 3)
INSERT [dbo].[Accountingclass] ([AFclass_id], [AFclassname], [dept_id], [sem_id]) VALUES (5, N'rrr', 2, 4)
INSERT [dbo].[Accountingclass] ([AFclass_id], [AFclassname], [dept_id], [sem_id]) VALUES (6, N'BACF05rrr', 2, 4)
SET IDENTITY_INSERT [dbo].[Accountingclass] OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [Fname], [Lname], [Address], [Pass]) VALUES (1, N'admin', N'admin', N'abdi', N'1234')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[BAclass] ON 

INSERT [dbo].[BAclass] ([BAclass_id], [BAclass_name], [dept_id], [sem_id]) VALUES (1, N'BBA13', 1, 8)
INSERT [dbo].[BAclass] ([BAclass_id], [BAclass_name], [dept_id], [sem_id]) VALUES (2, N'BBA14', 1, 6)
INSERT [dbo].[BAclass] ([BAclass_id], [BAclass_name], [dept_id], [sem_id]) VALUES (3, N'BBA15', 1, 4)
INSERT [dbo].[BAclass] ([BAclass_id], [BAclass_name], [dept_id], [sem_id]) VALUES (4, N'BBA16', 1, 2)
SET IDENTITY_INSERT [dbo].[BAclass] OFF
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([bookid], [bookName], [bookDetails], [bookPrice], [bookDepartment], [bookFaculty], [bookQuantity], [bookImage], [entryData], [available_qty], [rent_qty]) VALUES (2, N'management', N'ee5555', 100, N'Education', N'Islamic Studies and arabic language', 12, NULL, CAST(N'2024-01-31T00:00:00.000' AS DateTime), 9, 3)
INSERT [dbo].[books] ([bookid], [bookName], [bookDetails], [bookPrice], [bookDepartment], [bookFaculty], [bookQuantity], [bookImage], [entryData], [available_qty], [rent_qty]) VALUES (4, N'xczxx', N'sdas', 44, N'Econ&mgt science', N'Business Administration', 43, NULL, CAST(N'2024-02-04T00:00:00.000' AS DateTime), 43, 0)
INSERT [dbo].[books] ([bookid], [bookName], [bookDetails], [bookPrice], [bookDepartment], [bookFaculty], [bookQuantity], [bookImage], [entryData], [available_qty], [rent_qty]) VALUES (5, N'information secuirty', N'wewe', 100, N'Computer Studies', N'IT', 11, NULL, CAST(N'2024-02-08T00:00:00.000' AS DateTime), 8, 3)
INSERT [dbo].[books] ([bookid], [bookName], [bookDetails], [bookPrice], [bookDepartment], [bookFaculty], [bookQuantity], [bookImage], [entryData], [available_qty], [rent_qty]) VALUES (6, N'java', N'hello', 23, N'Computer Studies', N'IT', 4, NULL, CAST(N'2024-02-11T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[books] ([bookid], [bookName], [bookDetails], [bookPrice], [bookDepartment], [bookFaculty], [bookQuantity], [bookImage], [entryData], [available_qty], [rent_qty]) VALUES (8, N'حكاية الحبحكاية الحب والحكاية الحب والخيانة', N'sdasd...', 34, N'Education', N'Islamic Studies and arabic language', 44, NULL, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 42, 2)
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[classes] ON 

INSERT [dbo].[classes] ([class_id], [class_name], [dept_id]) VALUES (1, N'ITclass', 5)
INSERT [dbo].[classes] ([class_id], [class_name], [dept_id]) VALUES (2, N'medicineClass', 2)
SET IDENTITY_INSERT [dbo].[classes] OFF
GO
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (1, N'Business Administration', 1)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (2, N'Accounting and Finance', 1)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (3, N'Public Administration', 1)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (4, N'Political Science', 1)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (5, N'IT', 4)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (6, N'Islamic Studies and arabic language', 2)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (7, N'Science', 2)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (8, N'Social Science', 2)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (9, N'General Fiqhi', 3)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (10, N'Kitab/sunnah', 3)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (11, N'Sharia and Law', 3)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (12, N'Medicie', 5)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (13, N'General Nursing', 5)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (14, N'Public Health', 5)
INSERT [dbo].[departments] ([dept_id], [dept_name], [facul_id]) VALUES (15, N'Midwifery', 5)
GO
INSERT [dbo].[depttbll] ([dept_id], [dept_name]) VALUES (1, N'computer')
GO
SET IDENTITY_INSERT [dbo].[educationclass] ON 

INSERT [dbo].[educationclass] ([edcnclass_id], [edcnclassname], [dept_id], [sem_id]) VALUES (1, N'BIS13', 6, 10)
INSERT [dbo].[educationclass] ([edcnclass_id], [edcnclassname], [dept_id], [sem_id]) VALUES (3, N'BIS14', 6, 8)
INSERT [dbo].[educationclass] ([edcnclass_id], [edcnclassname], [dept_id], [sem_id]) VALUES (4, N'BIS15', 6, 4)
INSERT [dbo].[educationclass] ([edcnclass_id], [edcnclassname], [dept_id], [sem_id]) VALUES (5, N'BIS16', 6, 6)
SET IDENTITY_INSERT [dbo].[educationclass] OFF
GO
INSERT [dbo].[facults] ([facul_id], [faculty_name]) VALUES (1, N'Econ&mgt science')
INSERT [dbo].[facults] ([facul_id], [faculty_name]) VALUES (2, N'Education')
INSERT [dbo].[facults] ([facul_id], [faculty_name]) VALUES (3, N'Shariah and Law')
INSERT [dbo].[facults] ([facul_id], [faculty_name]) VALUES (4, N'Computer Studies')
INSERT [dbo].[facults] ([facul_id], [faculty_name]) VALUES (5, N'Medicine and Health Science')
GO
SET IDENTITY_INSERT [dbo].[generalfiqhiclass] ON 

INSERT [dbo].[generalfiqhiclass] ([GFclass_id], [GFclassname], [dept_id], [sem_id]) VALUES (1, N'BFU01', 9, 8)
INSERT [dbo].[generalfiqhiclass] ([GFclass_id], [GFclassname], [dept_id], [sem_id]) VALUES (2, N'BFU02', 9, 8)
INSERT [dbo].[generalfiqhiclass] ([GFclass_id], [GFclassname], [dept_id], [sem_id]) VALUES (3, N'BFU03', 9, 6)
INSERT [dbo].[generalfiqhiclass] ([GFclass_id], [GFclassname], [dept_id], [sem_id]) VALUES (4, N'BFU04', 9, 4)
SET IDENTITY_INSERT [dbo].[generalfiqhiclass] OFF
GO
SET IDENTITY_INSERT [dbo].[generalnursingclass] ON 

INSERT [dbo].[generalnursingclass] ([gnclass_id], [gnclassname], [dept_id], [sem_id]) VALUES (1, N'BGN08', 13, 4)
INSERT [dbo].[generalnursingclass] ([gnclass_id], [gnclassname], [dept_id], [sem_id]) VALUES (6, N'sdase', 13, 3)
SET IDENTITY_INSERT [dbo].[generalnursingclass] OFF
GO
SET IDENTITY_INSERT [dbo].[Itclass] ON 

INSERT [dbo].[Itclass] ([Itclass_id], [itclassname], [dept_id], [sem_id]) VALUES (3, N'BIT08', 5, 6)
INSERT [dbo].[Itclass] ([Itclass_id], [itclassname], [dept_id], [sem_id]) VALUES (4, N'BIT07', 5, 8)
INSERT [dbo].[Itclass] ([Itclass_id], [itclassname], [dept_id], [sem_id]) VALUES (1001, N'BIT10', 5, 2)
INSERT [dbo].[Itclass] ([Itclass_id], [itclassname], [dept_id], [sem_id]) VALUES (1003, N'BIT09', 5, 5)
INSERT [dbo].[Itclass] ([Itclass_id], [itclassname], [dept_id], [sem_id]) VALUES (1004, N'BIS16', 5, 3)
SET IDENTITY_INSERT [dbo].[Itclass] OFF
GO
SET IDENTITY_INSERT [dbo].[medclass] ON 

INSERT [dbo].[medclass] ([medclass_id], [medclassname], [dept_id], [sem_id]) VALUES (1, N'MBBS06', 12, 10)
INSERT [dbo].[medclass] ([medclass_id], [medclassname], [dept_id], [sem_id]) VALUES (2, N'MBBS07', 12, 8)
INSERT [dbo].[medclass] ([medclass_id], [medclassname], [dept_id], [sem_id]) VALUES (1002, N'MBBS08', 12, 6)
INSERT [dbo].[medclass] ([medclass_id], [medclassname], [dept_id], [sem_id]) VALUES (1004, N'MBBS09', 12, 2)
INSERT [dbo].[medclass] ([medclass_id], [medclassname], [dept_id], [sem_id]) VALUES (1005, N'MBBS10', 12, 2)
SET IDENTITY_INSERT [dbo].[medclass] OFF
GO
SET IDENTITY_INSERT [dbo].[message] ON 

INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (3, N'4234', N'rrrrr', CAST(N'2024-02-19T16:43:23.483' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (5, N'1701', N'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', CAST(N'2024-02-20T00:21:55.823' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (6, N'1701', N'ikiku', CAST(N'2024-02-20T00:22:12.910' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (8, N'44444', N'kismayo lab', CAST(N'2024-02-20T14:16:16.260' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (10, N'44444', N'trwer', CAST(N'2024-02-20T23:08:05.650' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (11, N'44444', N'trwer', CAST(N'2024-02-20T23:08:05.670' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (12, N'44444', N'ff', CAST(N'2024-02-20T23:08:32.840' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (14, N'44444', N'sdfsd', CAST(N'2024-02-21T01:06:00.713' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (17, N'44444', N'ffff', CAST(N'2024-02-21T23:46:03.553' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (18, N'44444', N'', CAST(N'2024-02-21T23:47:02.333' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (19, N'44444', N'asdas', CAST(N'2024-02-21T23:47:15.773' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (22, N'1701', N'asefSDFSasefSDFSasefSDFSasefSDFSasefSDFSasefSDFSasefSDFS', CAST(N'2024-02-27T09:21:35.243' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (24, N'1701', N'asdfS', CAST(N'2024-02-27T09:27:36.437' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (25, N'1111', N'dd', CAST(N'2024-02-27T09:31:24.957' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (26, N'44', N'rr', CAST(N'2024-02-27T09:36:27.920' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (27, N'44', N'rf', CAST(N'2024-02-27T09:40:45.707' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (28, N'444', N'rr', CAST(N'2024-02-27T09:47:02.183' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (29, N'44', N'rrr', CAST(N'2024-02-27T09:50:16.873' AS DateTime), 1)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (30, N'170`', N'sdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfs', CAST(N'2024-03-01T16:49:01.627' AS DateTime), 0)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (35, N'1701', N'dfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfs', CAST(N'2024-03-01T16:49:32.417' AS DateTime), 0)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (39, N'1701', N'sdfasfasfssdfasfdfasfasfsfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfsfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfs', CAST(N'2024-03-01T16:49:57.323' AS DateTime), 0)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (40, N'44444', N'dfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfs', CAST(N'2024-03-01T16:59:00.703' AS DateTime), 0)
INSERT [dbo].[message] ([m_id], [std_id], [description], [date], [isUnread]) VALUES (41, N'3454345434543', N'dfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfssdfasfasfs', CAST(N'2024-03-01T16:59:09.023' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[message] OFF
GO
SET IDENTITY_INSERT [dbo].[publicadministrationclass] ON 

INSERT [dbo].[publicadministrationclass] ([PAclass_id], [PAclassname], [dept_id], [sem_id]) VALUES (1, N'BPA07', 3, 8)
INSERT [dbo].[publicadministrationclass] ([PAclass_id], [PAclassname], [dept_id], [sem_id]) VALUES (2, N'BPA08', 3, 6)
INSERT [dbo].[publicadministrationclass] ([PAclass_id], [PAclassname], [dept_id], [sem_id]) VALUES (3, N'BPA09', 3, 5)
SET IDENTITY_INSERT [dbo].[publicadministrationclass] OFF
GO
SET IDENTITY_INSERT [dbo].[Publichealthclass] ON 

INSERT [dbo].[Publichealthclass] ([PHclass_id], [PHclassname], [dept_id], [sem_id]) VALUES (1, N'BPH05', 14, 8)
INSERT [dbo].[Publichealthclass] ([PHclass_id], [PHclassname], [dept_id], [sem_id]) VALUES (2, N'BPH06', 14, 8)
INSERT [dbo].[Publichealthclass] ([PHclass_id], [PHclassname], [dept_id], [sem_id]) VALUES (3, N'BPH07', 14, 6)
INSERT [dbo].[Publichealthclass] ([PHclass_id], [PHclassname], [dept_id], [sem_id]) VALUES (4, N'BPH08', 14, 4)
SET IDENTITY_INSERT [dbo].[Publichealthclass] OFF
GO
SET IDENTITY_INSERT [dbo].[rent] ON 

INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (1, N'management', 1123, 1, CAST(N'2024-02-08T11:54:05.410' AS DateTime), CAST(N'2024-02-08T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (2, N'xczx', 1222, 2, CAST(N'2024-02-10T09:24:06.800' AS DateTime), CAST(N'2024-02-10T22:01:33.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (3, N'xczx', 1233, 3, CAST(N'2024-02-10T09:27:00.400' AS DateTime), CAST(N'2024-02-10T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (4, N'xczx', 1701, 2, CAST(N'2024-02-10T09:28:24.213' AS DateTime), CAST(N'2024-02-11T11:02:32.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (5, N'xczx', 9899, 1, CAST(N'2024-02-10T09:33:35.487' AS DateTime), CAST(N'2024-02-10T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (6, N'management', 3434, 1, CAST(N'2024-01-10T10:24:35.880' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (7, N'management', 6789, 3, CAST(N'2024-02-11T10:41:53.833' AS DateTime), CAST(N'2024-02-13T14:33:41.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (8, N'management', 5445, 1, CAST(N'2024-02-11T12:23:44.583' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (9, N'information secuirty', 432423, 1, CAST(N'2024-02-13T14:33:13.660' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (10, N'????? ????????? ???? ???????? ???? ????????', 9899, 1, CAST(N'2024-02-19T14:22:15.483' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (11, N'حكاية الحبحكاية الحب والحكاية الحب والخيانة', 4234, 1, CAST(N'2024-02-19T14:39:41.133' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (12, N'java', 1701, 1, CAST(N'2024-02-19T19:04:00.603' AS DateTime), CAST(N'2024-02-19T19:06:24.000' AS DateTime), 1, 0)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (13, N'java', 1882, 1, CAST(N'2024-02-20T00:18:26.270' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (14, N'java', 43535, 1, CAST(N'2024-02-20T00:19:15.143' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[rent] ([rent_id], [bookname], [std_id], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (15, N'information secuirty', 44444, 1, CAST(N'2024-02-20T01:10:52.197' AS DateTime), NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[rent] OFF
GO
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (1, N'semester one')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (2, N'semester two')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (3, N'semester three')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (4, N'semester four')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (5, N'semester five')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (6, N'semester six')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (7, N'semester seven')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (8, N'semester eight')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (9, N'semester nine')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (10, N'semester ten')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (11, N'semester eleven')
INSERT [dbo].[semesters] ([sem_id], [sem_name]) VALUES (12, N'semester twelve')
GO
SET IDENTITY_INSERT [dbo].[sharialawclasss] ON 

INSERT [dbo].[sharialawclasss] ([sharialawclass_id], [sharialawclassname], [dept_id], [sem_id]) VALUES (1, N'BSHL02', 11, 6)
INSERT [dbo].[sharialawclasss] ([sharialawclass_id], [sharialawclassname], [dept_id], [sem_id]) VALUES (2, N'BSHL03', 11, 4)
INSERT [dbo].[sharialawclasss] ([sharialawclass_id], [sharialawclassname], [dept_id], [sem_id]) VALUES (3, N'BSHL04', 11, 2)
SET IDENTITY_INSERT [dbo].[sharialawclasss] OFF
GO
SET IDENTITY_INSERT [dbo].[shlclass] ON 

INSERT [dbo].[shlclass] ([shl_id], [shlclassname], [dept_id], [sem_id]) VALUES (2, N'BSHL02', 11, 8)
INSERT [dbo].[shlclass] ([shl_id], [shlclassname], [dept_id], [sem_id]) VALUES (3, N'BSHL03', 11, 6)
INSERT [dbo].[shlclass] ([shl_id], [shlclassname], [dept_id], [sem_id]) VALUES (4, N'BSHL04', 11, 4)
SET IDENTITY_INSERT [dbo].[shlclass] OFF
GO
INSERT [dbo].[student_class] ([stdclass_id], [std_id], [class_id]) VALUES (1, 1880, 1)
INSERT [dbo].[student_class] ([stdclass_id], [std_id], [class_id]) VALUES (23, 23, 1)
INSERT [dbo].[student_class] ([stdclass_id], [std_id], [class_id]) VALUES (234, 234, 1)
INSERT [dbo].[student_class] ([stdclass_id], [std_id], [class_id]) VALUES (1880, 1880, 1)
INSERT [dbo].[student_class] ([stdclass_id], [std_id], [class_id]) VALUES (2000, 2000, 1)
GO
SET IDENTITY_INSERT [dbo].[studentaccountingclass] ON 

INSERT [dbo].[studentaccountingclass] ([stdaf_id], [std_id], [AFclass_id]) VALUES (3, 1212122, 2)
INSERT [dbo].[studentaccountingclass] ([stdaf_id], [std_id], [AFclass_id]) VALUES (6, 9876545, 0)
SET IDENTITY_INSERT [dbo].[studentaccountingclass] OFF
GO
SET IDENTITY_INSERT [dbo].[studentBAclass] ON 

INSERT [dbo].[studentBAclass] ([stdba_id], [std_id], [BAclass_id]) VALUES (1, 4234, 4)
INSERT [dbo].[studentBAclass] ([stdba_id], [std_id], [BAclass_id]) VALUES (2, 9899, 2)
INSERT [dbo].[studentBAclass] ([stdba_id], [std_id], [BAclass_id]) VALUES (3, 12111, 1)
SET IDENTITY_INSERT [dbo].[studentBAclass] OFF
GO
SET IDENTITY_INSERT [dbo].[studenteducationclass] ON 

INSERT [dbo].[studenteducationclass] ([stdedcn_id], [std_id], [edcnclass_id]) VALUES (8, 9899, 1)
INSERT [dbo].[studenteducationclass] ([stdedcn_id], [std_id], [edcnclass_id]) VALUES (10, 98765453, 0)
INSERT [dbo].[studenteducationclass] ([stdedcn_id], [std_id], [edcnclass_id]) VALUES (12, 32423423, 0)
INSERT [dbo].[studenteducationclass] ([stdedcn_id], [std_id], [edcnclass_id]) VALUES (13, 987654, 0)
SET IDENTITY_INSERT [dbo].[studenteducationclass] OFF
GO
SET IDENTITY_INSERT [dbo].[studentgeneralfiqhiclass] ON 

INSERT [dbo].[studentgeneralfiqhiclass] ([stdgf_id], [std_id], [GFclass_id]) VALUES (1007, 4332323, 3)
SET IDENTITY_INSERT [dbo].[studentgeneralfiqhiclass] OFF
GO
SET IDENTITY_INSERT [dbo].[studentgeneralnursingclass] ON 

INSERT [dbo].[studentgeneralnursingclass] ([stdgn_id], [std_id], [gnclass_id]) VALUES (1, 5445, 1)
SET IDENTITY_INSERT [dbo].[studentgeneralnursingclass] OFF
GO
SET IDENTITY_INSERT [dbo].[studentIT_class] ON 

INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (5, 3434, 1)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (7, 1233, 1)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (8, 1222, 1)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (9, 11122, 2)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (1002, 6789, 1)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3007, 1127, 2)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3008, 43535, 4)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3009, 45666, 1001)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3010, 234534, 1001)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3011, 44444, 1003)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3012, 1701, 4)
INSERT [dbo].[studentIT_class] ([stdit_id], [std_id], [itclass_id]) VALUES (3017, 4234, 1001)
SET IDENTITY_INSERT [dbo].[studentIT_class] OFF
GO
SET IDENTITY_INSERT [dbo].[studentpublicadministrationclass] ON 

INSERT [dbo].[studentpublicadministrationclass] ([stdpa_id], [std_id], [PAclass_id]) VALUES (4, 1122, 3)
INSERT [dbo].[studentpublicadministrationclass] ([stdpa_id], [std_id], [PAclass_id]) VALUES (5, 334223, 0)
SET IDENTITY_INSERT [dbo].[studentpublicadministrationclass] OFF
GO
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (23, N'mohamed', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (34, N'baaada', N'rfre', N'cvs', 4567, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (45, N'mohamed', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (123, N'kismaayo', N'baadh', N'jaaka', 989898, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (234, N'badhey', N'dd', N'dfgfd', 34567, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (324, N'abdiiii', N'dsg', N'fdgdf', 34324, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (345, N'sahro', N'hussein', N'dhalahow', 614112537, N'female', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (444, N'badaaaa', N'dfgh', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (455, N'jike', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (655, N'baa', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (677, N'bulllaaaaaaaaa', N'aalta', N'zuuma', 2345, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (989, N'maaaaaa', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1123, N'alali', N'abdi', N'kiriim', 613147035, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1210, N'zaaaziii', N'dds', N'dsd', 3434, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1213, N'abdiiiii', N'dfsd', N'sdfsdf', 43434, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1222, N'nimco', N'hussein', N'dhalahow', 614112537, N'female', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1233, N'baajaaa', N'fddd', N'fdff', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1701, N'abdikadir', N'muhyadiin', N'mahad', 8283383, N'male', N'12345678')
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1880, N'mohamed', N'hussein', N'dhalahow', 4567, N'm', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1882, N'baadheeeyga', N'hussein', N'dhalahow', 614112537, N'female', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (2000, N'cumar', N'jubba', N'land', 34567, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (2333, N'mohamed', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (3434, N'zaki', N'hussein', N'dhalahow', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (4234, N'zakariy', N'sdsd', N'Dhallahow', 3234, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (5445, N'caderey', N'bioolo', N'dhalahow', 614112537, N'female', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (6789, N'zakariyr', N'dfghjkl', N'erwerwe', 444444, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (9899, N'kingaa', N'adam', N'yep', 123456789, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (11122, N'mareefu', N'dfdf', N'sdfsd', 614112537, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (12111, N'farax', N'hussei', N'mohamed', 234567, N'male', N'farah12345')
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (23342, N'zakariyr', N'fdfsasd', N'Dhallahow', 4343, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (32323, N'zakariyr', N'dsfsd', N'Dhallahow', 323, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (43535, N'sdfasd', N'asdfasd', N'asdfasdf', 34234234, N'male', N'12345678')
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (44444, N'sdfsdfg', N'sdfgsdf', N'sdfsdf', 343434, N'male', N'12345678')
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (45344, N'zakariyr', N'dsas', N'Dhallahow', 34, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (45666, N'dfghdfg', N'fgdfg', N'dfgdfg', 34554, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (98765, N'shashaaa', N'shaashuuu', N'fgdsfgh', 34325, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (232424, N'zakariyr', N'vxzcvzx', N'Dhallahow', 3424, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (234534, N'scbsdf', N'adrasr', N'astasr', 234123, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (334223, N'zakariyeeeee', N'husseineee', N'Dhallahow', 3432, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (432423, N'zakariyr', N'sdfsdf', N'Dhallahow', 434, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (987654, N'aaaaaaa', N'sdfghfds', N'fgdsfgh', 34325, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (1212122, N'daadireey', N'ddfd', N'dfdf', 34343, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (4332323, N'zakariyr', N'asdas', N'Dhallahow', 3322, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (9876545, N'zzzzzzzzzzz', N'sdfghfds', N'fgdsfgh', 34325, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (32423423, N'zakariyr', N'dsgdsfgsd', N'Dhallahodw', 2343, N'male', NULL)
INSERT [dbo].[students] ([std_id], [first_name], [middle_name], [last_name], [phone_number], [gender], [password]) VALUES (98765453, N'pkpkpkpkp', N'sdfghfds', N'fgdsfgh', 34325, N'male', NULL)
GO
SET IDENTITY_INSERT [dbo].[studentsharialawclass] ON 

INSERT [dbo].[studentsharialawclass] ([stdsharialaw_id], [std_id], [shl_id]) VALUES (1002, 98765, 4)
SET IDENTITY_INSERT [dbo].[studentsharialawclass] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password]) VALUES (1, N'admin', N'12345')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[visitation] ([stdclass_id], [date_visited]) VALUES (1, CAST(N'2023-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[visitation] ([stdclass_id], [date_visited]) VALUES (3, CAST(N'2022-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[visitation] ([stdclass_id], [date_visited]) VALUES (1880, CAST(N'2023-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[visitation] ([stdclass_id], [date_visited]) VALUES (1880, CAST(N'2022-05-04T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[visitertable] ON 

INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2, N'zakariyr', N'hussein', N'Dhallahow', 616871404, N'xvzxc')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (3, N'zakariyr', N'asds', N'Dhallahow', 3234, N'dfasd')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2005, N'sdfgasdf', N'sdfsd', N'sdsd', 32, N'xcx')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2007, N'abdiqadir ', N'sdbhfb', N'eelkdkd', 3884, N'kel')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2008, N'sdfgsdf', N'dfd', N'sdfsdf', 55, N'cvxvc')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2009, N'sdfsd', N'sdsd', N'sdsd', 56, N'sdfsd')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2010, N'ssdf', N'dfd', N'dfdf', 31, N'sda')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2011, N'Abdi ', N'Mohamed', N'Salad', 615686831, N'prof Abdi salad ')
INSERT [dbo].[visitertable] ([visit_id], [firstname], [middlename], [lastname], [phone_number], [details]) VALUES (2012, N'ali', N'sdfgsdf', N'sdfgsdf', 433434, N'gdfasdf')
SET IDENTITY_INSERT [dbo].[visitertable] OFF
GO
SET IDENTITY_INSERT [dbo].[visitorrent] ON 

INSERT [dbo].[visitorrent] ([rent_id], [bookname], [phone_number], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (1, N'management', 31, -8, CAST(N'2024-02-08T12:04:42.773' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[visitorrent] ([rent_id], [bookname], [phone_number], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (2, N'management', 55, -2, CAST(N'2024-02-08T12:07:11.387' AS DateTime), CAST(N'2024-02-08T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[visitorrent] ([rent_id], [bookname], [phone_number], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (3, N'information secuirty', 615686831, 3, CAST(N'2024-02-11T17:10:44.497' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[visitorrent] ([rent_id], [bookname], [phone_number], [days], [issuedate], [returndate], [status], [extra_days]) VALUES (4, N'حكاية الحبحكاية الحب والحكاية الحب والخيانة', 55, 1, CAST(N'2024-02-27T10:24:10.523' AS DateTime), CAST(N'2024-02-27T10:25:10.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[visitorrent] OFF
GO
INSERT [dbo].[vist_history] ([dept_name], [faculty_name], [class_name], [itclass_name], [sem_name], [first_name], [middle_name], [last_name], [std_id], [date_visited]) VALUES (N'computer', N'IT', N'ITclass', N'bit01', N'semester one', N'mohamed', N'hussein', N'dhalahow', 1880, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[vist_history] ([dept_name], [faculty_name], [class_name], [itclass_name], [sem_name], [first_name], [middle_name], [last_name], [std_id], [date_visited]) VALUES (N'computer', N'IT', N'ITclass', N'BIT10', N'semester one', N'mohamed', N'hussein', N'dhalahow', 1880, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[vist_history] ([dept_name], [faculty_name], [class_name], [itclass_name], [sem_name], [first_name], [middle_name], [last_name], [std_id], [date_visited]) VALUES (N'computer', N'IT', N'ITclass', N'BIT10', N'semester one', N'mohamed', N'hussein', N'dhalahow', 1880, CAST(N'2022-05-04' AS Date))
GO
INSERT [dbo].[year] ([startdate], [enddate], [academic_year]) VALUES (NULL, NULL, N'2023-2024')
GO
ALTER TABLE [dbo].[Accountingclass] ADD  CONSTRAINT [DF_Accountingclass_dept_id]  DEFAULT ((2)) FOR [dept_id]
GO
ALTER TABLE [dbo].[BAclass] ADD  CONSTRAINT [DF_BAclass_dept_id]  DEFAULT ((1)) FOR [dept_id]
GO
ALTER TABLE [dbo].[educationclass] ADD  CONSTRAINT [DF_educationclass_dept_id]  DEFAULT ((6)) FOR [dept_id]
GO
ALTER TABLE [dbo].[generalfiqhiclass] ADD  CONSTRAINT [DF_generalfiqhiclass_dept_id]  DEFAULT ((9)) FOR [dept_id]
GO
ALTER TABLE [dbo].[generalnursingclass] ADD  CONSTRAINT [DF_generalnursingclass_dept_id]  DEFAULT ((13)) FOR [dept_id]
GO
ALTER TABLE [dbo].[Itclass] ADD  CONSTRAINT [DF_Itclass_dept_id]  DEFAULT ((5)) FOR [dept_id]
GO
ALTER TABLE [dbo].[medclass] ADD  CONSTRAINT [DF_medclass_dept_id]  DEFAULT ((12)) FOR [dept_id]
GO
ALTER TABLE [dbo].[publicadministrationclass] ADD  CONSTRAINT [DF_publicadministrationclass_dept_id]  DEFAULT ((3)) FOR [dept_id]
GO
ALTER TABLE [dbo].[Publichealthclass] ADD  CONSTRAINT [DF_Publichealthclass_dept_id]  DEFAULT ((14)) FOR [dept_id]
GO
ALTER TABLE [dbo].[rent] ADD  CONSTRAINT [DF_rent_issuedate]  DEFAULT (getdate()) FOR [issuedate]
GO
ALTER TABLE [dbo].[rent] ADD  CONSTRAINT [DF_rent_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[shlclass] ADD  CONSTRAINT [DF_shlclass_dept_id]  DEFAULT ((11)) FOR [dept_id]
GO
ALTER TABLE [dbo].[visitorrent] ADD  CONSTRAINT [DF_visitorrent_issuedate]  DEFAULT (getdate()) FOR [issuedate]
GO
ALTER TABLE [dbo].[visitorrent] ADD  CONSTRAINT [DF_visitorrent_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[visittable] ADD  CONSTRAINT [DF_visittable_date_visited]  DEFAULT (getdate()) FOR [date_visited]
GO
/****** Object:  StoredProcedure [dbo].[examp]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[examp]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[exampp]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[exampp]
    @ClassId INT ,
	@dept_id int,
	@facul_id int
	--@itclassid int,
	--@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[examppp]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[examppp]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
	IF @medclassid = 1
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        where medclass_id = @medclassid;
    END
	IF @medclassid = 1
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        where medclass_id = @medclassid;
    END
	IF @itclassid = 0
    BEGIN
      
     SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
       
        WHERE Itclass_id = @itclassid;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[exampppp]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[exampppp]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
		IF @itclassid = 0
    BEGIN
      
     SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
       
        WHERE Itclass_id = @itclassid;
    END
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
		IF @medclassid = 1
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        where medclass_id = @medclassid;
    END
    END

	
	
END;
GO
/****** Object:  StoredProcedure [dbo].[examppppp]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[examppppp]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
		
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
	
    END

	
	
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDataByClassId]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentDataByClassId]
    @classid INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        students.std_id,
        students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
        CONCAT(med_facults.faculty_name, ' ', it_facults.faculty_name) AS combined_facults,
        CONCAT(Itclass.itclassname, ' ', medclass.medclassname) AS combined_classname,
        CONCAT(medept.dept_name, ' ', itdept.dept_name) AS deprtments,
        CONCAT(classit.class_name, ' ', classmed.class_name) AS classes,
        CONCAT(itsem.sem_name, ' ', medsem.sem_name) AS semesters,
        students.gender
    FROM students
    LEFT JOIN studentIT_class ON students.std_id = studentIT_class.std_id
    LEFT JOIN studentMed_class ON students.std_id = studentMed_class.std_id
    LEFT JOIN medclass ON studentMed_class.medclass_id = medclass.medclass_id
    LEFT JOIN Itclass ON studentIT_class.itclass_id = Itclass.Itclass_id
    LEFT JOIN facults AS med_facults ON medclass.facul_id = med_facults.facul_id
    LEFT JOIN facults AS it_facults ON Itclass.facul_id = it_facults.facul_id
    LEFT JOIN departments AS medept ON med_facults.dept_id = medept.dept_id
    LEFT JOIN departments AS itdept ON it_facults.dept_id = itdept.dept_id
    LEFT JOIN classes AS classit ON it_facults.facul_id = classit.facul_id
    LEFT JOIN classes AS classmed ON med_facults.facul_id = classmed.facul_id
    LEFT JOIN semesters AS itsem ON Itclass.sem_id = itsem.sem_id
    LEFT JOIN semesters AS medsem ON medclass.sem_id = medsem.sem_id
    WHERE
        (
            (@classid = 1 AND Itclass.itclass_id = 3 AND Itclass.itclassname IS NOT NULL AND Itclass.itclassname != '')
            OR
            (@classid = 2 AND medclass.medclassname IS NOT NULL AND medclass.medclassname != '')
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDataByClassId1]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentDataByClassId1]
    @classid INT,
	  @itclass INT,
	    @medclass INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        students.std_id,
        students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
        CONCAT(med_facults.faculty_name, ' ', it_facults.faculty_name) AS combined_facults,
        CONCAT(Itclass.itclassname, ' ', medclass.medclassname) AS combined_classname,
        CONCAT(medept.dept_name, ' ', itdept.dept_name) AS deprtments,
        CONCAT(classit.class_name, ' ', classmed.class_name) AS classes,
        CONCAT(itsem.sem_name, ' ', medsem.sem_name) AS semesters,
        students.gender
    FROM students
    LEFT JOIN studentIT_class ON students.std_id = studentIT_class.std_id
    LEFT JOIN studentMed_class ON students.std_id = studentMed_class.std_id
    LEFT JOIN medclass ON studentMed_class.medclass_id = medclass.medclass_id
    LEFT JOIN Itclass ON studentIT_class.itclass_id = Itclass.Itclass_id
    LEFT JOIN facults AS med_facults ON medclass.facul_id = med_facults.facul_id
    LEFT JOIN facults AS it_facults ON Itclass.facul_id = it_facults.facul_id
    LEFT JOIN departments AS medept ON med_facults.dept_id = medept.dept_id
    LEFT JOIN departments AS itdept ON it_facults.dept_id = itdept.dept_id
    LEFT JOIN classes AS classit ON it_facults.facul_id = classit.facul_id
    LEFT JOIN classes AS classmed ON med_facults.facul_id = classmed.facul_id
    LEFT JOIN semesters AS itsem ON Itclass.sem_id = itsem.sem_id
    LEFT JOIN semesters AS medsem ON medclass.sem_id = medsem.sem_id
    WHERE
        (
            (@classid = 1 AND Itclass.itclass_id = @itclass AND Itclass.itclassname IS NOT NULL AND Itclass.itclassname != '')
            OR
            (@classid = 2 AND medclass.medclass_id = @medclass AND medclass.medclassname IS NOT NULL AND medclass.medclassname != '')
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDataByClassId2]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentDataByClassId2]
    @dept INT,
    @facul INT,
    @classid INT,
    @medclass INT,
    @itclass INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        students.std_id,
        students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
        CONCAT(med_facults.faculty_name, ' ', it_facults.faculty_name) AS combined_facults,
        CONCAT(Itclass.itclassname, ' ', medclass.medclassname) AS combined_classname,
        CONCAT(medept.dept_name, ' ', itdept.dept_name) AS deprtments,
        CONCAT(classit.class_name, ' ', classmed.class_name) AS classes,
        CONCAT(itsem.sem_name, ' ', medsem.sem_name) AS semesters,
        students.gender
    FROM students
    LEFT JOIN studentIT_class ON students.std_id = studentIT_class.std_id
    LEFT JOIN studentMed_class ON students.std_id = studentMed_class.std_id
    LEFT JOIN medclass ON studentMed_class.medclass_id = medclass.medclass_id
    LEFT JOIN Itclass ON studentIT_class.itclass_id = Itclass.Itclass_id
    LEFT JOIN facults AS med_facults ON medclass.facul_id = med_facults.facul_id
    LEFT JOIN facults AS it_facults ON Itclass.facul_id = it_facults.facul_id
    LEFT JOIN departments AS medept ON med_facults.dept_id = medept.dept_id
    LEFT JOIN departments AS itdept ON it_facults.dept_id = itdept.dept_id
    LEFT JOIN classes AS classit ON it_facults.facul_id = classit.facul_id
    LEFT JOIN classes AS classmed ON med_facults.facul_id = classmed.facul_id
    LEFT JOIN semesters AS itsem ON Itclass.sem_id = itsem.sem_id
    LEFT JOIN semesters AS medsem ON medclass.sem_id = medsem.sem_id
    WHERE
        (
            (@classid = 1 AND Itclass.itclass_id = @itclass AND Itclass.itclassname IS NOT NULL AND Itclass.itclassname != '')
            OR
            (@classid = 2 AND medclass.medclassname IS NOT NULL AND medclass.medclassname != '')
        )
        AND medept.dept_id = CASE WHEN @facul = med_facults.facul_id THEN @dept ELSE NULL END
        AND itdept.dept_id = CASE WHEN @facul = it_facults.facul_id THEN @dept ELSE NULL END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMedVisit]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[InsertMedVisit]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @v_medclass_id INT;

    -- Get medclass_id based on medclassname
    SELECT @v_medclass_id = medclass_id
    FROM medclass
    WHERE medclassname = @p_medclassname;

    -- Insert into medVisit based on conditions
    INSERT INTO medVisit (std_id, stdmed_id, date_visited)
    SELECT
        @p_std_id,
        stdmed_id,
        @p_date_visited
    FROM
        studentMed_class
    WHERE
        medclass_id = @v_medclass_id
        AND std_id = @p_std_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMedVisit11]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedVisit11]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medcineclass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMedVisit111]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedVisit111]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medcineclass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertMedVisit1111]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedVisit1111]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertvisit]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertvisit]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
	    @p_itclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
	 IF @class_id = 1
    BEGIN
        INSERT INTO itVisit(std_id, stdit_id, date_visited)
        SELECT
            @p_std_id,
            stdit_id,
            @p_date_visited
        FROM
            studentIT_class
        WHERE
            itclass_id = (
                SELECT itclassname
                FROM Itclass
                WHERE itclassname = @p_itclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertVisitBasedOnClass]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertVisitBasedOnClass]
AS
BEGIN
    -- Insert data into itVisit if class_id is 1
    IF EXISTS (SELECT 1 FROM classes WHERE class_id = 1)
    BEGIN
        INSERT INTO itVisit (stdit_id, date_visited)
        SELECT studentIT_class.stdit_id, GETDATE() -- Assuming you want to insert the current date
        FROM studentIT_class
        -- Add JOIN conditions as needed
   
    END

    -- Insert data into medVisit if class_id is 2
    IF EXISTS (SELECT 1 FROM classes WHERE class_id = 2)
    BEGIN
        INSERT INTO medVisit (stdmed_id, date_visited)
        SELECT studentMed_class.stdmed_id, GETDATE() -- Assuming you want to insert the current date
        FROM studentMed_class
        -- Add JOIN conditions as needed
  
    END

    -- Add more conditions as needed for other class_ids
END;
GO
/****** Object:  StoredProcedure [dbo].[insertvisits]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertvisits]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
	    @p_itclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
	 IF @class_id = 1
    BEGIN
        INSERT INTO itVisit(std_id, stdit_id, date_visited)
        SELECT
            @p_std_id,
            stdit_id,
            @p_date_visited
        FROM
            studentIT_class
        WHERE
            itclass_id = (
                SELECT itclass_id
                FROM Itclass
                WHERE itclassname = @p_itclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertvisitss]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertvisitss]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
	    @p_itclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Check if @p_classname is 'medcineclass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

   
	 IF @class_id = 1
    BEGIN
        INSERT INTO itVisit(std_id, stdit_id, date_visited)
        SELECT
            @p_std_id,
            stdit_id,
            @p_date_visited
        FROM
            studentIT_class
        WHERE
            itclass_id = (
                SELECT itclass_id
                FROM Itclass
                WHERE itclassname = @p_itclassname
            )
            AND std_id = @p_std_id;
    END;
	 -- Check if @class_id is 2
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertvisitsss]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertvisitsss]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_itclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Initialize @class_id to a default value
    SET @class_id = 0;

    -- Check if @p_classname is 'medcineClass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check for invalid @class_id
    IF @class_id NOT IN (1, 2)
    BEGIN
        -- Handle the case of an invalid class_id
        -- You may want to raise an error, log it, or handle it in a way that makes sense for your application
        RETURN; -- or RAISEERROR, or other appropriate action
    END;

    -- Use transactions if needed
    BEGIN TRANSACTION;

    -- Perform the appropriate insert based on the class_id
    IF @class_id = 1
    BEGIN
        INSERT INTO itVisit (std_id, stdit_id, date_visited)
        SELECT
            @p_std_id,
            stdit_id,
            @p_date_visited
        FROM
            studentIT_class
        WHERE
            itclass_id = (
                SELECT itclass_id
                FROM Itclass
                WHERE itclassname = @p_itclassname
            )
            AND std_id = @p_std_id;
    END;

    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;

    -- Commit the transaction if everything is successful
    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[istvst]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[istvst]
    @p_std_id INT,
    @p_medclassname VARCHAR(255),
    @p_itclassname VARCHAR(255),
    @p_classname VARCHAR(255),
    @p_date_visited DATE
AS
BEGIN
    DECLARE @class_id INT;

    -- Initialize @class_id to a default value
    SET @class_id = 0;

    -- Check if @p_classname is 'medcineClass' or 'ITclass'
    IF @p_classname IN ('medicineClass', 'ITclass')
    BEGIN
        -- Assuming you want to retrieve class_id for further use
        SELECT @class_id = class_id FROM classes WHERE class_name = @p_classname;
    END;

    -- Check for invalid @class_id
    IF @class_id NOT IN (1, 2)
    BEGIN
        -- Handle the case of an invalid class_id
        -- You may want to raise an error, log it, or handle it in a way that makes sense for your application
        RETURN; -- or RAISEERROR, or other appropriate action
    END;

    -- Use transactions if needed
    BEGIN TRANSACTION;

    -- Perform the appropriate insert based on the class_id
    IF @class_id = 1
    BEGIN
        INSERT INTO itVisit (std_id, stdit_id, date_visited)
        SELECT
            @p_std_id,
            stdit_id,
            @p_date_visited
        FROM
            studentIT_class
        WHERE
            itclass_id = (
                SELECT itclass_id
                FROM Itclass
                WHERE itclassname = @p_itclassname
            )
            AND std_id = @p_std_id;
    END;
	else 
    IF @class_id = 2
    BEGIN
        INSERT INTO medVisit (std_id, stdmed_id, date_visited)
        SELECT
            @p_std_id,
            stdmed_id,
            @p_date_visited
        FROM
            studentMed_class
        WHERE
            medclass_id = (
                SELECT medclass_id
                FROM medclass
                WHERE medclassname = @p_medclassname
            )
            AND std_id = @p_std_id;
    END;

    -- Commit the transaction if everything is successful
    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[moha]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[moha]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	else if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	 else IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
		
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
	
    END

	
	
END;
GO
/****** Object:  StoredProcedure [dbo].[mohaa]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[mohaa]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN


IF @dept_id= 1
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END
   else if @dept_id= 2
    BEGIN
        
       SELECT facul_id, faculty_name FROM facults WHERE dept_id = @dept_id
     
    END

	else if @facul_id= 1
    BEGIN
        
       SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
     
    END
	else if @facul_id= 2
	begin
	    SELECT class_id, class_name FROM classes WHERE facul_id =  @facul_id
	end






	 else IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
		
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
	
    END
	else  IF @medclassid = 1
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
     
        WHERE medclass_id = @medclassid;
	
    END
	
	
END;
GO
/****** Object:  StoredProcedure [dbo].[mohaaa]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mohaaa]
    @ClassId INT,
    @dept_id INT,
    @facul_id INT,
    @itclassid INT,
    @medclassid INT
AS
BEGIN
    IF @dept_id = 1 OR @dept_id = 2
    BEGIN
        SELECT facul_id, faculty_name
        FROM facults
        WHERE dept_id = @dept_id;
    END
    ELSE IF @facul_id = 1 OR @facul_id = 2
    BEGIN
        SELECT class_id, class_name
        FROM classes
        WHERE facul_id = @facul_id;
    END
    ELSE IF @ClassId = 1 OR @ClassId = 2
    BEGIN
        IF @ClassId = 1
        BEGIN
            SELECT itclass.Itclass_id, Itclass.itclassname
            FROM Itclass
            INNER JOIN classes ON Itclass.class_id = classes.class_id
            WHERE classes.class_id = @ClassId;
        END
        ELSE IF @ClassId = 2
        BEGIN
            SELECT medclass.medclass_id, medclass.medclassname
            FROM medclass
            INNER JOIN classes ON medclass.class_id = classes.class_id
            WHERE classes.class_id = @ClassId;
        END
    END
    ELSE IF @medclassid = 1
    BEGIN
        SELECT medclass.medclass_id, medclass.medclassname
        FROM medclass
        WHERE medclass.medclass_id = @medclassid;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[mohaaaa]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mohaaaa]
    @ClassId INT,
    @dept_id INT,
    @facul_id INT,
    @itclassid INT,
    @medclassid INT
AS
BEGIN
    IF @dept_id = 1 OR @dept_id = 2
    BEGIN
        SELECT facul_id, faculty_name
        FROM facults
        WHERE dept_id = @dept_id;
    END
    ELSE IF @facul_id = 1 OR @facul_id = 2
    BEGIN
        SELECT class_id, class_name
        FROM classes
        WHERE facul_id = @facul_id;
    END
    ELSE IF @ClassId = 1
    BEGIN
        SELECT itclass.Itclass_id, Itclass.itclassname
        FROM Itclass
        INNER JOIN classes ON Itclass.class_id = classes.class_id
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @ClassId = 2
    BEGIN
        SELECT medclass.medclass_id, medclass.medclassname
        FROM medclass
        INNER JOIN classes ON medclass.class_id = classes.class_id
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @itclassid IS NOT NULL
    BEGIN
        -- Execute itclass query based on itclassid
        SELECT itclass.Itclass_id, itclass.itclassname
        FROM itclass
        WHERE itclass.Itclass_id = @itclassid;
    END
    ELSE IF @medclassid IS NOT NULL
    BEGIN
        -- Execute medclass query based on medclassid
        SELECT medclass.medclass_id, medclass.medclassname
        FROM medclass
        WHERE medclass.medclass_id = @medclassid;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[que]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[que]
    @ClassId INT ,
	@dept_id int,
	@facul_id int,
	@itclassid int,
	@medclassid int 
AS
BEGIN
if 	@dept_id =2 or @dept_id = 1
   BEGIN
   select *  from facults where dept_id=	@dept_id
   END
   if 	@facul_id =2 or @facul_id = 1
   BEGIN
   select class_id , class_name  from classes where facul_id=	@facul_id
   END
    if 	    @ClassId =2 
   BEGIN
   select medclass_id   from medclass where class_id=	    @ClassId
   END
     if 	    @medclassid =1 or @medclassid = 2
   BEGIN
   select medclass_id   from medclass where medclass_id=	    @medclassid
   END
    if 	    @ClassId =1
   BEGIN
   select  Itclass_id  from Itclass where class_id=	    @ClassId
   END
     if 	    @itclassid =1 or  @itclassid = 2
   BEGIN
   select Itclass_id   from Itclass where Itclass_id=	    @itclassid
   END
END;
GO
/****** Object:  StoredProcedure [dbo].[selectbarches]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectbarches]
   @depts INT
AS
BEGIN
    IF @depts = 4
    BEGIN
        
       SELECT itclass.Itclass_id, itclass.itclassname
FROM Itclass
INNER JOIN departments ON itclass.dept_id = departments.dept_id
WHERE departments.dept_id = @depts;

    END
    ELSE IF @depts = 12
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
       INNER JOIN departments  ON medclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END

     ELSE IF @depts = 1
    BEGIN
      
        SELECT BAclass.Baclass_id , BAclass.BAclass_name
        FROM  BAclass
       INNER JOIN departments  ON BAclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 2
    BEGIN
      
        SELECT Accountingclass.AFclass_id , Accountingclass.AFclassname
        FROM  Accountingclass
       INNER JOIN departments  ON Accountingclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 3
    BEGIN
      
        SELECT publicadministrationclass.PAclass_id , publicadministrationclass.PAclassname
        FROM  publicadministrationclass
       INNER JOIN departments  ON publicadministrationclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 9
    BEGIN
      
        SELECT generalfiqhiclass.GFclass_id , generalfiqhiclass.GFclassname
        FROM  generalfiqhiclass
       INNER JOIN departments  ON generalfiqhiclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	 ELSE IF @depts = 11
    BEGIN
      
        SELECT sharialawclass.sharialawclass_id , sharialawclass.sharialawclassname
        FROM  sharialawclass
       INNER JOIN departments  ON sharialawclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
		 ELSE IF @depts = 14
    BEGIN
      
        SELECT Publichealthclass.PHclass_id , Publichealthclass.PHclassname
        FROM  Publichealthclass
       INNER JOIN departments  ON Publichealthclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[selectbarches1]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectbarches1]
   @depts INT 
AS
BEGIN
    IF @depts = 5
    BEGIN
        
       SELECT itclass.Itclass_id, itclass.itclassname
FROM Itclass
INNER JOIN departments ON itclass.dept_id = departments.dept_id
WHERE departments.dept_id = @depts;

    END
    ELSE IF @depts = 12
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
       INNER JOIN departments  ON medclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END

     ELSE IF @depts = 1
    BEGIN
      
        SELECT BAclass.Baclass_id , BAclass.BAclass_name
        FROM  BAclass
       INNER JOIN departments  ON BAclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 2
    BEGIN
      
        SELECT Accountingclass.AFclass_id , Accountingclass.AFclassname
        FROM  Accountingclass
       INNER JOIN departments  ON Accountingclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 3
    BEGIN
      
        SELECT publicadministrationclass.PAclass_id , publicadministrationclass.PAclassname
        FROM  publicadministrationclass
       INNER JOIN departments  ON publicadministrationclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	    ELSE IF @depts = 9
    BEGIN
      
        SELECT generalfiqhiclass.GFclass_id , generalfiqhiclass.GFclassname
        FROM  generalfiqhiclass
       INNER JOIN departments  ON generalfiqhiclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	 
		 ELSE IF @depts = 14
    BEGIN
      
        SELECT Publichealthclass.PHclass_id , Publichealthclass.PHclassname
        FROM  Publichealthclass
       INNER JOIN departments  ON Publichealthclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	 ELSE IF @depts = 6
    BEGIN
      
        SELECT educationclass.edcnclass_id , educationclass.edcnclassname
        FROM  educationclass
       INNER JOIN departments  ON educationclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	 ELSE IF @depts = 13
    BEGIN
      
        SELECT generalnursingclass.gnclass_id , generalnursingclass.gnclassname
        FROM  generalnursingclass
       INNER JOIN departments  ON generalnursingclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
	ELSE IF @depts = 11
    BEGIN
      
        SELECT shlclass.shl_id , shlclass.shlclassname
        FROM  shlclass
       INNER JOIN departments  ON shlclass.dept_id  =departments.dept_id 
        WHERE departments.dept_id = @depts;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[selectclass]    Script Date: 3/10/2024 12:19:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectclass]
    @ClassId INT
AS
BEGIN
    IF @ClassId = 1
    BEGIN
        
        SELECT itclass.Itclass_id , Itclass.itclassname
        FROM  Itclass 
        INNER JOIN classes  ON Itclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
    ELSE IF @ClassId = 2
    BEGIN
      
        SELECT medclass.medclass_id , medclass.medclassname
        FROM  medclass
        INNER JOIN classes  ON medclass.class_id  =classes.class_id 
        WHERE classes.class_id = @ClassId;
    END
    
END;
GO
USE [master]
GO
ALTER DATABASE [kismalib] SET  READ_WRITE 
GO
