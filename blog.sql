-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2022 at 07:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `postID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `commentDesc` varchar(500) NOT NULL,
  `commentAuthor` varchar(500) NOT NULL,
  `commentTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`postID`, `commentID`, `commentDesc`, `commentAuthor`, `commentTime`) VALUES
(18, 23, '          ggggggg', 'user', '2022-07-31 19:43:22'),
(18, 24, '          ', 'user', '2022-07-31 19:44:10'),
(18, 25, '          alo', 'user', '2022-07-31 19:47:07'),
(23, 26, '&lt;script&gt;alert(1)&lt;/script&gt;', 'user', '2022-07-31 19:53:48'),
(23, 27, '&lt;script&gt;alert(1)&lt;/script&gt;', 'user', '2022-07-31 19:58:00'),
(23, 28, '&lt;sCRIp&gt;alert(1)&lt;/ScRipt&gt;', 'user', '2022-07-31 20:06:12');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `name`, `size`) VALUES
(11, 'Roadmap_pentest.png', 36810);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `time`) VALUES
(3, ' thong', 'thong@thong.com', 'hello ', '2022-07-26 05:25:11'),
(4, ' thong', 'thong@gmail.com', 'hello', '2022-07-26 05:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `postTitle` varchar(200) NOT NULL,
  `postDesc` varchar(10000) NOT NULL,
  `postTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `postTag` varchar(40) NOT NULL,
  `postAuthor` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `postTitle`, `postDesc`, `postTime`, `postTag`, `postAuthor`) VALUES
(17, 'Review Webserver Metafiles for Information Leakage', '<p>This section describes how to test various metadata files for information leakage of the web application&rsquo;s path(s), or functionality. Furthermore, the list of directories that are to be avoided by Spiders, Robots, or Crawlers can also be created as a dependency for&nbsp;<a href=\"https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/07-Map_Execution_Paths_Through_Application\">Map execution paths through application</a>. Other information may also be collected to identify attack surface, technology details, or for use in social engineering engagement.</p>\r\n', '2022-07-30 05:30:05', 'Information Gathering', 'thong'),
(18, 'Fingerprint Web Server', '<p>Web server fingerprinting is the task of identifying the type and version of web server that a target is running on. While web server fingerprinting is often encapsulated in automated testing tools, it is important for researchers to understand the fundamentals of how these tools attempt to identify software, and why this is useful.</p>\r\n\r\n<p>Accurately discovering the type of web server that an application runs on can enable security testers to determine if the application is vulnerable to attack. In particular, servers running older versions of software without up-to-date security patches can be susceptible to known version-specific exploits.</p>\r\n', '2022-07-30 05:29:30', 'Information Gathering', 'thong'),
(21, 'Conduct Search Engine Discovery Reconnaissance for Information Leakage', '<p>In order for search engines to work, computer programs (or&nbsp;<code>robots</code>) regularly fetch data (referred to as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Web_crawler\">crawling</a>) from billions of pages on the web. These programs find web content and functionality by following links from other pages, or by looking at sitemaps. If a website uses a special file called&nbsp;<code>robots.txt</code>&nbsp;to list pages that it does not want search engines to fetch, then the pages listed there will be ignored. This is a basic overview - Google offers a more in-depth explanation of&nbsp;<a href=\"https://support.google.com/webmasters/answer/70897?hl=en\">how a search engine works</a>.</p>\r\n\r\n<p>Testers can use search engines to perform reconnaissance on websites and web applications. There are direct and indirect elements to search engine discovery and reconnaissance: direct methods relate to searching the indexes and the associated content from caches, while indirect methods relate to learning sensitive design and configuration information by searching forums, newsgroups, and tendering websites.</p>\r\n\r\n<p>Once a search engine robot has completed crawling, it commences indexing the web content based on tags and associated attributes, such as&nbsp;<code>&lt;TITLE&gt;</code>, in order to return relevant search results. If the&nbsp;<code>robots.txt</code>&nbsp;file is not updated during the lifetime of the web site, and in-line HTML meta tags that instruct robots not to index content have not been used, then it is possible for indexes to contain web content not intended to be included by the owners. Website owners may use the previously mentioned&nbsp;<code>robots.txt</code>, HTML meta tags, authentication, and tools provided by search engines to remove such content.</p>\r\n', '2022-07-30 05:28:22', 'Information Gathering', 'thong'),
(23, 'Test Network Infrastructure Configuration', '<p>The intrinsic complexity of interconnected and heterogeneous web server infrastructure, which can include hundreds of web applications, makes configuration management and review a fundamental step in testing and deploying every single application. It takes only a single vulnerability to undermine the security of the entire infrastructure, and even small and seemingly unimportant problems may evolve into severe risks for another application on the same server. In order to address these problems, it is of utmost importance to perform an in-depth review of configuration and known security issues, after having mapped the entire architecture.</p>\r\n\r\n<p>Proper configuration management of the web server infrastructure is very important in order to preserve the security of the application itself. If elements such as the web server software, the back-end database servers, or the authentication servers are not properly reviewed and secured, they might introduce undesired risks or introduce new vulnerabilities that might compromise the application itself.</p>\r\n\r\n<p>For example, a web server vulnerability that would allow a remote attacker to disclose the source code of the application itself (a vulnerability that has arisen a number of times in both web servers or application servers) could compromise the application, as anonymous users could use the information disclosed in the source code to leverage attacks against the application or its users.</p>\r\n\r\n<p>The following steps need to be taken to test the configuration management infrastructure:</p>\r\n\r\n<ul>\r\n	<li>The different elements that make up the infrastructure need to be determined in order to understand how they interact with a web application and how they affect its security.</li>\r\n	<li>All the elements of the infrastructure need to be reviewed in order to make sure that they don&rsquo;t contain any known vulnerabilities.</li>\r\n	<li>A review needs to be made of the administrative tools used to maintain all the different elements.</li>\r\n	<li>The authentication systems, need to reviewed in order to assure that they serve the needs of the application and that they cannot be manipulated by external users to leverage access.</li>\r\n	<li>A list of defined ports which are required for the application should be maintained and kept under change control.</li>\r\n</ul>\r\n\r\n<p>After having mapped the different elements that make up the infrastructure (see&nbsp;<a href=\"https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/10-Map_Application_Architecture\">Map Network and Application Architecture</a>) it is possible to review the configuration of each element founded and test for any known vulnerabilities.</p>\r\n\r\n<div id=\"simple-translate\">\r\n<div>\r\n<div class=\"simple-translate-button \" style=\"background-image: url(&quot;chrome-extension://cllnohpbfenopiakdcjmjcbaeapmkcdl/icons/512.png&quot;); height: 22px; width: 22px; top: 10px; left: 10px;\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-panel isShow\" style=\"width: 63px; height: 50px; top: 47px; left: 10px; font-size: 13px; background-color: rgb(24, 24, 24);\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\">&nbsp;</div>\r\n\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\" style=\"color: rgb(230, 230, 230);\">aaaa</p>\r\n\r\n<p class=\"simple-translate-candidate\" dir=\"auto\" style=\"color: rgb(170, 170, 170);\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n', '2022-07-30 05:31:29', 'Configuration and Deployment Management ', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `posts_buffer`
--

CREATE TABLE `posts_buffer` (
  `postID` int(11) NOT NULL,
  `postTitle` varchar(100) NOT NULL,
  `postDesc` varchar(5000) NOT NULL,
  `postTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `postTag` varchar(20) NOT NULL,
  `postAuthor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `emailid` varchar(40) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usertype` varchar(50) NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `password`, `emailid`, `createdon`, `usertype`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@admin.com', '2022-07-22 13:34:00', 'admin'),
(2, 'thong', 'thong', 'thong', 'thong@gmail.com', '2022-07-26 09:41:20', 'normal'),
(8, 'user', 'user', 'user', 'user@gmail.com', '2022-07-27 03:55:46', 'normal'),
(10, 'abc', 'abc', 'abc', 'abc@gmail.com', '2022-07-27 04:09:33', 'normal'),
(11, 'root', 'root', 'r', 'root@root.com', '2022-07-29 17:25:01', 'normal'),
(12, 'thanh', 'thanh', 'thanh', 'thanh@gmail.com', '2022-08-15 17:43:13', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `users_buffer`
--

CREATE TABLE `users_buffer` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `emailid` varchar(40) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT current_timestamp(),
  `usertype` varchar(20) NOT NULL DEFAULT 'nornal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

CREATE TABLE `user_post` (
  `postAuthor` varchar(40) NOT NULL,
  `postID` int(11) NOT NULL,
  `postLikes` int(11) NOT NULL DEFAULT 0,
  `postDisLikes` int(11) NOT NULL,
  `postComments` int(11) NOT NULL DEFAULT 0,
  `postViews` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User and Post relation Table';

--
-- Dumping data for table `user_post`
--

INSERT INTO `user_post` (`postAuthor`, `postID`, `postLikes`, `postDisLikes`, `postComments`, `postViews`) VALUES
('', 0, 0, 0, 0, 63),
('thong', 1, 4, 0, 0, 25),
('thong', 17, 0, 0, 0, 6),
('thong', 18, 0, 0, 0, 17),
('thong', 21, 0, 0, 0, 432),
('user', 23, 20, 0, 0, 1149);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD UNIQUE KEY `commentID` (`commentID`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD UNIQUE KEY `postTitle` (`postTitle`);

--
-- Indexes for table `posts_buffer`
--
ALTER TABLE `posts_buffer`
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_buffer`
--
ALTER TABLE `users_buffer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`emailid`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`postID`),
  ADD UNIQUE KEY `postID` (`postID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts_buffer`
--
ALTER TABLE `posts_buffer`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users_buffer`
--
ALTER TABLE `users_buffer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
