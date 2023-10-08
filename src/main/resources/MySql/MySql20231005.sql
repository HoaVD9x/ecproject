-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-10-05 16:40:11
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `ecommerce`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

create database ecommerce;
use  ecommerce;

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`category_id`, `active`, `category_name`) VALUES
(1, b'1', 'パソコン・タブレットPC'),
(2, b'1', 'apple'),
(3, b'1', 'ゲーミングPC・デバイス'),
(4, b'1', 'パソコン周辺機器'),
(5, b'0', 'パソコンソフト');

-- --------------------------------------------------------

--
-- テーブルの構造 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `local_date_time` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `orders`
--

INSERT INTO `orders` (`order_id`, `local_date_time`, `user_id`) VALUES
(14, '2023-10-04 21:05:34.000000', 2),
(15, '2023-10-04 21:44:28.000000', 2),
(16, NULL, 2),
(17, '2023-10-04 22:32:10.000000', 2),
(18, '2023-10-04 22:34:51.000000', 2),
(19, '2023-10-04 23:02:40.000000', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `oder_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `quantity`, `total_price`, `oder_id`, `product_id`) VALUES
(4, 13, 1232400, NULL, 1),
(5, 13, 1232400, NULL, 1),
(6, 20, 47800000, NULL, 2),
(8, 13, 1232400, 16, 1),
(9, 2, 431080, 16, 3),
(10, 13, 1232400, 18, 1),
(11, 20, 4310800, 18, 3),
(12, 3, 438240, 18, 5),
(13, 30, 10464000, 18, 8),
(14, 23, 3986521, 18, 9),
(15, 13, 1232400, 19, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `product_description` longtext DEFAULT NULL,
  `product_image_link` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `product`
--

INSERT INTO `product` (`product_id`, `active`, `product_description`, `product_image_link`, `product_name`, `product_price`, `quantity`, `category_id`) VALUES
(1, b'1', 'デル DELL NI345-DNLSC [ノートパソコン/Inspiron 15 3520/15.6型/Core i5-1135G7/UHD グラフィックス/メモリ 8GB/SSD 512GB/Windows 11 Home/プラチナシルバー]と一緒に購入されている商品', 'http://localhost:8088/images/100000001007874332_10204.jpg', 'デル DELL NI345-DNLSC [ノートパソコン', 94800, 50, 1),
(2, b'1', 'test', 'http://localhost:8088/images/100000001007848046_10204.jpg', 'delll', 2390000, 2, 1),
(3, b'1', '有機ELが実現する薄型軽量ボディと映像美\r\n\r\n■持ち運びやすさを極限まで追求\r\n15.6インチの大画面でありながら、有機ELディスプレイの採用により、薄さ10.99mm※1、重量990g※2を実現。\r\n革新的な薄型軽量ボディが持ち運びの負担を減らし、移動先でも常に高いパフォーマンスを発揮できます。\r\n※1：突起部を除く\r\n※2：サイズ、重量などはシステムの構成と製造工程によって若干の誤差があります\r\n\r\n■限りなくピュアな黒とHDRによるリアリティ\r\n有機ELならではの黒再現が、1,000,000：1という液晶には真似できない高コントラストを実現。\r\n10.7億色表示の10bitカラーとDCI-P3 100％（標準値）※1の色再現により、写真や映像も、より正確な色合いで編集ができます。\r\nまた、ピーク輝度500cd/㎡※2まで対応し、VESA DisplayHDR True Black 500の認証を取得。リアリティあふれるHDR映像を存分に楽しめます。\r\n※1 DCI-P3 ：Digital Cinema Initiatives （DCI） により定義されている色標準です。\r\n※2 輝度400cd/㎡（ピーク時500cd/㎡）', 'http://localhost:8088/images/100000001007718531_10204.jpg', 'LGエレクトロニクス 15Z90RT-MA75J [超薄型軽量ノートパソコン LG gram SuperSlim15.6型/Core i7-1360P/メモリ 16GB/SSD 512GB/Windows 11 Home/ネプチューンブルー]', 215540, 50, 1),
(4, b'0', 'どこでもワークスペース\r\n\r\n■軽量大画面・ロングタイムバッテリーで作業に集中\r\n最大37時間使用可能なロングタイムバッテリーを搭載。\r\n14.0インチの大画面かつ長時間バッテリーを搭載しながら、わずか999gの軽量化を実現。ストレスなく持ち歩けます。\r\n※記載されている駆動時間はJEITAバッテリ動作時間測定法（Ver.2.0）による測定結果です。使用する環境、使用状況、周辺機器の接続状況等に応じて大きく変わります。\r\n\r\n■広い画面と低反射で高まる作業効率\r\nフルHDよりも縦長な16：10の縦横比と、多くの情報量を表示できる1920×1200（WUXGA）の解像度が見やすく、効率的な作業空間を提供。また、反射を抑えるアンチグレアパネルが、屋外での作業の際も画面を見やすくします。', 'http://localhost:8088/images/100000001007718531_10204.jpg', 'LGエレクトロニクス 14ZB90R-NP55J [ビジネスモデルノートパソコン/LG gram/14型/Core i5-1340P/メモリ 16GB/SSD 512GB/Windows 11 Pro/オブシディアンブラック]', 190000, 50, 1),
(5, b'1', '毎日快適にお使いいただけるパフォーマンス\r\n\r\n●高性能8コア16スレッドAMD Ryzen7搭載し、写真・動画編集のような高負荷処理やマルチタスクでの作業でも快適に動作します。\r\n●快適動作の16GBメモリを搭載し、複数の作業を同時に行っても動作が安定します。\r\n●Wi-Fi 6に対応、より高速なWi-Fi環境で4Kや8K動画のストリーミングなどが楽しめます。\r\nこだわりのキーボード\r\n\r\n●3段階押下圧：キーの位置によって重さを3段階に調節。小指で打つキーは弱い力で反応するなど、それぞれ異なる指の力に合わせることにより、長時間の使用でも疲れにくい快適なキーボード入力ができます。さらに約2.5mmの深いキーストロークでどの指でも心地よい打鍵感を実現しました。\r\n●ステップ型キートップ：デザイン性に優れたアイソレーションキーボードに加え、各キーを液晶側に向かって傾斜させ、階段形状の段差を持たせているので、キー列を間違えず正確なタッチタイピングができます。\r\n●球面シリンドリカルキートップ：キートップをわずかに凹形状にすることにより、キーが自然に指に沿い、疲れにくいタイピングを実現します。\r\n●高レスポンスキーボード：一般的なキーボードと異なり、キーを最後まで押し込まなくてもキー入力を検出します。軽いタッチや高速タイピングでも入力抜けが少ない、確実なキー操作ができます。\r\n●美しいデザインとカラー：ボディと同色にコーディネートしたキーボード。側面がキラリと輝く美しいプリズムクリアキーを採用しました。\r\n●4列テンキーとカーソルキー：テンキーには「00」キーと「tab」キーを搭載。一段下がった場所に配置したカーソルキーで快適なキー操作を実現します。', 'http://localhost:8088/images/100000001007594519_10204.jpg', '富士通 FUJITSU FMVA50H1B [ノートパソコン/FMV AHシリーズ/15.6型ワイド/Ryzen 7 5700U/メモリ 16GB/SSD 256GB/Windows 11 Home/Office Home and Business 2021/ブライトブラック]', 146080, 50, 1),
(6, b'1', '基本スペックを強化したヨドバシカメラ限定モデル\r\n\r\n●高性能4コア8スレッドIntel Core-i5にCPUを強化し、写真・動画編集のような高負荷処理やマルチタスクでの作業でも快適に動作します。\r\n●快適動作の16GBメモリへ容量アップし、複数の作業を同時に行っても動作が安定します。\r\n●ストレージ容量を約512GBにアップしたSSDを搭載。高速起動だけでなく、最新ミラーレスカメラの写真やアクションカメラの動画データをたくさん保存できます。\r\n●Wi-Fi 6に対応、より高速なWi-Fi環境で4Kや8K動画のストリーミングなどが楽しめます。\r\nこだわりのキーボード\r\n\r\n●3段階押下圧：キーの位置によって重さを3段階に調節。小指で打つキーは弱い力で反応するなど、それぞれ異なる指の力に合わせることにより、長時間の使用でも疲れにくい快適なキーボード入力ができます。さらに約2.5mmの深いキーストロークでどの指でも心地よい打鍵感を実現しました。\r\n●ステップ型キートップ：デザイン性に優れたアイソレーションキーボードに加え、各キーを液晶側に向かって傾斜させ、階段形状の段差を持たせているので、キー列を間違えず正確なタッチタイピングができます。\r\n●球面シリンドリカルキートップ：キートップをわずかに凹形状にすることにより、キーが自然に指に沿い、疲れにくいタイピングを実現します。\r\n●高レスポンスキーボード：一般的なキーボードと異なり、キーを最後まで押し込まなくてもキー入力を検出します。軽いタッチや高速タイピングでも入力抜けが少ない、確実なキー操作ができます。\r\n●美しいデザインとカラー：ボディと同色にコーディネートしたキーボード。側面がキラリと輝く美しいプリズムクリアキーを採用しました。\r\n●4列テンキーとカーソルキー：テンキーには「00」キーと「tab」キーを搭載。一段下がった場所に配置したカーソルキーで快適なキー操作を実現します。', 'http://localhost:8088/images/100000001007594531_10204.jpg', '富士通 FUJITSU FMVA47H1WC [ノートパソコン/FMV AHシリーズ/15.6型ワイド/Core i5-1135G7/メモリ 16GB/SSD 512GB/Windows 11 Home/Office Home and Business 2021/プレミアムホワイト/ヨドバシカメラ限定モデル]', 169800, 50, 1),
(7, b'1', '驚くほど薄いデザイン – デザインも性能も一新したMacBook Airは、これまで以上にポータブルなわずか1.24kg。仕事も、遊びも、もの作りも。超万能なノートブックと一緒に、好きなことを好きな場所で好きなだけ楽しんでください。\r\nM2の驚異的なパワーを内蔵 – 次世代の8コアCPU、最大10コアのGPU、最大24GBのユニファイドメモリが、より多くのことをより速くできるようにします。\r\n最大18時間使えるバッテリー – 電力効率に優れたApple M2チップにより、朝から晩まで使えます。\r\n大きくて美しいディスプレイ – 500ニトの輝度とP3の広色域を持ち、10億色に対応。13.6インチのLiquid Retinaディスプレイが、あざやかな色と目を見張るディテールを映し出します。\r\n進化したカメラとオーディオ – 1080p FaceTime HDカメラ、3マイクアレイ、空間オーディオ対応の4スピーカーサウンドシステムが、シャープな映像と魅力的なサウンドを届けます。', 'http://localhost:8088/images/71uJwr1IrZL.__AC_SY445_SX342_QL70_ML2_.jpg', '2022 13インチMacBook Air: 8コアCPUと8コアGPUを搭載したApple M2チップ, 256GB SSD - ミッドナイト', 158141, 50, 2),
(8, b'1', 'Apple Trade Inプログラムは、Likewize JapanおよびAlchemy Telco Solutions Japanによって提供・運営されています。名称：Likewize Japan株式会社（古物商許可証発行：東京都公安委員会 古物商許可証番号：第301112215727号）。名称：Alchemy Telco Solutions Japan合同会社（古物商許可証発行：東京都公安委員会 古物商許可証番号：第308842007505号）。\r\n\r\n‡本オファーは、予告なく期間を変更、延長、または終了する場合があります。ペイディあと払いプランApple専用アカウントを使用した購入が対象であり、株式会社Paidyによる承認が必要です。分割金利0%のプランは、ペイディアプリによる口座振替・銀行振込の場合のみご利用いただけます。ご利用可能な分割払いプランは、購入される製品に応じてAppleにより決定されます。最低購入金額は3,000円（税込）です。製品価格を分割回数で割った金額に1円未満の端数がある場合は、月々の支払い金額に差が生じることがあります。上記の月額は税込です。ペイディあと払いプランApple専用の詳細についてはapple.com/jp/shop/browse/financingをご覧ください。\r\nAppleは、あなたのインターネット回線のIPアドレスを地理的な区域と照合した結果、または以前にAppleのサイトを利用した際に入力された位置情報をもとに、あなたのおおよその位置を判断します。', 'http://localhost:8088/images/81Fm0tRFdHL.__AC_SY445_SX342_QL70_ML2_.jpg', '16インチMacBook Proをカスタマイズ - スペースグレイ', 348800, 50, 2),
(9, b'1', 'M2の驚異的なパワーを内蔵 – 13インチMacBook Proは、ポータブルでパワフルなノートブックです。次世代の8コアCPU、10コアGPU、最大24GBのユニファイドメモリにより、もっと多くのことをもっと速くできます。\r\n最大20時間使えるバッテリー – 電力効率に優れたApple M2チップにより、朝から晩まで使えます。\r\nパフォーマンスが持続 – 13インチMacBook Proは、アクティブクーリングシステムでプロレベルの性能をキープ。CPUやGPUへの負荷が高い作業を何時間でも続けられます。\r\n目の覚めるようなディスプレイ – 500ニトの輝度とP3の広色域を持つ13.3インチのRetinaディスプレイが、あざやかな色と目を見張るディテールを映し出します。\r\nHDカメラとスタジオ品質のマイク – FaceTime HDカメラと3マイクアレイが、シャープな映像と魅力的なサウンドを届けます。', 'http://localhost:8088/images/61vkJ9V6-dL._AC_SX679_.jpg', '2022 13インチMacBook Pro: 8コアCPUと10コアGPUを搭載したApple M2チップ, 256GB SSD - シルバー', 173327, 50, 2),
(10, b'1', '1日中使えるバッテリー – これまでで最長の最大18時間駆動するバッテリー。 パワフルなパフォーマンス – プロレベルの編集からアクション満載のゲームまで、何でも楽々。8コアCPU搭載のApple M1チップは、一世代前のモデルより最大3.5倍高速。なのに消費電力は大幅に抑えます。\r\nパワフルなパフォーマンス – プロレベルの編集からアクション満載のゲームまで、何でも楽々。8コアCPU搭載のApple M1チップは、一世代前のモデルより最大3.5倍高速。なのに消費電力は大幅に抑えます。\r\n超高速メモリ – 8GBのユニファイドメモリが、システム全体を高速かつスムーズに。メモリを大幅に消費するマルチタブを使ったネットサーフィンなどのタスクを快適にし、大容量のグラフィックファイルもすぐに開けます。\r\n目を奪うディスプレイ – 13.3インチのRetinaディスプレイが、まったく新しいレベルのリアルさで画像に躍動感を与えます。文字はシャープでクリア。色はこれまで以上に鮮明です。\r\nMacを選ぶ理由 – 設定が簡単。使い方が簡単。圧倒的にパワフル。直感的。すぐに使えるアプリが最初からたっぷり内蔵。Macがあれば、まったく新しい方法で働き、遊び、作れます。', 'http://localhost:8088/images/7164QKnFoPL._AC_SX679_.jpg', 'Apple 2020 MacBook Air ノートパソコン: Apple M1 Chip、13インチ、8GB RAM、256GB SSD、バックライトKeyboard、FaceTime HDカメラ、Touch ID、iPhoneとiPadに対応; シルバー', 129354, 50, 2),
(11, b'1', 'Built in incredible power of M2 Pro or M2 Max with M2 Pro or M2 Max chip, you can handle your project with high performance. The M2 Pro uses a 12-core CPU, 19-core GPU, and up to 32GB unified memory. The M2 Max uses a 12-core CPU, up to 38-core GPU, and up to 96GB unified memory\nUp to 22 hours of battery power efficient M2 Pro or M2 Max chip for all day use. Whether you use a battery or connect it to a power source, the performance of your MacBook Pro notebook is overwhelming\nCOMPATIBLE WITH A WIDE RANGE OF APPS - Whether you are looking for professional apps such as Adobe Creative Cloud, Xcode, Affinity Designer, Microsoft 365 and many of your favorite iPhone apps and iPad apps run at a flying speed\nBEAUTIFUL DISPLAY FOR PROFESSIONALS 16.2\" Liquid Retina XDR Display is compatible with Extreme Dynamic Range. With over 1,000 nitos brightness, you can create beautiful HDR content. Professionals can choose from a variety of reference modes so you can get the best job on the go\nAdvanced Camera and Audio 1080p FaceTime HD Camera, Studio Quality 3 Mic Array and 6 Speaker Sound System for Spatial Audio delivers sharp video and attractive sound\nVersatile connectivity MacBook Pro features MagSafe charging port, 3 Thunderbolt 4 ports, SDXC card slots, HDMI port and headphone jack. You can also use a seamless wireless connection via Wi-Fi 6E and Bluetooth 5.3\nIncludes Touch ID Magic Keyboard with Full Height function key column and Touch ID. Conveniently and securely to unlock your Mac or sign in apps or sites for quick and easy use', 'http://localhost:8088/images/61CHqS31PiL._AC_SX679_.jpg', 'Apple 2023 MacBook Pro M2 Max Chip Laptop: 16.2\" Liquid Retina XDR Display, 12 Core CPU and 38 Core GPU, 32GB Unified Memory, 1TB SSD Storage, Backlit Keyboard, 1080p FaceTime HD Camera, Works with iPhone and iPad - Silver', 457573, 50, 2),
(12, b'1', '144Hzによる快適なゲーム体験\r\n\r\n144Hzのリフレッシュレートによって高い視認性を実現。\r\n激しい動きの際、高速でクリアな映像体験が戦場であなたをサポートします。\r\n1ms（GTG）の応答速度で残像感を低減\r\n\r\n応答速度1ms（GTG）により、素早い動きもくっきりと表示します。\r\nなめらかで安定した映像体験\r\n\r\nAMD FreeSync PremiumとG-SYNC compatibleに対応。\r\n表示遅延や画面のカクツキを気にせずにゲームを楽しめます。\r\n高視野角で鮮やかなIPSパネル\r\n\r\n多くのクリエイターが愛用するIPSパネルを採用。\r\n高視野角で鮮やかな発色をゲームで体験することができます。\r\n\r\nベゼルレスデザイン\r\n約1mm幅のスリムなサイドベゼルは最高のマルチモニター環境を提供し、省スペースで机の上を効率的に使います。', 'http://localhost:8088/images/100000001008007750_10204_001.jpg', 'ピクシオ Pixio PX248PA-PW [ゲーミングモニター 23.8インチ 144Hz FHD Fast IPSパネル 1ms （GTG） ドット抜け交換保証]', 31980, 50, 3),
(13, b'1', 'JAPANNEXT ジャパンネクスト JN-27VCG240FHDR の 商品概要\r\n27インチ 曲面（R1500）\r\n\r\n27インチ R1500の曲面モニターは、画面でプレーヤーを包み込むように、没入感を高めるだけでなく、画面の端までプレーヤーからの距離がより均一化されるため見やすく、より鮮やかに表示します。27インチの大画面でありながら画面が見やすく、特にFPSなどのゲームプレイに最適です。HDRにも対応しゲーム映像や映画などの動画コンテンツをより鮮やかに表示します。\r\n240Hzの高リフレッシュレートに対応\r\n\r\n1秒間に240回の画面更新が可能な240Hzリフレッシュレートに対応（DP×1, HDMI×1）。より素早く、なめらかに画面を表示出来るため操作遅延が少なくなり特にFPSなどの動きの早いゲームにてより優位なプレイが可能になります。\r\nMPRT 1ms 高速応答速度対応\r\n\r\nMPRT 1msの高速応答速度に対応。ゲームはもちろんスポーツやアクション映画など動きの早い動画でも残像感が少なく、くっきりと快適な視聴が可能です。\r\n充実のインターフェース\r\n\r\n映像入力端子はHDMI、DPに対応、様々な入力機器からの映像入力が可能です。※ 240HzリフレッシュレートはHDMI×1, DP×1が対応です。\r\nVESAマウント対応\r\n\r\n75×75のVESAマウントに対応しているので別売のモニターアームやモニタースタンドへの取り付けが可能です。', 'http://localhost:8088/images/100000001006494014_10204_001.jpg', 'JAPANNEXT ジャパンネクスト JN-27VCG240FHDR [曲面ゲーミングモニター/27インチ/VAパネル/非光沢/Full HD（1920×1080）/最大リフレッシュレート240Hz/1ms（MPRT）]', 33170, 50, 3),
(14, b'1', '30インチ曲面ウルトラワイドゲーミングモニター\r\n\r\n30インチの湾曲液晶パネル（R1500）を採用、包み込むような圧倒的な没入感を実現します。ウルトラワイドWFHD（2560×1080）解像度は対応ゲームでは左右により広くフィールドを表示し敵をより早く発見することが出来ます。\r\nWFHD（2560×1080）解像度\r\n\r\n圧倒的な没入感を実現するウルトラワイドWFHD（2560x1080）はゲームプレイはもちろん、デスクワークにも最適。超高解像度は表計算ソフトの広域な表示領域を実現、文書やホームページなど複数を画面上に表示出来することができます。\r\n高画質VAパネル\r\n\r\n高コントラスト（3000：1）に対応した液晶パネルは写真編集や映画鑑賞にも最適です。HDR（ハイダイナミックレンジ）に対応。明るい部分も暗い部分もくっきり表現しリアルに迫った深みのある映像を演出します。sRGB99％の広色域に対応、写真編集等にも最適です。\r\nインターフェイス\r\n\r\n映像入力端子はDisplayPort1.2 ×2（200Hz対応）、HDMI2.0 ×2（165Hz対応）、を搭載します。また複数の入力を同時に表示する「PBP（Picture by Picture）」に対応、PBPモードでは、最大2つの入力映像を左右同時に表示可能。さらに2つの入力の一つを子画面にて表示する「PIP（Picture in Picture）」も可能です。\r\nその他特徴\r\n\r\n75×75のVESAマウントに対応（付属のVESA取付金具を使用します）、別売のモニターアームやモニタースタンドへの取り付けが可能です。なおスピーカーは内蔵しておりません。', 'http://localhost:8088/images/100000001007979079_10204.jpg', 'JAPANNEXT ジャパンネクスト JN-VCG30202WFHDR-N [30型 ウルトラワイド WFHD（2560×1080）曲面ゲーミングモニター 200Hz対応 HDMI DP]', 39980, 123, 3),
(15, b'1', '24.5インチのVAパネルを搭載、フルHD解像度（1920×1080）に対応したゲーミングモニターです。240Hzの超高速リフレッシュレート、1ms（MPRT）の高速応答速度に対応し、FPSなどの動きの速いゲームプレイに最適です。\r\n350cd/m2の高輝度液晶を採用、3000：1の高コントラスト比の液晶は映像をくっきりと鮮やかに表示します。HDR（ハイダイナミックレンジ）に対応。明るい部分も暗い部分もくっきり表現しリアルに迫った深みのある映像を演出します。HDR対応のブルーレイディスクやビデオ・オン・デマンド、ゲームなどの表示が可能です。', 'http://localhost:8088/images/100000001007901618_10204.avif', 'JAPANNEXT ジャパンネクスト JN-245VG240FLFHDR [ゲーミングモニター/24.5型/1920×1080/VAパネル/非光沢/240Hz/1ms（MPRT）/HDR対応/HDMI×2 DP×2]', 29180, 50, 1),
(16, b'1', '本製品は23.8インチのWQHDパネルを搭載、165Hzのリフレッシュレート、AMD FreeSyncに対応した高解像度ゲーミングモニターです。MPRTを搭載、1msの高速応答速度を実現しゲームプレイに最適です。WQHD（2560x1440）の高解像度に対応しながら最大165Hzの高リフレッシュレートに対応（DP接続時）高精細で滑らかな表現を可能にし、より快適なゲームプレイを実現します。350cd/m2 の高輝度液晶はHDRに対応しより鮮やかな色彩を表現し、ゲーム以外にも映画や動画サービスをお楽しみいただくのに最適です。*HDRはHDMIのみ対応となります。映像入力端子はDisplayPort1.2 x1（165Hz対応）、HDMI2.0 x1（144Hz対応）、DVI-I x1（75hz対応） を搭載しています。スピーカーは内蔵しておりません。別売りのVESAアダプター「JN-ADP-2427SVESA」を使用することで75mm x 75mmおよび100mm x 100mmのVESAマウントに対応、モニターアームやモニタースタンドへの取り付けが可能です。', 'http://localhost:8088/images/100000001007464218_10204.jpg', 'JAPANNEXT ジャパンネクスト JN-238GT165WQHDR [23.8型 ゲーミングモニターJN-238GT165WQHDR 165hz対応 WQHD HDMI DP DVI-I]', 26980, 50, 3),
(17, b'1', '独自新技術SilentTouchテクノロジーを用いた静音設計で、操作音を従来比90％軽減しました。静かな環境で仕事に集中したい方に最適です。図書館や家族が寝静まった後など、クリック音さえも気になるほどの静かな環境でも使用できます\r\n', 'http://localhost:8088/images/100000001005842987_10204.jpg', 'ロジクール Logicool MK295GP [ロジクール サイレント ワイヤレスコンボ グラファイト]', 4100, 123, 4),
(18, b'1', '「Xbox ワイヤレス コントローラー」 は洗練された形状に滑りにくく操作しやすい加工を施した、より快適にゲームをプレイするために開発されたコントローラーです。\r\n正確な操作を実現するハイブリッド方向パッドを搭載し、トリガー、バンパーおよび背面にテクスチャー加工を採用。また、すぐにゲーム画面をキャプチャーして共有できるシェア ボタンを新たに搭載しました。Xbox アクセサリー Appを使えば、ボタンの割り当てなど設定することができます。\r\n本製品は、Xbox Series X|S, Xbox One, Windows 10 PC, Android、iOSでお使いいただけます。3.5mmオーディオ ジャックに対応したヘッドセットなどを本体に直接接続してお使いいただけます。', 'http://localhost:8088/images/100000001007967008_10204.jpg', 'マイクロソフト Microsoft QAT-00006 [Xbox ワイヤレス コントローラー （カーボン ブラック）]', 7050, 50, 4),
(19, b'1', 'ワコムの新たなフラグシップモデルとなる26.9型液晶ペンタブレット。あらゆる技術革新により色精度と解像度がさらに向上、新テクノロジーWacom Pro Pen 3搭載による描画応答速度の進化により「リアル」な紙とペンの感覚をそのまま表現できるプロフェッショナル向けペンタブレットです。\r\n※専用スタンド（ACK64801KZ）又はVESAマウント規格に対応のアームが必須となります。', 'http://localhost:8088/images/100000001007408706_10204_001.jpg', 'ワコム WACOM DTH271K0D [Wacom Cintiq Pro 27 液晶ペンタブレット/26.9型/ProPen3対応/4K/120Hz/1年保証/ブラック/スタンド別売必須]', 481800, 50, 4),
(20, b'1', 'Wacom Cintiq Pro 27（DTH271K0D）専用のスタンド。\r\n※Wacom Cintiq Pro 27ご使用の場合には専用スタンド又は専用アームが必須となります。', 'http://localhost:8088/images/100000001007408707_10204_001.jpg', 'ワコム WACOM ACK64801KZ [Wacom Cintiq Pro 27 Stand （DTH271K0D専用スタンド）]', 68760, 50, 4),
(21, b'1', 'MacBook Air 15 インチ (2023) - Apple M2 8-コア と 10-コア GPU - 8GB RAM - SSD 512GB - JIS配列キーボードに関して知りたかったことすべて\r\nApple MacBook Air - 10-Core GPU - SSD 512 GB - 8 GB - Space Gray - (2023)\r\n弊社のパートナーは電子機器のエキスパートであり、各商品が100%機能することをテストおよび検証したうえで、工場から発送します。Back Marketで購入されたリファービッシュ品に最低1年間の動作保証がついているのはこのためです。\r\nMacBook Air 15 インチ (2023) - Apple M2 8-コア と 10-コア GPU - 8GB RAM - SSD 512GB - JIS配列キーボード', 'http://localhost:8088/images/a62ba26b-0447-4273-ac68-459c8f29f1ce-1_96bcf344-12af-4500-82cb-d99b31b8c9af.avif', 'MacBook Air 15 インチ (2023) - Apple M2 8-コア と 10-コア GPU - 8GB RAM - SSD 512GB - JIS配列キーボード', 199800, 50, 2);


-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE  IF NOT EXISTS `user` (
  `used_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`used_id`, `active`, `email`, `full_name`, `password`, `role`, `user_name`) VALUES
(1, b'1', 'admin@gmail.com', 'admin', 'admin', 'admin', 'admin'),
(2, b'1', '123123@gmail.com', '123', '123', 'user', '123');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- テーブルのインデックス `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`);

--
-- テーブルのインデックス `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `FKdaxos43jgg5v9l2jics6kv9y9` (`oder_id`),
  ADD KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`);

--
-- テーブルのインデックス `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`used_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- テーブルの AUTO_INCREMENT `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `used_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`used_id`);

--
-- テーブルの制約 `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FKb8bg2bkty0oksa3wiq5mp5qnc` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `FKdaxos43jgg5v9l2jics6kv9y9` FOREIGN KEY (`oder_id`) REFERENCES `orders` (`order_id`);

--
-- テーブルの制約 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
