use lxbishe;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

/*动物种类表*/
DROP TABLE IF EXISTS `kinds`;
CREATE TABLE `kinds`  (
      `id` bigint(30) NOT NULL COMMENT '主键',
      `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '种类名称',
      `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类介绍',
      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `kinds` VALUES (1397849417888346113, '虎', '大型猫科动物；毛色浅黄或棕黄色，满身黑色横纹；头圆、耳短，耳背面黑色，中央有一白斑甚显著；四肢健壮有力；尾粗长，具黑色环纹，尾端黑色。');
INSERT INTO `kinds` VALUES (1397849739297861633, '狼', '保护等级有“三有”保护动物。共46个亚种，体型中等、匀称，四肢修长，趾行性，利于快速奔跑。头腭尖形，颜面部长，鼻端突出，耳尖且直立，嗅觉灵敏，听觉发达。');
INSERT INTO `kinds` VALUES (1397849739323027458, '狗', '属于脊索动物门、脊椎动物亚门、哺乳纲、真兽亚纲、食肉目、裂脚亚目、犬科动物。中文亦称“犬”，狗分布于世界各地，被称为“人类最忠实的朋友”，是饲养率最高的宠物，其寿命大约在12~18年。');
INSERT INTO `kinds` VALUES (1397849936421761025, '猫', '属于猫科动物，是全世界家庭中较为广泛的宠物，头圆、颜面部短，前肢五趾，后肢四趾，趾端具锐利而弯曲的爪，爪能伸缩，具有夜视性，以伏击的方式猎捕其它动物，大多能攀援上树。猫的趾底有脂肪质肉垫，以免在行走时发出声响，捕猎时也不会惊跑鼠。行进时爪子处于收缩状态，防止爪被磨钝，在捕鼠和攀岩时会伸出来。');


/*动物种品种表*/
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind`  (
     `id` bigint(30) NOT NULL COMMENT '主键',
     `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
     `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品种名称',
     `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品种介绍',
     `belong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属种类',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kind
INSERT INTO `kind` VALUES (1397849417888346113, 'http://localhost:8080/cars/hqo.png' , '哈士奇', '原产于西伯利亚的雪橇犬犬种，也叫哈士奇、二哈。该犬脚步轻快，动作优美，身体紧凑，有着很厚的被毛，耳朵直立，尾如毛刷，显示出北方地区的遗传特征。该犬是和狼的血统非常近的犬种，所以外形非常的像狼，有着比大多数犬种都要厚的毛发。','狗');
INSERT INTO `kind` VALUES (1397849739297861633, 'http://localhost:8080/cars/hqo.png', '阿拉斯加', '原产北美阿拉斯加，是最古老的极地雪橇犬之一。该犬结实、有力、肌肉发达而且胸很深；当它们站立时，头部竖直，眼神显得警惕、好奇，给人的感觉是充满活力而且非常傲娇；头部宽阔，耳朵呈三角形，警惕状态时保持竖立；被毛浓密，披毛有足够的长度以保护内层柔软的底毛；毛色多样，有灰、黑白、红棕等。','狗');
INSERT INTO `kind` VALUES (1397849739323027458, 'http://localhost:8080/cars/hqo.png', '蓝猫', '传统英国本地猫纯种版本，具有鲜明的矮胖的身体，浓密的毛发和广阔的脸。早期中国人称之为英短蓝猫，学名应该称为英国蓝色短毛猫。最熟悉的彩色变种是“英国蓝”，一个坚实的蓝灰色的外衣和铜颜色的眼睛，但该品种也已在范围广泛的其他颜色和图案。最典型的特征是此猫有五短，即：毛短、身材短、尾巴短、四肢短、耳朵短。','猫');
INSERT INTO `kind` VALUES (1397849936421761025, 'http://localhost:8080/cars/hqo.png', '金丝熊', '叙利亚仓鼠。在生物分类学上是中仓鼠属的中型仓鼠。和许多仓鼠一样，黄金仓鼠有一个钝的口鼻部，相对较小的眼睛，大耳朵和一条短的约1.5厘米的尾巴。毛发金黄，背部中央颜色较深，耳朵下方可见黑色条纹，有些前额上可能有一片黑色的部分，面部两侧各有一条黑色条纹从颊囊延伸到脖子上。','鼠');


-- ----------------------------
-- Table structure for car
-- ----------------------------

/*动物个体表*/
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
    `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
    `gender` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
    `liveStyle` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '习性',
    `price` varchar(120) NOT NULL COMMENT '价格',
    `kind` varchar(120) NOT NULL COMMENT '所属品种',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



INSERT INTO `unit` VALUES (1533638999774633986, 'http://localhost:8080/cars/hqo.png', '旺财', '公', '爱睡懒觉', '800', '柴犬');
INSERT INTO `unit` VALUES (1533639902057504770, 'http://localhost:8080/cars/hqo.png', '糖咪', '母', '喜欢毛球球', '500', '蓝猫');
INSERT INTO `unit` VALUES (1533640536441790466, 'http://localhost:8080/cars/hqo.png', '啾啾', '公', '爱吃饭', '139', '金丝熊');


/* 动物领养表 */
DROP TABLE IF EXISTS `lingyang`;
CREATE TABLE `lingyang`  (
      `id` bigint(20) NOT NULL COMMENT '主键',
      `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
      `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
      `gender` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
      `kind` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属品种',
      `finder` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
      `tel` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
      `address` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领养地址',
      `note` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
      `create_time` datetime(0) NOT NULL COMMENT '发布时间',
      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `lingyang` VALUES (1531913671796604930, 'http://localhost:8080/files/yantafendian.png', '校门口的流浪狗', '公', '哈士奇', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1', '2023-04-13 16:20:56');
INSERT INTO `lingyang` VALUES (1531913693355327489, 'http://localhost:8080/files/dongyoufendian.png', '校门口的流浪猫', '母', '银渐层', '3199432593','15929068966','陕西省西安市长安区西安邮电大学东区安美公寓','备注2', '2023-04-11 09:53:13');


/* 宠物用品表 */
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
     `id` bigint(20) NOT NULL COMMENT '主键',
     `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
     `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用品名称',
     `price` varchar(120) NOT NULL COMMENT '价格',
     `date` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产日期',
     `ddl` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保质期',
     `sale` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销量',
     `stock` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库存',
     `note` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
     `create_time` datetime(0) NOT NULL COMMENT '创建时间',
     `update_time` datetime(0) NOT NULL COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


/* 宠物医疗表 */
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
    `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
    `price` varchar(120) NOT NULL COMMENT '价格',
    `sale` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销量',
    `note` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `update_time` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


/*博客表*/
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) NOT NULL COMMENT '封面',
    `title` varchar(64) DEFAULT NULL COMMENT '标题',
    `pet` varchar(120) NOT NULL COMMENT '相关动物',
    `body` text DEFAULT NULL COMMENT '内容',
    `owner` varchar(120) NOT NULL COMMENT '发布人',
    `owner_id` bigint(20) NOT NULL COMMENT '发布人ID',
    `views` int(11) DEFAULT '0' COMMENT '浏览数量',
    `create_time` datetime(0) NOT NULL COMMENT '发布时间',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `blog` VALUES (1534341375271723009, 'http://localhost:8080/files/508e348c-748b-4a9f-a4ba-47507239faa0.jpg','最受欢迎的宠物狗','狗', '一、十大最受欢迎的宠物狗：哈士奇
哈士奇：西伯利亚雪橇犬，二哈就是它了。他是原始的古老犬种，在西伯利亚东北部、格陵兰南部生活。哈士奇性格多变，有的极端温顺，也有的极端暴力。进入家庭的哈士奇，都选择温顺品种。不过它最出名的还是它能拆家，不过主人都很喜欢。
二、十大最受欢迎的宠物狗：柴犬
柴犬是体型中等并且又最古老的犬。柴犬性格活泼、好动。对自己喜欢的玩具、会玩上一整天。其对外有极强警惕性，能为户主看家护院。柴犬外观和日本秋田犬比较好像是它的缩小版。
3.柯基：柯基是一种小型犬，但性格非常稳健，完全没有一般小型犬的神经质，是非常适合小孩的守护犬。'
, '2193560021','1534341375271723009', '5', '2022-06-08 09:07:45', '2022-06-08 09:07:45');
INSERT INTO `blog` VALUES (1534341375271723088, 'http://localhost:8080/files/508e348c-748b-4a9f-a4ba-47507239faa0.jpg','最受欢迎的宠物狗','狗', '一、十大最受欢迎的宠物狗：哈士奇
哈士奇：西伯利亚雪橇犬，二哈就是它了。他是原始的古老犬种，在西伯利亚东北部、格陵兰南部生活。哈士奇性格多变，有的极端温顺，也有的极端暴力。进入家庭的哈士奇，都选择温顺品种。不过它最出名的还是它能拆家，不过主人都很喜欢。
二、十大最受欢迎的宠物狗：柴犬
柴犬是体型中等并且又最古老的犬。柴犬性格活泼、好动。对自己喜欢的玩具、会玩上一整天。其对外有极强警惕性，能为户主看家护院。柴犬外观和日本秋田犬比较好像是它的缩小版。
3.柯基：柯基是一种小型犬，但性格非常稳健，完全没有一般小型犬的神经质，是非常适合小孩的守护犬。'
, '3199432593','1532212175635058690', '3', '2022-06-09 09:07:45', '2022-06-09 09:07:45');


/* 用户表 */
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
     `id` bigint(30) NOT NULL COMMENT '主键',
     `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
     `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
     `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
     `id_card` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci default null COMMENT '身份证号',
     `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
     `password` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
     `create_time` datetime(0) default NULL COMMENT '创建时间',
     `update_time` datetime(0) default NULL COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO user
VALUES (1532212175635058690, 'http://localhost:8080/files/touxiang_xu.jpg', '刘璇', '15929068966', '6161627373848432', '1299605102@qq.com', 'ee7ee7d96d79d0fb40f9f5486f7bf6f6', '2022-06-02 12:07:04', '2022-06-02 12:07:24');



/*系统订单表*/
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `number` bigint(20) NOT NULL COMMENT '订单号',
    `name` varchar(64) NOT NULL COMMENT '商品名',
    `customer_id` bigint(20) NOT NULL COMMENT '买家id',
    `tel` varchar(64) NOT NULL COMMENT '联系方式',
    `count` int(20) NOT NULL COMMENT '数量',
    `address` varchar(64) NOT NULL COMMENT '地址',
    `price` varchar(120) NOT NULL COMMENT '付款金额',
    `pay_time` datetime(0) NOT NULL COMMENT '支付时间',
    `state` varchar(120) NOT NULL COMMENT '状态',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `update_time` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
