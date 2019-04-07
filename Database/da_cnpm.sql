/*
 Navicat Premium Data Transfer

 Source Server         : DACNPM
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : da_cnpm

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 07/04/2019 12:34:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bookTitle` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookAuthor` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publicationYear` date NULL DEFAULT NULL,
  `bookCategory` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `isActive` bit(1) NULL DEFAULT NULL,
  `bookImage` varchar(500) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `bookPrice` float(10, 2) NULL DEFAULT NULL,
  `bookQuantity` int(11) NULL DEFAULT NULL,
  `bookDescription` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL,
  `bookState` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookCategory`(`bookCategory`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `bookState`(`bookState`) USING BTREE,
  CONSTRAINT `FK3yxi7uidtobof0b96q7wpltb` FOREIGN KEY (`bookState`) REFERENCES `state` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9tgww7fu2ldi7h76a6a04m4o3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl4gnu9q801l419cj9ce5yqg8w` FOREIGN KEY (`bookCategory`) REFERENCES `bookcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`bookCategory`) REFERENCES `bookcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`bookState`) REFERENCES `state` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Chuyện Lính Tây Nam', 'Trung Sỹ ', '2019-09-03', 2, 11, b'1', 'chuyen-linh-tay-nam.jpg', 95000.00, 5, 'Gần 5 năm từ 1978 đến 1983 được gói gọn lại trong 300 trang sách chia thành 120 đoản khúc mô tả sự thực đã xảy ra ở chiến trường Tây Nam, một sự thật trần trụi “Nó không chỉ có “anh dũng lao lên” mà đó còn là cuộc sống hiện tại của ...', 2);
INSERT INTO `book` VALUES (2, 'Anh Là Tất Cả Những Gì Em Ghét Nhất ', 'Tiểu Bố Thích Ăn Bánh Trứng ', '2019-04-04', 2, 14, b'1', 'anh-la-tat-ca-nhung-gi-em-ghet-nhat.jpg', 87000.00, 10, 'Cuốn sách là tập hợp những mẩu chuyện ngắn ấm áp và hài hước, giống như một cuốn nhật ký ghi lại quãng thời gian yêu nhau của hai nhân vật chính Tiểu Bố và Tam Gia. Họ quen biết nhau từ năm đầu cấp ba, và chính thức trở thành người yêu khi học ... ', 2);
INSERT INTO `book` VALUES (3, 'Mục Đích Sống Của Một Chú Chó', 'W.Bruce Cameron ', '2019-03-01', 2, 13, b'1', 'muc-dich-song-cua-mot-chu-cho.jpg', 102000.00, 1, 'Đây là câu chuyện cảm động của một chú chó - trải qua rất nhiều kiếp sống chỉ để tự hỏi: mục đích sống của loài chó là gì. Truyện còn là những lát cắt cuộc sống và những mối quan hệ của loài người dưới cái nhìn của động vật bốn ... ', 3);
INSERT INTO `book` VALUES (4, 'Chuyện Của Heo', 'Tuyệt Đỉnh Sinh Vật ', '2016-06-09', 5, 13, b'1', 'chuyen-cua-heo.jpg', 87000.00, 1, 'Đây không phải là cuốn truyện dành cho thiếu nhi, nó là cuốn sách dành cho những người lớn muốn tìm lại sự trẻ con trong chính mình.Khi phải sống mỗi ngày, trưởng thành rồi ai cũng già đi.Hơn cả một quyển sách, được sáng tạo cần mẫn và tỉ mỉ ...', 1);
INSERT INTO `book` VALUES (5, 'Tư Duy Tích Cực Để Thành Công', 'Napoleon Hill ', '2018-03-01', 6, 12, b'1', 'tu-duy-tich-cuc-de-thanh-cong.jpg', 95000.00, 1, 'Đã sống, là phải trải qua phiền toái và thất vọng, phải đau lòng, phải rối loạn. Nhưng người ta vẫn lựa chọn sống, bất chấp tất cả những phiền não và vận rủi. Bởi trong bất cứ hoàn cảnh nào, ta luôn luôn tìm thấy những khoảnh khắc của ... ', 3);
INSERT INTO `book` VALUES (6, 'Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', '2016-10-01', 7, 12, b'1', 'tuoi-tre-dang-gia-bao-nhieu.jpg', 41000.00, 18, 'Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.\r\n\r\nBạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.\r\n\r\nBạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.\r\n\r\nSuy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.', 1);
INSERT INTO `book` VALUES (7, 'Nhà Giả Kim', 'Paulo Coelho', '2013-10-01', 1, 11, b'1', 'nha-gia-kim.jpg', 48000.00, 12, 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.\r\n\r\nTiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản', 2);
INSERT INTO `book` VALUES (8, 'Đắc Nhân Tâm (Khổ Lớn)', 'Dale Carnegie', '2016-03-01', 7, 11, b'1', 'dac-nhan-tam.jpg', 50000.00, 1, 'Tại sao Đắc Nhân Tâm luôn trong Top sách bán chạy nhất thế giới?\r\n\r\nBởi vì đó là cuốn sách mọi người đều nên đọc.', 3);
INSERT INTO `book` VALUES (9, 'Giới Hạn Của Bạn Chỉ Là Xuất Phát Điểm Của Tôi', 'Mèo Maverick', '2019-04-03', 7, 14, b'1', 'gioi-han-cua-ban-cung-chi-la-xuat-phat-diem-cua-toi.jpg', 57400.00, 12, 'Giới hạn là gì?\r\n\r\nGiới hạn liệu có phải ranh giới an toàn của mỗi người?\r\n\r\nCó lẽ không, giới hạn là để phá bỏ\r\n\r\nBởi giới hạn của bạn chỉ là xuất phát điểm của người khác.', 2);
INSERT INTO `book` VALUES (10, 'Sống Thực Tế Giữa Đời Thực Dụng', 'Mễ Mông', '2019-04-10', 7, 11, b'1', 'song-thuc-te-giua-doi-thuc-dung.jpg', 64000.00, 1, 'Con người muốn trưởng thành đều phải trải qua ba lần lột xác “phá kén hóa bướm”. Lần đầu tiên là khi nhận ra mình không phải trung tâm thế giới. Lần thứ hai là khi phát hiện ra dù cố gắng đến đâu vẫn có những việc cảm thấy thật bất lực. Lần thứ ba là khi biết rõ có những việc bản thân không thể làm được nhưng vẫn cố tranh đấu đến cùng.', 1);
INSERT INTO `book` VALUES (11, 'Khí Chất Bao Nhiêu, Hạnh Phúc Bấy Nhiêu', 'Vãn Tình', '2019-04-24', 7, 14, b'1', 'khi-chat-bao-nhieu-hanh-phuc-bay-nhieu.jpg', 83300.00, 10, 'Có ai đó từng nói:\r\n\r\n“Hãy sống như một trái dứa: Đầu đội vương miện, dáng đứng hiên ngang – Bên ngoài gai góc, bên trong ngọt ngào.”', 2);
INSERT INTO `book` VALUES (12, 'Hành Trình Về Phương Đông (Tái Bản)', 'Baird T. Spalding', '2019-04-17', 7, 14, b'1', 'hanh_trinh_ve_phuong_dong_2.jpg', 45000.00, 1, 'Hành Trình Về Phương Đông mở ra một chân trời mới về Đông Tây gặp nhau, để khoa học Minh triết hội ngộ, để Hiện đại Cổ xưa giao duyên, để Đất Trời là một. Thế giới, vì vậy đã trở nên hài hòa hơn, rộng mở, diệu kỳ hơn và, do đó, nhân văn hơn.', 3);
INSERT INTO `book` VALUES (13, 'Mắt Biếc (Tái Bản 2018)', 'Nguyễn Nhật Ánh', '2019-04-10', 8, 12, b'1', 'mat-biec-2.jpg', 54400.00, 16, 'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).', 2);
INSERT INTO `book` VALUES (14, 'Tớ Thích Cậu Hơn Cả Harvard', 'Lan Rùa', '2019-04-17', 8, 11, b'1', 'to-thich-cau-hon-ca-harvard.jpg', 63700.00, 1, 'Tớ Thích Cậu Hơn Cả Harvard gồm 2 phiên bản:\r\n\r\nBản Thông Thường: 1 cuốn sách Tớ Thích Cậu Hơn Cả Harvard\r\nBản Đặc Biệt: Tặng Kèm 1 bookmark 2 postcard và 1 ngoại truyện + chữ Ký Tác Giả Ngẫu Nhiên Số Lượng Có Hạn.\r\nĐánh dấu sự trở lại của Lan Rùa- nữ hoàng ngôn tình trong năm 2019.', 3);
INSERT INTO `book` VALUES (15, 'Đi Tìm Lẽ Sống (Tái Bản)', 'Viktor Emil Frankl', '2019-04-17', 7, 14, b'1', 'di-tim-le-song-2.jpg', 45000.00, 15, 'Đi tìm lẽ sống của Viktor Frankl là một trong những quyển sách kinh điển của thời đại. Thông thường, nếu một quyển sách chỉ có một đoạn văn, một ý tưởng có sức mạnh thay đổi cuộc sống của một người, thì chỉ riêng điều đó cũng đã đủ để chúng ta đọc đi đọc lại và dành cho nó một chỗ trên kệ sách của mình. Quyển sách này có nhiều đoạn văn như thế.', 2);
INSERT INTO `book` VALUES (16, 'Chuyện Con Mèo Dạy Hải Âu Bay (Tái Bản 2017)', 'Luis Sepulveda', '2019-12-31', 9, 12, b'1', 'chuyen-con-meo-day-hai-au-bay-2017.jpg', 29400.00, 12, 'Có tồn tại không tình thương yêu giữa mèo và hải âu?\r\n\r\nThế giới này đầy những nghịch lý và khác biệt, nhưng bỏ qua những khác biệt đó để hướng đến tình yêu thương thì cuộc sống sẽ tốt đẹp hơn.“Chuyện con mèo dạy hải âu bay” của nhà văn Chi Lê nổi tiếng Luis SéPulveda.là một câu chuyện thấm đẫm tình mèo, tình người như thế.', 2);
INSERT INTO `book` VALUES (17, 'Nghệ Thuật Tinh Tế Của Việc \"Đếch\" Quan Tâm', 'Mark Manson', '2019-04-03', 7, 13, b'1', 'nghe-thuat-tinh-te-cua-viec-dech-quan-tam.jpg', 62000.00, 1, 'Trong cuộc đời mình, tôi đã từng quan tâm về quá nhiều thứ. Đồng thời tôi cũng \"đếch\" quan tâm tới nhiều người, nhiều điều khác nữa. Và giống như con đường chưa từng được khai phá, chính những điều tôi chẳng thèm quan tâm ấy lại tạo nên sự khác biệt. ', 1);
INSERT INTO `book` VALUES (18, 'Khi Bạn Đang Mơ Thì Người Khác Đang Nỗ Lực', 'Vĩ Nhân', '2019-01-26', 7, 12, b'1', 'khi-ban-dang-mo-thi-nguoi-khac-dang-no-luc.jpg', 80500.00, 1, 'Tại sao bạn không đủ xuất sắc?\r\n\r\nCó rất nhiều người hỏi tôi: “Tại sao em có thành tích tốt, cũng không lười, nhưng vẫn không đủ xuất sắc?”. Tôi chỉ có một câu trả lời cho vấn đề này: Bạn vẫn chưa thực sự thay đổi bản thân nhưng lại ép mình phải thành công, vì thế bạn mãi mãi không biết mình có thể xuất sắc thế nào.', 3);
INSERT INTO `book` VALUES (19, 'Nghĩ Đơn Giản, Sống Đơn Thuần', 'Tolly Burkan', '2019-04-17', 7, 13, b'1', 'nghi-don-gian-song-don-thuan.jpg', 43400.00, 1, 'Từ xưa đến nay, chúng ta vẫn được định hướng để tin rằng chẳng có điều gì đáng giá mà không cần đấu tranh. Bản thân tôi cũng đã dành hàng thập kỷ để nghiên cứu về nhận định phổ biến này. Tôi chưa bao giờ để cuộc sống trở nên dễ dàng. Tuy nhiên, giờ đây, thay vì cứ cố gắng làm mọi việc đúng theo ý mình, tôi đã tìm ra chiến lược để mọi thứ diễn ra theo cách của nó.', 3);
INSERT INTO `book` VALUES (20, 'Tôi, Tương Lai Và Thế Giới', 'Nguyễn Phi Vân', '2019-04-16', 7, 11, b'1', 'toi-tuong-lai-va-the-gioi.png', 105000.00, 12, 'Tôi, Tương lai & Thế giới ra đời đúng vào thời điểm cần thiết nhất đối với Việt Nam. Môi trường sống của chúng ta, kể cả ở Việt Nam đang thay đổi ở một tốc độ chưa từng có do Cách mạng công nghiệp 4.0 đem lại. Trong sự thay đổi ấy, luật tiến hóa của vạn vật sẽ là tấm lưới chọn lọc những ai tồn tại. Đó không phải người thông minh nhất, cũng không phải người mạnh nhất hay nhanh nhất mà là người có khả năng thích nghi cao nhất.', 2);

-- ----------------------------
-- Table structure for bookcategory
-- ----------------------------
DROP TABLE IF EXISTS `bookcategory`;
CREATE TABLE `bookcategory`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookcategory
-- ----------------------------
INSERT INTO `bookcategory` VALUES (1, 'Sách Văn Học Trong Nước');
INSERT INTO `bookcategory` VALUES (2, 'Sách Văn Học Nước Ngoài');
INSERT INTO `bookcategory` VALUES (3, 'Sách Kinh Tế');
INSERT INTO `bookcategory` VALUES (4, 'Sách Ngoại Văn');
INSERT INTO `bookcategory` VALUES (5, 'Truyện Tranh Khác');
INSERT INTO `bookcategory` VALUES (6, 'Sách Phát Triển Bản Thân');
INSERT INTO `bookcategory` VALUES (7, 'Kỹ Năng Sống');
INSERT INTO `bookcategory` VALUES (8, 'Tiểu Thuyết Lãng Mạn');
INSERT INTO `bookcategory` VALUES (9, 'Văn Học Thiếu Nhi');

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES (1, 'Mượn');
INSERT INTO `state` VALUES (2, 'Bán');
INSERT INTO `state` VALUES (3, 'Trao đổi');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(320) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `password` varchar(300) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (11, 'ngà', 'huynhphuocnga97@gmail.com', '$2a$10$yVpDZ2nH4ojN0QFirQlqHOk2uOxRbpNdrJOedn5AQAtg3BEkqF64K', NULL);
INSERT INTO `user` VALUES (12, 'Thanh Phương', 'phuongbestad@gmail.com', 'tuididuongcorong', NULL);
INSERT INTO `user` VALUES (13, 'Quang Thiện', 'thienchamhoc@gmail.com', 'ahihidongoc', NULL);
INSERT INTO `user` VALUES (14, 'Hồng Thái', 'thaibestyasou@gmail.com', '$2a$10$jGJXYfi8iJ7yYUUT7fn5J.FDlQ7w6eCuVvUnsb3Q0UffLIu5osF72', NULL);
INSERT INTO `user` VALUES (15, 'm', 'nga@gmail.com', '$2a$10$3ejLuEkacBv9jCBcTzUZOeZCL/Wk00OOCW3EEcYJhumlp7Il6BD4W', NULL);
INSERT INTO `user` VALUES (16, 'Ngô Thái', 'ngohongthai011@gmail.com', '$2a$10$jGJXYfi8iJ7yYUUT7fn5J.FDlQ7w6eCuVvUnsb3Q0UffLIu5osF72', NULL);

SET FOREIGN_KEY_CHECKS = 1;
