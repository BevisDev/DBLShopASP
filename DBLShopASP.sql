USE [DBLShopASP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28/07/2021 8:46:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28/07/2021 8:46:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[User_Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Full_Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28/07/2021 8:46:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [nvarchar](20) NOT NULL,
	[Order_Date] [datetime] NOT NULL,
	[Ship_Date] [datetime] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Checkout] [bit] NULL,
	[Finished_Ship] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 28/07/2021 8:46:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Unit_Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28/07/2021 8:46:00 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Unit_Price] [float] NOT NULL,
	[Size] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Product_Date] [date] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Hàng mới về')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Bóng đá')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Air Max')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Jordan')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Chạy Bộ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer] ([User_Name], [Password], [Full_Name], [Address], [Phone], [Email], [Admin]) VALUES (N'binh', N'1', N'thanh binh', N'89 duong 11 ', N'0901850057', N'truongthanhbinh57200', 0)
INSERT [dbo].[Customer] ([User_Name], [Password], [Full_Name], [Address], [Phone], [Email], [Admin]) VALUES (N'long', N'1', N'long123', NULL, N'123', N'long@gmail.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Customer_Id], [Order_Date], [Ship_Date], [Address], [Checkout], [Finished_Ship]) VALUES (1, N'binh', CAST(N'2021-07-26T22:30:43.713' AS DateTime), CAST(N'2021-07-30T00:00:00.000' AS DateTime), N'89 Đường 11 Phường Tân Kiểng Quận 7', 0, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Unit_Price], [Quantity]) VALUES (1, 1, 6, 5869000, 1)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (1, N'Nike ZoomX Vaporfly', N'nike1.jpg', 7199000, 40, 10, CAST(N'2021-07-11' AS Date), 1, N'Bạn biết rằng mỗi lần chạy đều có giá trị. Khi bạn đeo Nike Vaporfly, bạn đã có sẵn một mục tiêu. Chuẩn bị cho sự thành công với các chi tiết hiệu suất tùy chỉnh — như chuyển đổi dây buộc hoặc đế bánh Waffle — và vẻ ngoài truyền cảm hứng cho bạn để ra ngoài đó.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (2, N'Nike Waffle 1', N'nike2.jpg', 3829000, 40, 50, CAST(N'2021-07-11' AS Date), 1, N'Đơn giản, thấp, một bức tranh hoàn hảo cho những giấc mơ của bạn. Nike Waffle One By You là mẫu xe đua nguyên bản, mang đến vẻ ngoài siêu di sản hoặc hiện đại hóa với màu sắc và chi tiết lấy cảm hứng từ những ngày dài ở bãi biển. Vật liệu và màu sắc OG lấy ngay từ hầm kết hợp hoàn hảo với các vật liệu và lớp hoàn thiện sáng tạo để có được vẻ ngoài giống bạn 100%.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (3, N'Nike Phantom GT2 Elite FG', N'nike3.jpg', 7629000, 40, 50, CAST(N'2021-07-12' AS Date), 1, N'Xây dựng dựa trên Phantom GT, Nike Phantom GT2 Elite FG có sự nâng cấp thiết kế và hoa văn nổi lên để giúp tại độ xoáy tối ưu để kiểm soát đường bay của bóng. Viền trung tâm cung cấp một vùng xoắn sạch sẽ cho khả năng rê bóng, chuyền và sút khéo léo!')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (4, N'Nike Air Zoom Tempo', N'nike4.jpg', 4108000, 40, 50, CAST(N'2021-07-13' AS Date), 1, N'Giày Nike Air Zoom Teempo siêu nhạy được thiết kế để giúp bạn tận dụng tối đa các bài tập luyện của mình, để bạn có thể tự tin bước vào cuộc đu tiếp theo của mình. Nó có mục nhập bước vào và cơ chế viền bên trong mà bạn vận hành bằng một tay. Kéo một vòng để thắt chặt, một vòng khác để giải phóng. ')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (5, N'Air Jordan 3 Retro', N'nike5.jpg', 5589000, 40, 50, CAST(N'2021-07-12' AS Date), 1, N'Đôi giày huyền thoại có một diện mạo mới lấy cảm hứng từ di sản. Một sự thay đổi trên đường phối màu ''Black Cement'' nguyên bản, Air Jordan 3 Retro mang trong mình một trong những màu sắc mang tính biểu tượng nhất của thương hiệu.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (6, N'Nike Air VaporMax 2021 FK', N'nike6.jpg', 5869000, 40, 50, CAST(N'2021-07-13' AS Date), 1, N'Được làm từ ít nhất 40% vật liệu tái chế theo trọng lượng, Nike Air VaporMax 2021 FK thoáng mát và dễ mặc với vải Flyknit tái chế siêu co giãn, cùng với cổ áo mềm mại có tác dụng điêu khắc mắt cá chân của bạn. clip thêm một chút hấp dẫn khi bạn thả mình trên đường phố trên đệm VaporMax cực kỳ mềm mại.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (7, N'Nike Flow 2020 ISPA', N'nike7.jpg', 5279000, 40, 50, CAST(N'2021-07-12' AS Date), 1, N'Nike Flow 2020 ISPA đưa ra một giải pháp tinh vi cho các vấn đề phức tạp về giày dép. Hệ thống dây kéo dây độc đáo cho phép bạn dễ dàng tùy chỉnh sự phù hợp của mình khi di chuyển, trong khi lưới được đặt ở vị trí chiến lược cung cấp sự thông thoáng khi bạn cần.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (8, N'Nike Air Max 95 SE', N'nike8.jpg', 4999000, 40, 50, CAST(N'2021-07-12' AS Date), 1, N'Lấy cảm hứng từ cơ thể con người và tính thẩm mỹ từ các môn thể thao thập niên 90, Nike Air Max 95 SE kết hợp sự thoải mái đến khó tin và phong cách quay đầu với một thiết kế bền vững. denim và lưới. Hình ảnh nút chai thêu trên lưỡi gật đầu với loại cây được sử dụng trong thiết kế. Không khí có thể xử lý được ở gót chân và đệm bàn chân trước mỗi bước đi.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (9, N'Jordan Why Not? Zer0.4 PF', N'j1.jpg', 3829000, 41, 50, CAST(N'2021-07-10' AS Date), 4, N'Tốc độ là vũ khí bất ly thân của Russell Westbrook. Anh ấy liên tục lấn át cuộc thi, tạo động lực và vận động cơ bắp theo cách của mình vào guồng quay nổi bật. Cue the Jordan Tại sao không? Zer0.4, người đầu tiên có tính năng Phóng to xếp chồng đôi ở bàn chân trước. Đó là một hệ thống đệm cực nhạy được thiết kế để giúp anh ta chuyển hóa tốc độ thành lực và tập trung tấn công.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (10, N'Air Jordan 1 Hi FlyEase', N'j2.jpg', 2549000, 41, 50, CAST(N'2021-07-12' AS Date), 4, N'Air Jordan 1 Hi FlyEase mang đến cho bạn một cách nhanh chóng để đi vào đôi giày thể thao của mình trong khi vẫn duy trì được sức hấp dẫn vượt thời gian của bản gốc. Cổ áo của nó được kéo ra và các nếp gấp trên cùng mở ra để tạo ra một lối vào rộng, khiến một trong những đôi giày mang tính biểu tượng nhất mọi thời đại trở nên dễ dàng hơn bao giờ hết.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (11, N'Air Jordan 1 Low SE', N'j3.jpg', 2299000, 41, 50, CAST(N'2021-07-10' AS Date), 4, N'Hãy cất cánh với Jumpman trong Air Jordan 1 Low SE, được làm từ ít nhất 20% vật liệu tái chế theo trọng lượng. Đôi giày thể thao phiên bản đặc biệt này lấy cảm hứng từ quần áo bảo hộ lao động chắc chắn; chúng được làm từ vải canvas đã giặt và da lộn tổng hợp để trông bền và lâu mòn, với tông màu trung tính được bù đắp bằng biểu tượng Swoosh lốm đốm.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (12, N'Jordan Delta 2', N'j4.jpg', 3829000, 41, 50, CAST(N'2021-07-10' AS Date), 4, N'Jordan Delta 2 mang đến sự mới mẻ, không sợ hãi với các tính năng bạn muốn: độ bền, sự thoải mái và thái độ lấy cốt lõi của Jordan. 2 vẫn có sự kết hợp xung đột giữa các vật liệu giống như thời đại không gian và hỗ trợ, với rất nhiều kết cấu khác nhau và đường khâu dày để tạo ra một cái nhìn vừa mạo hiểm vừa mang tính biểu tượng.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (13, N'Jordan Air NFH', N'j5.jpg', 3239000, 41, 50, CAST(N'2021-07-10' AS Date), 4, N'Jordan Air NFH là một đôi giày thể thao hàng ngày với bóng rổ trong DNA của nó. Các chi tiết như đệm khí có thể nhìn thấy, lớp phủ được khâu và lực kéo xương cá kết nối với phả hệ hiệu suất của thương hiệu. Vật liệu nhẹ và vừa vặn tạo cảm giác thoải mái.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (14, N'Zion 1 PF', N'j6.jpg', 3519000, 41, 50, CAST(N'2021-07-11' AS Date), 4, N'Với một tính cách bình thường và những khả năng vượt ra ngoài thế giới này, Zion không giống bất kỳ ai khác. Trên tòa án, linh hồn hiền lành, người luôn hướng về gia đình biến thành một sức mạnh vô địch của thể thao và tốc độ không thể ngăn cản. đường nét đặc trưng với thiết kế lấy cảm hứng từ tính khiêm tốn và khả năng siêu phàm của anh ấy. đệm Air Strobel có chiều dài hoàn chỉnh được xếp chồng lên nhau với bộ phận Zoom Air ở bàn chân trước — sự kết hợp thú vị giữa sự thoải mái dưới chân sang trọng và khả năng phản hồi nhanh. với lực kéo mạnh mẽ giúp Zion bám sân và kiểm soát sức mạnh của mình. Phiên bản PF này sử dụng đế ngoài siêu bền được thiết kế cho các sân ngoài trời.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (15, N'Nike Air Max 96 2 SE', N'a2.jpg', 4999000, 41, 50, CAST(N'2021-07-10' AS Date), 3, N'Đánh dấu 50 năm thành lập của Swoosh với Air Max 96 2. Lần đầu tiên được tưởng tượng bởi một trong những nhà thiết kế trang trí nhất của Nike, nó hiện có logo Swoosh ban đầu và số bằng sáng chế. giày kem của mùa vụ.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (16, N'Nike Air VaporMax 2021 FK', N'a3.jpg', 5869000, 41, 50, CAST(N'2021-07-09' AS Date), 3, N'Được làm từ ít nhất 40% vật liệu tái chế theo trọng lượng, Nike Air VaporMax 2021 FK thoáng mát và dễ mặc với vải Flyknit tái chế siêu co giãn, cùng với cổ áo mềm mại có tác dụng điêu khắc mắt cá chân của bạn. clip thêm một chút hấp dẫn khi bạn thả mình trên đường phố trên đệm VaporMax cực kỳ mềm mại.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (17, N'Nike Air Max 96 2', N'a4.jpg', 4699000, 42, 50, CAST(N'2021-07-12' AS Date), 3, N'Lần đầu tiên, Air Max 96 2 trở lại với một phiên bản làm lại có một không hai. Bộ phận Nike Air lớn giúp giữ được số lượng quần áo bình thường hoàn hảo trong khi vẫn tăng thêm sự thoải mái lâu dài.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (18, N'Nike Air Max 97', N'a5.jpg', 4999000, 42, 50, CAST(N'2021-07-08' AS Date), 3, N'Đi trong sự thoải mái hạng nhất. Nike Air Max 97 cho phép bạn thúc đẩy phong cách của mình với tốc độ tối đa với thiết kế lấy cảm hứng từ tàu cao tốc Nhật Bản')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (19, N'Nike Air Max 90 SE', N'a6.jpg', 3829000, 42, 50, CAST(N'2021-07-08' AS Date), 3, N'Không gì bằng bay, không gì thoải mái bằng, không gì đã chứng minh — Nike Air Max 90 SE kỷ niệm 50 năm thành lập Swoosh. nó hiện có thiết kế Swoosh ban đầu và miếng ren có thể tháo rời.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (20, N'Nike Air Max Pre-Day LX', N'a1.jpg', 4109000, 42, 50, CAST(N'2021-07-11' AS Date), 3, N'Mang dáng vẻ cổ điển của di sản Nike đang chạy sang một thế giới mới, Nike Air Max Pre-Day LX mang đến cho bạn một diện mạo nhanh nhạy, sẵn sàng cho thế giới ngày nay. Vật liệu tái chế ở phía trên giữ cho thẩm mỹ thể thao cổ điển mà bạn biết rõ nhất trong khi cửa sổ Air mới tạo sức sống cho giao diện, pha trộn giữa phong cách quay đầu với đệm mềm đến khó tin.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (21, N'Nike Air Zoom Pegasus 38 FlyEase', N'r1.jpg', 3519000, 42, 50, CAST(N'2021-07-09' AS Date), 5, N'Ngựa của bạn với đôi cánh trở lại. Nike Air Zoom Pegasus 38 tiếp tục tạo ra một lò xo trong bước đi của bạn, sử dụng cùng một loại bọt đáp ứng như người tiền nhiệm của nó. Lưới ở phía trên kết hợp sự thoải mái và độ bền bạn muốn với hệ thống nhập FlyEase giúp bạn nhập cảnh nhanh chóng và dễ dàng.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (22, N'Nike Air Zoom Pegasus 38', N'r2.jpg', 3519000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Nike Air Zoom Pegasus 38 tiếp tục tạo ra một lò xo trong bước đi của bạn, sử dụng bọt phản ứng tương tự như người tiền nhiệm của nó.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (23, N'Nike React Infinity Run Flyknit 2', N'r3.jpg', 3758000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Nike React Infinity Run Flyknit 2 tiếp tục giúp bạn tiếp tục chạy. Phần trên được làm mới sử dụng công nghệ Flywire kết hợp với Flyknit để hỗ trợ và thở khi bạn cần. Chiều cao bọt cao mang lại khả năng phản hồi mềm mại và sự thoải mái lâu dài. Nó vẫn là một trong những đôi giày được thử nghiệm nhiều nhất của chúng tôi, được thiết kế để giúp bạn cảm nhận được tiềm năng khi chân của bạn chạm vào mặt đường.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (24, N'Nike Air Zoom Terra Kiger 7', N'r4.jpg', 4109000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Chạy đường mòn trong Nike Air Zoom Terra Kiger 7. Nhanh và nhẹ, giày mang lại cảm giác thoáng khí và an toàn khi bạn chạy đua trên những con đường đầy đá.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (25, N'Nike Wildhorse 7', N'r5.jpg', 3519000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Hãy thực hiện những cuộc chạy đường mòn khó khăn và khắc nghiệt đó với kết cấu chắc chắn của Nike Wildhorse 7. Phần trên mang lại khả năng thông gió bền bỉ với sự hỗ trợ khi bạn cần.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (26, N'Nike React Infinity Run FK 2 BeTrue', N'r6.jpg', 4699000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Bộ sưu tập BeTrue năm nay tôn vinh niềm tự hào bằng cách tôn vinh cộng đồng LGBTQIA + trên toàn thế giới. đưa ra một tuyên bố lâu dài. Bạn muốn nhiều hơn nữa? Hãy nhấp vào liên kết Chi tiết Sản phẩm để biết một chút lịch sử về mỗi lá cờ.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (27, N'Nike Winflo 7 Shield', N'r7.jpg', 3239000, 43, 50, CAST(N'2021-07-08' AS Date), 5, N'Đừng để thời tiết ẩm ướt ngăn cản bạn chạy. Nike Winflo 7 Shield có lớp đệm cao cấp mà bạn muốn và thêm sức kéo dẻo dai, lấy cảm hứng từ lốp xe để tăng độ bám. Phía trên được phong hóa giúp che phủ nhẹ trong các điều kiện có vấn đề.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (28, N'Nike ZoomX Vaporfly Next% 2 ''OG''', N'r8.jpg', 6609000, 43, 50, CAST(N'2021-07-11' AS Date), 5, N'Tiếp tục sự phát triển tiếp theo của tốc độ với một đôi giày đua được sản xuất để giúp bạn theo đuổi các mục tiêu và kỷ lục mới. từ 10K đến marathon, chiếc 2 vẫn có đệm đáp ứng và hỗ trợ an toàn để thúc đẩy bạn hướng tới mục tiêu tốt nhất của mình.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (29, N'Nike Mercurial Vapor 14 Elite FG', N'f1.jpg', 7319000, 43, 50, CAST(N'2021-07-09' AS Date), 2, N'Nike Mercurial Vapor 14 Elite FG có thiết kế rút gọn sử dụng ít vật liệu nhất có thể, vì vậy bạn có thể chơi nhanh nhất từ ​​đầu đến cuối. Đế có đệm mang đến cho bạn sự thoải mái không ngừng và một tấm được thiết kế đặc biệt cung cấp khả năng phản hồi tức thì để cắt nhanh hơn ở tốc độ cao.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (30, N'Nike Tiempo Legend 9 Elite FG', N'f2.jpg', 6739000, 43, 50, CAST(N'2021-07-08' AS Date), 2, N'Là một trong những chiếc Tiempo nhẹ nhất của chúng tôi cho đến nay, Nike Tiempo Legend 9 Elite FG cho phép bạn tấn công với thiết kế cấu hình thấp được sáng tạo lại cho những kẻ tấn công. trong khi đinh tán ở phía dưới cung cấp lực kéo để cắt nhanh và dừng đột ngột.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (31, N'Nike Mercurial Superfly 8 Elite CR7 FG', N'f3.jpg', 8219000, 43, 50, CAST(N'2021-07-09' AS Date), 2, N'Là một động lực không thể ngăn cản trên sân cỏ, Cristiano Ronaldo cho rằng chuyên môn của anh ấy là do tư duy tích cực của anh ấy. Nike Mercurial Superfly 8 Elite CR7 FG có họa tiết hình tia lặp lại cho phép bạn mang lại sự tích cực cho sân cỏ.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (32, N'Nike Tiempo Legend 9 Elite SE FG', N'f4.jpg', 7039000, 43, 50, CAST(N'2021-07-09' AS Date), 2, N'Là một trong những chiếc Tiempo nhẹ nhất của chúng tôi cho đến nay, Nike Tiempo Legend 9 Elite SE FG cho phép bạn tấn công với thiết kế cấu hình thấp được sáng tạo lại cho những kẻ tấn công. , trong khi các đinh tán ở phía dưới cung cấp lực kéo để cắt nhanh và dừng đột ngột.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (33, N'Nike Phantom GT Elite Dynamic Fit 3D FG', N'f5.jpg', 8219000, 43, 50, CAST(N'2021-07-10' AS Date), 2, N'Người chơi Phantom đa đoan; họ có tính toán, bản năng và có phong cách chơi khiêu khích. Nike Phantom GT Elite Dynamic Fit 3D FG bao hàm những đặc điểm này bằng biểu tượng Swoosh lặp lại và lớp phủ lấy cảm hứng từ 3D đại diện cho 3 mặt của mọi người chơi Phantom.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (34, N'Nike Mercurial Dream Speed Superfly 8 Elite FG', N'f6.jpg', 8219000, 43, 50, CAST(N'2021-07-11' AS Date), 2, N'Với giao diện mới lấy cảm hứng từ Cristiano Ronaldo, Nike Mercurial Dream Speed ​​Superfly 8 Elite FG có các bộ phận chuyên dụng cho phép bạn chơi nhanh nhất từ ​​đầu đến cuối.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (35, N'Nike Tiempo Legend 8 Elite FG', N'f7.jpg', 6739000, 43, 50, CAST(N'2021-07-07' AS Date), 2, N'Nike Tiempo Legend 8 Elite FG mang phong cách huyền thoại của da kangaroo cao cấp và thêm lưới Quadfit ôm chân trong lớp lót và lưỡi Flyknit bao quanh tạo cảm giác nâng đỡ dưới vòm chân của bạn.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (36, N'Nike Phantom GT Elite Dynamic Fit FG', N'f8.jpg', 7629000, 43, 50, CAST(N'2021-07-06' AS Date), 2, N'Nike Phantom GT Elite Dynamic Fit FG là một thiết kế theo hướng dữ liệu được thiết kế cho các cuộc tấn công chính xác. Cấu trúc Flyknit được bao phủ bởi một kết cấu nhám để cảm ứng tốt hơn, trong khi lực kéo chuyên dụng cho phép bạn kiểm soát trò chơi. Cổ áo co giãn tạo cảm giác an toàn để bạn có thể tập trung vào động tác chân của mình.')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Unit_Price], [Size], [Quantity], [Product_Date], [Category_Id], [Description]) VALUES (37, N'Nike Tiempo Legend 8 Academy MG', N'f9.jpg', 2039000, 43, 50, CAST(N'2021-07-01' AS Date), 2, N'Nike Tiempo Legend 8 Academy MG mang nét huyền thoại của da bê và thêm một tấm đế đa năng để tạo lực kéo trên các bề mặt cỏ tự nhiên và nhân tạo.')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534EAD14F70]    Script Date: 28/07/2021 8:46:00 pm ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Phone]  DEFAULT ((0)) FOR [Phone]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Checkout]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Finished_Ship]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Product_Date]  DEFAULT (getdate()) FOR [Product_Date]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([User_Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
