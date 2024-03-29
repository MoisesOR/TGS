USE [master]
GO
/****** Object:  Database [TGS]    Script Date: 28/05/2019 17:33:08 ******/
CREATE DATABASE [TGS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TGS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TGS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TGS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TGS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TGS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TGS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TGS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TGS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TGS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TGS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TGS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TGS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TGS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TGS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TGS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TGS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TGS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TGS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TGS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TGS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TGS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TGS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TGS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TGS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TGS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TGS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TGS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TGS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TGS] SET RECOVERY FULL 
GO
ALTER DATABASE [TGS] SET  MULTI_USER 
GO
ALTER DATABASE [TGS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TGS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TGS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TGS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TGS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TGS', N'ON'
GO
ALTER DATABASE [TGS] SET QUERY_STORE = OFF
GO
USE [TGS]
GO
/****** Object:  Table [dbo].[AlbumList]    Script Date: 28/05/2019 17:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumList](
	[Year] [int] NOT NULL,
	[Album] [nvarchar](100) NOT NULL,
	[Artist] [nvarchar](100) NOT NULL,
	[Genre] [nvarchar](100) NOT NULL,
	[Subgenre] [nvarchar](150) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenreList]    Script Date: 28/05/2019 17:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GenreList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupList]    Script Date: 28/05/2019 17:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Group] [nvarchar](50) NOT NULL,
	[StartYear] [int] NOT NULL,
	[EndYear] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[UrlWiki] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_GroupList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserList]    Script Date: 28/05/2019 17:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_UserList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlbumList] ON 

INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Sgt. Pepper''s Lonely Hearts Club Band', N'The Beatles', N'Rock', N'Rock & Roll, Psychedelic Rock', 1)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Pet Sounds', N'The Beach Boys', N'Rock', N'Pop Rock, Psychedelic Rock', 2)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Revolver', N'The Beatles', N'Rock', N'Psychedelic Rock, Pop Rock', 3)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Highway 61 Revisited', N'Bob Dylan', N'Rock', N'Folk Rock, Blues Rock', 4)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Rubber Soul', N'The Beatles', N'Rock, Pop', N'Pop Rock', 5)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'What''s Going On', N'Marvin Gaye', N'Funk / Soul', N'Soul', 6)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Exile on Main St.', N'The Rolling Stones', N'Rock', N'Blues Rock, Rock & Roll, Classic Rock', 7)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'London Calling', N'The Clash', N'Rock', N'Punk, New Wave', 8)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Blonde on Blonde', N'Bob Dylan', N'Rock, Blues', N'Folk Rock, Rhythm & Blues', 9)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'The Beatles (""The White Album"")', N'The Beatles', N'Rock', N'Rock & Roll, Pop Rock, Psychedelic Rock, Experimental', 10)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'The Sun Sessions', N'Elvis Presley', N'Rock', N'Rock & Roll', 11)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1959, N'Kind of Blue', N'Miles Davis', N'Jazz', N'Modal', 12)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'The Velvet Underground & Nico', N'The Velvet Underground', N'Rock', N'Garage Rock, Art Rock, Experimental', 13)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Abbey Road', N'The Beatles', N'Rock', N'Psychedelic Rock, Classic Rock, Pop Rock', 14)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Are You Experienced', N'The Jimi Hendrix Experience', N'Rock, Blues', N'Blues Rock, Psychedelic Rock', 15)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Blood on the Tracks', N'Bob Dylan', N'Rock', N'Folk Rock, Acoustic, Ballad', 16)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Nevermind', N'Nirvana', N'Rock', N'Alternative Rock, Grunge', 17)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Born to Run', N'Bruce Springsteen', N'Rock', N'Pop Rock', 18)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Astral Weeks', N'Van Morrison', N'Jazz, Rock, Blues, Folk, World, & Country', N'Acoustic, Classic Rock, Free Improvisation', 19)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'Thriller', N'Michael Jackson', N'Funk / Soul, Pop', N'Disco', 20)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'The Great Twenty_Eight', N'Chuck Berry', N'Rock', N'Rock & Roll', 21)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1990, N'The Complete Recordings', N'Robert Johnson', N'Blues', N'Delta Blues', 22)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'John Lennon/Plastic Ono Band', N'John Lennon / Plastic Ono Band', N'Rock', N'Pop Rock', 23)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Innervisions', N'Stevie Wonder', N'Funk / Soul', N'Soul', 24)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1963, N'Live at the Apollo, 1962', N'James Brown', N'Funk / Soul', N'Rhythm & Blues, Soul', 25)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Rumours', N'Fleetwood Mac', N'Rock', N'Pop Rock', 26)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'The Joshua Tree', N'U2', N'Rock', N'Alternative Rock, Pop Rock', 27)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Who''s Next', N'The Who', N'Rock', N'Hard Rock, Mod, Prog Rock, Psychedelic Rock', 28)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Led Zeppelin', N'Led Zeppelin', N'Rock', N'Blues Rock, Hard Rock', 29)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Blue', N'Joni Mitchell', N'Pop', N'Acoustic, Ballad, Folk', 30)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Bringing It All Back Home', N'Bob Dylan', N'Rock, Folk, World, & Country', N'Folk Rock, Folk', 31)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Let It Bleed', N'The Rolling Stones', N'Rock', N'Blues Rock, Hard Rock', 32)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Ramones', N'Ramones', N'Rock', N'Rock & Roll, Punk', 33)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Music From Big Pink', N'The Band', N'Rock', N'Folk Rock, Acoustic, Blues Rock', 34)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'The Rise and Fall of Ziggy Stardust and the Spiders From Mars', N'David Bowie', N'Rock', N'Classic Rock, Glam', 35)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Tapestry', N'Carole King', N'Rock, Pop', N'Folk Rock, Soft Rock', 36)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Hotel California', N'Eagles', N'Rock', N'Classic Rock', 37)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'The Anthology', N'Muddy Waters', N'Folk, World, & Country', N'Folk', 38)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1963, N'Please Please Me', N'The Beatles', N'Rock', N'Beat, Rock & Roll', 39)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Forever Changes', N'Love', N'Rock', N'Folk Rock, Psychedelic Rock', 40)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Never Mind the Bollocks Here''s the Sex Pistols', N'Sex Pistols', N'Rock', N'Punk', 41)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'The Doors', N'The Doors', N'Rock', N'Psychedelic Rock', 42)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'The Dark Side of the Moon', N'Pink Floyd', N'Rock', N'Prog Rock', 43)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Horses', N'Patti Smith', N'Rock', N'Art Rock', 44)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'The Band (""The Brown Album"")', N'The Band', N'Classical, Stage & Screen', N'Soundtrack, Modern Classical, Contemporary, Score', 45)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Legend: The Best of Bob Marley and The Wailers', N'Bob Marley & The Wailers', N'Reggae', N'Reggae, Roots Reggae', 46)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'A Love Supreme', N'John Coltrane', N'Jazz', N'Free Jazz, Hard Bop, Modal', 47)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'It Takes a Nation of Millions to Hold Us Back', N'Public Enemy', N'Hip Hop', N'Conscious', 48)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'At Fillmore East', N'The Allman Brothers Band', N'Rock, Blues', N'Blues Rock', 49)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1957, N'Here''s Little Richard', N'Little Richard', N'Rock, Blues', N'Rock & Roll, Rhythm & Blues', 50)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Bridge Over Troubled Water', N'Simon & Garfunkel', N'Rock', N'Folk Rock, Classic Rock', 51)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Greatest Hits', N'Al Green', N'Funk / Soul', N'Soul', 52)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1964, N'Meet The Beatles!', N'The Beatles', N'Rock', N'Beat, Rock & Roll', 53)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'The Birth of Soul', N'Ray Charles', N'Jazz, Funk / Soul', N'Rhythm & Blues, Big Band, Soul, Soul-Jazz', 54)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Electric Ladyland', N'The Jimi Hendrix Experience', N'Rock, Blues', N'Electric Blues, Psychedelic Rock', 55)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1956, N'Elvis Presley', N'Elvis Presley', N'Rock', N'Rock & Roll, Rockabilly', 56)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Songs in the Key of Life', N'Stevie Wonder', N'Funk / Soul', N'Soul, Disco', 57)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Beggars Banquet', N'The Rolling Stones', N'Rock, Funk / Soul, Pop', N'Blues Rock, Southern Rock, Classic Rock', 58)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Chronicle: The 20 Greatest Hits', N'Creedence Clearwater Revival', N'Rock', N'None', 59)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Trout Mask Replica', N'Captain Beefheart & His Magic Band', N'Rock, Blues', N'Dialogue, Field Recording, Avantgarde, Electric Blues, Psychedelic Rock, Experimental', 60)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Greatest Hits', N'Sly & The Family Stone', N'Funk / Soul', N'Rhythm & Blues, Funk', 61)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Appetite for Destruction', N'Guns N'' Roses', N'Rock', N'Hard Rock, Heavy Metal', 62)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Achtung Baby', N'U2', N'Electronic, Rock', N'Pop Rock, Synth-pop, Alternative Rock, Arena Rock', 63)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Sticky Fingers', N'The Rolling Stones', N'Rock', N'Classic Rock', 64)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Back to Mono (1958-1969)', N'Phil Spector', N'Rock, Funk / Soul, Pop', N'Doo Wop, Pop Rock, Ballad, Rhythm & Blues', 65)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Moondance', N'Van Morrison', N'Jazz, Rock, Funk / Soul, Folk, World, & Country', N'Folk Rock, Rhythm & Blues, Classic Rock, Contemporary Jazz', 66)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'Kid A', N'Radiohead', N'Electronic, Rock', N'Alternative Rock, IDM, Experimental', 67)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Off the Wall', N'Michael Jackson', N'Funk / Soul, Pop', N'Disco, Soul, Ballad', 68)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'[Led Zeppelin IV]', N'Led Zeppelin', N'Rock', N'Hard Rock, Classic Rock, Blues Rock', 69)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'The Stranger', N'Billy Joel', N'Rock', N'Pop Rock', 70)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Graceland', N'Paul Simon', N'Jazz, Rock, Funk / Soul, Pop, Folk, World, & Country', N'Folk Rock, Pop Rock, African, Afrobeat, Zydeco, Funk, Rhythm & Blues', 71)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Superfly', N'Curtis Mayfield', N'Funk / Soul, Stage & Screen', N'Soundtrack, Soul', 72)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Physical Graffiti', N'Led Zeppelin', N'Rock', N'Classic Rock', 73)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'After the Gold Rush', N'Neil Young', N'Rock', N'Rock & Roll, Country Rock', 74)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Star Time', N'James Brown', N'Funk / Soul', N'Soul, Funk, Disco', 75)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Purple Rain', N'Prince and the Revolution', N'Electronic, Rock, Funk / Soul, Stage & Screen', N'Pop Rock, Funk, Soundtrack, Synth-pop', 76)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Back in Black', N'AC/DC', N'Rock', N'Hard Rock', 77)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Otis Blue: Otis Redding Sings Soul', N'Otis Redding', N'Funk / Soul', N'Soul', 78)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Led Zeppelin II', N'Led Zeppelin', N'Rock', N'Blues Rock, Classic Rock, Hard Rock', 79)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Imagine', N'John Lennon', N'Rock', N'Pop Rock', 80)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'The Clash', N'The Clash', N'Rock', N'Punk', 81)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Harvest', N'Neil Young', N'Rock', N'Folk Rock, Country Rock, Classic Rock', 82)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Axis: Bold as Love', N'The Jimi Hendrix Experience', N'Rock', N'Psychedelic Rock, Electric Blues', 83)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'I Never Loved a Man the Way I Love You', N'Aretha Franklin', N'Funk / Soul', N'Soul', 84)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Lady Soul', N'Aretha Franklin', N'Funk / Soul', N'Soul', 85)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Born in the U.S.A.', N'Bruce Springsteen', N'Rock', N'Pop Rock', 86)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'The Wall', N'Pink Floyd', N'Rock', N'Alternative Rock, Prog Rock', 87)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'At Folsom Prison', N'Johnny Cash', N'Folk, World, & Country', N'Country', 88)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Dusty in Memphis', N'Dusty Springfield', N'Rock, Funk / Soul', N'Pop Rock, Soul', 89)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Talking Book', N'Stevie Wonder', N'Funk / Soul', N'Soul, Funk', 90)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Goodbye Yellow Brick Road', N'Elton John', N'Rock', N'Pop Rock, Classic Rock', 91)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'20 Golden Greats', N'Buddy Holly', N'Rock', N'Rock & Roll', 92)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Sign ""Peace"" the Times', N'Prince', N'Rock, Reggae', N'Ska, Reggae-Pop', 93)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'40 Greatest Hits', N'Hank Williams', N'Folk, World, & Country', N'Country', 94)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Bitches Brew', N'Miles Davis', N'Jazz', N'Fusion', 95)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Tommy', N'The Who', N'Rock', N'Psychedelic Rock', 96)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1963, N'The Freewheelin'' Bob Dylan', N'Bob Dylan', N'Folk, World, & Country', N'Folk', 97)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'This Year''s Model', N'Elvis Costello', N'Rock', N'New Wave', 98)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'There''s a Riot Goin'' On', N'Sly & The Family Stone', N'Funk / Soul', N'Rhythm & Blues, Funk', 99)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Odessey and Oracle', N'The Zombies', N'Rock', N'Psychedelic Rock', 100)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1955, N'In the Wee Small Hours', N'Frank Sinatra', N'Jazz, Pop', N'Big Band, Ballad', 101)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Fresh Cream', N'Cream', N'Rock, Blues', N'Blues Rock, Electric Blues', 102)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1959, N'Giant Steps', N'John Coltrane', N'Jazz', N'Hard Bop', 103)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Sweet Baby James', N'James Taylor', N'Rock', N'Folk Rock, Acoustic, Soft Rock', 104)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1962, N'Modern Sounds in Country and Western Music', N'Ray Charles', N'Funk / Soul, Folk, World, & Country', N'Country, Rhythm & Blues', 105)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Rocket to Russia', N'Ramones', N'Rock', N'Rock & Roll, Punk', 106)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2003, N'Portrait of a Legend 1951-1964', N'Sam Cooke', N'Latin, Funk / Soul', N'Soul, Rhythm & Blues, Gospel, Cha-Cha', 107)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Hunky Dory', N'David Bowie', N'Rock', N'Classic Rock, Glam', 108)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Aftermath', N'The Rolling Stones', N'Rock', N'Blues Rock, Pop Rock', 109)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Loaded', N'The Velvet Underground', N'Rock', N'Art Rock, Classic Rock', 110)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1995, N'The Bends', N'Radiohead', N'Rock', N'Alternative Rock', 111)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'If You Can Believe Your Eyes and Ears', N'The Mamas and the Papas', N'Rock', N'Folk Rock, Pop Rock', 112)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Court and Spark', N'Joni Mitchell', N'Rock', N'Soft Rock, Pop Rock', 113)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Disraeli Gears', N'Cream', N'Rock', N'Psychedelic Rock, Blues Rock', 114)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'The Who Sell Out', N'The Who', N'Rock', N'Psychedelic Rock, Mod', 115)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Out of Our Heads', N'The Rolling Stones', N'Rock', N'Blues Rock, Rock & Roll', 116)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Layla and Other Assorted Love Songs', N'Derek and the Dominos', N'Rock', N'Blues Rock', 117)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2005, N'Late Registration', N'Kanye West', N'Hip Hop', N'None', 118)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1960, N'At Last!', N'Etta James', N'Funk / Soul, Blues', N'Rhythm & Blues, Soul', 119)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Sweetheart of the Rodeo', N'The Byrds', N'Rock', N'Folk Rock, Country Rock', 120)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Stand!', N'Sly & The Family Stone', N'Funk / Soul', N'Funk, Psychedelic, Disco', 121)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'The Harder They Come', N'Various Artists', N'Reggae,ÊPop,ÊFolk, World, & Country,ÊStage & Screen', N'Reggae,ÊRoots Reggae,ÊRocksteady,ÊContemporary,ÊSoundtrack', 122)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Raising Hell', N'Run D.M.C.', N'Hip Hop', N'None', 123)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Moby Grape', N'Moby Grape', N'Rock', N'Folk Rock, Psychedelic Rock', 124)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Pearl', N'Janis Joplin', N'Rock, Blues', N'Blues Rock', 125)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Catch a Fire', N'The Wailers', N'Reggae', N'Roots Reggae', 126)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Younger Than Yesterday', N'The Byrds', N'Rock', N'Folk Rock, Psychedelic Rock', 127)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Raw Power', N'Iggy and The Stooges', N'Rock', N'Garage Rock, Hard Rock, Punk', 128)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Remain in Light', N'Talking Heads', N'Electronic, Rock', N'New Wave, Art Rock, Funk', 129)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Marquee Moon', N'Television', N'Rock', N'New Wave, Punk', 130)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Paranoid', N'Black Sabbath', N'Rock', N'Hard Rock, Heavy Metal', 131)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Saturday Night Fever: The Original Movie Sound Track', N'Various Artists', N'Electronic,ÊStage & Screen', N'Soundtrack,ÊDisco', 132)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'The Wild, the Innocent & the E Street Shuffle', N'Bruce Springsteen', N'Rock', N'None', 133)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Ready to Die', N'The Notorious B.I.G.', N'Hip Hop', N'Thug Rap', 134)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'Slanted and Enchanted', N'Pavement', N'Rock', N'Alternative Rock', 135)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Greatest Hits', N'Elton John', N'Rock', N'Classic Rock', 136)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Tim', N'The Replacements', N'Rock', N'Indie Rock', 137)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'The Chronic', N'Dr. Dre', N'Hip Hop', N'Gangsta', 138)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Rejuvenation', N'The Meters', N'Funk / Soul', N'Bayou Funk, Soul', 139)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Parallel Lines', N'Blondie', N'Electronic, Rock', N'New Wave, Pop Rock, Punk, Disco', 140)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Live at the Regal', N'B.B. King', N'Blues', N'Chicago Blues', 141)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1963, N'A Christmas Gift for You From Phil Spector', N'Phil Spector', N'Rock, Funk / Soul, Pop', N'Pop Rock', 142)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Gris-Gris', N'Dr. John, the Night Tripper', N'Jazz, Rock, Funk / Soul, Blues', N'Soul-Jazz, Louisiana Blues, Fusion, Bayou Funk', 143)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'Straight Outta Compton', N'N.W.A', N'Hip Hop', N'Gangsta', 144)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Aja', N'Steely Dan', N'Jazz, Rock', N'Jazz-Rock, Classic Rock', 145)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Surrealistic Pillow', N'Jefferson Airplane', N'Rock', N'Folk Rock, Psychedelic Rock', 146)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Deja vu', N'Crosby, Stills, Nash & Young', N'Rock', N'Classic Rock', 147)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Houses of the Holy', N'Led Zeppelin', N'Rock', N'Classic Rock', 148)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Santana', N'Santana', N'Rock, Latin, Funk / Soul', N'Afro-Cuban, Psychedelic Rock', 149)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Darkness on the Edge of Town', N'Bruce Springsteen', N'Rock', N'Pop Rock', 150)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2004, N'Funeral', N'Arcade Fire', N'Rock', N'Indie Rock', 151)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'The B 52''s / Play Loud', N'The B 52''s', N'Electronic, Rock, Pop', N'New Wave, Punk, Mod', 152)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'The Low End Theory', N'A Tribe Called Quest', N'Hip Hop', N'Conscious', 153)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1958, N'Moanin'' in the Moonlight', N'Howlin'' Wolf', N'Blues', N'Chicago Blues', 154)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Pretenders', N'Pretenders', N'Rock', N'Alternative Rock, New Wave', 155)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Paul''s Boutique', N'Beastie Boys', N'Hip Hop, Rock, Funk / Soul', N'Alternative Rock, Pop Rap, Psychedelic', 156)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Closer', N'Joy Division', N'Rock', N'Post-Punk, New Wave', 157)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Captain Fantastic and the Brown Dirt Cowboy', N'Elton John', N'Rock', N'Pop Rock, Classic Rock', 158)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Alive!', N'KISS', N'Rock', N'Hard Rock, Glam', 159)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Electric Warrior', N'T. Rex', N'Rock', N'Glam, Classic Rock', 160)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'The Dock of the Bay', N'Otis Redding', N'Funk / Soul', N'Rhythm & Blues, Soul', 161)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'OK Computer', N'Radiohead', N'Electronic, Rock', N'Alternative Rock', 162)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'1999', N'Prince', N'Funk / Soul, Pop', N'None', 163)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'The Very Best of Linda Ronstadt', N'Linda Ronstadt', N'Rock, Pop', N'Soft Rock, Pop Rock', 164)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Let''s Get It On', N'Marvin Gaye', N'Funk / Soul', N'Soul', 165)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'Imperial Bedroom', N'Elvis Costello & The Attractions', N'Rock', N'Alternative Rock, New Wave', 166)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Master of Puppets', N'Metallica', N'Rock', N'Thrash, Speed Metal', 167)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'My Aim Is True', N'Elvis Costello', N'Rock', N'New Wave, Pop Rock', 168)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Exodus', N'Bob Marley & The Wailers', N'Reggae', N'Reggae, Roots Reggae', 169)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Live at Leeds', N'The Who', N'Rock', N'Classic Rock, Blues Rock, Hard Rock', 170)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'The Notorious Byrd Brothers', N'The Byrds', N'Rock', N'Psychedelic Rock, Folk Rock, Country Rock, Pop Rock', 171)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Every Picture Tells a Story', N'Rod Stewart', N'Rock', N'Pop Rock', 172)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Something/Anything?', N'Todd Rundgren', N'Rock', N'Power Pop, Pop Rock, Prog Rock', 173)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Desire', N'Bob Dylan', N'Rock', N'Folk Rock', 174)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Close to You', N'Carpenters', N'Rock, Pop', N'Pop Rock, Vocal', 175)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Rocks', N'Aerosmith', N'Rock', N'Hard Rock, Classic Rock', 176)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'One Nation Under a Groove', N'Funkadelic', N'Funk / Soul', N'P.Funk', 177)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'The Anthology: 1961-1977', N'Curtis Mayfield and The Impressions', N'Funk / Soul', N'Rhythm & Blues, Soul, Funk', 178)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'The Definitive Collection', N'ABBA', N'Electronic, Pop', N'Europop, Synth-pop, Disco', 179)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'The Rolling Stones, Now!', N'The Rolling Stones', N'Rock, Blues, Pop', N'Pop Rock, Rhythm & Blues, Rock & Roll', 180)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Natty Dread', N'Bob Marley & The Wailers', N'Reggae', N'Reggae, Roots Reggae', 181)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Fleetwood Mac', N'Fleetwood Mac', N'Rock, Pop', N'Folk Rock, Pop Rock', 182)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Red Headed Stranger', N'Willie Nelson', N'Folk, World, & Country', N'Country', 183)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1990, N'The Immaculate Collection', N'Madonna', N'Electronic, Pop', N'Synth-pop', 184)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'The Stooges', N'The Stooges', N'Rock', N'Garage Rock, Punk', 185)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Fresh', N'Sly & The Family Stone', N'Funk / Soul', N'Rhythm & Blues, Funk', 186)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'So', N'Peter Gabriel', N'Electronic, Rock, Funk / Soul, Pop', N'Art Rock, Pop Rock, Synth-pop, Funk', 187)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Buffalo Springfield Again', N'Buffalo Springfield', N'Rock, Pop', N'Country Rock', 188)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Happy Trails', N'Quicksilver Messenger Service', N'Rock', N'Acid Rock, Psychedelic Rock', 189)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'From Elvis in Memphis', N'Elvis Presley', N'Rock, Funk / Soul, Folk, World, & Country', N'Country, Soul', 190)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Fun House', N'The Stooges', N'Rock', N'Garage Rock, Punk', 191)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'The Gilded Palace of Sin', N'The Flying Burrito Brothers', N'Rock, Folk, World, & Country', N'Country Rock', 192)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Dookie', N'Green Day', N'Rock', N'Alternative Rock, Pop Punk, Punk', 193)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Transformer', N'Lou Reed', N'Rock', N'Glam', 194)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Blues Breakers With Eric Clapton (""The Beano Album"")', N'John Mayall & The Bluesbreakers', N'Rock,ÊBlues', N'Blues Rock,ÊElectric Blues,ÊHarmonica Blues', 195)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1998, N'Nuggets: Original Artyfacts From the First Psychedelic Era, 1965-1968', N'Various Artists', N'Rock', N'Garage Rock,ÊPsychedelic Rock', 196)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1983, N'Murmur', N'R.E.M.', N'Rock', N'Alternative Rock', 197)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'The Best of Little Walter', N'Little Walter', N'Blues', N'Chicago Blues', 198)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'Is This It', N'The Strokes', N'Rock', N'Indie Rock', 199)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Highway to Hell', N'AC/DC', N'Rock', N'Hard Rock', 200)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'The Downward Spiral', N'Nine Inch Nails', N'Electronic, Rock', N'Industrial', 201)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Parsley, Sage, Rosemary and Thyme', N'Simon & Garfunkel', N'Rock, Pop, Folk, World, & Country', N'Folk Rock, Pop Rock', 202)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Bad', N'Michael Jackson', N'Funk / Soul, Pop', N'Pop Rock, Ballad, Funk, Soul', 203)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2006, N'Modern Times', N'Bob Dylan', N'Rock', N'Blues Rock, Folk Rock', 204)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Wheels of Fire', N'Cream', N'Rock, Blues', N'Blues Rock, Psychedelic Rock, Classic Rock', 205)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Dirty Mind', N'Prince', N'Funk / Soul', N'None', 206)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Abraxas', N'Santana', N'Rock, Latin', N'Fusion, Hard Rock, Psychedelic Rock', 207)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Tea for the Tillerman', N'Cat Stevens', N'Rock, Stage & Screen', N'Folk Rock, Pop Rock', 208)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Ten', N'Pearl Jam', N'Rock', N'Grunge', 209)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Everybody Knows This Is Nowhere', N'Neil Young & Crazy Horse', N'Rock', N'Folk Rock, Country Rock, Classic Rock', 210)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Wish You Were Here', N'Pink Floyd', N'Rock', N'Classic Rock, Prog Rock', 211)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Crooked Rain Crooked Rain', N'Pavement', N'Rock', N'Alternative Rock, Indie Rock', 212)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Tattoo You', N'The Rolling Stones', N'Rock', N'Classic Rock', 213)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Proud Mary: The Best of Ike and Tina Turner', N'Ike & Tina Turner', N'Funk / Soul', N'Rhythm & Blues, Bayou Funk, Soul', 214)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'New York Dolls', N'New York Dolls', N'Rock', N'Glam', 215)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Bo Diddley / Go Bo Diddley', N'Bo Diddley', N'Rock, Blues', N'Rhythm & Blues, Rock & Roll', 216)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1961, N'Two Steps From the Blues', N'Bobby ""Blue"" Bland', N'Funk / Soul, Blues', N'Rhythm & Blues, Soul', 217)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'The Queen Is Dead', N'The Smiths', N'Rock, Pop', N'Indie Rock', 218)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Licensed to Ill', N'Beastie Boys', N'Hip Hop', N'None', 219)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Look-Ka Py Py', N'The Meters', N'Funk / Soul', N'Bayou Funk, Soul, Funk', 220)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Loveless', N'My Bloody Valentine', N'Rock', N'Alternative Rock, Shoegaze', 221)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'New Orleans Piano', N'Professor Longhair', N'Funk / Soul, Blues', N'Piano Blues', 222)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1983, N'War', N'U2', N'Rock', N'Pop Rock', 223)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'The Neil Diamond Collection', N'Neil Diamond', N'Rock, Pop', N'Soft Rock, Ballad', 224)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2004, N'American Idiot', N'Green Day', N'Rock', N'Pop Rock, Punk', 225)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'Nebraska', N'Bruce Springsteen', N'Rock', N'Acoustic', 226)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Doolittle', N'Pixies', N'Rock', N'Indie Rock', 227)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Paid in Full', N'Eric B. & Rakim', N'Hip Hop', N'None', 228)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Toys in the Attic', N'Aerosmith', N'Rock', N'Hard Rock, Blues Rock', 229)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Nick of Time', N'Bonnie Raitt', N'Rock, Pop', N'Blues Rock, Pop Rock', 230)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'A Night at the Opera', N'Queen', N'Rock', N'Hard Rock, Pop Rock, Prog Rock', 231)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'The Kink Kronikles', N'The Kinks', N'Rock', N'Rock & Roll, Pop Rock', 232)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Mr. Tambourine Man', N'The Byrds', N'Rock', N'Folk Rock, Garage Rock, Pop Rock', 233)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Bookends', N'Simon & Garfunkel', N'Rock', N'Folk Rock, Classic Rock', 234)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'The Ultimate Collection', N'Patsy Cline', N'Folk, World, & Country', N'None', 235)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'Mr. Excitement!', N'Jackie Wilson', N'Funk / Soul', N'None', 236)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'My Generation', N'The Who', N'Rock', N'Mod', 237)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1962, N'Howlin'' Wolf', N'Howlin'' Wolf', N'Blues', N'None', 238)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Like a Prayer', N'Madonna', N'Electronic, Pop', N'Synth-pop', 239)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Can''t Buy a Thrill', N'Steely Dan', N'Rock', N'Classic Rock', 240)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Let It Be', N'The Replacements', N'Rock', N'Alternative Rock, Power Pop, Punk, Indie Rock', 241)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Run D.M.C.', N'Run D.M.C.', N'Hip Hop', N'None', 242)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Black Sabbath', N'Black Sabbath', N'Rock', N'Blues Rock, Heavy Metal', 243)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'The Marshall Mathers LP', N'Eminem', N'Hip Hop', N'Pop Rap, Hardcore Hip-Hop, Horrorcore', 244)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'All Killer No Filler! The Jerry Lee Lewis Anthology', N'Jerry Lee Lewis', N'Rock, Blues, Folk, World, & Country', N'Country Blues, Rock & Roll, Rhythm & Blues', 245)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Freak Out!', N'The Mothers of Invention', N'Electronic, Rock', N'Musique Concr?te, Avantgarde, Symphonic Rock, Rhythm & Blues, Psychedelic Rock, Experimental, Parody', 246)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Live/Dead', N'The Grateful Dead', N'Rock', N'Folk Rock, Country Rock, Psychedelic Rock, Experimental', 247)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1959, N'The Shape of Jazz to Come', N'Ornette Coleman', N'Jazz', N'Free Jazz', 248)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'Automatic for the People', N'R.E.M.', N'Rock', N'Alternative Rock', 249)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1996, N'Reasonable Doubt', N'Jay Z', N'Hip Hop', N'None', 250)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Low', N'David Bowie', N'Electronic, Rock', N'Art Rock, Ambient, Experimental', 251)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'The Blueprint', N'Jay Z', N'Hip Hop', N'None', 252)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'The River', N'Bruce Springsteen', N'Rock', N'Folk Rock, Pop Rock, Classic Rock', 253)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Complete & Unbelievable: The Otis Redding Dictionary of Soul', N'Otis Redding', N'Funk / Soul', N'Soul', 254)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Metallica (""The Black Album"")', N'Metallica', N'Rock', N'Heavy Metal', 255)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Trans Europa Express', N'Kraftwerk', N'Electronic', N'Electro', 256)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Whitney Houston', N'Whitney Houston', N'Funk / Soul, Pop', N'Synth-pop, Rhythm & Blues', 257)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'The Kinks Are The Village Green Preservation Society', N'The Kinks', N'Rock', N'Psychedelic Rock, Pop Rock', 258)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'The Velvet Rope', N'Janet', N'Electronic, Funk / Soul, Pop', N'RnB/Swing, Downtempo', 259)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Stardust', N'Willie Nelson', N'Pop, Folk, World, & Country', N'Vocal', 260)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'American Beauty', N'Grateful Dead', N'Rock', N'Folk Rock', 261)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Crosby, Stills & Nash', N'Crosby, Stills & Nash', N'Rock, Folk, World, & Country', N'Folk Rock, Classic Rock', 262)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'Tracy Chapman', N'Tracy Chapman', N'Rock', N'None', 263)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Workingman''s Dead', N'Grateful Dead', N'Rock', N'Folk Rock, Country Rock, Classic Rock', 264)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1959, N'The Genius of Ray Charles', N'Ray Charles', N'Jazz, Pop', N'Soul-Jazz, Big Band', 265)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Child Is Father to the Man', N'Blood, Sweat & Tears', N'Rock', N'Blues Rock, Jazz-Rock, Classic Rock', 266)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Quadrophenia', N'The Who', N'Rock', N'Hard Rock, Classic Rock, Mod', 267)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Paul Simon', N'Paul Simon', N'Rock', N'Folk Rock, Pop Rock', 268)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Psychocandy', N'The Jesus and Mary Chain', N'Rock', N'Noise', 269)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Some Girls', N'The Rolling Stones', N'Rock', N'Blues Rock, Rock & Roll, Classic Rock, Disco', 270)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'The Beach Boys Today!', N'The Beach Boys', N'Rock', N'Pop Rock, Psychedelic Rock', 271)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'Dig Me Out', N'Sleater Kinney', N'Rock', N'Indie Rock', 272)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Going to a Go-Go', N'Smokey Robinson & The Miracles', N'Funk / Soul', N'Soul', 273)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Nightbirds', N'LaBelle', N'Funk / Soul', N'Funk, Disco', 274)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'The Slim Shady LP', N'Eminem', N'Hip Hop', N'None', 275)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Mothership Connection', N'Parliament', N'Funk / Soul', N'P.Funk, Funk', 276)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Rhythm Nation 1814', N'Janet Jackson', N'Electronic, Hip Hop, Pop', N'RnB/Swing, Downtempo, Synth-pop', 277)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'Anthology of American Folk Music', N'Various', N'Blues, Folk, World, & Country', N'Cajun, Country, Field Recording, Gospel, Delta Blues, Folk', 278)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Aladdin Sane', N'David Bowie', N'Rock', N'Glam', 279)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'All That You Can''t Leave Behind', N'U2', N'Rock', N'Pop Rock', 280)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'My Life', N'Mary J. Blige', N'Hip Hop', N'RnB/Swing', 281)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1964, N'Folk Singer', N'Muddy Waters', N'Blues', N'Delta Blues', 282)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Can''t Get Enough', N'Barry White', N'Funk / Soul', N'Soul, Disco', 283)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'The Cars', N'The Cars', N'Electronic, Rock', N'New Wave, Pop Rock, Synth-pop', 284)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Music of My Mind', N'Stevie Wonder', N'Funk / Soul', N'Soul-Jazz, Soul', 285)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'I''m Still in Love With You', N'Al Green', N'Funk / Soul', N'Rhythm & Blues, Soul', 286)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Los Angeles', N'X', N'Rock', N'Punk, Rock & Roll', 287)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Anthem of the Sun', N'Grateful Dead', N'Rock', N'Psychedelic Rock', 288)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Something Else by The Kinks', N'The Kinks', N'Rock', N'Pop Rock, Psychedelic Rock, Mod', 289)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Call Me', N'Al Green', N'Funk / Soul', N'Rhythm & Blues, Soul', 290)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Talking Heads: 77', N'Talking Heads', N'Rock', N'New Wave', 291)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'The Basement Tapes', N'Bob Dylan and the Band', N'Rock', N'Folk Rock, Country Rock, Classic Rock', 292)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'White Light/White Heat', N'The Velvet Underground', N'Rock', N'Avantgarde, Experimental', 293)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Kick Out the Jams', N'MC5', N'Rock', N'Garage Rock, Hard Rock, Punk, Blues Rock', 294)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Songs of Love and Hate', N'Leonard Cohen', N'Folk, World, & Country', N'Folk Rock, Folk, Ballad', 295)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Meat Is Murder', N'The Smiths', N'Rock', N'Alternative Rock, Indie Rock', 296)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'We''re Only in It for the Money', N'The Mothers of Invention', N'Electronic, Rock', N'Modern Classical, Avantgarde, Psychedelic Rock, Experimental, Parody', 297)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2003, N'The College Dropout', N'Kanye West', N'Hip Hop', N'Pop Rap, Conscious, Contemporary R&B', 298)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Weezer (Blue Album)', N'Weezer', N'Rock', N'Alternative Rock, Emo', 299)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Master of Reality', N'Black Sabbath', N'Rock', N'Hard Rock, Heavy Metal', 300)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Coat of Many Colors', N'Dolly Parton', N'Folk, World, & Country', N'Country', 301)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1990, N'Fear of a Black Planet', N'Public Enemy', N'Hip Hop', N'Conscious', 302)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'John Wesley Harding', N'Bob Dylan', N'Rock', N'Folk Rock, Country Rock', 303)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Grace', N'Jeff Buckley', N'Rock', N'Alternative Rock, Folk Rock', 304)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1998, N'Car Wheels on a Gravel Road', N'Lucinda Williams', N'Folk, World, & Country', N'Country, Folk', 305)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1996, N'Odelay', N'Beck', N'Electronic, Hip Hop, Funk / Soul, Pop', N'Electro, Downtempo, Hip Hop, Disco, Afrobeat, Abstract', 306)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1964, N'A Hard Day''s Night', N'The Beatles', N'Rock, Stage & Screen', N'Soundtrack, Beat, Pop Rock', 307)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1956, N'Songs for Swingin'' Lovers!', N'Frank Sinatra', N'Jazz, Pop', N'Vocal, Easy Listening', 308)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Willy and the Poor Boys', N'Creedence Clearwater Revival', N'Rock', N'Blues Rock, Rock & Roll, Classic Rock', 309)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Blood Sugar Sex Magik', N'Red Hot Chili Peppers', N'Rock', N'Alternative Rock, Funk Metal', 310)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'The Sun Records Collection', N'Various', N'Rock, Funk / Soul, Blues, Pop, Folk, World, & Country', N'Country Blues, Rock & Roll, Rockabilly', 311)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'Nothing''s Shocking', N'Jane''s Addiction', N'Rock', N'Alternative Rock', 312)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'MTV Unplugged in New York', N'Nirvana', N'Rock', N'Folk Rock, Acoustic, Grunge', 313)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1998, N'The Miseducation of Lauryn Hill', N'Lauryn Hill', N'Hip Hop', N'RnB/Swing, Conscious', 314)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Damn the Torpedoes', N'Tom Petty and the Heartbreakers', N'Rock', N'Soft Rock, Hard Rock, Pop Rock', 315)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'The Velvet Underground', N'The Velvet Underground', N'Rock', N'Garage Rock, Art Rock, Experimental', 316)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'Surfer Rosa', N'Pixies', N'Rock', N'Alternative Rock', 317)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Back Stabbers', N'The O''Jays', N'Funk / Soul', N'Soul', 318)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Burnin''', N'The Wailers', N'Reggae', N'Reggae', 319)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'Amnesiac', N'Radiohead', N'Electronic, Rock', N'Alternative Rock, Experimental', 320)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Pink Moon', N'Nick Drake', N'Rock, Folk, World, & Country', N'Folk, Folk Rock, Acoustic', 321)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Sail Away', N'Randy Newman', N'Rock, Pop', N'None', 322)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Ghost in the Machine', N'The Police', N'Rock, Pop', N'Alternative Rock, New Wave, Pop Rock', 323)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Station to Station', N'David Bowie', N'Rock, Funk / Soul', N'Classic Rock, Soul, Funk, Art Rock', 324)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Slowhand', N'Eric Clapton', N'Rock', N'None', 325)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'Disintegration', N'The Cure', N'Electronic, Rock', N'New Wave, Alternative Rock', 326)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'Exile in Guyville', N'Liz Phair', N'Rock', N'Lo-Fi, Indie Rock', 327)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1988, N'Daydream Nation', N'Sonic Youth', N'Rock', N'Alternative Rock, Indie Rock', 328)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'In the Jungle Groove', N'James Brown', N'Funk / Soul', N'Soul, Funk', 329)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Tonight''s the Night', N'Neil Young', N'Rock', N'Blues Rock, Folk Rock, Classic Rock', 330)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Help!', N'The Beatles', N'Rock, Stage & Screen', N'Beat, Soundtrack, Pop Rock', 331)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1982, N'Shoot Out the Lights', N'Richard & Linda Thompson', N'Rock, Folk, World, & Country', N'Folk Rock', 332)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Wild Gift', N'X', N'Rock', N'Rock & Roll, Punk', 333)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Squeezing Out Sparks', N'Graham Parker & The Rumour', N'Rock, Blues', N'None', 334)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Superunknown', N'Soundgarden', N'Rock', N'Alternative Rock', 335)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2007, N'In Rainbows', N'Radiohead', N'Electronic, Rock', N'Alternative Rock, Art Rock', 336)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Aqualung', N'Jethro Tull', N'Rock', N'Classic Rock, Prog Rock', 337)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'Cheap Thrills', N'Big Brother & the Holding Company', N'Rock', N'Folk Rock, Blues Rock, Psychedelic Rock', 338)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'The Heart of Saturday Night', N'Tom Waits', N'Jazz, Pop, Folk, World, & Country', N'Contemporary Jazz, Spoken Word', 339)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Damaged', N'Black Flag', N'Rock', N'Hardcore, Punk', 340)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'Play', N'Moby', N'Electronic', N'Breakbeat, Leftfield, Downtempo', 341)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1990, N'Violator', N'Depeche Mode', N'Electronic', N'Synth-pop', 342)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Bat Out of Hell', N'Meat Loaf', N'Rock', N'Pop Rock', 343)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Berlin', N'Lou Reed', N'Rock', N'Hard Rock', 344)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Stop Making Sense', N'Talking Heads', N'Rock, Funk / Soul', N'Funk, Indie Rock, New Wave', 345)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'3 Feet High and Rising', N'De La Soul', N'Hip Hop', N'None', 346)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'The Piper at the Gates of Dawn', N'Pink Floyd', N'Rock', N'Psychedelic Rock', 347)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1960, N'Muddy Waters at Newport 1960', N'Muddy Waters', N'Rock, Blues', N'Blues Rock, Chicago Blues', 348)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2003, N'The Black Album', N'Jay Z', N'Hip Hop', N'None', 349)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'Roger the Engineer', N'The Yardbirds', N'Rock, Blues', N'Blues Rock, Pop Rock', 350)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Rust Never Sleeps', N'Neil Young & Crazy Horse', N'Rock', N'Hard Rock, Arena Rock', 351)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Brothers in Arms', N'Dire Straits', N'Rock', N'AOR, Classic Rock', 352)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2010, N'My Beautiful Dark Twisted Fantasy', N'Kanye West', N'Hip Hop', N'None', 353)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'52nd Street', N'Billy Joel', N'Jazz, Rock, Pop', N'Pop Rock, Ballad, Latin Jazz', 354)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'Having a Rave Up', N'The Yardbirds', N'Rock', N'Blues Rock, Psychedelic Rock', 355)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'12 Songs', N'Randy Newman', N'Rock, Pop', N'Pop Rock, Vocal', 356)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Between the Buttons', N'The Rolling Stones', N'Rock', N'Blues Rock, Psychedelic Rock, Pop Rock', 357)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1960, N'Sketches of Spain', N'Miles Davis', N'Jazz', N'Modal', 358)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Honky Ch‰teau', N'Elton John', N'Rock', N'Pop Rock,ÊClassic Rock', 359)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Singles Going Steady', N'Buzzcocks', N'Rock', N'Punk', 360)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'Stankonia', N'OutKast', N'Hip Hop, Funk / Soul', N'Gangsta, P.Funk, Crunk, Conscious', 361)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'Siamese Dream', N'The Smashing Pumpkins', N'Rock', N'Alternative Rock', 362)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Substance 1987', N'New Order', N'Electronic', N'Synth-pop', 363)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'L.A. Woman', N'The Doors', N'Rock', N'Blues Rock, Classic Rock', 364)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1992, N'Rage Against the Machine', N'Rage Against the Machine', N'Hip Hop, Rock', N'Funk Metal', 365)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'American Recordings', N'Johnny Cash', N'Folk, World, & Country', N'Country, Gospel, Folk', 366)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1998, N'Ray of Light', N'Madonna', N'Electronic, Pop', N'House, Techno, Downtempo, Vocal, Ambient', 367)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Eagles', N'Eagles', N'Rock', N'Country Rock, Classic Rock', 368)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Louder Than Bombs', N'The Smiths', N'Rock', N'Alternative Rock, Indie Rock', 369)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Mott', N'Mott the Hoople', N'Rock', N'Classic Rock', 370)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2006, N'Whatever People Say I Am, That''s What I''m Not', N'Arctic Monkeys', N'Rock', N'Indie Rock', 371)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Reggatta de Blanc', N'The Police', N'Rock, Pop', N'New Wave, Pop Rock', 372)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1969, N'Volunteers', N'Jefferson Airplane', N'Rock', N'Psychedelic Rock, Folk Rock, Country Rock, Honky Tonk', 373)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Siren', N'Roxy Music', N'Rock', N'Art Rock, Pop Rock, Glam', 374)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Late for the Sky', N'Jackson Browne', N'Rock', N'Pop Rock', 375)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1995, N'Post', N'Bjork', N'Electronic', N'Breakbeat, IDM, Electro', 376)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'The Ultimate Collection: 1948-1990', N'John Lee Hooker', N'Blues', N'Country Blues, Electric Blues, Chicago Blues, Jump Blues', 377)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1995, N'(What''s the Story) Morning Glory?', N'Oasis', N'Rock, Pop', N'Brit Pop', 378)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'CrazySexyCool', N'TLC', N'Electronic, Hip Hop, Funk / Soul', N'RnB/Swing', 379)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Funky Kingston', N'Toots & The Maytals', N'Reggae', N'Reggae Gospel, Reggae, Roots Reggae, Rocksteady', 380)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2011, N'The Smile Sessions', N'The Beach Boys', N'Rock', N'Pop Rock, Psychedelic Rock', 381)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'The Modern Lovers', N'The Modern Lovers', N'Rock', N'Art Rock, Indie Rock', 382)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'More Songs About Buildings and Food', N'Talking Heads', N'Rock', N'New Wave, Indie Rock', 383)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1966, N'A Quick One', N'The Who', N'Rock', N'Mod, Beat, Psychedelic Rock', 384)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'Love and Theft', N'Bob Dylan', N'Rock', N'Folk Rock, Blues Rock', 385)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Pretzel Logic', N'Steely Dan', N'Jazz, Rock', N'Jazz-Rock, Pop Rock, Classic Rock', 386)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'Enter the Wu_Tang: 36 Chambers', N'Wu Tang Clan', N'Hip Hop', N'Gangsta', 387)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'The Indestructible Beat of Soweto', N'Various Artists', N'Funk / Soul,ÊFolk, World, & Country', N'African', 388)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'The End of the Innocence', N'Don Henley', N'Rock', N'Pop Rock', 389)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2003, N'Elephant', N'The White Stripes', N'Rock', N'Blues Rock, Garage Rock, Alternative Rock', 390)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'The Pretender', N'Jackson Browne', N'Rock', N'Soft Rock, Pop Rock', 391)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Let It Be', N'The Beatles', N'Rock', N'Pop Rock', 392)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2007, N'Kala', N'M.I.A.', N'Electronic, Hip Hop, Reggae, Pop', N'Grime, Bollywood, Hip Hop, Dancehall', 393)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Good Old Boys', N'Randy Newman', N'Rock, Pop', N'Pop Rock, Vocal', 394)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2007, N'Sound of Silver', N'LCD Soundsystem', N'Electronic, Rock', N'Leftfield, Alternative Rock, Electro, Disco', 395)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'For Your Pleasure', N'Roxy Music', N'Rock', N'Art Rock, Avantgarde, Glam', 396)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1991, N'Blue Lines', N'Massive Attack', N'Electronic, Reggae', N'Dub, Downtempo', 397)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1983, N'Eliminator', N'ZZ Top', N'Rock', N'Pop Rock', 398)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Rain Dogs', N'Tom Waits', N'Rock, Blues', N'Blues Rock', 399)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1995, N'Anthology: The Best of The Temptations', N'The Temptations', N'Electronic, Funk / Soul', N'Soul, Disco', 400)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'Californication', N'Red Hot Chili Peppers', N'Rock', N'Alternative Rock, Funk Metal', 401)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Illmatic', N'Nas', N'Hip Hop', N'None', 402)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'(pronounced ''leh-''nerd ''skin-''nerd)', N'Lynyrd Skynyrd', N'Rock', N'Blues Rock, Hard Rock, Southern Rock', 403)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'Dr. John''s Gumbo', N'Dr. John', N'Funk / Soul', N'Bayou Funk, Funk, Rhythm & Blues', 404)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Radio City', N'Big Star', N'Rock', N'Power Pop', 405)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'Rid of Me', N'PJ Harvey', N'Rock', N'Indie Rock', 406)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Sandinista!', N'The Clash', N'Rock, Reggae', N'Rock & Roll, Dub, Punk', 407)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1989, N'I Do Not Want What I Haven''t Got', N'Sinead O''Connor', N'Rock, Funk / Soul, Blues', N'Blues Rock, Rhythm & Blues, Soul', 408)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Strange Days', N'The Doors', N'Rock', N'Psychedelic Rock', 409)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'Time Out of Mind', N'Bob Dylan', N'Rock, Blues', N'Blues Rock', 410)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'461 Ocean Boulevard', N'Eric Clapton', N'Rock', N'Blues Rock', 411)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Pink Flag', N'Wire', N'Rock', N'Punk', 412)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'Double Nickels on the Dime', N'Minutemen', N'Rock', N'Alternative Rock, Hardcore, Punk', 413)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Beauty and the Beat', N'The Go Go''s', N'Rock', N'Pop Rock', 414)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Van Halen', N'Van Halen', N'Rock', N'Hard Rock', 415)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'Mule Variations', N'Tom Waits', N'Electronic, Rock', N'Abstract, Art Rock', 416)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1980, N'Boy', N'U2', N'Rock', N'New Wave, Pop Rock', 417)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Band on the Run', N'Paul McCartney & Wings', N'Rock', N'Pop Rock', 418)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Dummy', N'Portishead', N'Electronic', N'Trip Hop, Downtempo', 419)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1957, N'The ""Chirping"" Crickets', N'The Crickets', N'Rock, Pop', N'Rockabilly, Rock & Roll', 420)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1990, N'The Best of the Girl Groups, Volume 1', N'Various Artists', N'Rock,ÊPop', N'Pop Rock, Vocal', 421)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1963, N'Presenting the Fabulous Ronettes Featuring Veronica', N'The Ronettes', N'Rock, Pop', N'Rock & Roll, Vocal', 422)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'Anthology', N'Diana Ross & The Supremes', N'Electronic, Funk / Soul', N'Pop Rock, Soul, Disco', 423)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'The Rising', N'Bruce Springsteen', N'Rock', N'Folk Rock, Classic Rock', 424)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'Grievous Angel', N'Gram Parsons', N'Rock, Folk, World, & Country', N'Country Rock, Honky Tonk', 425)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Cheap Trick at Budokan', N'Cheap Trick', N'Rock', N'Power Pop, Pop Rock, Arena Rock, Hard Rock', 426)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'Sleepless', N'Peter Wolf', N'Rock, Blues, Pop', N'Blues Rock, Pop Rock, Ballad', 427)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Outlandos d''Amour', N'The Police', N'Rock', N'Alternative Rock, New Wave, Punk', 428)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'Another Green World', N'Brian Eno', N'Electronic', N'Experimental, Ambient', 429)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2007, N'Vampire Weekend', N'Vampire Weekend', N'Rock', N'Indie Rock', 430)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'Stories From the City, Stories From the Sea', N'PJ Harvey', N'Rock', N'Indie Rock', 431)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Here Come the Warm Jets', N'Brian Eno', N'Rock', N'Art Rock, Glam', 432)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'All Things Must Pass', N'George Harrison', N'Rock', N'Pop Rock', 433)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'#1 Record', N'Big Star', N'Rock', N'Power Pop', 434)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1993, N'In Utero', N'Nirvana', N'Rock', N'Grunge, Alternative Rock', 435)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'Sea Change', N'Beck', N'Rock', N'Alternative Rock, Post Rock', 436)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2008, N'Tha Carter III', N'Lil Wayne', N'Hip Hop, Funk / Soul', N'RnB/Swing, Screw, Pop Rap, Thug Rap', 437)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Boys Don''t Cry', N'The Cure', N'Rock', N'New Wave, Post-Punk', 438)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Live at the Harlem Square Club, 1963', N'Sam Cooke', N'Funk / Soul', N'Soul', 439)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Rum Sodomy & the Lash', N'The Pogues', N'Rock, Folk, World, & Country', N'Folk Rock, Celtic, Punk', 440)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'Suicide', N'Suicide', N'Electronic, Rock', N'New Wave, Experimental', 441)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Q: Are We Not Men? A: We Are Devo!', N'DEVO', N'Rock', N'New Wave', 442)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1977, N'In Color', N'Cheap Trick', N'Rock', N'Power Pop, Pop Rock, Hard Rock', 443)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'The World Is a Ghetto', N'War', N'Funk / Soul', N'Funk', 444)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Fly Like an Eagle', N'Steve Miller Band', N'Rock', N'Pop Rock', 445)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Back in the USA', N'MC5', N'Rock', N'Garage Rock, Rock & Roll', 446)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1964, N'Getz / Gilberto', N'Stan GetzÊ/ÊJoao GilbertoÊfeaturingÊAntonio Carlos Jobim', N'Jazz', N'Bossa Nova,ÊLatin Jazz', 447)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1983, N'Synchronicity', N'The Police', N'Rock, Pop', N'New Wave, Pop Rock', 448)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Third/Sister Lovers', N'Big Star', N'Rock', N'Lo-Fi,ÊIndie Rock', 449)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'For Everyman', N'Jackson Browne', N'Rock', N'Pop Rock, Classic Rock', 450)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2006, N'Back to Black', N'Amy Winehouse', N'Funk / Soul, Pop', N'Soul', 451)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'John Prine', N'John Prine', N'Folk, World, & Country', N'Country, Folk', 452)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Strictly Business', N'EPMD', N'Hip Hop', N'None', 453)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Love It to Death', N'Alice Cooper', N'Rock', N'Classic Rock', 454)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'How Will the Wolf Survive?', N'Los Lobos', N'Rock, Latin', N'Blues Rock', 455)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1978, N'Here, My Dear', N'Marvin Gaye', N'Funk / Soul', N'Soul', 456)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2005, N'Z', N'My Morning Jacket', N'Rock', N'Alternative Rock', 457)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1970, N'Tumbleweed Connection', N'Elton John', N'Rock, Folk, World, & Country', N'Soft Rock, Country Rock', 458)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1968, N'The Drifters'' Golden Hits', N'The Drifters', N'Rock, Funk / Soul', N'Rhythm & Blues, Soul', 459)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Live Through This', N'Hole', N'Rock', N'Grunge', 460)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Metal Box', N'Public Image Ltd.', N'Electronic, Rock', N'Post-Punk, Dub, Avantgarde, Experimental', 461)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Document', N'R.E.M.', N'Rock', N'None', 462)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1981, N'Heaven Up Here', N'Echo and The Bunnymen', N'Rock', N'New Wave, Indie Rock', 463)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Hysteria', N'Def Leppard', N'Rock', N'Hard Rock, Arena Rock', 464)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'69 Love Songs', N'The Magnetic Fields', N'Electronic, Rock', N'Synth-pop, Indie Rock', 465)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'A Rush of Blood to the Head', N'Coldplay', N'Rock', N'Alternative Rock, Pop Rock', 466)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Tunnel of Love', N'Bruce Springsteen', N'Rock', N'None', 467)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1965, N'The Paul Butterfield Blues Band', N'The Paul Butterfield Blues Band', N'Rock, Blues', N'Blues Rock, Electric Blues, Chicago Blues, Modern Electric Blues, Harmonica Blues', 468)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1996, N'The Score', N'Fugees', N'Hip Hop', N'Pop Rap, Conscious', 469)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'Radio', N'L.L. Cool J', N'Hip Hop', N'None', 470)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1974, N'I Want to See the Bright Lights Tonight', N'Richard & Linda Thompson', N'Rock', N'Classic Rock, Folk Rock', 471)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1987, N'Faith', N'George Michael', N'Electronic, Rock, Funk / Soul, Blues, Pop', N'Downtempo, Soft Rock, Pop Rock, Synth-pop', 472)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1984, N'The Smiths', N'The Smiths', N'Rock', N'Indie Rock', 473)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2001, N'Proxima estacion: Esperanza', N'Manu Chao', N'Rock, Reggae, Latin', N'Folk Rock, Reggae, Reggae-Pop', 474)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Armed Forces', N'Elvis Costello & The Attractions', N'Rock', N'New Wave, Pop Rock', 475)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1997, N'Life After Death', N'The Notorious B.I.G.', N'Hip Hop', N'None', 476)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1996, N'Down Every Road', N'Merle Haggard', N'Folk, World, & Country', N'Country', 477)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2002, N'All Time Greatest Hits', N'Loretta Lynn', N'Folk, World, & Country', N'Country', 478)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1971, N'Maggot Brain', N'Funkadelic', N'Rock, Funk / Soul', N'P.Funk, Psychedelic Rock', 479)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1995, N'Only Built 4 Cuban Linx', N'Raekwon', N'Hip Hop', N'None', 480)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'Voodoo', N'D''Angelo', N'Hip Hop, Funk / Soul', N'Soul, Funk, Neo Soul', 481)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1986, N'Guitar Town', N'Steve Earle', N'Rock, Folk, World, & Country', N'Country, Honky Tonk', 482)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1979, N'Entertainment!', N'Gang of Four', N'Rock', N'Post-Punk, New Wave', 483)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1972, N'All the Young Dudes', N'Mott the Hoople', N'Rock', N'Classic Rock, Glam', 484)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1994, N'Vitalogy', N'Pearl Jam', N'Rock', N'Alternative Rock, Hard Rock', 485)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1975, N'That''s the Way of the World', N'Earth, Wind & Fire', N'Funk / Soul', N'Soul, Funk, Disco', 486)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1983, N'She''s So Unusual', N'Cyndi Lauper', N'Electronic, Rock', N'Pop Rock, Synth-pop', 487)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1985, N'New Day Rising', N'Husker Du', N'Rock', N'Alternative Rock, Hardcore, Punk', 488)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1976, N'Destroyer', N'KISS', N'Rock', N'Hard Rock', 489)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1973, N'Tres hombres', N'ZZ Top', N'Rock', N'Blues Rock, Classic Rock', 490)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1967, N'Born Under a Bad Sign', N'Albert King', N'Funk / Soul, Blues', N'Electric Blues, Rhythm & Blues, Soul', 491)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (3, N'aaa', N'bbb', N'ccc', N'ddd', 2501)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1958, N'Prueba', N'Tester', N'Asdadnn', N'njfkjasnfkiewfe', 3501)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1999, N'Prueba2', N'Tester2', N'Asdadnn2', N'njfkjasnfkiewfe2', 3502)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1231, N'Test', N'QA', N'ASD', N'asdasdw', 4501)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (5555, N'Test5', N'QA5', N'ASD5', N'asdasdw5', 4502)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (647, N'TESTttzzgam', N'Artistxofnkhe', N'edsiwyd', N'twlfmye', 4503)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1130, N'TESTcxtamlb', N'Artistgreclbl', N'opizdmd', N'aimdsbs', 4505)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1197, N'TESTfgyxdpj', N'Artistxhifgvi', N'kohcmbn', N'ykrhnnb', 4506)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (740, N'TESTkgmtohm', N'Artistfclwsfk', N'dkofsbn', N'iyrahjv', 4507)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (795, N'TESTbnacjjg', N'Artistxhmlwdp', N'ytazfea', N'qpghtac', 4509)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (709, N'Album lbocqat', N'Artist xsxlcna', N'qlsntxk', N'woyizvw', 4510)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (139, N'Album fnjafii', N'Artist fycvrlh', N'aeywzvn', N'vbsuhrd', 4511)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (14, N'Album jydnrgc', N'Artist pcmspta', N'sahkivv', N'vzytaab', 4512)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1902, N'Album bvbjstp', N'Artist eftakxr', N'mqglobb', N'sejkasa', 4513)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (392, N'Album nhwylrw', N'Artist plndzoa', N'jljondi', N'nswrkkt', 4514)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1768, N'Album vnvjptr', N'Artist taeqfrd', N'kbidphz', N'gjpwdbc', 4515)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1263, N'Album aakroez', N'Artist vfhyfox', N'wwvcjdx', N'lpzjrfp', 4516)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (788, N'Album rrbehdf', N'Artist hnsbvca', N'lqupqgv', N'lrudlrr', 4517)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1193, N'Album tfmyqxn', N'Artist fokocjg', N'mhgsaah', N'rvtwmea', 4518)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (632, N'Album abqswgs', N'Artist vppshhh', N'crstyle', N'loevywn', 4519)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (489, N'Album rbjmrtw', N'Artist bbirkpg', N'mupykqr', N'yqtcdin', 4520)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1033, N'Album lxjfmba', N'Artist lkwnimv', N'tfsbzkc', N'lsrbihn', 4521)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (366, N'Album pmashiz', N'Artist oqyamcv', N'jezbeim', N'yjchbjp', 4522)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1, N'asd', N'asd', N'asd', N'asd', 4523)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (258, N'Album arkacuy', N'Artist wtoawmc', N'zuutclc', N'srcvqpc', 4524)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1602, N'Album asjvpzz', N'Artist jwmsunj', N'prnhlej', N'luhlfxe', 4525)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1384, N'Album qlypfag', N'Artist keyclep', N'pgbeizm', N'wuxjcsd', 4526)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1828, N'Album hsdrfko', N'Artist ublyviw', N'byokvfv', N'ceuaade', 4527)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1738, N'Album nnbiadb', N'Artist eqepfzp', N'rohksov', N'duajfzc', 4528)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (128, N'Album yeylhbr', N'Artist fjfenap', N'lvcxydk', N'ziuzfhp', 4529)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1770, N'Album vonxgjx', N'Artist vxendqz', N'qndjwuc', N'wiuuuij', 4530)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (593, N'Album pvmrqmx', N'Artist zpzuvwz', N'pprbcod', N'fkokgfx', 4531)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (378, N'Album vxeafly', N'Artist odfzmoz', N'nzicfly', N'kkrbifu', 4532)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (706, N'Album qcvgkhu', N'Artist ibydloa', N'gfvyccz', N'bdbmepi', 4533)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1022, N'Album tqycwyh', N'Artist yjcknlj', N'jlimsmi', N'yvhiseg', 4534)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (12, N'asd', N'asd', N'eqw', N'asd', 4535)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (738, N'Album pjvzwsb', N'Artist dhkianw', N'dxjjqni', N'pniocvx', 4536)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (670, N'Album ebaqopy', N'Artist fgcubme', N'yptcjyg', N'rqvyhyg', 4537)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (689, N'Album ukkztfr', N'Artist znrjcvr', N'qkpqbmu', N'jmxzmtr', 4538)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1899, N'Album ckupjnr', N'Artist idanfpn', N'ngwiliy', N'uaopjgp', 4539)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (563, N'Album xmbcteq', N'Artist tlfytco', N'ycucjjh', N'kpdisfx', 4540)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (142, N'Album jalsrlq', N'Artist smrytru', N'fsapgiv', N'xoskzou', 4541)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1635, N'Album eeemrhq', N'Artist xbcnkgs', N'pgegmyk', N'nxzdxqq', 4542)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1441, N'Album fyfesmj', N'Artist rihnmpz', N'mdtadyz', N'ibtrmiv', 4543)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (375, N'Album hrnvtaq', N'Artist sdfkhnj', N'dfsbske', N'ruvxrqk', 4544)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1764, N'Album pbgquno', N'Artist ctmyugj', N'rnpdppn', N'wpbavki', 4545)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (839, N'Album blsfzym', N'Artist cuinsyr', N'jwkuyye', N'emhosra', 4546)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1872, N'Album jwwmwhb', N'Artist mbwqxvw', N'axcspwk', N'yrofecx', 4547)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1372, N'Album clufvju', N'Artist ljxvmgz', N'nmerzyd', N'wbnkjgq', 4548)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1083, N'Album oviohbm', N'Artist xevfqxd', N'lnziwzy', N'grtywwc', 4549)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1517, N'Album aoopjrm', N'Artist snibkav', N'kkuvzil', N'ijzdtjh', 4550)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (819, N'Album ybftfdv', N'Artist uzteeqd', N'qfpasyq', N'qmgfram', 4551)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1295, N'Album vbrzxcg', N'Artist fcxmqqh', N'uwzlboz', N'aobqdsk', 4552)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1639, N'Album jnotopd', N'Artist zrlxjuu', N'fuayhyt', N'uwewmyz', 4553)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1419, N'Album slhsmhj', N'Artist xhvpkuh', N'kjhadak', N'exsdphx', 4554)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (513, N'Album znuplni', N'Artist dwnxill', N'qlmmpog', N'yqvwdwi', 4555)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1203, N'Album cgapvva', N'Artist icorlqv', N'vbcfhcv', N'hqcaqdq', 4556)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (15, N'Album cmzhxzy', N'Artist cshuega', N'qchkikj', N'ghfwxgb', 4557)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (477, N'Album hhpcnje', N'Artist mcczdxg', N'nfgseku', N'lcbyivc', 4558)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (165, N'Album pgphmmx', N'Artist titcyqz', N'ufeywpb', N'pungsmr', 4559)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (2000, N'Album czowgnr', N'Artist fnhfqax', N'jfgqvjv', N'ybvghub', 4560)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (338, N'Album lmntxgb', N'Artist kfklins', N'mnhqozx', N'djpqkaw', 4561)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1845, N'Album tsyvisn', N'Artist jfkwldl', N'ypncins', N'ncpercn', 4562)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1346, N'Album yurlkzg', N'Artist xrzqhfo', N'noamcmb', N'ssbzscd', 4563)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1546, N'Album krfopwk', N'Artist zejxpca', N'kagvidc', N'nivpynt', 4564)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (678, N'Album kjadepk', N'Artist hgqxctt', N'pqvlrut', N'annzhca', 4565)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1807, N'Album knwojkj', N'Artist fvvlucm', N'yskgtvy', N'kunhidi', 4566)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (980, N'Album cmgmppa', N'Artist ypcbcow', N'puhsoyo', N'dkgdznb', 4567)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (85, N'Album fvdvaum', N'Artist vlqywgt', N'dvubxqp', N'iqyelbf', 4568)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (55, N'Album kyafqeb', N'Artist kciwcae', N'snsllhi', N'psfcqoh', 4569)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (890, N'Album plhirht', N'Artist nxmsyxe', N'sdyqgvv', N'cinedhr', 4570)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (913, N'Album ntgxhby', N'Artist iqjtlfb', N'mgphkix', N'ionprmf', 4571)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1892, N'Album xqkazam', N'Artist dolbcxb', N'ipcuxkw', N'uweveoh', 4572)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1056, N'Album ezlrioz', N'Artist wnfjwgy', N'cznyftd', N'wmsdcgd', 4573)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (323, N'Album lkcottba', N'Artist xqbttev', N'prbqixj', N'xvymcbt', 4574)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (935, N'Album pzpldbv', N'Artist dpafvpk', N'ybkkuul', N'xwbjmjf', 4575)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1618, N'Album mazgckx', N'Artist kzpkdib', N'kxqoeus', N'qpcnjna', 4576)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (186, N'Album qhfleev', N'Artist mvhukfb', N'jhhzzji', N'xrhjktc', 4577)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1417, N'Album tztccdg', N'Artist nctjvgw', N'krraqdx', N'cgxtxpq', 4578)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (846, N'Album iideknr', N'Artist rmefnul', N'dgonrgm', N'qfvshif', 4579)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (792, N'Album pnzqpou', N'Artist xwjebdk', N'xomtnie', N'harhuez', 4580)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1491, N'Album oqifruo', N'Artist rlmgqqs', N'xotqrrp', N'ewxkjmv', 4581)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1448, N'Album jtgxdon', N'Artist nulapdi', N'utkqnlq', N'uqegbjj', 4582)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (184, N'Album tqracuj', N'Artist skrvmxy', N'fdsspts', N'vgsjhnx', 4583)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1348, N'Album fqburoz', N'Artist xmltznf', N'zanloxs', N'iktnivf', 4584)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (531, N'Album qptujhl', N'Artist wnhtbas', N'metwmvp', N'mykualw', 4585)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1058, N'Album ystvvrt', N'Artist timcedq', N'arqpqci', N'cojaegu', 4586)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1568, N'Album ohpjakz', N'Artist nqllqjt', N'cnkoxyh', N'xzdpffd', 4587)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1463, N'Album dypsfeg', N'Artist lisqsuj', N'hljgisa', N'yejnshr', 4588)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1012, N'Album gseyajm', N'Artist pfgtknp', N'ywmtjhu', N'dgvwwja', 4589)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (134, N'Album hbmotzs', N'Artist efxiyqy', N'onbjiff', N'sxuhtux', 4590)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1839, N'Album gajalkh', N'Artist huyegfz', N'sxbpfsh', N'kdlfalk', 4591)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1754, N'Album ogporlj', N'Artist eipzhev', N'zavjcyw', N'pxcmiad', 4594)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (28, N'TESTfjhaxga', N'Artistwhuyoli', N'xrsoqcc', N'vnkdfgk', 4596)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (467, N'TESTyyrosfp', N'Artistausfaxa', N'dhdqqfb', N'jedjqyf', 4597)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (929, N'TESToxcoucc', N'Artistmrbcwpf', N'dedfddy', N'owhtxhp', 4598)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (297, N'TESTjckbevx', N'Artistsnpophm', N'lairtvn', N'rsdbdgi', 4599)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (896, N'TESTxdsqjde', N'Artistdgwytal', N'vsoehnh', N'lkwmvvg', 4601)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1113, N'TESThqbwywy', N'Artistiqiizhz', N'fggawkf', N'jspmvwx', 4602)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1600, N'TESTglackck', N'Artistpaebmao', N'dwojmfa', N'hwcggbf', 4604)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (43, N'TESTcfxfwtn', N'Artistteqqnzf', N'axdstvv', N'wfagque', 4605)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (913, N'TESTklpdtxt', N'Artistbaafivu', N'qtzqccy', N'omjmtgx', 4607)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1666, N'TESTlsswddv', N'Artisthlngbin', N'odpxhin', N'ubfjfnu', 4608)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1761, N'TESTknshfmx', N'Artistdfgrudv', N'vdjaahj', N'ietibvd', 4609)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1444, N'TESTzrtxtbd', N'Artisthbgohhg', N'hejfbxq', N'phbswoz', 4610)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1417, N'TESTktavhxg', N'Artistnoaswdy', N'bwinzcw', N'mscrndy', 4611)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (496, N'TESTxibafyf', N'Artistnvrnzoa', N'pnekzbn', N'kqpummn', 4612)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (702, N'TESTmdakkdp', N'Artistszituue', N'ayigsdt', N'zpeomqp', 4614)
GO
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1908, N'Album wustyzc', N'Artist plvalli', N'mdxtcda', N'gloigaf', 4615)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1334, N'Album xjpyyyb', N'Artist zyzpxhk', N'bqsjfzs', N'linphrn', 4616)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1127, N'Album gydjvxc', N'Artist gowtnls', N'bhtiemg', N'hfqsqpi', 4617)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1140, N'Album ticvuhy', N'Artist sgozkfs', N'qgoedyx', N'nqhxwpw', 4618)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1748, N'Album zjmmzwl', N'Artist abgnicr', N'iqzjgqv', N'zodklgh', 4619)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1301, N'Album ytdzuxb', N'Artist cvebmey', N'shkorpd', N'bvdnfap', 4620)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1485, N'Album vaemzwk', N'Artist penllzm', N'gisjzzy', N'eymhecv', 4621)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1117, N'Album wxajisy', N'Artist pvumjyh', N'wzlqflp', N'bndtaqc', 4622)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1159, N'Album qmrgfgq', N'Artist earictz', N'qaqdpep', N'vuaguij', 4623)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1495, N'Album kquujck', N'Artist ksmsbcd', N'qpntuih', N'akdyboy', 4624)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (345, N'Album lbgfpmg', N'Artist akpfrrp', N'yvyebgk', N'ikpacar', 4625)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (377, N'Album meimqfe', N'Artist pwbccle', N'trcustt', N'qobgthu', 4626)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (1455, N'Album zsdesbq', N'Artist btzxmyg', N'klxweyf', N'emybwvg', 4627)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (154, N'Album hmppffd', N'Artist cwbrzct', N'pruyyan', N'jepoyoc', 4628)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (130, N'Album zakeaqg', N'Artist blixapp', N'yhbxacn', N'gnulggt', 4629)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (169, N'Album ogjtcgf', N'Artist kyexzeg', N'ijcmsml', N'sbztpap', 4630)
INSERT [dbo].[AlbumList] ([Year], [Album], [Artist], [Genre], [Subgenre], [Id]) VALUES (712, N'Album pywltzb', N'Artist ecdqxiu', N'xlcjqcw', N'vjesbgg', 4632)
SET IDENTITY_INSERT [dbo].[AlbumList] OFF
SET IDENTITY_INSERT [dbo].[GenreList] ON 

INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (1, N'Blues')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (2, N'Folk')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (3, N'World')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (4, N'Country')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (5, N'Classical')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (6, N'Stage')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (7, N'Screen')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (8, N'Electronic')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (9, N'Funk')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (10, N'Soul')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (11, N'Pop')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (12, N'Hip Hop')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (13, N'Reggae')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (14, N'Rock')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (15, N'Jazz')
INSERT [dbo].[GenreList] ([Id], [Genre]) VALUES (16, N'Latin')
SET IDENTITY_INSERT [dbo].[GenreList] OFF
SET IDENTITY_INSERT [dbo].[GroupList] ON 

INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (4, N'A Tribe Called Quest', 1985, 1999, N'Es un grupo de rap estadounidense de los años 1990, originalmente formado en Queens, Nueva York.', N'https://es.wikipedia.org/wiki/A_Tribe_Called_Quest', N'EEUU', N'Nueva York')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (8, N'ABBA', 1972, 1982, N'Es un grupo sueco de música pop.', N'https://es.wikipedia.org/wiki/ABBA', N'Suecia', N'Estocolmo')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (11, N'AC/DC', 1973, NULL, N'Es un grupo de Hard Rock australiano formado por los hermanos Malcolm y Angus Young.', N'https://es.wikipedia.org/wiki/AC/DC', N'Australia', N'Sidney')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (12, N'Aerosmith', 1970, NULL, N'Conocidos como "Toxic Twins", apelativo por el que se conoce a sus dos líderes.', N'https://es.wikipedia.org/wiki/Aerosmith', N'EEUU', N'Massachusetts')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (13, N'Al Green', 1967, NULL, N'Albert Greene, más conocido como Al Green, es un cantante y compositor estadounidense.', N'https://es.wikipedia.org/wiki/Al_Green', N'EEUU', N'Arkansas')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (14, N'Albert King', 1948, 1992, N'Albert Nelson fue un influyente guitarrista y cantante estadounidense de Blues. ', N'https://es.wikipedia.org/wiki/Albert_King', N'EEUU', N'Mississippi')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (15, N'Alice Cooper', 1964, NULL, N'Es un cantante de hard rock y heavy metal estadounidense, nacido en Detroit, Michigan.', N'https://es.wikipedia.org/wiki/Alice_Cooper', N'EEUU', N'Arizona')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (16, N'Prueba1', 1111, 2222, N'asASDasdlasdas', N'asdasdqwdqwdqw', N'sPAIN', N'irigoregmre')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (19, N'TESTmnaywhc', 999, 2019, N'', N'', N'utqxytw', N'')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (20, N'TESTdrhaxrn', 601, 1902, N'kwbzwdbppooaygkbkhbz', N'xqpqmxm', N'nrpmwjx', N'ljtezqt')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (21, N'TESTrfujdcv', 925, 1938, N'rtplrpqkullvkkyclldw', N'rpcsrkx', N'aupzlsj', N'mrepygw')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (22, N'TESTfbowwvd', 812, 1883, N'kfbjntqhconnzwmuigmz', N'veufldz', N'bhgvovu', N'olupaom')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (23, N'TESTvigphzk', 580, 1989, N'bbyapbyzwzznpyqkkqsj', N'eoyzqud', N'bqcjhuh', N'knxdvhv')
INSERT [dbo].[GroupList] ([Id], [Group], [StartYear], [EndYear], [Description], [UrlWiki], [Country], [City]) VALUES (24, N'TESTvzyogby', 514, 1927, N'wovxdltsgtzrmvcoojdl', N'sfltmce', N'umfnxgb', N'geznnta')
SET IDENTITY_INSERT [dbo].[GroupList] OFF
SET IDENTITY_INSERT [dbo].[UserList] ON 

INSERT [dbo].[UserList] ([Id], [User], [Password]) VALUES (2, N'', N'')
INSERT [dbo].[UserList] ([Id], [User], [Password]) VALUES (5, N'Tester', N'hU3cAGNp63usOLtmkOf5sF0NaGWb4fllZN9AfWU+DfI=')
INSERT [dbo].[UserList] ([Id], [User], [Password]) VALUES (1004, N'QAmanager', N'6Xr2KN6r3cxkLQDJsPo8SI5U/pu+VXl15fReXJ8E6oI=')
INSERT [dbo].[UserList] ([Id], [User], [Password]) VALUES (1134, N'Prueb1', N'/5YMtVZzlYxZTQ2qqx42hlHHXAL5aHGSoYEeexgDNqc=')
SET IDENTITY_INSERT [dbo].[UserList] OFF
USE [master]
GO
ALTER DATABASE [TGS] SET  READ_WRITE 
GO
