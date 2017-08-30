USE [nbms]
GO
/****** Object:  Table [dbo].[Tab_nbms_devattr]    Script Date: 08/30/2017 17:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_nbms_devattr](
	[sn] [int] IDENTITY(1,1) NOT NULL,
	[nDevType] [int] NOT NULL,
	[nSubtype] [int] NOT NULL,
	[sDevID] [nvarchar](50) NULL,
	[nLocaMode] [int] NULL,
	[sDevName] [nvarchar](50) NULL,
	[x_pos] [float] NULL,
	[y_pos] [float] NULL,
	[fHop] [float] NULL,
	[fBatteryVolt] [float] NULL,
	[nRSOC] [float] NULL,
	[nAlarm] [int] NULL,
	[nState] [int] NULL,
	[SamplingTime] [datetime] NULL,
	[sIPAddr] [nvarchar](50) NULL,
	[nPort] [int] NULL,
	[sRemark] [nvarchar](50) NULL,
	[Spare1] [nvarchar](50) NULL,
	[Spare2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tab_pems_devattr] PRIMARY KEY CLUSTERED 
(
	[sn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
