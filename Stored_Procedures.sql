USE [organizationdb]
GO
/****** Object:  StoredProcedure [dbo].[spusers_getcurrentuser]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getcurrentuser]
	@email nvarchar(255)
AS
BEGIN
	SELECT * from dbo.users where email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuser]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuser]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.users 
	where id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserattendance]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserattendance]
	@userId int 
AS 
BEGIN
	SELECT userId, checkInTime, checkInDate, checkOutTime, checkOutDate, location from  dbo.userAttendances INNER JOIN dbo.users ON dbo.userAttendances.userId = dbo.users.id
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprofile]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserprofile]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, permanentAddress,city, state, country, emergencyPhone, hrmid, name, email, password, phone, image, role, reportingManager, allocation, joiningDate from  dbo.users LEFT JOIN dbo.userProfiles ON dbo.users.id = dbo.userProfiles.userId
	where dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprojects]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spusers_getuserprojects]
	@userId int 
AS 
BEGIN
	SELECT userId, projectId, projectName, assignedOn, completeBy, teamMembers, teamHead, department, status from  dbo.userProjects INNER JOIN dbo.users ON dbo.userProjects.userId = dbo.users.id
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserrequests]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserrequests]
	@userId int 
AS 
BEGIN
	SELECT userId, startDate, endDate, request, status from  dbo.userRequests INNER JOIN dbo.users ON dbo.userRequests.userId = dbo.users.id
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserskills]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserskills]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, primarySkills, secondarySkills, certifications, hrmid, name, email, password, phone, image, role, reportingManager, allocation, joiningDate from  dbo.users LEFT JOIN dbo.userSkills ON dbo.userSkills.userId = dbo.users.id
	where dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusertimesheets]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusertimesheets]
	@userId int 
AS 
BEGIN
	SELECT userId, clientName, projectName, jobName, workItem, date, description, startTime, endTime, billableStatus from  dbo.userTimesheets INNER JOIN dbo.users ON dbo.userTimesheets.userId = dbo.users.id
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postcheckin]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postcheckin]
	@userId int, @checkInTime time(7), @checkInDate date, @location nvarchar(255)
AS 
BEGIN
	INSERT INTO dbo.userAttendances (userId, checkInTime, checkInDate, location)
	values (@userId, @checkInTime, @checkInDate, @location)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postsignup]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postsignup]
	@hrmid nvarchar(255), @name nvarchar(255), @email nvarchar(255),@password nvarchar(255), @phone nvarchar(255), @image nvarchar(255), @role nvarchar(255),  @reportingManager nvarchar(255), @allocation nvarchar(255), @joiningDate nvarchar(255)
AS 
BEGIN
	INSERT INTO dbo.users (hrmid,name, email, password, phone, image, role, reportingManager, allocation, joiningDate)
	values (@hrmid,@name,@email,@password, @phone, @image, @role, @reportingManager, @allocation, @joiningDate)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserprofile]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserprofile]
	@userId int, @permanentAddress nvarchar(255), @city nvarchar(255), @state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId from dbo.userProfiles WHERE userId = @userId)
	INSERT INTO dbo.userProfiles (userId, permanentAddress , city, state, country, emergencyPhone)
	values (@userId, @permanentAddress ,  @city ,  @state,@country,  @emergencyPhone)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserproject]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserproject]
	@userId int, @projectId nvarchar(255), @projectName nvarchar(255), @assignedOn date, @completeBy date, @teamMembers nvarchar(255), @teamHead nvarchar(255), @department nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId, projectId from dbo.userProjects WHERE userId = @userId AND projectId = @projectId)
	INSERT INTO dbo.userProjects(userId, projectId, projectName, assignedOn, completeBy, teamMembers, teamHead, department)
	values (@userId, @projectId, @projectName, @assignedOn, @completeBy, @teamMembers, @teamHead, @department)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserrequest]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserrequest]
	@userId int, @startDate date, @endDate date,@request nvarchar(255)
AS 
BEGIN
	INSERT INTO dbo.userRequests(userId,startDate, endDate, request)
	values (@userId,@startDate,@endDate,@request )
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserskills]    Script Date: 3/30/2023 9:23:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spusers_postusertimesheet]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postusertimesheet]
	@userId int, @clientName nvarchar(255), @projectName nvarchar(255), @jobName nvarchar(255), @workItem nvarchar(255), @date date, @description nvarchar(255), @startTime time(7), @endTime time(7), @billableStatus nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId, date from dbo.userTimesheets WHERE userId = @userId AND date = @date)
	INSERT INTO dbo.userTimesheets(userId, clientName, projectName, jobName, workItem, date,description, startTime,endTime, billableStatus )
	values (@userId,@clientName,@projectName, @jobName, @workItem, @date, @description, @startTime, @endTime,@billableStatus )
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserattendance]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserattendance]
	@userId int ,@checkOutDate date,@checkOutTime time(7)
AS 
BEGIN
	UPDATE dbo.userAttendances
	SET checkOutDate=@checkOutDate, checkOutTime=@checkOutTime
	where userId = @userId AND checkInDate= @checkOutDate
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserprofile]    Script Date: 3/30/2023 9:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserprofile]
	@userId int ,@permanentAddress nvarchar(255),@city nvarchar(255) ,@state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	UPDATE dbo.userProfiles
	SET permanentAddress=@permanentAddress, city=@city, state=@state, country = @country,  emergencyPhone=@emergencyPhone
	where userProfiles.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserskills]    Script Date: 3/30/2023 9:23:54 PM ******/
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
