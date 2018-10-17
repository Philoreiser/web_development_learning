SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

CREATE TABLE `together` (
    `tid` int(11) NOT NULL,
    `uid` varchar(255) NOT NULL,
    `opengpmid` varchar(255) NOT NULL,
    `location` varchar(255) NOT NULL,
    `subject` varchar(255) NOT NULL,
    `starttime` varchar(255) NOT NULL,
    `endtime` varchar(255) NOT NULL,
    `class` varchar(255) NOT NULL,
    `lat` varchar(255) NOT NULL,
    `lng` varchar(255) NOT NULL,
    `detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `together` 
    ADD PRIMARY KEY (`tid`);

ALTER TABLE `together` 
    MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;


SOURCE /Users/chiou/Projects/TestSQL/funcDistance.sql;

