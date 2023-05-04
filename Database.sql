/****** Object:  Database [ctintern]    Script Date: 5/4/2023 4:14:49 PM ******/
CREATE DATABASE [ctintern]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ctintern', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ctintern.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ctintern_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ctintern_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ctintern] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ctintern].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ctintern] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ctintern] SET ARITHABORT OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ctintern] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ctintern] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ctintern] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ctintern] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ctintern] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ctintern] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ctintern] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ctintern] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ctintern] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ctintern] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ctintern] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ctintern] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ctintern] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ctintern] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ctintern] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ctintern] SET  MULTI_USER 
GO
ALTER DATABASE [ctintern] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ctintern] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ctintern] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ctintern] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ctintern] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ctintern] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ctintern] SET QUERY_STORE = ON
GO
ALTER DATABASE [ctintern] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ctintern]
GO
/****** Object:  Table [dbo].[userAttendances]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userAttendances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[checkInTime] [nvarchar](255) NULL,
	[checkOutTime] [nvarchar](255) NULL,
	[checkInDate] [date] NULL,
	[checkOutDate] [date] NULL,
	[checkInLocation] [nvarchar](255) NULL,
	[checkOutLocation] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userProfiles]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userProfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[profileImage] [nvarchar](max) NULL,
	[hrmid] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[permanentAddress] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[emergencyPhone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userProjects]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userProjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[clientId] [int] NULL,
	[clientName] [nvarchar](255) NULL,
	[projectId] [int] NULL,
	[projectName] [nvarchar](255) NULL,
	[assignedOn] [date] NULL,
	[completeBy] [date] NULL,
	[teamMembers] [nvarchar](255) NULL,
	[teamHead] [nvarchar](255) NULL,
	[department] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userRequests]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userRequests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[email] [nvarchar](255) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[date] [date] NULL,
	[leaveType] [nvarchar](255) NULL,
	[request] [nvarchar](255) NULL,
	[reason] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(10001,1) NOT NULL,
	[hrmid] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[role] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[joiningDate] [date] NULL,
	[reportingManager] [nvarchar](255) NULL,
	[reportsTo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userSkills]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userSkills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[primarySkills] [nvarchar](255) NULL,
	[secondarySkills] [nvarchar](255) NULL,
	[certifications] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userTimesheets]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userTimesheets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[timesheetName] [nvarchar](255) NULL,
	[clientName] [nvarchar](255) NULL,
	[projectName] [nvarchar](255) NULL,
	[jobName] [nvarchar](255) NULL,
	[workItem] [nvarchar](255) NULL,
	[date] [date] NULL,
	[week] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[totalTime] [nvarchar](255) NULL,
	[billableStatus] [nvarchar](255) NULL,
	[submittedHours] [nvarchar](255) NULL,
	[approvedHours] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[userProjects] ADD  DEFAULT (N'Active') FOR [status]
GO
ALTER TABLE [dbo].[userRequests] ADD  DEFAULT (N'Pending') FOR [status]
GO
ALTER TABLE [dbo].[userTimesheets] ADD  DEFAULT (N'Waiting for Approval') FOR [approvedHours]
GO
ALTER TABLE [dbo].[userTimesheets] ADD  DEFAULT (N'Pending') FOR [status]
GO
/****** Object:  StoredProcedure [dbo].[spadmins_getallusers]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmins_getallusers] 
AS 
BEGIN
	SELECT * FROM  dbo.users
	ORDER BY id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spadmins_postuserproject]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmins_postuserproject]
	@userEmail nvarchar(255), @clientId nvarchar(255), @clientName nvarchar(255), @projectId nvarchar(255), @projectName nvarchar(255), @assignedOn date, @completeBy date, @teamMembers nvarchar(255), @teamHead nvarchar(255), @department nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userEmail, projectId
	FROM dbo.userProjects
	WHERE userEmail = @userEmail AND projectId = @projectId)
	INSERT INTO dbo.userProjects(userEmail, clientId, clientName, projectId, projectName, assignedOn, completeBy, teamMembers, teamHead, department)
	values (@userEmail, @clientId, @clientName, @projectId, @projectName, @assignedOn, @completeBy, @teamMembers, @teamHead, @department)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_deleteuserrequest]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_deleteuserrequest]
	 @userId int , @id int 
AS 
BEGIN
	DELETE  FROM  dbo.userRequests
	WHERE id = @id AND userId =	@userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getcurrentuser]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getcurrentuser]
	@email nvarchar(255)
AS
BEGIN
	SELECT * FROM dbo.users
	WHERE email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuser]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuser]
	@userId int 
AS 
BEGIN
	SELECT * FROM  dbo.users 
	WHERE id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserattendance]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserattendance]
	@userId int 
AS 
BEGIN
	SELECT * FROM  dbo.userAttendances
	WHERE userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusercurrentattendance]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusercurrentattendance]
	@userId int, @currentDate date
AS 
BEGIN
	SELECT TOP 1 * FROM  dbo.userAttendances
	WHERE userId = @userId AND checkInDate = @currentDate
	ORDER BY dbo.userAttendances.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusercurrentrequest]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusercurrentrequest]
	 @userId int , @id int 
AS 
BEGIN
	SELECT * FROM  dbo.userRequests
	WHERE id = @id AND userId =	@userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprofile]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserprofile]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, userId, profileImage, dbo.users.hrmid, dbo.users.name, permanentAddress,city, state, country, emergencyPhone, email, password, phone, role, location, joiningDate, reportingManager, reportsTo
	FROM  dbo.users
	LEFT JOIN dbo.userProfiles
	ON dbo.users.id = dbo.userProfiles.userId
	WHERE dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprojects]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserprojects]
	@userEmail nvarchar(255) 
AS 
BEGIN
	SELECT * FROM  dbo.userProjects
	WHERE userEmail = @userEmail
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserrequests]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserrequests]
	@userId int 
AS 
BEGIN
	SELECT dbo.userRequests.id, dbo.userRequests.userId, dbo.userProfiles.profileImage, dbo.userProfiles.hrmid, dbo.userProfiles.name, email, startDate, endDate, date, leaveType, request, reason, status
	FROM  dbo.userRequests
	INNER JOIN dbo.userProfiles
	ON dbo.userRequests.userId = dbo.userProfiles.userId
	WHERE dbo.userRequests.userId = @userId
	ORDER BY dbo.userRequests.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserskills]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserskills]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, userId, primarySkills, secondarySkills, certifications from  dbo.users LEFT JOIN dbo.userSkills ON dbo.userSkills.userId = dbo.users.id
	where dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusersubordinates]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusersubordinates] 
   @hrmid nvarchar(255)
AS 
BEGIN
	SELECT dbo.users.name, role, profileImage
	FROM dbo.users
	LEFT JOIN dbo.userProfiles
	ON dbo.users.id = dbo.userProfiles.userId
	WHERE reportsTo = @hrmid
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusersubordinatesrequests]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusersubordinatesrequests]
	@hrmid nvarchar(255) 
AS 
BEGIN
	SELECT dbo.userRequests.id, dbo.userRequests.userId, dbo.userProfiles.profileImage, dbo.userProfiles.hrmid, dbo.userProfiles.name, dbo.userRequests.email, role, request, startDate, endDate, leaveType, reason, status
	FROM  dbo.userRequests
	INNER JOIN dbo.userProfiles
	ON dbo.userRequests.userId = dbo.userProfiles.userId
	INNER JOIN dbo.users
	ON dbo.userRequests.userId = dbo.users.id
	WHERE dbo.users.reportsTo = @hrmid
	ORDER BY dbo.userRequests.id DESC
	SET NOCOUNT ON;
END

EXEC [dbo].[spusers_getusersubordinatesrequests] 'HRM1002';
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusersubordinatestimesheets]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusersubordinatestimesheets]
	@hrmid nvarchar(255) 
AS 
BEGIN
	SELECT dbo.userTimesheets.id, dbo.userTimesheets.userId, dbo.userProfiles.profileImage, dbo.userProfiles.hrmid, dbo.userProfiles.name, timesheetName, clientName, projectName, jobName, workItem, date, week, description, totalTime, billableStatus, submittedHours, approvedHours, status
	FROM  dbo.userTimesheets
	INNER JOIN dbo.userProfiles
	ON dbo.userTimesheets.userId = dbo.userProfiles.userId
	INNER JOIN dbo.users
	ON dbo.userTimesheets.userId = dbo.users.id
	WHERE dbo.users.reportsTo = @hrmid
	ORDER BY dbo.userTimesheets.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusersuperiorprofile]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusersuperiorprofile] 
   @hrmid nvarchar(255)
AS 
BEGIN
	SELECT dbo.users.name, role, profileImage
	FROM  dbo.users
	LEFT JOIN dbo.userProfiles
	ON dbo.users.id = dbo.userProfiles.userId
	WHERE dbo.users.hrmid = @hrmid
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusertimesheets]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusertimesheets]
	@userId int 
AS 
BEGIN
	SELECT dbo.userTimesheets.id, dbo.userTimesheets.userId, dbo.userProfiles.profileImage, dbo.userProfiles.hrmid, dbo.userProfiles.name, timesheetName, clientName, projectName, jobName, workItem, date, week, description, totalTime, billableStatus, submittedHours, approvedHours, status
	FROM  dbo.userTimesheets
	INNER JOIN dbo.userProfiles
	ON dbo.userTimesheets.userId = dbo.userProfiles.userId
	WHERE dbo.userTimesheets.userId = @userId
	ORDER BY dbo.userTimesheets.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postusercheckin]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postusercheckin]
	@userId int, @checkInLocation nvarchar(255), @status nvarchar(255)
AS 
BEGIN
	DECLARE @checkInDate date;
	DECLARE @checkInTime nvarchar(255);
	SET @checkInDate = CAST(CURRENT_TIMESTAMP AS date);
	SET @checkInTime = CONVERT(varchar,GETDATE(),8);
	INSERT INTO dbo.userAttendances (userId, checkInTime, checkInDate, checkInLocation, status)
	values (@userId, @checkInTime, @checkInDate, @checkInLocation, @status)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserprofile]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserprofile]
	@userId int, @profileImage nvarchar(MAX), @hrmid nvarchar(255), @name nvarchar(255), @permanentAddress nvarchar(255), @city nvarchar(255), @state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId from dbo.userProfiles WHERE userId = @userId)
	INSERT INTO dbo.userProfiles (userId, profileImage, hrmid, name, permanentAddress , city, state, country, emergencyPhone)
	values (@userId, @profileImage, @hrmid, @name, @permanentAddress ,  @city ,  @state,@country,  @emergencyPhone)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserrequest]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserrequest]
	@userId int, @email nvarchar(255), @startDate date, @endDate date,@leaveType nvarchar(255), @request nvarchar(255), @reason nvarchar(255)
AS 
BEGIN
	DECLARE @date date;
	SET @date = CAST(CURRENT_TIMESTAMP AS date);
	INSERT INTO dbo.userRequests(userId, email, startDate, endDate, date, leaveType, request, reason)
	values (@userId, @email, @startDate,@endDate, @date, @leaveType, @request, @reason)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserskills]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserskills]
	@userId int, @primarySkills nvarchar(255), @secondarySkills nvarchar(255),@certifications nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId from dbo.userSkills WHERE userId = @userId)
	INSERT INTO dbo.userSkills(userId, primarySkills, secondarySkills, certifications)
	values (@userId,@primarySkills,@secondarySkills,@certifications )
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postusertimesheet]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postusertimesheet]
	@userId int, @timesheetName nvarchar(255), @clientName nvarchar(255), @projectName nvarchar(255), @jobName nvarchar(255), @workItem nvarchar(255), @date date, @week nvarchar(255), @description nvarchar(255), @totalTime nvarchar(255), @billableStatus nvarchar(255), @submittedHours nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId, date from dbo.userTimesheets WHERE userId = @userId AND date = @date)
	INSERT INTO dbo.userTimesheets(userId, timesheetName, clientName, projectName, jobName, workItem, date, week, description, totalTime, billableStatus, submittedHours)
	values (@userId, @timesheetName, @clientName, @projectName, @jobName, @workItem, @date, @week, @description, @totalTime, @billableStatus, @submittedHours)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateusercheckout]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateusercheckout]
    @userId int, @checkOutLocation nvarchar(255), @status nvarchar(255), @checkInTime nvarchar(255)
AS 
BEGIN
	DECLARE @checkOutDate date;
	DECLARE @checkOutTime nvarchar(255);
	SET @checkOutDate = CAST(CURRENT_TIMESTAMP AS date);
	SET @checkOutTime = CONVERT(varchar,GETDATE(),8);

    UPDATE dbo.userAttendances
    SET checkOutDate=@checkOutDate, checkOutTime=@checkOutTime, checkOutLocation=@checkOutLocation, status=@status
    where userId = @userId AND checkInDate= @checkOutDate AND checkInTime=@checkInTime
    SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserprofile]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserprofile]
	@userId int , @profileImage nvarchar(MAX), @permanentAddress nvarchar(255),@city nvarchar(255) ,@state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	UPDATE dbo.userProfiles
	SET profileImage=@profileImage, permanentAddress=@permanentAddress, city=@city, state=@state, country = @country,  emergencyPhone=@emergencyPhone
	where userProfiles.userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserrequest]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserrequest]
     @userId int, @id int, @status nvarchar(255)
AS 
BEGIN
     UPDATE dbo.userRequests
     SET status = @status
     where userId = @userId AND id = @id
     SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateusersignup]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateusersignup]
	@name nvarchar(255), @email nvarchar(255),@password nvarchar(255)
AS 
BEGIN
	UPDATE dbo.users
	SET name=@name, email=@email, password=@password
	where users.email = @email
	SET NOCOUNT ON; 
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserskills]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserskills]
	@userId int ,@primarySkills nvarchar(255),@secondarySkills nvarchar(255) ,@certifications nvarchar(255)
AS 
BEGIN
	UPDATE dbo.userSkills
	SET primarySkills=@primarySkills, secondarySkills=@secondarySkills, certifications=@certifications
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateusertimesheet]    Script Date: 5/4/2023 4:14:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateusertimesheet]
     @userId int, @id int, @status nvarchar(255)
AS 
BEGIN
     UPDATE dbo.userTimesheets
     SET status = @status
     where userId = @userId AND id = @id
     SET NOCOUNT ON;
END
GO