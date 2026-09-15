import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final String descriptionEn;
  final String descriptionAr;
  final List<String> featuresEn;
  final List<String> featuresAr;
  final List<String> techStack;
  final String category;
  final IconData icon;
  final Color primaryColor;
  final String? githubUrl;
  final String? liveUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool isFeatured;
  final String architectureEn;
  final String architectureAr;
  final String imagePath;
  final List<String> galleryImages;
  final String impactEn;
  final String impactAr;

  const ProjectModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.featuresEn,
    required this.featuresAr,
    required this.techStack,
    required this.category,
    required this.icon,
    required this.primaryColor,
    required this.architectureEn,
    required this.architectureAr,
    required this.imagePath,
    required this.impactEn,
    required this.impactAr,
    this.galleryImages = const [],
    this.githubUrl,
    this.liveUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.isFeatured = false,
  });
}

class SkillCategory {
  final String titleEn;
  final String titleAr;
  final IconData icon;
  final List<SkillModel> skills;

  const SkillCategory({
    required this.titleEn,
    required this.titleAr,
    required this.icon,
    required this.skills,
  });
}

class SkillModel {
  final String name;
  final double level;
  final String proficiency;
  final IconData icon;
  final Color color;
  final String tagEn;
  final String tagAr;
  final String noteEn;
  final String noteAr;
  const SkillModel({
    required this.name,
    required this.level,
    required this.proficiency,
    required this.icon,
    required this.color,
    required this.tagEn,
    required this.tagAr,
    required this.noteEn,
    required this.noteAr,
  });
}

class ExperienceModel {
  final String roleEn;
  final String roleAr;
  final String companyEn;
  final String companyAr;
  final String locationEn;
  final String locationAr;
  final String periodEn;
  final String periodAr;
  final String descriptionEn;
  final String descriptionAr;
  final List<String> highlightsEn;
  final List<String> highlightsAr;
  final bool isCurrent;

  const ExperienceModel({
    required this.roleEn,
    required this.roleAr,
    required this.companyEn,
    required this.companyAr,
    required this.locationEn,
    required this.locationAr,
    required this.periodEn,
    required this.periodAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.highlightsEn,
    required this.highlightsAr,
    this.isCurrent = false,
  });
}

class PortfolioData {
  static const String nameEn = "Omar Ragab";
  static const String nameAr = "عمر رجب";
  static const String titleEn =
      "Mid-Level Flutter Developer | Mobile Software Engineer";
  static const String titleAr =
      "مطور تطبيقات فلاتر (Mid-Level) | مهندس برمجيات الموبايل";
  static const String email = "omarragab712000@gmail.com";
  static const String phone = "+201018027405";
  static const String displayPhone = "01018027405";
  static const String locationEn = "Mansoura, Egypt (Open to Remote Globally)";
  static const String locationAr =
      "المنصورة، مصر (متاح للعمل عن بُعد محلياً وعالمياً)";
  static const String githubUrl = "https://github.com/omarragab2020";
  static const String linkedinUrl =
      "https://linkedin.com/in/omar-ragab-347200212";
  static const String whatsappUrl = "https://wa.me/201018027405";
  static const String profileImage = "assets/images/omar_profile.jpg";

  static const String bioEn =
      "Mid-Level Flutter Developer with 2+ years of commercial experience engineering scalable cross-platform mobile apps for Android, iOS & Web. "
      "Proven expertise in Clean Architecture, reactive State Management (GetX, BLoC, Provider), real-time WebSockets & Pusher streams, "
      "complex RESTful APIs, and backend ecosystems (Firebase, Supabase). "
      "Experienced in remote collaboration, translating Figma prototypes into pixel-perfect 60fps applications, and writing robust, maintainable Dart code ready for production.";

  static const String bioAr =
      "مطور تطبيقات Flutter بمستوى Mid-Level يمتلك خبرة عملية لأكثر من سنتين (+2) في بناء وتطوير تطبيقات الموبايل التجارية متعددة المنصات (Android, iOS & Web). "
      "خبرة قوية في تطبيق المعمارية النظيفة (Clean Architecture)، وإدارة الحالة (GetX, BLoC, Provider)، والربط اللحظي عبر WebSockets و Pusher، "
      "وتكاملات الـ REST APIs و Firebase و Supabase. "
      "متمكن من العمل الفعّال ضمن فرق العمل عن بُعد (Remote Teams)، وتحويل تصاميم Figma بدقة متناهية مع كود نظيف وسهل الصيانة وقابل للتوسع.";

  static const String educationEn =
      "B.S. in Computer Science - Mansoura University (2018 - 2022)";
  static const String educationAr =
      "بكالوريوس علوم الحاسب - جامعة المنصورة (2018 - 2022)";

  static const int yearsOfExperience = 2;
  static const int totalProjects = 10;
  static const int satisfiedUsersCount = 50000;
  static const int codeCommits = 1200;

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      roleEn: "Mid-Level Flutter Developer",
      roleAr: "مطور تطبيقات فلاتر (Mid-Level)",
      companyEn: "Nuess",
      companyAr: "شركة نيوس (Nuess)",
      locationEn: "Remote (Jordan)",
      locationAr: "عن بُعد (الأردن)",
      periodEn: "2025/02 – Present",
      periodAr: "فبراير 2025 – حتى الآن",
      descriptionEn: "Engineering full-scale commercial applications including real-time chalet booking ecosystems, multi-vendor e-commerce, and logistics services.",
      descriptionAr: "تطوير تطبيقات تجارية متكاملة تشمل منظومات حجز الشاليهات اللحظية، المتاجر المتعددة، والخدمات اللوجستية.",
      highlightsEn: [
        "Architected dual-app solutions (Client App + Provider Admin Dashboard) with real-time Pusher push event synchronization and map clustering.",
        "Built secure digital wallet architectures, encrypted voucher code redemptions, and gamified loyalty point transactions.",
        "Delivered smooth 60fps responsive UIs, robust local caching with SQLite, and decoupled Clean Data Layers.",
      ],
      highlightsAr: [
        "بناء منظومة ثنائية متكاملة (تطبيق العملاء + لوحة تحكم المزودين) مع مزامنة أحداث Pusher اللحظية والخرائط المجمعة.",
        "تطوير وتأمين أنظمة المحافظ الإلكترونية، شحن الرصيد بالأكواد الفريدة، ونظام نقاط المكافآت التفاعلي.",
        "تحقيق واجهات سلسة 60 إطار بالثانية مع تخزين محلي فعال عبر SQLite وطبقات بيانات نظيفة ومنفصلة.",
      ],
      isCurrent: true,
    ),
    ExperienceModel(
      roleEn: "Flutter Developer",
      roleAr: "مطور تطبيقات فلاتر",
      companyEn: "Nuess",
      companyAr: "شركة نيوس (Nuess)",
      locationEn: "Remote (Jordan)",
      locationAr: "عن بُعد (الأردن)",
      periodEn: "2023/05 – 2023/11",
      periodAr: "مايو 2023 – نوفمبر 2023",
      descriptionEn: "Built production features, multi-store shopping experiences, phone number authentication, and payment gateway workflows.",
      descriptionAr: "تطوير ميزات إنتاجية، تجارب تسوق متعددة المتاجر، تسجيل الدخول برقم الهاتف، وتدفقات الدفع الإلكتروني.",
      highlightsEn: [
        "Developed multi-store e-commerce modules with dynamic product filtering and saved multi-location geocoding.",
        "Integrated Firebase Authentication, Cloud Messaging (FCM) background services, and multipart HTTP file uploads.",
        "Refactored state logic to modular GetX controllers, significantly improving code maintainability and testability.",
      ],
      highlightsAr: [
        "برمجة وحدات التجارة الإلكترونية للمتاجر المتعددة مع التصفية الذكية للمنتجات وحفظ العناوين الجغرافية.",
        "دمج خدمات Firebase للتوثيق والإشعارات السحابية في الخلفية ورفع الملفات والإيصالات بنظام Multipart.",
        "إعادة هيكلة منطق إدارة الحالة مع وحدات تحكم GetX النمطية لتحسين سهولة الصيانة واختبار الكود.",
      ],
    ),
    ExperienceModel(
      roleEn: "Flutter Developer",
      roleAr: "مطور تطبيقات فلاتر",
      companyEn: "Mobileaders",
      companyAr: "موبايليدرز (Mobileaders)",
      locationEn: "Mansoura, Egypt",
      locationAr: "المنصورة، مصر",
      periodEn: "2022/10 – 2023/01",
      periodAr: "أكتوبر 2022 – يناير 2023",
      descriptionEn: "Collaborated in Agile sprints to build reactive mobile applications, pixel-perfect custom widgets, and API integrations.",
      descriptionAr: "العمل ضمن دورات Agile لبناء تطبيقات موبايل تفاعلية، مكونات واجهة مستخدم مخصصة، وربط واجهات الـ REST APIs.",
      highlightsEn: [
        "Worked closely with UI/UX teams to translate Figma prototypes into pixel-perfect Flutter applications.",
        "Engineered responsive and adaptive layouts ensuring compatibility across diverse screen resolutions.",
        "Maintained state with GetX and Provider while implementing clean architecture repository patterns.",
      ],
      highlightsAr: [
        "التعاون مع مصممي واجهات المستخدم لتحويل تصاميم Figma إلى واجهات برمجية متطابقة ودقيقة.",
        "بناء واجهات متجاوبة ومتكيفة تدعم مختلف أحجام ودقات الشاشات بكفاءة عالية.",
        "إدارة الحالة والتنقلات البرمجية مع GetX و Provider مع الالتزام بنمط المستودع (Repository Pattern).",
      ],
    ),
  ];

  static const List<ProjectModel> projects = [
    // 1. Engeez Driver (Live Google Play & Apple App Store)
    ProjectModel(
      id: "engeez_delivery",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.neuss.engeezdriverapp&pcampaignid=web_share",
      appStoreUrl: "https://apps.apple.com/jo/app/engeez-driver/id6758239812",
      titleEn: "Engeez Driver - Real-Time Logistics & Dispatch Platform",
      titleAr:
          "تطبيق إنجز للسائقين (Engeez Driver) - منظومة التوصيل واللوجستيات اللحظية",
      subtitleEn:
          "Enterprise Driver App with Background GPS Telemetry, Socket.IO & Price Negotiation",
      subtitleAr:
          "تطبيق السائقين التجاري مع التتبع الحي في الخلفية والملاحة والتفاوض اللحظي على الأسعار",
      descriptionEn:
          "A mission-critical enterprise driver dispatch and courier logistics platform published on Google Play and Apple App Store. Engineered for multi-category on-demand delivery (Express, Documents, Electronics, Food). Features high-frequency Socket.IO real-time order dispatching with audio alarm popups, battery-optimized background GPS telemetry service, interactive multi-stage order tracking (Start to Sender -> Confirm Pickup -> Start to Receiver -> Confirm Delivery), live in-app price negotiation engine, barcode & QR package scanner, digital Cash on Delivery (COD) collection ledger, and driver daily KPI rating metrics.",
      descriptionAr:
          "تطبيق تجاري متكامل لإدارة واستقبال شحنات التوصيل اللوجستية منشور رسمياً على متجري Google Play و Apple App Store. يدعم الشحنات المتنوعة (Express، مستندات، أجهزة إلكترونية، وطعام). يعتمد على توزيع الطلبات اللحظي عبر Socket.IO مع تنبيهات صوتية واهتزازية فورية، وتتبع موقع السائق في الخلفية بأقل استهلاك للبطارية، ومتابعة دقيقة لمراحل الشحنة، ونظام تفاوض لحظي على الأسعار بين السائق والعميل، مع مسح الباركود والـ QR للشحنات، ومحفظة مالية لإدارة التحصيل النقدي (COD) وإحصائيات الـ KPI اليومية.",
      featuresEn: [
        "Real-time Socket.IO dispatching with audible push alerts and fast Accept/Reject decision pipelines",
        "Battery-efficient background GPS telemetry stream with adaptive pinging intervals (Flutter Background Service)",
        "End-to-End order progression workflow (Start to Sender, Confirm Pickup, Start to Receiver, Confirm Delivery)",
        "Real-time in-app price bidding & negotiation controller between driver and client",
        "Integrated Barcode & QR Code camera scanner for package handoff verification",
        "Cash on Delivery (COD) collection ledger, daily earnings summary, and performance KPI analytics",
      ],
      featuresAr: [
        "إسناد الطلبات اللحظي عبر Socket.IO مع تنبيهات صوتية منبهة وقبول/رفض فوري للطلبات",
        "خدمة تتبع موقع السائق في الخلفية عبر GPS بأعلى دقة وتوفير فائق للبطارية (Background Service)",
        "تدفق كامل ومحكم لمراحل التوصيل (الانطلاق للمرسل ⬅️ استلام الشحنة ⬅️ الانطلاق للمستلم ⬅️ تأكيد التسليم)",
        "محرك تفاوض حي ومزايدة على الأسعار بين السائق والعميل للشحنات الخاصة والمستعجلة",
        "ماسح باركود ورموز QR مدمج للتحقق من أرقام الشحنات وسلامة تسليم الطرود",
        "محفظة مالية لتحصيل المبالغ النقدية (COD) وسجل أرباح مفصل وإحصائيات أداء الـ KPI",
      ],
      techStack: [
        "Flutter & Dart",
        "Google Play & App Store",
        "Socket.IO Real-Time",
        "Flutter Background Service",
        "Geolocator GPS Streams",
        "GetX State Architecture",
        "Mobile Scanner (QR/Barcode)",
        "Firebase Cloud Messaging",
        "Biometric Auth (LocalAuth)",
        "Clean Architecture",
      ],
      category: "Delivery",
      icon: Icons.delivery_dining_rounded,
      primaryColor: Color(0xFF00C853),
      isFeatured: true,
      imagePath: "assets/projects/engeez.png",
      galleryImages: [
        "assets/projects/engeez.png",
        "assets/projects/engeez_driver_1.png",
        "assets/projects/engeez_driver_2.png",
        "assets/projects/engeez_driver_3.png",
        "assets/projects/engeez_driver_4.png",
        "assets/projects/engeez_driver_5.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn:
          "Modular GetX State Architecture decoupled into specialized controllers (Home, Orders, Tracking, Negotiation, Wallet, KPI). Utilizes background isolates for GPS telemetry, secure token storage, and persistent Socket.IO event listeners.",
      architectureAr:
          "معمارية GetX نمطية مقسمة إلى وحدات تحكم متخصصة (الطلبات، التتبع، التفاوض، المحفظة، تقييم الأداء). تعتمد على معالجة متوازية (Isolates) في الخلفية لتتبع الـ GPS مع إدارة آمنة للتوكن واتصال Socket.IO مستقر.",
      impactEn:
          "Published on Google Play & App Store; handling hundreds of live logistics shipments daily across Jordan with 99.8% on-time delivery rate.",
      impactAr:
          "منشور على المتجرين؛ يدير مئات الشحنات اللوجستية اليومية في الأردن بنسبة تسليم ناجح 99.8% وسرعة استجابة فائقة.",
    ),
    // 2. Engeez Customer (Live Google Play & Apple App Store)
    ProjectModel(
      id: "engeez_customer",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.neuss.shipping&pcampaignid=web_share",
      appStoreUrl:
          "https://apps.apple.com/jo/app/engeez-%D8%A7%D9%86%D8%AC%D8%B2/id6755639468",
      titleEn: "Engeez Customer - On-Demand Shipping & Parcel Delivery",
      titleAr: "تطبيق إنجز للعملاء (Engeez Customer) - لطلب وشحن الطرود والمنتجات",
      subtitleEn:
          "Multi-Role Shipping Wizard with Offline MapLibre Vector Tiles & Real-Time Tracking",
      subtitleAr:
          "معالج شحن متعدد الأدوار مع خرائط فيكتور دون إنترنت (PMTiles) ومتابعة لحظية للشحنات",
      descriptionEn:
          "A next-generation on-demand courier and parcel delivery consumer application published on Apple App Store and Google Play. Engineered for individuals and merchants to dispatch goods seamlessly across Jordan. Features an intuitive 5-step shipping wizard (Sender/Receiver/Third-Party Organizer roles, categorized shipment types: Documents, Clothes, Electronics, Food & Groceries), offline Jordan vector map rendering using MapLibre GL & PMTiles, dynamic address book management with reverse geocoding, live order timeline status tracking (In Process -> On the Way -> Delivered), and comprehensive customer analytics overview with digital wallet integration.",
      descriptionAr:
          "تطبيق متطور لطلب وإرسال الشحنات والطرود السريعة منشور على متجري Google Play و Apple App Store. صُمم لخدمة الأفراد والتجار في شحن البضائع بسلاسة عبر جميع محافظات الأردن. يتميز بمعالج إنشاء شحنات ذكي من 5 خطوات (يدعم دور الراسل، المستلم، أو منسق الشحنة لطرف ثالث، مع تصنيف الطرود: وثائق، ملابس، إلكترونيات، طعام وبقالة)، وخرائط فيكتور محلية متقدمة عبر MapLibre GL و PMTiles، مع سجل عناوين ذكي، وتتبع حي لمراحل وتفاصيل الشحنة، ولوحة إحصائيات متكاملة ومحفظة إلكترونية.",
      featuresEn: [
        "5-Step intuitive shipment creation wizard supporting Sender, Receiver, and Third-Party organizer roles",
        "Categorized shipment profiles (Documents, Clothes, Electronics, Food & Groceries) with dynamic pricing",
        "High-performance vector map tile rendering with offline Jordan PMTiles & MapLibre GL",
        "Interactive Address Book with saved presets, Governorates & Areas geocoding selector",
        "Live shipment progress breakdown dashboard (In Process, On the Way, Delivered)",
        "Integrated Barcode & QR Code generator for shipment identity tags & receipts",
      ],
      featuresAr: [
        "معالج إنشاء شحنات ذكي من 5 خطوات يدعم خيارات (أنا الراسل، أنا المستلم، تنظيم الشحنة لشخص آخر، أو القوالب الجاهزة)",
        "تصنيف دقيق لأنواع الشحنات (وثائق، ملابس، إلكترونيات، طعام وبقالة) مع احتساب فوري للتكلفة",
        "خرائط فيكتور فائقة السرعة تعمل بدون إنترنت عبر MapLibre GL ومخططات Jordan PMTiles",
        "دفتر عناوين تفاعلي لحفظ الأماكن المفضلة وتحديد المحافظات والمديريات جغرافياً",
        "لوحة إحصائيات ومتابعة حية لمراحل الشحنة (قيد المعالجة ⬅️ في الطريق إليك ⬅️ تم التوصيل)",
        "توليد وتضمين أكواد الباركود ورموز QR لكل شحنة لسهولة التتبع والتوثيق",
      ],
      techStack: [
        "Flutter & Dart",
        "App Store & Google Play",
        "MapLibre GL & PMTiles",
        "GetX Architecture",
        "Mobile Scanner & Barcode",
        "Pinput (Phone OTP)",
        "Flutter Secure Storage",
        "Clean Architecture",
      ],
      category: "Delivery",
      icon: Icons.shopping_bag_rounded,
      primaryColor: Color(0xFF8B5CF6),
      isFeatured: true,
      imagePath: "assets/projects/engeez.png",
      galleryImages: [
        "assets/projects/engeez.png",
        "assets/projects/engeez_cust_1.png",
        "assets/projects/engeez_cust_2.png",
        "assets/projects/engeez_cust_3.png",
        "assets/projects/engeez_cust_4.png",
        "assets/projects/engeez_cust_5.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn:
          "Modular GetX architecture layered with domain-separated controllers (Shipments, AddressBook, Wallet, Analytics). Integrates local vector map PMTiles caching to eliminate external tile server load and ensure smooth 60fps rendering.",
      architectureAr:
          "معمارية GetX نمطية مقسمة إلى وحدات تحكم مخصصة (الشحنات، سجل العناوين، المحفظة، الإحصائيات). مع دمج خرائط PMTiles محلياً لتقليل استهلاك الإنترنت وتسريع التصفح بسلاسة 60fps.",
      impactEn:
          "Live on App Store & Google Play with thousands of successfully created on-demand parcels and seamless checkout.",
      impactAr:
          "منشور على المتجرين بخدمة آلاف الشحنات الناجحة وتجربة مستخدم سهلة وسريعة لطلب التوصيل.",
    ),
    // 3. Neuss Time Tracker (Live Apple App Store)
    ProjectModel(
      id: "time_tracker",
      appStoreUrl:
          "https://apps.apple.com/jo/app/neuss-time-tracker/id6761728653",
      titleEn: "Neuss Time Tracker Pro",
      titleAr: "تطبيق تايم تراكر (Neuss Time Tracker Pro)",
      subtitleEn:
          "Employee Work Hour Logger & Vacation Workflow on Apple App Store",
      subtitleAr:
          "نظام تسجيل ساعات العمل والإجازات للموظفين معتمد على متجر App Store",
      descriptionEn: "A dedicated employee productivity and attendance tracking application engineered with GetX and published on Apple App Store. Allows workers to clock in/out with live session timers, track break durations, review past work shifts by interactive calendar dates, reset active sessions, and submit annual or hourly leave requests with real-time approval status monitoring.",
      descriptionAr: "تطبيق لإدارة حضور وإنتاجية الموظفين مبني بواسطة GetX ومنشور رسمياً على متجر Apple App Store. يتيح تسجيل الحضور والانصراف بعداد زمني دقيق، واحتساب فترات الاستراحة، ومراجعة سجلات العمل السابقة عبر تقويم تفاعلي، وتقديم طلبات الإجازات السنوية أو الساعية.",
      featuresEn: [
        "High-accuracy live session timer with automatic break calculation and overtime logs",
        "Historical work shift archives queryable via interactive monthly calendar",
        "Leave request workflow supporting both annual and hourly permissions with manager status tracking",
        "Employee profile settings, job title updates, and secure local audit logging",
      ],
      featuresAr: [
        "عداد زمني دقيق لحساب ساعات العمل الصافية وفترات الراحة والأوقات الإضافية",
        "أرشيف تفاعلي كامل لسجلات الورديات اليومية قابل للبحث بالتقويم الشهري",
        "نظام تقديم طلبات الإجازات والأذونات الساعية ومتابعة حالة الموافقة من الإدارة",
        "الملف الشخصي للموظف مع حفظ السجلات والأذونات محلياً بأمان",
      ],
      techStack: [
        "Flutter",
        "GetX",
        "App Store Release",
        "Local SQLite",
        "Interactive Calendar",
        "Clean Architecture",
      ],
      category: "Tools",
      icon: Icons.timer_rounded,
      primaryColor: Color(0xFF6366F1),
      isFeatured: true,
      imagePath: "assets/projects/time_tracker.png",
      galleryImages: ["assets/projects/time_tracker.png"],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Domain Architecture with Local SQLite Shift Database, Time Calculation Services, and Reactive GetX Bindings.",
      architectureAr: "معمارية Clean Architecture مع قاعدة بيانات SQLite لتخزين الورديات وخدمات حساب الوقت مع GetX Bindings.",
      impactEn: "Published on Apple App Store; eliminated manual timesheet calculation errors and streamlined leave approval workflows.",
      impactAr: "منشور على Apple App Store؛ قضى على أخطاء حساب ساعات العمل وسرّع من دورات اعتماد الإجازات.",
    ),
    // 4. Manhaj Quran (Live Google Play Store)
    ProjectModel(
      id: "quran_manhaj_app",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.omar.qurankareem2",
      titleEn: "Manhaj - Al-Mus-haf Al-Mugawwad & Islamic Curriculum",
      titleAr: "تطبيق منهج (المصحف المجود والمنهج الإسلامي الشامل)",
      subtitleEn: "Full Quran Super-App with Tajweed, Tafseer, Salah, Audio & Offline Curriculums",
      subtitleAr: "تطبيق إسلامي فائق يشمل المصحف المجود، التلاوات الصوتية، التفاسير، والمناهج الشرعية",
      descriptionEn: "A comprehensive, multi-module Islamic encyclopedia and Quran curriculum platform published on Google Play. Features color-coded Tajweed pages with high-fidelity vector rendering, offline audio recitations with byte caching from over 20 renowned Qaris, continuous background playback via AudioHandler, precision GPS-calculated prayer times with dynamic countdowns and custom Athan notifications, full Tafseer engines (Al-Muyassar, Ibn Katheer, Al-Saadi), Hisn Al-Muslim Azkar, verified Hadith databases with search, interactive digital Sebha with custom goal presets, and complete Islamic educational curriculums.",
      descriptionAr: "موسوعة إسلامية متكاملة ومنصة مناهج قرآنية منشورة على متجر Google Play. تضم المصحف المجود الملون بدقة عالية، وتلاوات صوتية لأكثر من 20 قارئاً مع تشغيل في الخلفية بدون إنترنت، ومواقيت صلاة دقيقة بحسابات GPS وأذان مخصص، ومحركات تفاسير متعددة، وأذكار حصن المسلم، وأحاديث نبوية مصنفة، وسبحة ذكية، ومناهج تعليمية شرعية.",
      featuresEn: [
        "Color-coded Tajweed Mushaf with verse bookmarking, custom fonts, and ayah-by-ayah tafseer",
        "High-performance background audio player with byte-range caching & lock-screen controls (just_audio)",
        "Astronomy-grade GPS prayer times calculator with multiple calculation methods & dynamic Athan alerts",
        "Comprehensive offline encyclopedias: Tafseer (Muyassar & Saadi), Sahih Hadith, and Hisn Al-Muslim",
        "Interactive digital Sebha with vibrating touch feedback and personalized dhikr counter targets",
        "Islamic educational curriculum covering Aqeedah, Fiqh, Tajweed rules, and Prophet biographies",
      ],
      featuresAr: [
        "مصحف التجويد الملون مع حفظ العلامات المرجعية والخطوط المخصصة والتفسير لكل آية",
        "مشغل صوتي متقدم يعمل في الخلفية مع التحكم من شاشة القفل والتحميل بدون إنترنت",
        "حاسبة مواقيت الصلاة الفلكية بدقة GPS مع تنبيهات الأذان والعد التنازلي للصلاة القادمة",
        "موسوعات شاملة بدون إنترنت: التفسير الميسر والسعدي، الأحاديث الصحيحة، وأذكار حصن المسلم",
        "سبحة إلكترونية ذكية تدعم الاهتزاز التفاعلي وتحديد الأهداف اليومية للأذكار",
        "مناهج تعليمية إسلامية في العقيدة والفقه والتجويد والسيرة النبوية",
      ],
      techStack: [
        "Flutter",
        "Google Play Release",
        "BLoC/Cubit",
        "just_audio & audio_service",
        "SQLite",
        "Hive",
        "WorkManager",
        "Clean Architecture",
      ],
      category: "Islamic",
      icon: Icons.menu_book_rounded,
      primaryColor: Color(0xFF10B981),
      isFeatured: true,
      imagePath: "assets/projects/quran_manhaj.png",
      galleryImages: ["assets/projects/quran_manhaj.png"],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Architecture (Domain/Data/Presentation), BLoC/Cubit state management, SQLite relational indexes, Hive fast key-value storage, and Background AudioHandler service.",
      architectureAr: "معمارية Clean Architecture مع BLoC وقاعدة بيانات SQLite لفهارس الآيات و Hive للبيانات السريعة ومشغل صوتي في الخلفية عبر AudioService.",
      impactEn: "Published on Google Play Store with thousands of active downloads and 100% offline availability.",
      impactAr: "منشور على Google Play بآلاف التحميلات ويعمل بكفاءة 100% بدون اتصال بالإنترنت.",
    ),
    // 5. Scholar Platform (Live Google Play & Web)
    ProjectModel(
      id: "scholar_edu",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.omar.scholar_edu",
      liveUrl: "https://scholaredu-a0f69.web.app",
      titleEn: "Scholar Platform - Enterprise EdTech Monorepo Ecosystem",
      titleAr: "منصة سكولار التعليمية (Scholar Platform) - منظومة EdTech متكاملة",
      subtitleEn:
          "Multi-Platform EdTech Suite (Student App, Parent App & Web Admin Dashboard)",
      subtitleAr:
          "منظومة تعليمية ثلاثية (تطبيق الطالب، تطبيق ولي الأمر، ولوحة تحكم الويب للمدرسين)",
      descriptionEn:
          "A production-grade, enterprise EdTech ecosystem engineered with Flutter & Melos Monorepo. Features a multi-tiered architecture comprising a Student Mobile App, a dedicated Parent oversight flavor, and a high-performance Web Admin & Teacher Dashboard. Powered by Supabase Real-time PostgreSQL, Edge Functions with PostgreSQL RPCs, DRM-protected Bunny.net CDN signed video streaming, automated timed competitive examination engines, Question Banks (QBank), multi-tier subscription models (per-lesson, monthly, and full-term), and dynamic public teacher profiles with QR deep linking.",
      descriptionAr:
          "منظومة تعليمية متكاملة للتعليم الإلكتروني مبنية بهيكلية Melos Monorepo لتوحيد الأكواد بين تطبيق الطلاب (Android & iOS)، وتطبيق أولياء الأمور، ولوحة تحكم الويب للمدرسين والإدارة. تعتمد على Supabase Real-time و Edge Functions، مع بث فيديو مشفر عبر Bunny.net CDN بروابط موقعة أمنياً، ومحرك اختبارات موقوتة وبنوك أسئلة ذكية، ونظام اشتراكات متعدد (بالدرس، بالشهر، وبالترم)، وبطاقات رقمية للمدرسين مع مشاركة الروابط برمز QR.",
      featuresEn: [
        "Multi-tier subscription engine supporting flexible enrollments (Per-Lesson, Monthly, Full-Term) with automated code redemption",
        "DRM-protected video lecture streaming via Bunny.net CDN with signed security tokens & watermarked player",
        "Automated timed competitive examination engine with randomized question banks & instant analytics",
        "Gamified student honors leaderboard (اللوحة الشرفية) with performance tracking & rank badges",
        "Dynamic Teacher Public Profiles with deep-linking URL routing and shareable QR identity cards",
        "Dedicated Parent App flavor for live tracking of student attendance, exam scores, and financial subscriptions",
      ],
      featuresAr: [
        "محرك اشتراكات مرن يدعم الدفع والاشتراك (بالدرس الفردي، بالاشتراك الشهري، أو بالترم الكامل) مع تفعيل الأكواد",
        "مشغل محاضرات فيديو مؤمن ضد القرصنة عبر Bunny.net CDN بروابط موقعة أمنياً وعلامات مائية متحركة",
        "محرك امتحانات تفاعلية موقوتة متصل ببنوك الأسئلة (QBank) مع تصحيح لحظي وتحليل أداء الطالب",
        "لوحة شرف تفاعلية للمتفوقين (اللوحة الشرفية) لتشجيع التنافس وترتيب أوائل المجموعات",
        "ملفات تعريفية عامة للمدرسين بـ Deep Links وبطاقات هوية رقمية قابلة للمشاركة برمز QR",
        "نسخة مخصصة لأولياء الأمور لمتابعة حضور الأبناء ودرجات الاختبارات وحالة الاشتراكات لحظياً",
      ],
      techStack: [
        "Flutter & Dart",
        "Melos Monorepo",
        "Supabase Real-time",
        "PostgreSQL & Edge Functions",
        "Bunny.net CDN (Signed URLs)",
        "GetX & Service Locator",
        "GetStorage & Hive CE",
        "Clean Architecture (MVC+Mixins)",
      ],
      category: "Education",
      icon: Icons.school_rounded,
      primaryColor: Color(0xFF06B6D4),
      isFeatured: true,
      imagePath: "assets/projects/scholar_edu.png",
      galleryImages: [
        "assets/projects/scholar_edu.png",
        "assets/projects/scholar_screen_1.png",
        "assets/projects/scholar_screen_2.png",
        "assets/projects/scholar_screen_3.png",
        "assets/projects/scholar_screen_4.png",
        "assets/projects/scholar_screen_5.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn:
          "Engineered as a Melos Monorepo splitting shared business logic (scholar_core), mobile client (scholar_edu), and web management (scholar_dashboard). Implements Clean Architecture with domain mixin decorators, BaseSupaBaseRepository query DSL, chunked response mappers, and secure Edge Functions for token minting.",
      architectureAr:
          "معمارية Monorepo عبر Melos تفصل منطق الأعمال والنماذج المشتركة (scholar_core) عن تطبيق الموبايل (scholar_edu) ولوحة تحكم الويب (scholar_dashboard). تطبق معمارية Clean Architecture مع طبقة مستودعات QueryBuilder DSL ومعالجة البيانات بالحزم لتسريع الأداء.",
      impactEn:
          "Live on Google Play & Web; powering active students and teachers with 99.9% video stream uptime, robust anti-piracy protection, and instant exam evaluations.",
      impactAr:
          "منشور على متجر Google Play والويب؛ يخدم آلاف الطلاب والمدرسين بنسبة استقرار 99.9% لبث المحاضرات، وحماية تامة للمحتوى من القرصنة، مع تصحيح فوري للامتحانات.",
    ),
    // 6. Tawfeer 360 / Entertainer
    ProjectModel(
      id: "tawfeer_360",
      titleEn: "Tawfeer 360 (Entertainer) - Deals, Vouchers & RBAC SuperApp",
      titleAr: "تطبيق توفير 360 (Tawfeer / Entertainer) - منصة العروض والكوبونات ولوحة الإدارة",
      subtitleEn:
          "Multi-Role Deals Ecosystem (SuperAdmin Dashboard, Merchant Provider & Customer App)",
      subtitleAr:
          "منظومة متكاملة للعروض والخصومات (لوحة تحكم السوبر أدمن، بوابة التاجر، وتطبيق العملاء)",
      descriptionEn:
          "A full-scale, multi-role deals and voucher ecosystem built with Flutter, GetX, and Firebase. Tailored for scalable enterprise promotional operations, featuring a 3-tier Role-Based Access Control (RBAC) architecture: SuperAdmin (controlling admin shifts/schedules, voucher issuance, offer approvals, category/banner sections, and user provisioning), Merchant Provider (creating discount campaigns, branch geolocation, and validating redemptions via built-in high-speed camera scanner), and Customer (browsing curated categories from dining to hospitality, interactive dual-map branch discovery with cluster markers, story feeds, and streamlined voucher purchasing with multipart receipt verification).",
      descriptionAr:
          "منظومة عروض وقسائم خصومات شاملة متعددة الصلاحيات (RBAC) مبنية بـ Flutter و GetX و Firebase. تنقسم إلى 3 أطراف متكاملة: لوحة تحكم السوبر أدمن (SuperAdmin) لإدارة ورديات العمل، واعتماد عروض المتاجر، والتحكم في الكوبونات والأقسام والبانرات، وبوابة التاجر (Merchant/Provider) لإدارة الفروع ومسح أكواد القسائم بالكاميرا والتحقق من صحتها لحظياً، وتطبيق العملاء (Customer) لاستكشاف العروض وتصفح الفروع على الخرائط التفاعلية مع دعم القصص الترويجية (Stories) وشراء الكوبونات برفع إيصالات الدفع.",
      featuresEn: [
        "Comprehensive SuperAdmin mobile control center: manage admin schedules & work hours, offer review pipeline, and banner sliders",
        "Role-Based Access Control (RBAC) user manager: instantly provision and monitor SuperAdmin, Provider, and Customer accounts with status toggling (Active/Pending)",
        "Merchant Voucher Engine: create discount vouchers, configure redemption limits, and review incoming purchase requests",
        "Instant camera QR & Barcode scanner (MobileScanner) for verified, real-time in-store voucher redemption logging",
        "Interactive dual-map rendering (FlutterMap with OpenStreetMap + Google Maps) with custom animated marker clustering & GPS routing",
        "Dynamic Story Feeds (StoryPresenter) for high-engagement merchant promotional stories and new arrival banners",
        "Multipart HTTP payment proof upload pipeline for swift bank transfer validation and automated voucher activation",
        "Enterprise notification architecture powered by Firebase Messaging (FCM) and custom local alerts for nearby deal drops",
      ],
      featuresAr: [
        "لوحة تحكم سوبر أدمن متكاملة: إدارة مواعيد وورديات العمل (Admin Schedules)، واعتماد عروض التجار، والتحكم في الأقسام والبانرات",
        "نظام إدارة الصلاحيات والمستخدمين (RBAC): فلترة ومتابعة حسابات المدراء والتجار والعملاء مع حالات الحساب (Active/Pending) وإضافة مستخدمين جدد",
        "محرك إدارة الكوبونات: إصدار قسائم الشراء، وتحديد نسب الخصم وكميات العرض، ومراجعة طلبات الشراء الواردة من العملاء",
        "ماسح كاميرا QR وباركود فوري (MobileScanner) للتحقق الأمني ومنع تكرار استبدال الكوبونات داخل الفروع",
        "خرائط تفاعلية مزدوجة (FlutterMap مع OSM و Google Maps) تدعم تجميع العلامات (Marker Clustering) والمسارات الجغرافية",
        "نظام قصص تفاعلي (Stories) لعرض أحدث الحملات الترويجية للمطاعم والفنادق والأنشطة الترفيهية",
        "بوابة دفع مرنة تدعم رفع إيصالات التحويل البنكي عبر Multipart HTTP للتحقق السريع وتفعيل القسائم آلياً",
        "منظومة إشعارات ذكية عبر Firebase FCM وتنبيهات مخصصة للعروض والخصومات القريبة جغرافياً",
      ],
      techStack: [
        "Flutter & Dart (SDK 3.7+)",
        "GetX State Management & Routing",
        "RBAC Multi-Role Architecture",
        "Firebase Auth & Cloud Messaging (FCM)",
        "FlutterMap & OSM Marker Clustering",
        "Google Maps Flutter",
        "Mobile Scanner & QR Flutter",
        "Story View & Presenter",
        "Multipart HTTP File Upload",
        "Rive & Flutter Animate",
      ],
      category: "E-commerce",
      icon: Icons.local_offer_rounded,
      primaryColor: Color(0xFF2563EB),
      isFeatured: true,
      imagePath: "assets/projects/tawfeer_360.jpg",
      galleryImages: [
        "assets/projects/tawfeer_360.jpg",
        "assets/projects/tawfeer_screen_1.png",
        "assets/projects/tawfeer_screen_2.png",
        "assets/projects/tawfeer_screen_3.png",
        "assets/projects/tawfeer_screen_4.png",
        "assets/projects/tawfeer_screen_5.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn:
          "Domain-driven GetX architecture segregating views and controllers into modular boundaries (SuperAdmin, Provider, Customer, OsmMaps, Vouchers). Uses reactive Service Locators, role-based route middleware guards, and robust multipart HTTP repository clients with resilient offline token caching.",
      architectureAr:
          "معمارية GetX نمطية قائمة على عزل النطاقات (Domain-Driven) تفصل وحدات SuperAdmin و Provider و Customer و الخرائط والكوبونات. مع تطبيق حماية التوجيه حسب الصلاحيات (Route Guards) وعميل رفع ملفات Multipart عالي الاعتمادية.",
      impactEn:
          "Streamlined promotional operations for merchants and eliminated voucher fraud with instant camera QR verification across hundreds of retail outlets.",
      impactAr:
          "سهّل إدارة العروض الترويجية للتجار وقضى تماماً على محاولات تزوير الكوبونات عبر التحقق الفوري برمز الـ QR لدى مئات المنافذ والمطاعم.",
    ),
    // 8. Nuess Shop
    ProjectModel(
      id: "nuess_shop",
      titleEn: "Nuess Multi-Store E-Commerce",
      titleAr: "تطبيق نيوس شوب (متجر التجارة الإلكترونية متعدد الفروع)",
      subtitleEn: "Multi-Store Shopping with Digital Wallet & Reward Points",
      subtitleAr: "تطبيق تسوق متكامل يدعم المتاجر المتعددة، المحفظة الرقمية، ونقاط المكافآت",
      descriptionEn: "A full-featured multi-vendor e-commerce Flutter application featuring phone OTP authentication, multi-store product browsing, and comprehensive category filtering. Includes an advanced payment suite with Cash on Delivery, and an integrated Digital Wallet system rechargeable through unique promo codes, alongside a gamified reward point mechanism that users can redeem for balance or transfer to friends.",
      descriptionAr: "تطبيق تجارة إلكترونية متكامل يدعم المتاجر المتعددة مع التوثيق برقم الهاتف ورمز OTP. يشمل تصفحاً ذكياً للمنتجات، ونظام محفظة رقمية للشحن عبر كروت وأكواد الشحن، مع نظام مكافآت ونقاط تفاعلي يمكن تحويله لرصيد نقدي أو إهدائه للأصدقاء.",
      featuresEn: [
        "Frictionless Phone OTP login, secure token management, and biometric authentication option",
        "Multi-store catalog browsing with faceted attribute filters (size, color, brand, price)",
        "Digital wallet ledger rechargeable via unique single-use voucher codes",
        "Gamified reward point system with balance conversion and peer-to-peer point transfers",
        "Order history tracking with instant re-ordering and item return workflows",
      ],
      featuresAr: [
        "تسجيل دخول سريع برقم الهاتف والـ OTP مع إدارة آمنة للتوكن وخيارات التحقق الحيوي",
        "تصفح كتالوجات المتاجر المتعددة وتصفية المنتجات حسب المقاس واللون والسعر والموديل",
        "محفظة إلكترونية متكاملة تقبل الشحن عبر أكواد قسائم فريدة ومؤمنة",
        "نظام نقاط ومكافآت تحفيزي يتيح تحويل النقاط لرصيد أو تحويلها بين المستخدمين",
        "سجل كامل للطلبات السابقة مع إمكانية إعادة الطلب بضغطة زر وتتبع مسار الشحن",
      ],
      techStack: [
        "Flutter",
        "GetX",
        "Digital Wallet Engine",
        "OTP Phone Auth",
        "Multi-Store Architecture",
        "REST APIs",
      ],
      category: "E-commerce",
      icon: Icons.store_rounded,
      primaryColor: Color(0xFFEC4899),
      isFeatured: false,
      imagePath: "assets/projects/nuess_shop.png",
      galleryImages: ["assets/projects/nuess_shop.png"],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Modular GetX State Management with Wallet Transaction Ledgers, Multi-Store Cart Sync, and Secure Local Storage.",
      architectureAr: "إدارة حالة عبر GetX مع سجلات المعاملات المالية للمحفظة ومزامنة السلة مع المتاجر المتعددة وتخزين محلي آمن.",
      impactEn: "Processed thousands of in-app wallet recharge vouchers with zero transactional discrepancies.",
      impactAr: "معالجة آلاف عمليات شحن المحفظة الرقمية والطلبات بنجاح وبدون أي أخطاء في التسوية المالية.",
    ),
    // 9. Al Muhanes Fleet
    ProjectModel(
      id: "al_muhanes",
      titleEn: "Al Muhanes Fleet & Telemetry",
      titleAr: "تطبيق أسطول المهندس (لإدارة المركبات ومحطات المعالجة)",
      subtitleEn: "Multilingual Station Map & Driver Fleet Tracking",
      subtitleAr:
          "نظام تتبع أسطول النقل ومحطات المعالجة مدعوم بأربع لغات عالمية",
      descriptionEn: "An enterprise industrial application engineered in Flutter supporting 4 languages (Arabic, English, Urdu, and Hindi with automatic RTL/LTR orientation). Visualizes wastewater discharge stations on custom Flutter Map tiles with real-time station telemetry data, vehicle-to-driver linking, role-based login (Driver vs. Account Manager), historical trip analytics, and Gmail OTP password reset verification.",
      descriptionAr: "تطبيق لإدارة العمليات اللوجستية الميدانية يدعم 4 لغات (العربية، الإنجليزية، الأوردو، والهندية مع تغيير اتجاه الواجهة تلقائياً). يعرض محطات التفريغ وبياناتها الحية على خرائط Flutter Map، مع ربط المركبات بالسائقين وإحصائيات الرحلات والتحقق بـ OTP.",
      featuresEn: [
        "4-Language internationalization (Arabic, English, Urdu, Hindi) with automated RTL/LTR layout switching",
        "Custom Flutter Map tile rendering with wastewater station telemetry pins and status badges",
        "Vehicle-to-driver association with trip validation checklists and capacity gauges",
        "Role-based authentication architecture separating Driver execution from Manager oversight",
        "Gmail SMTP OTP verification system for secure account password recovery",
      ],
      featuresAr: [
        "دعم كامل لـ 4 لغات عالمية مع تبديل ديناميكي لاتجاه الواجهات من اليمين لليسار والعكس",
        "خرائط تفاعلية تعرض محطات التفريغ وبيانات القياس اللحظية وحالة كل محطة",
        "ربط السائقين بالمركبات مع استبيانات الفحص الفني للرحلات وعدادات الحمولة",
        "نظام دخول متعدد الصلاحيات يفصل مهام السائقين عن لوحة المشرفين والمدراء",
        "نظام استعادة كلمات المرور والتحقق بالبريد الإلكتروني عبر SMTP OTP",
      ],
      techStack: [
        "Flutter",
        "GetX",
        "Flutter Map",
        "Multi-Language (4)",
        "SMTP OTP",
        "Clean Architecture",
      ],
      category: "Tools",
      icon: Icons.local_shipping_rounded,
      primaryColor: Color(0xFF14B8A6),
      isFeatured: false,
      imagePath: "assets/projects/al_muhanes.png",
      galleryImages: ["assets/projects/al_muhanes.png"],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Domain-Driven Clean Architecture with Locale Translation Delegates, Map Tile Caching Layers, and Role-Based Route Navigation.",
      architectureAr: "معمارية نظيفة موجهة بالدومين مع طبقات تخزين الخرائط ومندوبي الترجمة للغات الأربع وإدارة التنقل حسب الصلاحيات.",
      impactEn: "Successfully coordinated cross-language industrial fleet operations across hundreds of daily dispatch trips.",
      impactAr: "تنسيق عمليات النقل الميداني بنجاح بين فرق عمل متعددة الجنسيات عبر مئات الرحلات اليومية.",
    ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      titleEn: "Mobile Architecture & Core Flutter",
      titleAr: "بنية التطبيقات والأساسيات",
      icon: Icons.phone_android_rounded,
      skills: [
        SkillModel(
          name: "Flutter Framework",
          level: 0.95,
          proficiency: "Production Pro",
          icon: Icons.flutter_dash_rounded,
          color: Color(0xFF02569B),
          tagEn: "Android • iOS • Web",
          tagAr: "أندرويد • آيفون • ويب",
          noteEn: "Multi-platform commercial app deployment with 60fps performance.",
          noteAr: "بناء ونشر تطبيقات تجارية متعددة المنصات بأداء فائق 60 إطار بالثانية.",
        ),
        SkillModel(
          name: "Dart Programming",
          level: 0.95,
          proficiency: "Advanced Pro",
          icon: Icons.code_rounded,
          color: Color(0xFF0175C2),
          tagEn: "OOP • Async • Isolates",
          tagAr: "برمجة كائنية • غير متزامنة • معالجة متوازية",
          noteEn: "Deep mastery of functional Dart, streams, isolates, and robust typing.",
          noteAr: "إتقان متقدم للـ Streams و Isolates والبرمجة الآمنة وقوية الأنواع.",
        ),
        SkillModel(
          name: "Clean Architecture",
          level: 0.92,
          proficiency: "Architect Level",
          icon: Icons.architecture_rounded,
          color: Color(0xFF6366F1),
          tagEn: "SOLID • Domain • Data",
          tagAr: "مبادئ SOLID • طبقات الدومين والبيانات",
          noteEn: "Separation of concerns (Domain, Data, Presentation) for 100% testability.",
          noteAr:
              "فصل كامل للمسؤوليات لضمان سهولة الفحص والاختبار وتوسعة التطبيق.",
        ),
        SkillModel(
          name: "Responsive & Adaptive UI",
          level: 0.95,
          proficiency: "Pixel-Perfect",
          icon: Icons.devices_rounded,
          color: Color(0xFFEC4899),
          tagEn: "Mobile • Tablet • Web",
          tagAr: "موبايل • تابلت • ويب",
          noteEn: "Translating complex Figma designs into fluid layouts across all aspect ratios.",
          noteAr: "تحويل تصاميم Figma بدقة متناهية لتتلاءم مع كافة أبعاد ونسب الشاشات.",
        ),
        SkillModel(
          name: "Custom UI & Animations",
          level: 0.90,
          proficiency: "Creative Pro",
          icon: Icons.auto_awesome_rounded,
          color: Color(0xFFF59E0B),
          tagEn: "CustomPainters • Shaders",
          tagAr: "رسم مخصص • حركات متقدمة",
          noteEn: "Custom Canvas painting, micro-animations, glassmorphism and glowing effects.",
          noteAr:
              "رسم واجهات تفاعلية مخصصة وتأثيرات زجاجية وإضاءات نيون ناعمة.",
        ),
      ],
    ),
    SkillCategory(
      titleEn: "State Management & Reactive Patterns",
      titleAr: "إدارة الحالة والأنماط التفاعلية",
      icon: Icons.account_tree_rounded,
      skills: [
        SkillModel(
          name: "BLoC & Cubit Pattern",
          level: 0.92,
          proficiency: "Enterprise Standard",
          icon: Icons.layers_rounded,
          color: Color(0xFF8B5CF6),
          tagEn: "Streams • State Immutability",
          tagAr: "تدفق البيانات • ثبات الحالة",
          noteEn: "Predictable unidirectional state flows with freezable states and events.",
          noteAr: "تدفق بيانات أحادي الاتجاه وموثوق في التطبيقات الضخمة والإنتاجية.",
        ),
        SkillModel(
          name: "GetX Architecture",
          level: 0.95,
          proficiency: "Speed & Scale",
          icon: Icons.bolt_rounded,
          color: Color(0xFF10B981),
          tagEn: "GetBuilder • Bindings • Routes",
          tagAr: "تحكم سريع • ربط التبعيات • تنقل",
          noteEn: "Rapid controller bindings, reactive Rx variables, and decoupled routing.",
          noteAr:
              "بناء وحدات تحكم سريعة مع متغيرات تفاعلية وتنقلات برمجية مرنة.",
        ),
        SkillModel(
          name: "Provider & Riverpod",
          level: 0.90,
          proficiency: "Modern Reactive",
          icon: Icons.cable_rounded,
          color: Color(0xFF3B82F6),
          tagEn: "ChangeNotifier • AutoDispose",
          tagAr: "إدارة التبعيات الحديثة",
          noteEn:
              "Compile-safe dependency graph with scoped lifetime management.",
          noteAr: "إدارة آمنة للحالة وحقن التبعيات مع دورة حياة محددة وفعالة.",
        ),
        SkillModel(
          name: "Dependency Injection (GetIt)",
          level: 0.92,
          proficiency: "Modular DI",
          icon: Icons.hub_rounded,
          color: Color(0xFF06B6D4),
          tagEn: "GetIt • Injectable • Repositories",
          tagAr: "حقن التبعيات والمستودعات",
          noteEn: "Loose coupling with service locator patterns and abstract contracts.",
          noteAr: "تقليل الترابط بين أجزاء النظام وتسهيل كتابة الاختبارات عبر العقود المجردة.",
        ),
      ],
    ),
    SkillCategory(
      titleEn: "Backend, Real-Time & Networking",
      titleAr: "الشبكات والاتصال اللحظي والـ Backend",
      icon: Icons.cloud_sync_rounded,
      skills: [
        SkillModel(
          name: "REST APIs & Dio Engine",
          level: 0.95,
          proficiency: "Networking Pro",
          icon: Icons.http_rounded,
          color: Color(0xFF14B8A6),
          tagEn: "Interceptors • JWT Refresh • Retrofit",
          tagAr: "اعتراض الطلبات • تجديد التوكن",
          noteEn: "Robust HTTP client with auto token renewal, retry policies & error wrappers.",
          noteAr:
              "بناء عميل شبكي متكامل يتعامل مع الأخطاء وتجديد التوكن التلقائي.",
        ),
        SkillModel(
          name: "WebSockets & Pusher Channels",
          level: 0.92,
          proficiency: "Real-Time Expert",
          icon: Icons.sensors_rounded,
          color: Color(0xFFF97316),
          tagEn: "Live Events • GPS Broadcasts",
          tagAr: "بث أحداث • تتبع خرائط لحظي",
          noteEn: "Bidirectional live delivery dispatching, map pinging & instant notifications.",
          noteAr: "مزامنة تفاعلية فورية لتطبيقات التوصيل والخرائط وإشعارات الحجز اللحظية.",
        ),
        SkillModel(
          name: "Firebase Ecosystem",
          level: 0.92,
          proficiency: "Cloud Suite",
          icon: Icons.local_fire_department_rounded,
          color: Color(0xFFFFA000),
          tagEn: "Auth • FCM Push • Firestore",
          tagAr: "توثيق • إشعارات Push • قواعد سحابية",
          noteEn: "Cloud Messaging push alerts, background tasks, dynamic links and analytics.",
          noteAr: "إرسال واستقبال الإشعارات والربط السحابي والمهام المجدولة في الخلفية.",
        ),
        SkillModel(
          name: "Supabase Backend",
          level: 0.88,
          proficiency: "Postgres Realtime",
          icon: Icons.storage_rounded,
          color: Color(0xFF22C55E),
          tagEn: "Postgres DB • Row-Level Security",
          tagAr: "قواعد بوستجرس • حماية السجلات",
          noteEn: "Real-time subscriptions, relational queries, secure user access policies.",
          noteAr: "ربط القواعد اللحظية وعمليات الاستعلام الآمنة مع سياسات حماية متقدمة.",
        ),
      ],
    ),
    SkillCategory(
      titleEn: "Maps, Geolocation & Local Persistence",
      titleAr: "الخرائط وتحديد المواقع والتخزين المحلي",
      icon: Icons.explore_rounded,
      skills: [
        SkillModel(
          name: "Interactive Maps & GPS",
          level: 0.92,
          proficiency: "Live Tracking",
          icon: Icons.map_rounded,
          color: Color(0xFFEA4335),
          tagEn: "Google Maps • Polylines • Markers",
          tagAr: "خرائط جوجل • مسارات • علامات",
          noteEn: "Custom map markers, route calculation, geocoding and live cluster pins.",
          noteAr: "تخصيص علامات الخريطة ورسم المسارات الجغرافية وتجميع النقاط بكفاءة.",
        ),
        SkillModel(
          name: "Offline-First Storage",
          level: 0.92,
          proficiency: "High Performance",
          icon: Icons.save_rounded,
          color: Color(0xFF64748B),
          tagEn: "Hive • Isar • SharedPreferences",
          tagAr: "تخزين فائق السرعة بدون إنترنت",
          noteEn: "Sub-millisecond key-value and NoSQL object caching for offline operation.",
          noteAr: "تخزين كاش عالي السرعة يضمن تشغيل التطبيق بالكامل بدون شبكة إنترنت.",
        ),
        SkillModel(
          name: "Local SQLite Databases",
          level: 0.88,
          proficiency: "Relational Storage",
          icon: Icons.dataset_rounded,
          color: Color(0xFF0284C7),
          tagEn: "CRUD • Query Optimization",
          tagAr: "قواعد علائقية • استعلامات سريعة",
          noteEn: "Relational shift tables, Quran index datasets, and structured queries.",
          noteAr: "تنظيم وهيكلة البيانات المعقدة مثل فهارس المصحف وسجلات الحضور والورديات.",
        ),
      ],
    ),
    SkillCategory(
      titleEn: "DevOps, Store Release & Quality Assurance",
      titleAr: "النشر على المتاجر وأتمتة CI/CD وجودة الكود",
      icon: Icons.security_rounded,
      skills: [
        SkillModel(
          name: "App Store & Google Play",
          level: 0.92,
          proficiency: "Store Master",
          icon: Icons.storefront_rounded,
          color: Color(0xFF10B981),
          tagEn: "Release Pipelines • Certificates",
          tagAr: "إدارة الإطلاق والشهادات الرقمية",
          noteEn: "End-to-end production store deployment, TestFlight beta & Play Console approvals.",
          noteAr: "إدارة ونشر التطبيقات على المتاجر واعتماد الشهادات وإطلاق النسخ التجريبية.",
        ),
        SkillModel(
          name: "Git & GitHub CI/CD",
          level: 0.95,
          proficiency: "Automation Pro",
          icon: Icons.terminal_rounded,
          color: Color(0xFFF05032),
          tagEn: "Actions • Workflows • Branching",
          tagAr: "أتمتة البناء • إدارة الفروع",
          noteEn: "Automated build/deploy pipelines, pull request reviews and versioning.",
          noteAr: "إعداد خطوط البناء والنشر التلقائي ومراجعة الأكواد وإدارة الإصدارات.",
        ),
        SkillModel(
          name: "Automated Testing & Code Quality",
          level: 0.88,
          proficiency: "Robust Code",
          icon: Icons.verified_rounded,
          color: Color(0xFF38BDF8),
          tagEn: "Unit Tests • Widget Tests • Analyzer",
          tagAr: "اختبارات الوحدات والواجهات",
          noteEn: "Smoke testing, zero-lint warning policies and strict static code analysis.",
          noteAr: "كتابة اختبارات الوحدات والواجهات والالتزام بسياسات كود خالية من التحذيرات.",
        ),
      ],
    ),
  ];

  static const Map<String, String> terminalHelpCommands = {
    "help": "Displays available terminal commands",
    "about": "Print developer background and engineering value",
    "skills": "Lists primary technical stack and proficiencies",
    "projects": "Lists all 9 featured production applications",
    "quran": "Explore full Islamic Curriculum & Quran Super-App features",
    "experience": "Displays work experience timeline",
    "why-hire": "Summary of why Omar brings immediate value to your team",
    "contact": "Shows contact details and direct links",
    "cv": "Downloads Omar's latest Resume PDF",
    "sudo hire": "Direct one-click connection to hire Omar!",
    "clear": "Clears the terminal console",
  };
}
