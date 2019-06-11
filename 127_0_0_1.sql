-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2018 at 12:55 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--
CREATE DATABASE IF NOT EXISTS `gym` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gym`;

-- --------------------------------------------------------

--
-- Table structure for table `addblog`
--

CREATE TABLE `addblog` (
  `srno` int(100) NOT NULL,
  `authername` varchar(100) NOT NULL,
  `postdate` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `dis` varchar(100) NOT NULL,
  `about` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addblog`
--

INSERT INTO `addblog` (`srno`, `authername`, `postdate`, `image`, `dis`, `about`) VALUES
(8, 'shubhamrana', '27-08-2018', 'default.jpg', 'this is blog', 'health');

-- --------------------------------------------------------

--
-- Table structure for table `addcategory`
--

CREATE TABLE `addcategory` (
  `catid` int(11) NOT NULL,
  `catname` varchar(100) NOT NULL,
  `catimage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addcategory`
--

INSERT INTO `addcategory` (`catid`, `catname`, `catimage`) VALUES
(3, 'Health Supplements', '1532614761655Combat-100-Whey-By-MusclePharm-Protein-Powder-in-Pakistan-Jacked-Nutrition.jpg'),
(4, 'Accesoriesss', '1532614739633adidas-speed-rope-3-m.jpg'),
(5, 'abc', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addsubcategory`
--

CREATE TABLE `addsubcategory` (
  `categoryid` int(100) NOT NULL,
  `subcategoryid` int(100) NOT NULL,
  `subcatname` varchar(100) NOT NULL,
  `subcatimage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addsubcategory`
--

INSERT INTO `addsubcategory` (`categoryid`, `subcategoryid`, `subcatname`, `subcatimage`) VALUES
(3, 1005, 'whey protiens', '1532591206399on1.jpeg'),
(3, 1006, 'Mass Gainer', '1532594833964serious-mass-6lb-vanila.jpg'),
(4, 1007, 'Shaker', '1532594812534shakermyprotienmetalic.jpg'),
(3, 1008, 'a', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admintable`
--

CREATE TABLE `admintable` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admintable`
--

INSERT INTO `admintable` (`email`, `password`) VALUES
('admin', 'admin123'),
('admin@admin.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `carttable`
--

CREATE TABLE `carttable` (
  `srno` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `totalcost` int(100) NOT NULL,
  `sessionid` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carttable`
--

INSERT INTO `carttable` (`srno`, `pid`, `pname`, `price`, `qty`, `totalcost`, `sessionid`, `image`) VALUES
(8, 5, 'ddcds', 11, 5, 55, '0D0D20755E89CAA6E86A67C93FA09708', 'default.jpg'),
(9, 6, 'cedv', 12, 1, 12, '4C2E82BD2516A6189B6405A8669CD92F', 'default.jpg'),
(10, 5, 'ddcds', 11, 1, 11, 'CEB868EDB44272B9C4D457E2CDA6A77E', 'default.jpg'),
(11, 5, 'ddcds', 11, 1, 11, '94AD98467ACCA7879B21196EBB9E2514', 'default.jpg'),
(12, 6, 'cedv', 12, 1, 12, 'A8829A39FCEB28D2765D0838935EB950', 'default.jpg'),
(15, 6, 'cedv', 12, 4, 48, 'A8829A39FCEB28D2765D0838935EB950', 'default.jpg'),
(16, 6, 'cedv', 12, 1, 12, 'CE3B11F538AF12AAF101BBF56BEE450D', 'default.jpg'),
(17, 6, 'cedv', 12, 1, 12, 'CE3B11F538AF12AAF101BBF56BEE450D', 'default.jpg'),
(19, 10, 'Dymatize whey proitien', 3200, 1, 3200, '338D32C0A0938FEDEBC3620D546A0450', '1532591360445dymantize.jpg'),
(20, 10, 'Dymatize whey proitien', 3200, 1, 3200, '338D32C0A0938FEDEBC3620D546A0450', '1532591360445dymantize.jpg'),
(24, 10, 'Dymatize whey proitien', 3200, 1, 3200, 'BB0176BC11C2B303289D89E6C39636DC', '1532591360445dymantize.jpg'),
(25, 11, 'muscle parm whey', 3100, 1, 3100, 'BB0176BC11C2B303289D89E6C39636DC', '1532591408060musclepharmgaine.jpg'),
(35, 10, 'Dymatize whey proitien', 3200, 1, 3200, '31DEBA3FD6CEFB79FBD6430BB45DDB28', '1532591360445dymantize.jpg'),
(38, 11, 'muscle parm whey', 3100, 1, 3100, 'A77B9667066C57ACB96C2FA06235C438', '1532591408060musclepharmgaine.jpg'),
(39, 10, 'Dymatize whey proitien', 3200, 1, 3200, '3E964307C40D9C9B0E7CFB7C087B9C39', '1532591360445dymantize.jpg'),
(40, 11, 'muscle parm whey', 3100, 1, 3100, '3E964307C40D9C9B0E7CFB7C087B9C39', '1532591408060musclepharmgaine.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `orderno` int(11) NOT NULL,
  `paymentmode` varchar(100) NOT NULL,
  `amount` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `saledate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`orderno`, `paymentmode`, `amount`, `username`, `address`, `saledate`) VALUES
(2, 'cod', 3200, 'srana5898@gmail.com', 'ca', '2018-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `ordertable2`
--

CREATE TABLE `ordertable2` (
  `orderno` int(100) NOT NULL,
  `paymentmode` varchar(100) NOT NULL,
  `amount` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `saledate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderno` int(100) NOT NULL,
  `productid` int(100) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `totalcost` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orderno`, `productid`, `productname`, `price`, `qty`, `totalcost`, `image`) VALUES
(2, 5, 'ddcds', 11, 2, 22, 'default.jpg'),
(2, 5, 'ddcds', 11, 1, 11, 'default.jpg'),
(2, 5, 'ddcds', 11, 1, 11, 'default.jpg'),
(42, 6, 'cedv', 12, 1, 12, 'default.jpg'),
(44, 10, 'Dymatize whey proitien', 3200, 4, 12800, '1532591360445dymantize.jpg'),
(45, 11, 'muscle parm whey', 3100, 1, 3100, '1532591408060musclepharmgaine.jpg'),
(46, 11, 'muscle parm whey', 3100, 1, 3100, '1532591408060musclepharmgaine.jpg'),
(47, 11, 'muscle parm whey', 3100, 1, 3100, '1532591408060musclepharmgaine.jpg'),
(48, 10, 'Dymatize whey proitien', 3200, 1, 3200, '1532591360445dymantize.jpg'),
(49, 14, 'on mass gainer', 2299, 1, 2299, '1532591617959serious-mass-6lb-vanila.jpg'),
(50, 11, 'muscle parm whey', 3100, 1, 3100, '1532591408060musclepharmgaine.jpg'),
(51, 13, 'muscle parm Mass Gainer', 2200, 1, 2200, '1532591569881musclepharmgaine.jpg'),
(52, 10, 'Dymatize whey proitien', 3200, 1, 3200, '1532591360445dymantize.jpg'),
(53, 13, 'muscle parm Mass Gainer', 2200, 1, 2200, '1532591569881musclepharmgaine.jpg'),
(1, 9, 'On 100% Gold Standard Whey', 3000, 1, 3000, '1532591287191on1.jpeg'),
(2, 10, 'Dymatize whey proitien', 3200, 1, 3200, '1532591360445dymantize.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `srno` int(100) NOT NULL,
  `otp` int(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plan2table`
--

CREATE TABLE `plan2table` (
  `planid` int(100) NOT NULL,
  `typeid` varchar(100) NOT NULL,
  `planname` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plan2table`
--

INSERT INTO `plan2table` (`planid`, `typeid`, `planname`, `price`, `image1`, `image2`) VALUES
(1, 'GYM', '1 Month', 1500, 'default.jpg', 'default.jpg'),
(2, 'GYM', '3 Month', 4000, 'default.jpg', 'default.jpg'),
(3, 'GYM', '6 Month', 7500, 'default.jpg', 'default.jpg'),
(4, 'GYM', '12 month', 10000, 'default.jpg', 'default.jpg'),
(5, 'YOGA', '1 Month', 1000, 'default.jpg', 'default.jpg'),
(6, 'YOGA', '3 Month', 2700, 'default.jpg', 'default.jpg'),
(7, 'YOGA', '6 Month', 5000, 'default.jpg', 'default.jpg'),
(8, 'YOGA', '12 Month', 7800, 'default.jpg', 'default.jpg'),
(11, 'GYMand yoga', '1 Month', 1500, 'default.jpg', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `plantable`
--

CREATE TABLE `plantable` (
  `srno` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `plan` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plantable`
--

INSERT INTO `plantable` (`srno`, `username`, `phone`, `name`, `type`, `plan`, `status`) VALUES
(6, 'srana5898@gmail.com', '8968005778', 'Shubham Singh Rana', 'YOGA', '3 Month ', 'activated'),
(11, 'srana5898@gmail.com', '8968005778', 'Shubham Singh Rana', 'GYM', '1 Month', 'activated'),
(15, 'srana5898@gmail.com', '8968005778', 'Shubham Singh Rana', 'GYM', '12 month', 'requested'),
(16, 'srana5898@gmail.com', '8968005778', 'Shubham Singh Rana', 'GYM', '1 Month', 'activated');

-- --------------------------------------------------------

--
-- Table structure for table `producttable`
--

CREATE TABLE `producttable` (
  `productid` int(100) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `catid` int(100) NOT NULL,
  `subcatid` int(100) NOT NULL,
  `mrp` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `dis` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producttable`
--

INSERT INTO `producttable` (`productid`, `productname`, `price`, `image1`, `image2`, `catid`, `subcatid`, `mrp`, `qty`, `dis`) VALUES
(9, 'On 100% Gold Standard Whey', 3000, '1532591287191on1.jpeg', '1532591287194label.jpg', 3, 1005, 3299, 99, 'on whey protirn'),
(10, 'Dymatize whey proitien', 3200, '1532591360445dymantize.jpg', '1532591360450Elite5lbSmoothBanana.png', 3, 1005, 3600, 93, 'dymantize whey protien'),
(11, 'muscle parm whey', 3100, '1532591408060musclepharmgaine.jpg', '1532591408063musclepharmgainerlabel.png', 3, 1005, 3400, 96, 'whey protien'),
(12, 'My protien Mass Gainer', 2199, '1532591481593prd_129980_c_xxl.jpg', '1532591481596myprotiengainerlabel.jpg', 3, 1006, 2500, 100, 'mass gainer'),
(13, 'muscle parm Mass Gainer', 2200, '1532591569881musclepharmgaine.jpg', '1532591569884musclepharmgainerlabel.png', 3, 1006, 2600, 98, 'mass gainer'),
(14, 'on mass gainer', 2299, '1532591617959serious-mass-6lb-vanila.jpg', '1532591617962onweightganerlabel.png', 3, 1006, 2699, 99, 'mass gainer'),
(15, 'on Shaker', 400, '1532591711307ONShaker.jpg', '1532591711309on-shaker-2-part.jpg', 4, 1007, 500, 100, 'shaker'),
(16, 'My protien Shaker', 450, '1532591760239shaker my protien.jpg', '1532591760242shakermy3.jpg', 4, 1007, 600, 100, 'shaker'),
(17, 'my protien Shaker metal', 950, '1532591802297shakermyprotienmetalic.jpg', '1532591802310shakeer2.jpg', 4, 1007, 1500, 100, 'metal shaker');

-- --------------------------------------------------------

--
-- Table structure for table `typetable`
--

CREATE TABLE `typetable` (
  `typeid` int(100) NOT NULL,
  `typename` varchar(100) NOT NULL,
  `typeimg` varchar(100) NOT NULL,
  `typeimg2` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typetable`
--

INSERT INTO `typetable` (`typeid`, `typename`, `typeimg`, `typeimg2`, `title`) VALUES
(1, 'GYM', '1533370774254gym1.jpg', 'default.jpg', ' Healthy habit to stay fit'),
(2, 'YOGA', '1533371181129yoga1.jpg', 'default.jpg', 'Morning Yoga Classes From 6-8 Am .'),
(4, 'GYMand yoga', 'default.jpg', 'default.jpg', ' health');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`name`, `password`, `email`, `phone`) VALUES
('Shubham Singh Rana', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 'srana5898@gmail.com', '8968005778');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addblog`
--
ALTER TABLE `addblog`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `addcategory`
--
ALTER TABLE `addcategory`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `addsubcategory`
--
ALTER TABLE `addsubcategory`
  ADD PRIMARY KEY (`subcategoryid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `admintable`
--
ALTER TABLE `admintable`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `carttable`
--
ALTER TABLE `carttable`
  ADD PRIMARY KEY (`srno`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`orderno`);

--
-- Indexes for table `ordertable2`
--
ALTER TABLE `ordertable2`
  ADD PRIMARY KEY (`orderno`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `plan2table`
--
ALTER TABLE `plan2table`
  ADD PRIMARY KEY (`planid`);

--
-- Indexes for table `plantable`
--
ALTER TABLE `plantable`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `producttable`
--
ALTER TABLE `producttable`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `subcatid` (`subcatid`),
  ADD KEY `catid_2` (`catid`);

--
-- Indexes for table `typetable`
--
ALTER TABLE `typetable`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addblog`
--
ALTER TABLE `addblog`
  MODIFY `srno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `addcategory`
--
ALTER TABLE `addcategory`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `addsubcategory`
--
ALTER TABLE `addsubcategory`
  MODIFY `subcategoryid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `carttable`
--
ALTER TABLE `carttable`
  MODIFY `srno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `orderno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `srno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan2table`
--
ALTER TABLE `plan2table`
  MODIFY `planid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plantable`
--
ALTER TABLE `plantable`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `producttable`
--
ALTER TABLE `producttable`
  MODIFY `productid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `typetable`
--
ALTER TABLE `typetable`
  MODIFY `typeid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producttable`
--
ALTER TABLE `producttable`
  ADD CONSTRAINT `categoryconstraint` FOREIGN KEY (`catid`) REFERENCES `addcategory` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcatconstraint` FOREIGN KEY (`subcatid`) REFERENCES `addsubcategory` (`subcategoryid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
