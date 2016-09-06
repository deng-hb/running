# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: running
# Generation Time: 2016-09-06 15:03:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `task_url` varchar(200) DEFAULT NULL COMMENT '任务地址',
  `response_code` int(11) DEFAULT NULL COMMENT '返回状态码',
  `response_text` varchar(5000) DEFAULT NULL COMMENT '返回字符（最多5000）',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务纪录';

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;

INSERT INTO `history` (`id`, `task_id`, `task_url`, `response_code`, `response_text`, `start_time`, `end_time`, `created_by`, `created_time`, `updated_by`, `updated_time`, `deleted`, `version`)
VALUES
	(1,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:22:49','2016-09-06 22:22:52',0,'2016-09-06 22:22:52',NULL,NULL,0,1),
	(2,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:22:50','2016-09-06 22:22:53',0,'2016-09-06 22:22:53',NULL,NULL,0,1),
	(3,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:25:09','2016-09-06 22:25:12',0,'2016-09-06 22:25:12',NULL,NULL,0,1),
	(4,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:25:10','2016-09-06 22:25:13',0,'2016-09-06 22:25:12',NULL,NULL,0,1),
	(5,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:32:58','2016-09-06 22:33:01',0,'2016-09-06 22:33:01',NULL,NULL,0,1),
	(6,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:47:53','2016-09-06 22:47:57',0,'2016-09-06 22:47:57',NULL,NULL,0,1),
	(7,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:47:54','2016-09-06 22:47:57',0,'2016-09-06 22:47:57',NULL,NULL,0,1),
	(8,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:52:07','2016-09-06 22:52:11',0,'2016-09-06 22:52:10',NULL,NULL,0,1),
	(9,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:52:08','2016-09-06 22:52:11',0,'2016-09-06 22:52:11',NULL,NULL,0,1),
	(10,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:53:56','2016-09-06 22:53:59',0,'2016-09-06 22:53:59',NULL,NULL,0,1),
	(11,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 22:54:22','2016-09-06 22:54:25',0,'2016-09-06 22:54:25',NULL,NULL,0,1),
	(12,5,'https://www.google.com',0,'java.net.SocketTimeoutException: connect timed out\n	at java.net.PlainSocketImpl.socketConnect(Native Method)\n	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)\n	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)\n	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)\n	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)\n	at java.net.Socket.connect(Socket.java:589)\n	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:656)\n	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:432)\n	at sun.net.www.http.HttpClient.openServer(HttpClient.java:527)\n	at sun.net.www.protocol.https.HttpsClient.<init>(HttpsClient.java:275)\n	at sun.net.www.protocol.https.HttpsClient.New(HttpsClient.java:371)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.getNewHttpClient(AbstractDelegateHttpsURLConnection.java:191)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1104)\n	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:998)\n	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:177)\n	at sun.net.www.protocol.https.HttpsURLConnectionImpl.connect(HttpsURLConnectionImpl.java:153)\n	at com.denghb.running.HttpConnectionTask.run(HttpConnectionTask.java:48)\n	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)\n	at java.util.concurrent.FutureTask.runAndReset(FutureTask.java:308)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$301(ScheduledThreadPoolExecutor.java:180)\n	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:294)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n	at java.lang.Thread.run(Thread.java:745)\n','2016-09-06 23:02:24','2016-09-06 23:02:27',0,'2016-09-06 23:02:26',NULL,NULL,0,1);

/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接',
  `sec` int(11) NOT NULL COMMENT '间隔秒',
  `last_status` int(11) NOT NULL COMMENT '最近状态',
  `is_run` int(11) NOT NULL DEFAULT '1' COMMENT '是否运行',
  `desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `is_mail` int(11) DEFAULT NULL COMMENT '是否发邮件',
  `mail_address` varchar(200) DEFAULT NULL COMMENT '邮件地址多个,隔开',
  `mail_max_count` int(11) DEFAULT NULL COMMENT '邮件最大次数',
  `mail_send_count` int(11) DEFAULT NULL COMMENT '邮件发送次数',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `url`, `sec`, `last_status`, `is_run`, `desc`, `is_mail`, `mail_address`, `mail_max_count`, `mail_send_count`, `created_by`, `created_time`, `updated_by`, `updated_time`, `deleted`, `version`)
VALUES
	(1,'https://denghb.com',5,200,1,'我的博客',1,'sadfaced@qq.com',1,NULL,0,'2016-09-03 16:21:42',NULL,'2016-09-06 23:02:26',0,1),
	(3,'http://json.denghb.com',60,200,1,'JSON',NULL,NULL,NULL,NULL,0,'2016-09-03 21:40:03',NULL,'2016-09-06 23:02:25',0,1),
	(4,'http://dwz.denghb.com',10,200,1,'短网址',NULL,NULL,NULL,NULL,0,'2016-09-03 22:23:42',NULL,'2016-09-06 23:02:24',0,1),
	(5,'https://www.google.com',20,0,0,'谷歌',NULL,NULL,NULL,NULL,0,'2016-09-03 22:28:44',NULL,'2016-09-06 23:02:31',0,1);

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;