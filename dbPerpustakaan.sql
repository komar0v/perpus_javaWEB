/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `perpustakaan`;

/*Table structure for table `akun_admin` */

DROP TABLE IF EXISTS `akun_admin`;

CREATE TABLE `akun_admin` (
  `id_admin` varchar(10) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nama_admin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `akun_admin` */

insert  into `akun_admin`(`id_admin`,`username`,`password`,`nama_admin`) values 
('911','admin123@gmail.com','admin123','Admin');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `id_buku` varchar(100) NOT NULL,
  `judul_buku` varchar(200) NOT NULL,
  `pengarang_buku` varchar(200) DEFAULT NULL,
  `tahunterbit_buku` varchar(50) DEFAULT NULL,
  `penerbit_buku` varchar(200) DEFAULT NULL,
  `isbn_buku` varchar(200) DEFAULT NULL,
  `kategori_buku` varchar(100) NOT NULL,
  `dipinjamkah` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `buku` */

insert  into `buku`(`id_buku`,`judul_buku`,`pengarang_buku`,`tahunterbit_buku`,`penerbit_buku`,`isbn_buku`,`kategori_buku`,`dipinjamkah`) values 
('JAVIRA2124-113-2019','Javascript','Sanskerta','2019','Nugrohok','335624445','Ensiklopedia','tidak'),
('P12394LAY-497-2009','Kumpulan Puisi Alay','A Laiya','2009','PT. KEREN SEKALI','345235232','lainnya','tidak'),
('PYTHNSD124-414-2020','Python untuk anak SD','Jenly Brian','2020','Kapal Tervang','221983032','Ensiklopedia','tidak'),
('SGBBY016069-615-2020','Cara Menjadi Sugar Baby','H Paris','2020','S4NS','23452435234','Jurnal','tidak'),
('WHFCOLORB00K-464-2012','Buku Mewarnai','Semprul2','2012','Steamy','2291214','Komik','tidak');

/*Table structure for table `denda` */

DROP TABLE IF EXISTS `denda`;

CREATE TABLE `denda` (
  `id_denda` int(12) NOT NULL AUTO_INCREMENT,
  `id_member` int(12) DEFAULT NULL,
  `id_pinjam` int(12) DEFAULT NULL,
  `besar_denda` varchar(500) DEFAULT NULL,
  `dibayarkah` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_denda`)
) ENGINE=InnoDB AUTO_INCREMENT=933352021 DEFAULT CHARSET=latin1;

/*Data for the table `denda` */

insert  into `denda`(`id_denda`,`id_member`,`id_pinjam`,`besar_denda`,`dibayarkah`) values 
(157482020,4422020,73382020,'194000','sudah'),
(657612020,43702020,33292020,'6000','sudah'),
(933352020,55182020,48762020,'8000','sudah');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(10) NOT NULL,
  `nama_member` varchar(20) DEFAULT NULL,
  `notel_member` varchar(15) DEFAULT NULL,
  `alamat_member` varchar(55) DEFAULT NULL,
  `email_member` varchar(30) NOT NULL,
  `password_member` varchar(30) NOT NULL,
  `jeniskel_member` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert  into `member`(`id_member`,`nama_member`,`notel_member`,`alamat_member`,`email_member`,`password_member`,`jeniskel_member`) values 
(4422020,'Felix Astino P','08232324','jalan dulu','felixas@mail.com','qwerty','Laki-laki'),
(43702020,'Partha Wira','081228271929','Jl. Kaliurang KM 3','partha28@gmail.com','partha28','Laki-laki'),
(93252020,'Siti Mae Mun','081911223344','Jl. Palagan No.108','sitimun@yahoo.com','maemun','Perempuan');

/*Table structure for table `pinjam_buku` */

DROP TABLE IF EXISTS `pinjam_buku`;

CREATE TABLE `pinjam_buku` (
  `id_pinjam` int(11) NOT NULL AUTO_INCREMENT,
  `id_member` int(11) NOT NULL,
  `id_buku` varchar(100) NOT NULL,
  `mulai_pinjam` date DEFAULT NULL,
  `akhir_pinjam` date DEFAULT NULL,
  `diambilkah` varchar(100) DEFAULT NULL,
  `dikonfirmasikah` varchar(100) DEFAULT NULL,
  `batalkah` varchar(100) DEFAULT NULL,
  `dikembalikan` varchar(100) DEFAULT NULL,
  `dendakah` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pinjam`)
) ENGINE=InnoDB AUTO_INCREMENT=73382021 DEFAULT CHARSET=latin1;

/*Data for the table `pinjam_buku` */

insert  into `pinjam_buku`(`id_pinjam`,`id_member`,`id_buku`,`mulai_pinjam`,`akhir_pinjam`,`diambilkah`,`dikonfirmasikah`,`batalkah`,`dikembalikan`,`dendakah`) values 
(73382020,4422020,'PYTHNSD124-414-2020','2021-02-11','2021-06-09','sudah','sudah','tidak','sudah','tidak');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
