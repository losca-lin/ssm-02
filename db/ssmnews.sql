/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727 (5.7.27-log)
 Source Host           : localhost:3306
 Source Schema         : ssmnews

 Target Server Type    : MySQL
 Target Server Version : 50727 (5.7.27-log)
 File Encoding         : 65001

 Date: 21/05/2023 19:51:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `newsId` int(11) NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentDate` datetime NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, '1.1.1.1', 'tt', 1, '赞赞赞', '2021-11-30 18:21:32', 1);
INSERT INTO `t_comment` VALUES (2, '2.2.2.2', 'tt', 3, '干的漂亮！', '2021-11-30 14:31:37', 0);
INSERT INTO `t_comment` VALUES (3, '3.3.3.3', 'tt', 5, '已收藏', '2021-11-30 10:21:32', 0);
INSERT INTO `t_comment` VALUES (4, '4.4.4.4', 'tt', 7, '很有意义', '2021-11-30 14:22:32', 1);
INSERT INTO `t_comment` VALUES (5, '5.5.5.5', 'tt', 9, '支持', '2021-11-29 14:29:32', 1);
INSERT INTO `t_comment` VALUES (9, '0:0:0:0:0:0:0:1', 'tt', 10, '很棒', '2021-11-29 09:27:27', 1);
INSERT INTO `t_comment` VALUES (10, '0:0:0:0:0:0:0:1', 'tt', 8, '一定不负期望', '2021-11-28 08:11:37', 1);
INSERT INTO `t_comment` VALUES (11, '0:0:0:0:0:0:0:1', 'tt', 11, '未来可期！', '2021-11-22 13:20:44', 1);
INSERT INTO `t_comment` VALUES (12, '0:0:0:0:0:0:0:1', 'tt', 13, 'aafs', '2023-04-24 23:13:48', 1);
INSERT INTO `t_comment` VALUES (13, '0:0:0:0:0:0:0:1', 'tt', 4, '哈哈', '2023-04-24 23:22:10', 1);
INSERT INTO `t_comment` VALUES (14, '0:0:0:0:0:0:0:1', 'tt', 15, '你好啊', '2023-04-27 15:41:53', 1);
INSERT INTO `t_comment` VALUES (15, '0:0:0:0:0:0:0:1', 'tt', 16, '我来了', '2023-05-03 23:04:58', 0);
INSERT INTO `t_comment` VALUES (16, '0:0:0:0:0:0:0:1', 'tt', 27, '哈哈', '2023-05-10 22:24:21', 1);
INSERT INTO `t_comment` VALUES (17, '0:0:0:0:0:0:0:1', 'tt', 27, '哎哟喂', '2023-05-10 22:35:18', 0);
INSERT INTO `t_comment` VALUES (18, '0:0:0:0:0:0:0:1', 'tt', 27, '好哦', '2023-05-10 22:46:22', 1);

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderNo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES (1, '百度', 'https://www.baidu.com/', 1);
INSERT INTO `t_link` VALUES (2, '京东', 'https://www.jd.com/', 2);
INSERT INTO `t_link` VALUES (3, '淘宝', 'https://www.taobao.com', 3);

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `releaseDate` datetime NULL DEFAULT NULL,
  `clickHit` int(11) NULL DEFAULT NULL,
  `replyHit` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `typeId` int(11) NULL DEFAULT NULL,
  `keyWord` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `pname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeId`(`typeId`) USING BTREE,
  CONSTRAINT `t_news_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `t_newstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (1, 'NFT：通往元宇宙，还是走向大骗局？', ' 当NFT遇上艺术品，一张图片、一首歌、一段视频，甚至一个头像都可以与一串代码“擦出火花”，身价发生几何倍数暴涨，突破现实世界认知。NFT全称为Non-Fungible Tokens，即“非同质化代币”。“从技术上来看，NFT是一种基于区块链技术的契约的数字化凭证。”中国电子技术标准化研究院区块链研究室主任李鸣告诉记者， NFT具有可验证、唯一、不可分割和可追溯等特性，可以用来标记特定资产的所有权。今年以来，明星、大V、企业纷纷打造推出自己的NFT产品，数字艺术品俨然成为NFT落地最快的应用场景之一。当“万物皆可NFT”，这串连接虚拟与现实的“神秘代码”，会成为通往元宇宙世界的关键密钥，还是又一场币圈和资本炒作下的零和游戏？很多问题需要提前思考。', '2021-11-25 09:45:44', 7, 0, '<p style=\"text-align: justify;line-height: 1.5;text-indent: 2em;font-family: 宋体;font-size: 14px;margin-top: 1em;margin-bottom: 1em;-ms-text-justify: inter-ideograph\">1月8日下午，省委组织部干部五处副调研员曾志学、省委教育工委干部处副处长林筱毅莅临我校调研指导“组团式”帮扶工作，在办公楼一号会议室召开调研座谈会。我校党委副书记黄达海，校长助理、华师帮扶队队长张正栋，党委常委、组织部部长邓逢光，华师帮扶队全体成员参加座谈。</p><p style=\"text-align: justify;line-height: 1.5;text-indent: 2em;font-family: 宋体;font-size: 14px;margin-top: 1em;margin-bottom: 1em;-ms-text-justify: inter-ideograph\">张正栋代表华师帮扶队汇报了一年围绕“一中心两支柱三对接四任务”帮扶工作思路开展帮扶工作情况、存在主要问题和下一步工作计划，其他帮扶队员分别畅谈了对口帮扶单位的帮扶措施与感受体会。</p><p style=\"text-align: justify;line-height: 1.5;text-indent: 2em;font-family: 宋体;font-size: 14px;margin-top: 1em;margin-bottom: 1em;-ms-text-justify: inter-ideograph\">黄达海代表学校党委对省委组织部、省委教育工委开展“组团式”帮扶工作助推学校“冲一流、补短板、强特色”表示感谢，对华师的全力支持和帮扶队员担当意识、无私奉献精神致以崇高敬意。他认为，省委组织部和省委教育工委开展的“组团式”帮扶工作是英明的决策。他指出，华师帮扶队的帮扶思路清晰，帮扶中心突出，帮扶成效显著，在短短一年时间内围绕学校的申硕做了大量卓有成效的工作。他希望，省委组织部、省委教育工委继续给予帮扶工作更多关心，华师对我校的帮扶工作需要进一步完善机制，开展精准帮扶，使帮扶工作实效更突显。</p><p style=\"text-align: justify;line-height: 1.5;text-indent: 2em;font-family: 宋体;font-size: 14px;margin-top: 1em;margin-bottom: 1em;-ms-text-justify: inter-ideograph\">林筱毅对华师帮扶队工作给予充分的肯定，认为帮扶队制定的帮扶工作思路有很强的指导性，短短一年的时间里为岭南师院申硕工作、学科建设、“新师范”建设、科研平台和科研项目等做了很多具体且有成效的工作。她强调，两校党委高度重视，提早科学谋划，立足实际，扎实推进帮扶工作，成效初显。华师帮扶队队员讲政治、顾大局、站位高，全身心投入，有奉献有担当。她希望两校党委和帮扶团队要继续按照上级有关文件精神和对口帮扶框架协议要求，创新帮扶方式，充分发挥帮扶团队的示范引领作用，面深入推进帮扶工作，高质量完成“组团式”帮扶工作任务。</p><p style=\"text-align: justify;line-height: 1.5;text-indent: 2em;font-family: 宋体;font-size: 14px;margin-top: 1em;margin-bottom: 1em;-ms-text-justify: inter-ideograph\">曾志学认为华师对岭师的“组团式”帮扶工作具有合作实、思路清、成效好、奉献多的特点，希望两校及时总结经验，建立长效机制，在帮扶任务结束时取得实实在在的成效。</p><p><br/></p>', 1, '元宇宙', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (2, '国家计算机病毒应急处理中心监测发现十七款违法移动应用', '国家计算机病毒应急处理中心近期通过互联网监测发现17款移动应用存在隐私不合规行为，违反《网络安全法》《个人信息保护法》相关规定，涉嫌超范围采集个人隐私信息。', '2021-11-23 09:47:40', 0, 0, '<p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">1、App以默认选择同意隐私政策等非明示方式征求用户同意，涉嫌隐私不合规。涉及1款App如下：《趣出行》（版本7.1.1，华为应用市场）。<span style=\"background-color: rgb(255, 255, 255);\">针对上述情况，国家计算机病毒应急处理中心提醒广大手机用户首先谨慎下载使用以上违法、违规移动App，同时要注意认真阅读App的用户协议和隐私政策说明，不随意开放和同意不必要的隐私权限，不随意输入个人隐私信息，定期维护和清理相关数据，避免个人隐私信息被泄露。</span>，</p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\"></p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">“参加学习大讲堂，对我来说是一次思想大洗礼、能力大提升。”赖政融说，这让自己对党的创新理论有了更深刻的认识，也坚定了自己向党组织靠拢的决心。付隆琛为了不断完善宣讲稿，主动查阅资料学习理论知识，觉得自己的思想更加充实了，对“心中有理想，脚下有力量”这名话的理解更加深入透切了。</p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">马克思主义学院党总支书记谢应明介绍，概论课党支部是省委教育工委的“三型”党支部，也是省委教育工委、教育部党建“双创”工作样板培育创建单位，通过党建示范引领，实行与二级学院学生党支部签订共建协议，指导学生建立学习小组，构建学习平台和良性互动机制，着力打造堂上堂下、课内课外、师生之间、学生之间、小组之间“五位一体”的学习共同体，实现师生树信仰、建忠诚、讲奉献的目标。</p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">为了使宣讲深入人心，宣讲员通过幻灯片、短视频等多种形式，让宣讲变得生动有趣，首期活动在学生中引起了强烈的反响。学生党员张颂轩认为，宣讲员结合自身专业、经历和特长来讲述自己对习近平新时代中国特色社会主义思想的理解让人印象深刻。许多同学由衷地表示，这样的思政课形式新颖。</p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">马克思主义学院院长何增光教授认为，这是思政课教学的一次创新，实现了由教师讲思政课向学生讲思政课的转变。学生通过参与其中，带来的不仅是自我学习能力的突破，更是新思想新理念给其带来一生的受益。</p><p style=\"TEXT-ALIGN: justify; LINE-HEIGHT: 1.5; MARGIN-TOP: 1em; TEXT-INDENT: 2em; FONT-FAMILY: 宋体; MARGIN-BOTTOM: 1em; FONT-SIZE: 10.5pt\">马克思主义学院计划在两年内，依托大学生学习大讲堂，组建100个学习小组，教师和学生学习小组形成学前辅导、学中交流、学后宣讲的良性互动机制，每个学期开展4次宣讲，重点围绕“学习新思想”“社会主义好”“中国共产党为什么能、为什么行、为什么好”“强国有我”“守护祖国意识形态南大门”等板块展开宣讲。</p><p><br/></p>', 1, '“宣讲员”', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (3, '传承好老祖宗的技艺（众生相）', '　提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。', '2021-01-14 08:29:20', 5, 0, '<p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 20px;\">　</span><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。&nbsp;</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　在北京京郊靛庄花丝厂内，笔者见到了“熊氏珐琅”的第三代传承人熊松涛先生，听他讲述自己和家族的非遗传承故事。 <br/>　　熊师傅今年44岁，从事景泰蓝技艺传承工作已经20年了。他的掐丝珐琅表盘工艺填补了国内珐琅腕表和收藏界的一项空白，曾多次参与国家重大外事活动的国礼制作，他的作品《吉祥八宝孔雀瓶》等在国内外的比赛中屡获大奖。<br/>　　清朝设置手工坊来给宫廷制作珐琅器，熊师傅的祖父将这项宫廷技艺传承给熊师傅的父亲。1969年靛庄花丝厂成立，熊先生的父亲成为厂子的主要负责人，在厂里工作了50多年。<br/>　　熊师傅从小便在厂里长大，对景泰蓝技艺十分熟悉，直到大学毕业后他才下定决心要传承好这项技艺，“不能让老祖宗的技艺在咱们手里断送。”<br/>　　在熊氏珐琅馆里有一件特殊的展品，它是由废弃的表盘构成的。“珐琅表盘的废品率为90%甚至更高，我把这些废品二次创作，也算是不浪费。”熊师傅笑眯眯地向我们介绍。据他回忆，这些废品的总重量可达几百斤。 <br/>　　实际上，景泰蓝工艺复杂而繁多，只要有一道工艺稍有差池，这件作品便会成为废品，“我们绝不允许一件废品从厂里流出去。以前有人想收购我们的废品再转手卖出去，我们都拒绝了。”<br/>　　统的景泰蓝是铜胎制成，熊师傅不断改进工艺，研发出改良版的银胎景泰蓝制品。银的反光性、延展性较好，氧化程度慢，是熊师傅多方比对之后找到的理想材料。</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　此外，熊氏珐琅还率先采用超声波来清洗景泰蓝工艺品，并且在用料环节十分讲究，为了减少产品中的气泡瑕疵，就采用纯净水进行生产。熊氏珐琅还将原来70种釉彩颜色扩充到600种，极大丰富了作品的表现力。</span></p><p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 18px;\">　　　　　　　　　　　　　　　　　　　　　　　　　　　更新日期：2021年01月14日</span></p><p><br/></p>', 5, '传承', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (4, '北京新增7家A类定点医疗机构', '日前，北京市医疗保险事务管理中心发布通知，增补北京清华长庚医院等7家定点医疗机构为A类定点医疗机构。据悉，截至目前，北京市参保人员无需选择直接就医的医疗机构包括39家A类定点医疗机构、164家中医定点医疗机构、160家专科定点医疗机构以及2200余家定点社区卫生服务机构。', '2021-11-29 10:07:23', 12, 2, '<p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\">通告中指出，对全市基本医疗保险定点医疗机构从服务量情况、总额费用控制情况、次均费用控制情况和医疗保险管理情况等方面进行考评，决定在原有北京市基本医疗保险A类定点医疗机构的基础上，从</span><span style=\"font-size: 19px\">11月25日</span><span style=\"font-family: 宋体;font-size: 19px\">起，增补北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院7家定点医疗机构为A类定点医疗机构。这意味着，北京的A类定点医疗机构增至39家。据悉，参保人可直接持卡去A类定点医疗机构就医，而无需事先选择其为自己的定点机构。</span></p><p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\"><br/></span></p><p style=\"text-align: center\"><span style=\"color: rgb(51, 51, 51);font-family: 黑体;font-size: 21px\">通告</span></p><p style=\"text-align: center\">&nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　据悉，北京原有的A类定点医疗机构为32家，包括协和医院、同仁医院等。而所谓A类定点，即参保人无需事先选定其为就医的定点，可直接持卡就医。</span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px;text-indent: 38px\"><span style=\"font-family: 宋体;font-size: 19px\">市医保局强调，新增A类定点医疗机构要严格执行基本医疗保险相关管理规定及定点医疗机构服务协议书，加强内部管理，提高医疗保险服务水平，严格控制医疗费用，更好地为参保人员服务。各区医疗保险管理部门要加强对辖区内A类定点医疗机构的管理，同时向参保人员做好政策宣传工作。</span><span style=\"font-family: 宋体;font-size: 19px\"></span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　中国医学科学院北京协和医院、首都医科大学附属北京同仁医院、首都医科大学宣武医院、首都医科大学附属北京友谊医院、北京大学第一医院、北京大学人民医院、北京大学第三医院、北京积水潭医院、中国中医科学院广安门医院、首都医科大学附属北京朝阳医院、中日友好医院、北京大学首钢医院、首都医科大学附属北京中医医院、首都医科大学附属北京天坛医院、北京世纪坛医院(北京铁路总医院)、北京市健宫医院、北京市房山区良乡医院、北京市大兴区人民医院、北京市石景山医院、北京医院、首都医科大学附属北京安贞医院、首都医科大学附属北京潞河医院、国家电网公司北京电力医院、航空总医院、北京市海淀医院、北京市垂杨柳医院、北京市昌平区医院、北京市顺义区医院、北京市平谷区医院、北京市密云区医院、北京市延庆区医院、北京怀柔医院、北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院。</span></p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　</span></p><p style=\"text-align: right; line-height: 31px;\"><span style=\"font-family: 宋体;font-size: 19px\">（人民网）</span></p>', 5, '医疗机构', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (5, '传承好老祖宗的技艺（众生相）', '　提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。', '2021-01-14 08:29:20', 4, 0, '<p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 20px;\">　</span><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。&nbsp;</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　在北京京郊靛庄花丝厂内，笔者见到了“熊氏珐琅”的第三代传承人熊松涛先生，听他讲述自己和家族的非遗传承故事。 <br/>　　熊师傅今年44岁，从事景泰蓝技艺传承工作已经20年了。他的掐丝珐琅表盘工艺填补了国内珐琅腕表和收藏界的一项空白，曾多次参与国家重大外事活动的国礼制作，他的作品《吉祥八宝孔雀瓶》等在国内外的比赛中屡获大奖。<br/>　　清朝设置手工坊来给宫廷制作珐琅器，熊师傅的祖父将这项宫廷技艺传承给熊师傅的父亲。1969年靛庄花丝厂成立，熊先生的父亲成为厂子的主要负责人，在厂里工作了50多年。<br/>　　熊师傅从小便在厂里长大，对景泰蓝技艺十分熟悉，直到大学毕业后他才下定决心要传承好这项技艺，“不能让老祖宗的技艺在咱们手里断送。”<br/>　　在熊氏珐琅馆里有一件特殊的展品，它是由废弃的表盘构成的。“珐琅表盘的废品率为90%甚至更高，我把这些废品二次创作，也算是不浪费。”熊师傅笑眯眯地向我们介绍。据他回忆，这些废品的总重量可达几百斤。 <br/>　　实际上，景泰蓝工艺复杂而繁多，只要有一道工艺稍有差池，这件作品便会成为废品，“我们绝不允许一件废品从厂里流出去。以前有人想收购我们的废品再转手卖出去，我们都拒绝了。”<br/>　　统的景泰蓝是铜胎制成，熊师傅不断改进工艺，研发出改良版的银胎景泰蓝制品。银的反光性、延展性较好，氧化程度慢，是熊师傅多方比对之后找到的理想材料。</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　此外，熊氏珐琅还率先采用超声波来清洗景泰蓝工艺品，并且在用料环节十分讲究，为了减少产品中的气泡瑕疵，就采用纯净水进行生产。熊氏珐琅还将原来70种釉彩颜色扩充到600种，极大丰富了作品的表现力。</span></p><p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 18px;\">　　　　　　　　　　　　　　　　　　　　　　　　　　　更新日期：2021年01月14日</span></p><p><br/></p>', 5, '传承', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (6, '北京新增7家A类定点医疗机构', '日前，北京市医疗保险事务管理中心发布通知，增补北京清华长庚医院等7家定点医疗机构为A类定点医疗机构。据悉，截至目前，北京市参保人员无需选择直接就医的医疗机构包括39家A类定点医疗机构、164家中医定点医疗机构、160家专科定点医疗机构以及2200余家定点社区卫生服务机构。', '2021-11-29 10:07:23', 6, 1, '<p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\">通告中指出，对全市基本医疗保险定点医疗机构从服务量情况、总额费用控制情况、次均费用控制情况和医疗保险管理情况等方面进行考评，决定在原有北京市基本医疗保险A类定点医疗机构的基础上，从</span><span style=\"font-size: 19px\">11月25日</span><span style=\"font-family: 宋体;font-size: 19px\">起，增补北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院7家定点医疗机构为A类定点医疗机构。这意味着，北京的A类定点医疗机构增至39家。据悉，参保人可直接持卡去A类定点医疗机构就医，而无需事先选择其为自己的定点机构。</span></p><p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\"><br/></span></p><p style=\"text-align: center\"><span style=\"color: rgb(51, 51, 51);font-family: 黑体;font-size: 21px\">通告</span></p><p style=\"text-align: center\">&nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　据悉，北京原有的A类定点医疗机构为32家，包括协和医院、同仁医院等。而所谓A类定点，即参保人无需事先选定其为就医的定点，可直接持卡就医。</span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px;text-indent: 38px\"><span style=\"font-family: 宋体;font-size: 19px\">市医保局强调，新增A类定点医疗机构要严格执行基本医疗保险相关管理规定及定点医疗机构服务协议书，加强内部管理，提高医疗保险服务水平，严格控制医疗费用，更好地为参保人员服务。各区医疗保险管理部门要加强对辖区内A类定点医疗机构的管理，同时向参保人员做好政策宣传工作。</span><span style=\"font-family: 宋体;font-size: 19px\"></span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　中国医学科学院北京协和医院、首都医科大学附属北京同仁医院、首都医科大学宣武医院、首都医科大学附属北京友谊医院、北京大学第一医院、北京大学人民医院、北京大学第三医院、北京积水潭医院、中国中医科学院广安门医院、首都医科大学附属北京朝阳医院、中日友好医院、北京大学首钢医院、首都医科大学附属北京中医医院、首都医科大学附属北京天坛医院、北京世纪坛医院(北京铁路总医院)、北京市健宫医院、北京市房山区良乡医院、北京市大兴区人民医院、北京市石景山医院、北京医院、首都医科大学附属北京安贞医院、首都医科大学附属北京潞河医院、国家电网公司北京电力医院、航空总医院、北京市海淀医院、北京市垂杨柳医院、北京市昌平区医院、北京市顺义区医院、北京市平谷区医院、北京市密云区医院、北京市延庆区医院、北京怀柔医院、北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院。</span></p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　</span></p><p style=\"text-align: right; line-height: 31px;\"><span style=\"font-family: 宋体;font-size: 19px\">（人民网）</span></p>', 5, '医疗机构', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (7, '传承好老祖宗的技艺（众生相）', '　提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。', '2021-01-14 08:29:20', 4, 0, '<p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 20px;\">　</span><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。&nbsp;</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　在北京京郊靛庄花丝厂内，笔者见到了“熊氏珐琅”的第三代传承人熊松涛先生，听他讲述自己和家族的非遗传承故事。 <br/>　　熊师傅今年44岁，从事景泰蓝技艺传承工作已经20年了。他的掐丝珐琅表盘工艺填补了国内珐琅腕表和收藏界的一项空白，曾多次参与国家重大外事活动的国礼制作，他的作品《吉祥八宝孔雀瓶》等在国内外的比赛中屡获大奖。<br/>　　清朝设置手工坊来给宫廷制作珐琅器，熊师傅的祖父将这项宫廷技艺传承给熊师傅的父亲。1969年靛庄花丝厂成立，熊先生的父亲成为厂子的主要负责人，在厂里工作了50多年。<br/>　　熊师傅从小便在厂里长大，对景泰蓝技艺十分熟悉，直到大学毕业后他才下定决心要传承好这项技艺，“不能让老祖宗的技艺在咱们手里断送。”<br/>　　在熊氏珐琅馆里有一件特殊的展品，它是由废弃的表盘构成的。“珐琅表盘的废品率为90%甚至更高，我把这些废品二次创作，也算是不浪费。”熊师傅笑眯眯地向我们介绍。据他回忆，这些废品的总重量可达几百斤。 <br/>　　实际上，景泰蓝工艺复杂而繁多，只要有一道工艺稍有差池，这件作品便会成为废品，“我们绝不允许一件废品从厂里流出去。以前有人想收购我们的废品再转手卖出去，我们都拒绝了。”<br/>　　统的景泰蓝是铜胎制成，熊师傅不断改进工艺，研发出改良版的银胎景泰蓝制品。银的反光性、延展性较好，氧化程度慢，是熊师傅多方比对之后找到的理想材料。</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　此外，熊氏珐琅还率先采用超声波来清洗景泰蓝工艺品，并且在用料环节十分讲究，为了减少产品中的气泡瑕疵，就采用纯净水进行生产。熊氏珐琅还将原来70种釉彩颜色扩充到600种，极大丰富了作品的表现力。</span></p><p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 18px;\">　　　　　　　　　　　　　　　　　　　　　　　　　　　更新日期：2021年01月14日</span></p><p><br/></p>', 5, '传承', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (8, '北京新增7家A类定点医疗机构', '日前，北京市医疗保险事务管理中心发布通知，增补北京清华长庚医院等7家定点医疗机构为A类定点医疗机构。据悉，截至目前，北京市参保人员无需选择直接就医的医疗机构包括39家A类定点医疗机构、164家中医定点医疗机构、160家专科定点医疗机构以及2200余家定点社区卫生服务机构。', '2021-11-29 10:07:23', 6, 1, '<p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\">通告中指出，对全市基本医疗保险定点医疗机构从服务量情况、总额费用控制情况、次均费用控制情况和医疗保险管理情况等方面进行考评，决定在原有北京市基本医疗保险A类定点医疗机构的基础上，从</span><span style=\"font-size: 19px\">11月25日</span><span style=\"font-family: 宋体;font-size: 19px\">起，增补北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院7家定点医疗机构为A类定点医疗机构。这意味着，北京的A类定点医疗机构增至39家。据悉，参保人可直接持卡去A类定点医疗机构就医，而无需事先选择其为自己的定点机构。</span></p><p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\"><br/></span></p><p style=\"text-align: center\"><span style=\"color: rgb(51, 51, 51);font-family: 黑体;font-size: 21px\">通告</span></p><p style=\"text-align: center\">&nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　据悉，北京原有的A类定点医疗机构为32家，包括协和医院、同仁医院等。而所谓A类定点，即参保人无需事先选定其为就医的定点，可直接持卡就医。</span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px;text-indent: 38px\"><span style=\"font-family: 宋体;font-size: 19px\">市医保局强调，新增A类定点医疗机构要严格执行基本医疗保险相关管理规定及定点医疗机构服务协议书，加强内部管理，提高医疗保险服务水平，严格控制医疗费用，更好地为参保人员服务。各区医疗保险管理部门要加强对辖区内A类定点医疗机构的管理，同时向参保人员做好政策宣传工作。</span><span style=\"font-family: 宋体;font-size: 19px\"></span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　中国医学科学院北京协和医院、首都医科大学附属北京同仁医院、首都医科大学宣武医院、首都医科大学附属北京友谊医院、北京大学第一医院、北京大学人民医院、北京大学第三医院、北京积水潭医院、中国中医科学院广安门医院、首都医科大学附属北京朝阳医院、中日友好医院、北京大学首钢医院、首都医科大学附属北京中医医院、首都医科大学附属北京天坛医院、北京世纪坛医院(北京铁路总医院)、北京市健宫医院、北京市房山区良乡医院、北京市大兴区人民医院、北京市石景山医院、北京医院、首都医科大学附属北京安贞医院、首都医科大学附属北京潞河医院、国家电网公司北京电力医院、航空总医院、北京市海淀医院、北京市垂杨柳医院、北京市昌平区医院、北京市顺义区医院、北京市平谷区医院、北京市密云区医院、北京市延庆区医院、北京怀柔医院、北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院。</span></p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　</span></p><p style=\"text-align: right; line-height: 31px;\"><span style=\"font-family: 宋体;font-size: 19px\">（人民网）</span></p>', 5, '医疗机构', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (9, '传承好老祖宗的技艺（众生相）', '　提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。', '2021-01-14 08:29:20', 4, 0, '<p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 20px;\">　</span><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。&nbsp;</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　在北京京郊靛庄花丝厂内，笔者见到了“熊氏珐琅”的第三代传承人熊松涛先生，听他讲述自己和家族的非遗传承故事。 <br/>　　熊师傅今年44岁，从事景泰蓝技艺传承工作已经20年了。他的掐丝珐琅表盘工艺填补了国内珐琅腕表和收藏界的一项空白，曾多次参与国家重大外事活动的国礼制作，他的作品《吉祥八宝孔雀瓶》等在国内外的比赛中屡获大奖。<br/>　　清朝设置手工坊来给宫廷制作珐琅器，熊师傅的祖父将这项宫廷技艺传承给熊师傅的父亲。1969年靛庄花丝厂成立，熊先生的父亲成为厂子的主要负责人，在厂里工作了50多年。<br/>　　熊师傅从小便在厂里长大，对景泰蓝技艺十分熟悉，直到大学毕业后他才下定决心要传承好这项技艺，“不能让老祖宗的技艺在咱们手里断送。”<br/>　　在熊氏珐琅馆里有一件特殊的展品，它是由废弃的表盘构成的。“珐琅表盘的废品率为90%甚至更高，我把这些废品二次创作，也算是不浪费。”熊师傅笑眯眯地向我们介绍。据他回忆，这些废品的总重量可达几百斤。 <br/>　　实际上，景泰蓝工艺复杂而繁多，只要有一道工艺稍有差池，这件作品便会成为废品，“我们绝不允许一件废品从厂里流出去。以前有人想收购我们的废品再转手卖出去，我们都拒绝了。”<br/>　　统的景泰蓝是铜胎制成，熊师傅不断改进工艺，研发出改良版的银胎景泰蓝制品。银的反光性、延展性较好，氧化程度慢，是熊师傅多方比对之后找到的理想材料。</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　此外，熊氏珐琅还率先采用超声波来清洗景泰蓝工艺品，并且在用料环节十分讲究，为了减少产品中的气泡瑕疵，就采用纯净水进行生产。熊氏珐琅还将原来70种釉彩颜色扩充到600种，极大丰富了作品的表现力。</span></p><p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 18px;\">　　　　　　　　　　　　　　　　　　　　　　　　　　　更新日期：2021年01月14日</span></p><p><br/></p>', 5, '传承', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (10, '北京新增7家A类定点医疗机构', '日前，北京市医疗保险事务管理中心发布通知，增补北京清华长庚医院等7家定点医疗机构为A类定点医疗机构。据悉，截至目前，北京市参保人员无需选择直接就医的医疗机构包括39家A类定点医疗机构、164家中医定点医疗机构、160家专科定点医疗机构以及2200余家定点社区卫生服务机构。', '2021-11-29 10:07:23', 6, 1, '<p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\">通告中指出，对全市基本医疗保险定点医疗机构从服务量情况、总额费用控制情况、次均费用控制情况和医疗保险管理情况等方面进行考评，决定在原有北京市基本医疗保险A类定点医疗机构的基础上，从</span><span style=\"font-size: 19px\">11月25日</span><span style=\"font-family: 宋体;font-size: 19px\">起，增补北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院7家定点医疗机构为A类定点医疗机构。这意味着，北京的A类定点医疗机构增至39家。据悉，参保人可直接持卡去A类定点医疗机构就医，而无需事先选择其为自己的定点机构。</span></p><p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\"><br/></span></p><p style=\"text-align: center\"><span style=\"color: rgb(51, 51, 51);font-family: 黑体;font-size: 21px\">通告</span></p><p style=\"text-align: center\">&nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　据悉，北京原有的A类定点医疗机构为32家，包括协和医院、同仁医院等。而所谓A类定点，即参保人无需事先选定其为就医的定点，可直接持卡就医。</span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px;text-indent: 38px\"><span style=\"font-family: 宋体;font-size: 19px\">市医保局强调，新增A类定点医疗机构要严格执行基本医疗保险相关管理规定及定点医疗机构服务协议书，加强内部管理，提高医疗保险服务水平，严格控制医疗费用，更好地为参保人员服务。各区医疗保险管理部门要加强对辖区内A类定点医疗机构的管理，同时向参保人员做好政策宣传工作。</span><span style=\"font-family: 宋体;font-size: 19px\"></span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　中国医学科学院北京协和医院、首都医科大学附属北京同仁医院、首都医科大学宣武医院、首都医科大学附属北京友谊医院、北京大学第一医院、北京大学人民医院、北京大学第三医院、北京积水潭医院、中国中医科学院广安门医院、首都医科大学附属北京朝阳医院、中日友好医院、北京大学首钢医院、首都医科大学附属北京中医医院、首都医科大学附属北京天坛医院、北京世纪坛医院(北京铁路总医院)、北京市健宫医院、北京市房山区良乡医院、北京市大兴区人民医院、北京市石景山医院、北京医院、首都医科大学附属北京安贞医院、首都医科大学附属北京潞河医院、国家电网公司北京电力医院、航空总医院、北京市海淀医院、北京市垂杨柳医院、北京市昌平区医院、北京市顺义区医院、北京市平谷区医院、北京市密云区医院、北京市延庆区医院、北京怀柔医院、北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院。</span></p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　</span></p><p style=\"text-align: right; line-height: 31px;\"><span style=\"font-family: 宋体;font-size: 19px\">（人民网）</span></p>', 5, '医疗机构', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (11, '传承好老祖宗的技艺（众生相）', '　提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。', '2021-01-14 08:29:20', 4, 0, '<p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 20px;\">　</span><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">提起景泰蓝，那可谓是大名鼎鼎。景泰蓝即铜胎掐丝珐琅，它位于“燕京八绝”之首，清末有诗曰“就中绝技高天下，压倒五洲景泰蓝”，具有极高的艺术价值。&nbsp;</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　在北京京郊靛庄花丝厂内，笔者见到了“熊氏珐琅”的第三代传承人熊松涛先生，听他讲述自己和家族的非遗传承故事。 <br/>　　熊师傅今年44岁，从事景泰蓝技艺传承工作已经20年了。他的掐丝珐琅表盘工艺填补了国内珐琅腕表和收藏界的一项空白，曾多次参与国家重大外事活动的国礼制作，他的作品《吉祥八宝孔雀瓶》等在国内外的比赛中屡获大奖。<br/>　　清朝设置手工坊来给宫廷制作珐琅器，熊师傅的祖父将这项宫廷技艺传承给熊师傅的父亲。1969年靛庄花丝厂成立，熊先生的父亲成为厂子的主要负责人，在厂里工作了50多年。<br/>　　熊师傅从小便在厂里长大，对景泰蓝技艺十分熟悉，直到大学毕业后他才下定决心要传承好这项技艺，“不能让老祖宗的技艺在咱们手里断送。”<br/>　　在熊氏珐琅馆里有一件特殊的展品，它是由废弃的表盘构成的。“珐琅表盘的废品率为90%甚至更高，我把这些废品二次创作，也算是不浪费。”熊师傅笑眯眯地向我们介绍。据他回忆，这些废品的总重量可达几百斤。 <br/>　　实际上，景泰蓝工艺复杂而繁多，只要有一道工艺稍有差池，这件作品便会成为废品，“我们绝不允许一件废品从厂里流出去。以前有人想收购我们的废品再转手卖出去，我们都拒绝了。”<br/>　　统的景泰蓝是铜胎制成，熊师傅不断改进工艺，研发出改良版的银胎景泰蓝制品。银的反光性、延展性较好，氧化程度慢，是熊师傅多方比对之后找到的理想材料。</span></p><p style=\"line-height: 3em;\"><span style=\"font-size: 20px; font-family: 隶书, SimLi;\">　　此外，熊氏珐琅还率先采用超声波来清洗景泰蓝工艺品，并且在用料环节十分讲究，为了减少产品中的气泡瑕疵，就采用纯净水进行生产。熊氏珐琅还将原来70种釉彩颜色扩充到600种，极大丰富了作品的表现力。</span></p><p style=\"line-height: 3em;\"><span style=\"font-family: 仿宋_gb2312,fangsong_gb2312; font-size: 18px;\">　　　　　　　　　　　　　　　　　　　　　　　　　　　更新日期：2021年01月14日</span></p><p><br/></p>', 5, '传承', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (12, '北京新增7家A类定点医疗机构', '日前，北京市医疗保险事务管理中心发布通知，增补北京清华长庚医院等7家定点医疗机构为A类定点医疗机构。据悉，截至目前，北京市参保人员无需选择直接就医的医疗机构包括39家A类定点医疗机构、164家中医定点医疗机构、160家专科定点医疗机构以及2200余家定点社区卫生服务机构。', '2021-11-29 10:07:23', 6, 1, '<p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\">通告中指出，对全市基本医疗保险定点医疗机构从服务量情况、总额费用控制情况、次均费用控制情况和医疗保险管理情况等方面进行考评，决定在原有北京市基本医疗保险A类定点医疗机构的基础上，从</span><span style=\"font-size: 19px\">11月25日</span><span style=\"font-family: 宋体;font-size: 19px\">起，增补北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院7家定点医疗机构为A类定点医疗机构。这意味着，北京的A类定点医疗机构增至39家。据悉，参保人可直接持卡去A类定点医疗机构就医，而无需事先选择其为自己的定点机构。</span></p><p style=\"text-indent: 37px\"><span style=\"font-family: 宋体;font-size: 19px\"><br/></span></p><p style=\"text-align: center\"><span style=\"color: rgb(51, 51, 51);font-family: 黑体;font-size: 21px\">通告</span></p><p style=\"text-align: center\">&nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　据悉，北京原有的A类定点医疗机构为32家，包括协和医院、同仁医院等。而所谓A类定点，即参保人无需事先选定其为就医的定点，可直接持卡就医。</span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px;text-indent: 38px\"><span style=\"font-family: 宋体;font-size: 19px\">市医保局强调，新增A类定点医疗机构要严格执行基本医疗保险相关管理规定及定点医疗机构服务协议书，加强内部管理，提高医疗保险服务水平，严格控制医疗费用，更好地为参保人员服务。各区医疗保险管理部门要加强对辖区内A类定点医疗机构的管理，同时向参保人员做好政策宣传工作。</span><span style=\"font-family: 宋体;font-size: 19px\"></span> &nbsp; &nbsp; &nbsp;</p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　中国医学科学院北京协和医院、首都医科大学附属北京同仁医院、首都医科大学宣武医院、首都医科大学附属北京友谊医院、北京大学第一医院、北京大学人民医院、北京大学第三医院、北京积水潭医院、中国中医科学院广安门医院、首都医科大学附属北京朝阳医院、中日友好医院、北京大学首钢医院、首都医科大学附属北京中医医院、首都医科大学附属北京天坛医院、北京世纪坛医院(北京铁路总医院)、北京市健宫医院、北京市房山区良乡医院、北京市大兴区人民医院、北京市石景山医院、北京医院、首都医科大学附属北京安贞医院、首都医科大学附属北京潞河医院、国家电网公司北京电力医院、航空总医院、北京市海淀医院、北京市垂杨柳医院、北京市昌平区医院、北京市顺义区医院、北京市平谷区医院、北京市密云区医院、北京市延庆区医院、北京怀柔医院、北京清华长庚医院、中国医学科学院阜外医院、中国中医科学院西苑医院、首都医科大学附属复兴医院、航天中心医院、北京燕化医院、北京市第二医院。</span></p><p style=\"line-height: 31px\"><span style=\"font-family: 宋体;font-size: 19px\">　　</span></p><p style=\"text-align: right; line-height: 31px;\"><span style=\"font-family: 宋体;font-size: 19px\">（人民网）</span></p>', 5, '医疗机构', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (13, 'hh', 'fadfafdfd', '2023-04-24 23:10:42', 5, 1, '<p>fadfafdfd</p>', 1, 'aa', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (14, 'hhh', 'dfgfg', '2023-04-24 23:27:40', 4, 0, '<p>dfgfg</p><p><br/></p>', 3, 'aa', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (15, '哈哈', '大大的好', '2023-04-27 15:37:13', 6, 1, '<p>大大的好</p>', 1, '哈哈', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (16, 'aa', '关于技术探讨的科普', '2023-05-03 23:04:26', 7, 1, '<p>关于技术探讨的科普</p>', 6, '技术', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (17, 'gg', 'gg', '2023-05-03 23:12:01', 3, 0, '<p>gg<br/></p>', 6, 'gg', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (18, 'aa', 'aa', '2023-05-04 20:29:11', 0, 0, '<p>aa</p>', 6, 'qq', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (19, 'aa', 'aa', '2023-05-04 20:49:05', 0, 0, '<p>aa</p>', 1, 'aa', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (20, 'aa', 'aa', '2023-05-04 20:49:05', 0, 0, '<p>aa</p>', 1, 'aa', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (24, 'gg', 'gg', '2023-05-04 20:59:58', 8, 0, '<p>gg</p>', 6, 'gg', 3, 'tt', NULL);
INSERT INTO `t_news` VALUES (26, 'ee', ' <p><img src=\"https://adopt-zuo.oss-cn-hangzhou.aliyuncs.com/42c0101c-c01c-41fc-b0a3-784637403b4a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p', '2023-05-10 22:20:40', 2, 0, ' <p><img src=\"https://adopt-zuo.oss-cn-hangzhou.aliyuncs.com/42c0101c-c01c-41fc-b0a3-784637403b4a.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1, 'ee', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (27, 'gg', '<p><img src=\"https://adopt-zuo.oss-cn-hangzhou.aliyuncs.com/35d2fa7f-f475-4d9a-b5cc-a26b50cefdf4.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '2023-05-10 22:23:59', 15, 3, '<p><img src=\"https://adopt-zuo.oss-cn-hangzhou.aliyuncs.com/35d2fa7f-f475-4d9a-b5cc-a26b50cefdf4.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 1, 'gg', 3, 'tt', NULL);
INSERT INTO `t_news` VALUES (28, 'aaa', '<p>aaa</p>', '2023-05-21 19:02:10', 0, 0, '<p>aaa</p>', 1, 'gg', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (29, '123', '<p>123</p>', '2023-05-21 19:04:02', 3, 0, '<p>123</p>', 1, '123', 1, 'admin', NULL);
INSERT INTO `t_news` VALUES (30, 'bb', '<p>bb</p>', '2023-05-21 19:09:23', 23, 0, '<p>bb</p>', 1, 'bb', 1, 'admin', 'b2bd485b-4ade-4a88-bed2-be3dad96139a.txt');
INSERT INTO `t_news` VALUES (31, '论文查重工具，送给写论文的你', '<p>aaaa</p>', '2023-05-21 19:49:00', 5, 0, '<p>aaaa</p>', 1, '论文', 1, 'admin', '');

-- ----------------------------
-- Table structure for t_newsperson
-- ----------------------------
DROP TABLE IF EXISTS `t_newsperson`;
CREATE TABLE `t_newsperson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_newsperson
-- ----------------------------
INSERT INTO `t_newsperson` VALUES (1, 'admin', 'admin', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12.8px; background-color: rgb(255, 255, 255);\"><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12.8px; background-color: rgb(255, 255, 255);\">尽人事，听天命&nbsp;</span></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0058.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0058.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0058.gif\"/></p><p><span style=\"color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12.8px; background-color: rgb(255, 255, 255);\"></span></p>', 'admin', '只要我想，没有不可能1', '20200113083822.jpg', '123456@Outlook.com', '16622903812');
INSERT INTO `t_newsperson` VALUES (2, 'losca', '123456', NULL, 'losca', 'hh', NULL, '123456@qq.com', '16622903812');
INSERT INTO `t_newsperson` VALUES (3, 'tt', '123456', NULL, 'tt', '飞向远方', '20230510102653.png', 'losca1216@gmail.com', '16622903812');

-- ----------------------------
-- Table structure for t_newstype
-- ----------------------------
DROP TABLE IF EXISTS `t_newstype`;
CREATE TABLE `t_newstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderNo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_newstype
-- ----------------------------
INSERT INTO `t_newstype` VALUES (1, '头条新闻', 1);
INSERT INTO `t_newstype` VALUES (2, '时事政治', 2);
INSERT INTO `t_newstype` VALUES (3, '通知公告', 3);
INSERT INTO `t_newstype` VALUES (4, '健康生活', 4);
INSERT INTO `t_newstype` VALUES (5, '文旅体育', 5);
INSERT INTO `t_newstype` VALUES (6, '技术探讨', 6);

SET FOREIGN_KEY_CHECKS = 1;
