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
  static const String titleEn = "Mid-Level Flutter Developer | Mobile Software Engineer";
  static const String titleAr = "مطور تطبيقات فلاتر (Mid-Level) | مهندس برمجيات الموبايل";
  static const String email = "omarragab712000@gmail.com";
  static const String phone = "+201018027405";
  static const String displayPhone = "01018027405";
  static const String locationEn = "Mansoura, Egypt (Open to Remote Globally)";
  static const String locationAr = "المنصورة، مصر (متاح للعمل عن بُعد محلياً وعالمياً)";
  static const String githubUrl = "https://github.com/omarragab2020";
  static const String linkedinUrl = "https://linkedin.com/in/omar-ragab-347200212";
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

  static const String educationEn = "B.S. in Computer Science - Mansoura University (2018 - 2022)";
  static const String educationAr = "بكالوريوس علوم الحاسب - جامعة المنصورة (2018 - 2022)";

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
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.neuss.engeezdriverapp&pcampaignid=web_share",
      appStoreUrl: "https://apps.apple.com/jo/app/engeez-driver/id6758239812",
      titleEn: "Engeez Driver - Live Delivery & Logistics",
      titleAr: "تطبيق السائق (Engeez Driver) - للتوصيل واللوجستيات",
      subtitleEn: "Dual-Store Driver App with Live GPS Navigation & WebSocket Dispatching",
      subtitleAr: "تطبيق السائقين على المتجرين مع تتبع GPS وتوزيع الطلبات عبر WebSocket",
      descriptionEn: "A mission-critical enterprise driver dispatch application published on both Google Play and Apple App Store. Powers real-time order acceptance pipelines, turn-by-turn Google Maps polyline navigation, live driver battery-optimized background telemetry, offline cached order states, and multi-vendor parcel handoff protocols.",
      descriptionAr: "تطبيق متكامل لإدارة واستقبال طلبات التوصيل منشور على متجري Google Play و Apple App Store. يعتمد على نظام إسناد لحظي، وملاحة دقيقة عبر خرائط Google، مع تتبع موقع السائق في الخلفية بأقل استهلاك للبطارية، والعمل بدون إنترنت للتسليمات.",
      featuresEn: [
        "Real-time order dispatching and instant push audio alerts via Pusher & WebSockets",
        "Interactive route navigation using Google Maps API with auto-rerouting and distance matrix",
        "Earnings ledger, daily trip audit history, and live digital tip payouts",
        "Robust offline caching for pending deliveries using Hive & SQLite fallback",
        "Battery-efficient background location stream pinging with adaptive interval throttling",
      ],
      featuresAr: [
        "إسناد الطلبات واستقبال التنبيهات الصوتية اللحظية عبر Pusher و WebSockets",
        "ملاحة تفاعلية دقيقة وتوجيه ذكي عبر مسارات خرائط Google Maps مع حساب المسافات",
        "سجل مالي مفصل، وإحصائيات الرحلات اليومية مع نظام الإكراميات والمحفظة",
        "تخزين محلي قوي لحالات الطلبات غير المكتملة عند انقطاع الإنترنت عبر Hive و SQLite",
        "تتبع موقع السائق في الخلفية عبر Streams مع توفير استهلاك البطارية",
      ],
      techStack: ["Flutter", "Google Play Release", "App Store Release", "Google Maps SDK", "WebSockets", "Pusher", "Hive", "Clean Architecture"],
      category: "Delivery",
      icon: Icons.delivery_dining_rounded,
      primaryColor: Color(0xFF00C853),
      isFeatured: true,
      imagePath: "assets/projects/engeez.png",
      galleryImages: [
        "assets/projects/engeez.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Architecture (Domain/Data/Presentation), Repository Pattern, Reactive BLoC State Management, and Service Locator DI via GetIt.",
      architectureAr: "معمارية Clean Architecture (Domain/Data/Presentation) مع نمط المستودع وإدارة الحالة التفاعلية عبر BLoC وحقن التبعيات عبر GetIt.",
      impactEn: "Published on App Store & Google Play. Reduced order dispatch latency by 65% across hundreds of active drivers in Jordan.",
      impactAr: "منشور على المتجرين وخفض زمن إسناد الطلبات بنسبة 65% لعدة مئات من السائقين في الأردن.",
    ),
    // 2. Engeez Customer (Live Google Play & Apple App Store)
    ProjectModel(
      id: "engeez_customer",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.neuss.shipping&pcampaignid=web_share",
      appStoreUrl: "https://apps.apple.com/jo/app/engeez-%D8%A7%D9%86%D8%AC%D8%B2/id6755639468",
      titleEn: "Engeez Customer - On-Demand Essentials",
      titleAr: "تطبيق إنجز (Engeez Customer) - لطلب وتوصيل المنتجات",
      subtitleEn: "City-wide Food, Grocery & Retail Ordering App on App Store & Google Play",
      subtitleAr: "تطبيق شامل لطلب الطعام والبقالة والمستلزمات اليومية على المتجرين",
      descriptionEn: "A high-performance consumer delivery application published on Apple App Store and Google Play, providing an effortless ordering experience for food, grocery, and daily essentials across city-wide multi-branch vendors. Features instant fuzzy search, responsive cart modifiers, interactive GPS map address pin selector with saved presets, coupon checkout engine, and a live step-by-step order progress timeline.",
      descriptionAr: "تطبيق طلب وتوصيل استهلاكي منشور على متجري Google Play و Apple App Store، يوفر تجربة طلب سلسة للمطاعم والبقالة والاحتياجات اليومية. يشمل بحثاً ذكياً، وسلة مشتريات ديناميكية، وتحديد الموقع الجغرافي وحفظ العناوين، ومتابعة فورية لمراحل الطلب والسائق على الخريطة.",
      featuresEn: [
        "Fuzzy search & real-time restaurant catalog filtering by cuisine, rating, and distance",
        "Dynamic cart engine supporting customizable meal options, add-ons, and special notes",
        "Interactive map location picker with reverse geocoding and address labeling (Home, Work)",
        "Live order status tracker with driver location visualization and estimated arrival countdown",
        "Digital wallet integration, promo code validation, and automated payment receipts",
      ],
      featuresAr: [
        "بحث فوري وتصفية ذكية للمطاعم والمنتجات حسب التقييم والمسافة ونوع الأطعمة",
        "سلة مشتريات ديناميكية تدعم تخصيص الوجبات، الإضافات، والملاحظات الخاصة",
        "محدد مواقع تفاعلي على الخريطة لحفظ العناوين وتسميتها (المنزل، العمل)",
        "تتبع حي لمسار وحالة الطلب مع عداد زمني تقديري لوصول الكابتن",
        "محفظة رقمية مدمجة، والتحقق من كوبونات الخصم، وتوليد الفواتير الإلكترونية",
      ],
      techStack: ["Flutter", "App Store Release", "Google Play Release", "GetX", "Dio REST Engine", "Google Maps", "Firebase FCM", "Clean Architecture"],
      category: "Delivery",
      icon: Icons.shopping_bag_rounded,
      primaryColor: Color(0xFF8B5CF6),
      isFeatured: true,
      imagePath: "assets/projects/engeez.png",
      galleryImages: [
        "assets/projects/engeez.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Layered Clean Architecture with Dio Interceptors for JWT Refresh Tokens, Functional Either<Failure, Success> error wrappers, and Reactive GetX.",
      architectureAr: "معمارية نظيفة متعددة الطبقات مع Dio Interceptors لتجديد التوكن التلقائي ومعالجة الأخطاء بنظام Either وإدارة الحالة بـ GetX.",
      impactEn: "Live on Google Play & App Store with 99.8% crash-free session rate and frictionless checkout experience.",
      impactAr: "منشور على المتجرين بنسبة جلسات خالية من الأعطال 99.8% وتجربة دفع وتسوق سريعة وموثوقة.",
    ),
    // 3. Neuss Time Tracker (Live Apple App Store)
    ProjectModel(
      id: "time_tracker",
      appStoreUrl: "https://apps.apple.com/jo/app/neuss-time-tracker/id6761728653",
      titleEn: "Neuss Time Tracker Pro",
      titleAr: "تطبيق تايم تراكر (Neuss Time Tracker Pro)",
      subtitleEn: "Employee Work Hour Logger & Vacation Workflow on Apple App Store",
      subtitleAr: "نظام تسجيل ساعات العمل والإجازات للموظفين معتمد على متجر App Store",
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
      techStack: ["Flutter", "GetX", "App Store Release", "Local SQLite", "Interactive Calendar", "Clean Architecture"],
      category: "Tools",
      icon: Icons.timer_rounded,
      primaryColor: Color(0xFF6366F1),
      isFeatured: true,
      imagePath: "assets/projects/time_tracker.png",
      galleryImages: [
        "assets/projects/time_tracker.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Domain Architecture with Local SQLite Shift Database, Time Calculation Services, and Reactive GetX Bindings.",
      architectureAr: "معمارية Clean Architecture مع قاعدة بيانات SQLite لتخزين الورديات وخدمات حساب الوقت مع GetX Bindings.",
      impactEn: "Published on Apple App Store; eliminated manual timesheet calculation errors and streamlined leave approval workflows.",
      impactAr: "منشور على Apple App Store؛ قضى على أخطاء حساب ساعات العمل وسرّع من دورات اعتماد الإجازات.",
    ),
    // 4. Manhaj Quran (Live Google Play Store)
    ProjectModel(
      id: "quran_manhaj_app",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.omar.qurankareem2",
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
      techStack: ["Flutter", "Google Play Release", "BLoC/Cubit", "just_audio & audio_service", "SQLite", "Hive", "WorkManager", "Clean Architecture"],
      category: "Islamic",
      icon: Icons.menu_book_rounded,
      primaryColor: Color(0xFF10B981),
      isFeatured: true,
      imagePath: "assets/projects/quran_manhaj.png",
      galleryImages: [
        "assets/projects/quran_manhaj.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Architecture (Domain/Data/Presentation), BLoC/Cubit state management, SQLite relational indexes, Hive fast key-value storage, and Background AudioHandler service.",
      architectureAr: "معمارية Clean Architecture مع BLoC وقاعدة بيانات SQLite لفهارس الآيات و Hive للبيانات السريعة ومشغل صوتي في الخلفية عبر AudioService.",
      impactEn: "Published on Google Play Store with thousands of active downloads and 100% offline availability.",
      impactAr: "منشور على Google Play بآلاف التحميلات ويعمل بكفاءة 100% بدون اتصال بالإنترنت.",
    ),
    // 5. Scholar Edu (Live Google Play Store)
    ProjectModel(
      id: "scholar_edu",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.omar.scholar_edu",
      titleEn: "Scholar Edu - EdTech Smart Learning Hub",
      titleAr: "تطبيق سكولار إديو (Scholar Edu) - منصة التعليم الذكية",
      subtitleEn: "Smart Learning Hub with Supabase, Video Streaming & Timed Quizzes",
      subtitleAr: "منصة تعليمية ذكية تعتمد على Supabase مع بث الفيديو والاختبارات الموقوتة",
      descriptionEn: "A modern education technology platform published on Google Play, designed to bridge students and teachers seamlessly through Supabase. Students select their academic stage and curriculum to access structured recorded video lectures, followed by automated timed competitive quizzes, instant question feedback, and gamified student leaderboards that keep learning engaging and effective.",
      descriptionAr: "منصة تعليمية تفاعلية منشورة على متجر Google Play مربوطة بقاعدة بيانات Supabase السحابية. يختار الطالب مرحلته الدراسية للوصول للمحاضرات المرئية عالية الدقة، والاختبارات التنافسية المؤقتة مع التصحيح الفوري ولوحات الشرف للمتفوقين.",
      featuresEn: [
        "Academic stage selector with personalized syllabus trees and lesson module tracking",
        "Video lecture player with speed control, resume playback, and offline PDF attachments",
        "Automated timed quiz engine with multiple-choice randomization and instant grading analysis",
        "Gamified student leaderboards, achievement badges, and monthly performance reports",
        "Supabase real-time auth, relational lesson queries, and secure cloud storage",
      ],
      featuresAr: [
        "اختيار المراحل الدراسية مع تتبع شجرة المناهج والوحدات والدروس المكتملة",
        "مشغل محاضرات فيديو يدعم التحكم بالسرعة ومواصلة المشاهدة والمرفقات بصيغة PDF",
        "محرك اختبارات مؤقت تلقائي مع ترتيب عشوائي للأسئلة والتحليل الفوري للإجابات",
        "لوحة شرف للمتفوقين، ونظام أوسمة الإنجاز، وتقارير أداء دورية للطالب",
        "توثيق أمني لحظي عبر Supabase Auth وتخزين سحابي آمن للمحتوى والدروس",
      ],
      techStack: ["Flutter", "Google Play Release", "Supabase", "Video Player", "Chewie", "GetX", "Clean Architecture"],
      category: "Education",
      icon: Icons.school_rounded,
      primaryColor: Color(0xFF06B6D4),
      isFeatured: true,
      imagePath: "assets/projects/scholar_edu.png",
      galleryImages: [
        "assets/projects/scholar_edu.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Architecture with Supabase Real-Time Client, Secure Token Storage, Repository Pattern, and Modular Route Middleware.",
      architectureAr: "معمارية نظيفة تعتمد على Supabase Real-Time Client ونمط Repository مع حماية وتوجيه المسارات بالـ Middleware.",
      impactEn: "Live on Google Play Store; delivered seamless remote exam sessions and video lecture streaming to active students.",
      impactAr: "منشور على Google Play؛ يخدم مئات الطلاب في متابعة الشروحات وإجراء الاختبارات التنافسية بنجاح.",
    ),
    // 6. RHM Booking & Hospitality
    ProjectModel(
      id: "rhm_booking",
      titleEn: "RHM Booking & Hospitality Ecosystem",
      titleAr: "منظومة حجز الشاليهات والمنتجعات (RHM Booking)",
      subtitleEn: "Dual-App Platform (Guest Booking & Provider Dashboard)",
      subtitleAr: "منظومة ثنائية (تطبيق حجز النزلاء + لوحة تحكم المزودين وأصحاب العقارات)",
      descriptionEn: "An enterprise-grade dual-application ecosystem for chalet, resort, and event facility discovery and reservations. Comprises a customer booking application featuring interactive map browsing with live price tags and date filters, paired with a specialized Provider Admin Dashboard featuring real-time booking push notifications via Pusher Channels, interactive visual calendar scheduler, reservation status pipelines, and revenue analytics charts.",
      descriptionAr: "منظومة برمجية متقدمة من تطبيقين لحجز الشاليهات والمنتجعات وقاعات المناسبات. تشتمل على تطبيق للعملاء يتيح التصفح التفاعلي على الخريطة مع عرض الأسعار المباشرة، متصلاً بلوحة تحكم للمزودين تتلقى إشعارات الحجز اللحظية عبر Pusher، مع تقويم مرئي وجداول إحصائيات مالية.",
      featuresEn: [
        "Dual-application architecture sharing core domain entities and unified authentication services",
        "Interactive map browsing with custom chalet price-tag pins and radius filtering",
        "Provider calendar scheduler with drag-and-drop booking blocks and instant date lockouts",
        "Real-time reservation push notifications with instant accept/reject action pipelines via Pusher",
        "Financial reporting dashboard with monthly revenue breakdown charts and payout requests",
      ],
      featuresAr: [
        "هيكلية تطبيقين مترابطين تشترك في الطبقات الأساسية مع التوثيق الموحد",
        "تصفح تفاعلي بالخريطة مع دبابيس تسعير مخصصة وتصفية حسب النطاق الجغرافي والتواريخ",
        "تقويم ذكي لأصحاب الشاليهات لجدولة الحجوزات وحظر الأيام المشغولة فوراً",
        "إشعارات حجز فورية عبر قنوات Pusher مع إمكانية القبول أو الرفض اللحظي",
        "لوحة تقارير مالية تفاعلية تعرض المخططات البيانية للإيرادات وطلبات التحويل",
      ],
      techStack: ["Flutter", "Pusher Channels", "Google Maps", "BLoC/Cubit", "fl_chart", "Clean Architecture", "REST APIs"],
      category: "Real-time",
      icon: Icons.hotel_rounded,
      primaryColor: Color(0xFF3B82F6),
      isFeatured: true,
      imagePath: "assets/projects/rhm_booking.png",
      galleryImages: [
        "assets/projects/rhm_booking.png",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Clean Architecture with BLoC Pattern, Pusher WebSocket Event Handlers, and Shared Domain Repositories across dual apps.",
      architectureAr: "معمارية Clean Architecture مع BLoC والتعامل مع أحداث Pusher اللحظية ومستودعات بيانات مشتركة بين التطبيقين.",
      impactEn: "Zero double-booking conflicts achieved via real-time Pusher lock engine; streamlined resort management.",
      impactAr: "منع التعارض في الحجوزات بنسبة 100% بفضل مزامنة Pusher اللحظية وأتمتة إدارة المنتجعات.",
    ),
    // 7. Tawfeer 360
    ProjectModel(
      id: "tawfeer_360",
      titleEn: "Tawfeer 360 Deals & Vouchers",
      titleAr: "تطبيق توفير 360 (عروض الخصومات والكوبونات)",
      subtitleEn: "Multi-Role Offers App with QR Redemption & Maps",
      subtitleAr: "منصة عروض متكاملة متعددة الأدوار مع استبدال الكوبونات برمز QR",
      descriptionEn: "A robust cross-platform mobile marketplace application built with Flutter and GetX for deals and voucher redemption. Features a 3-tier Role-Based Access Control system (Super Admin, Merchant Providers, and Customers). Integrates Firebase Auth, Cloud Messaging (FCM), multipart HTTP payment proof uploads, voucher inventory management, dual map support (Google Maps & OpenStreetMap), and instant in-store QR code offer redemption scanning.",
      descriptionAr: "تطبيق متكامل للعروض والخصومات وقسائم الشراء مبني بـ Flutter و GetX. يتضمن نظام تحكم بصلاحيات متعددة (مدير النظام، التجار، والعملاء)، مع رفع إيصالات الدفع بنظام Multipart، والتحقق الفوري من الكوبونات داخل المتاجر عبر مسح كود الـ QR.",
      featuresEn: [
        "3-Tier RBAC architecture: Admin approval pipeline, Merchant voucher creator, and Customer app",
        "Instant camera QR-code scanner for verified in-store voucher redemption",
        "Dual-map rendering engine (Google Maps & OpenStreetMap) with branch geofencing",
        "Multipart HTTP client for secure receipt upload and merchant license verification",
        "Personalized push notifications targeting users based on nearby vendor promotions",
      ],
      featuresAr: [
        "نظام صلاحيات ثلاثي: لوحة اعتماد الإدارة، قسم إضافة كوبونات التاجر، وتطبيق المستخدم",
        "ماسح كاميرا QR فوري للتحقق من صحة القسائم واستبدالها داخل فروع المتاجر",
        "دعم الخرائط المزدوجة (Google Maps و OpenStreetMap) مع تحديد النطاقات الجغرافية للفروع",
        "عميل HTTP Multipart لرفع إيصالات التحويل البنكي وتوثيق سجلات التجار بأمان",
        "إشعارات موجهة ذكية للمستخدمين بالعروض القريبة جغرافياً",
      ],
      techStack: ["Flutter", "GetX", "QR Scanner", "Google Maps & OSM", "Multipart HTTP", "Firebase FCM", "Clean Architecture"],
      category: "E-commerce",
      icon: Icons.local_offer_rounded,
      primaryColor: Color(0xFFF59E0B),
      isFeatured: false,
      imagePath: "assets/projects/tawfeer_360.jpg",
      galleryImages: [
        "assets/projects/tawfeer_360.jpg",
      ],
      githubUrl: "https://github.com/omarragab2020",
      architectureEn: "Modular GetX State Architecture with Role-Based Navigation Guards, Custom Http Multipart Handlers, and Reactive QR Stream Controllers.",
      architectureAr: "معمارية GetX نمطية مع حماية التوجيه حسب الأدوار ومعالجات رفع الملفات Multipart ومتحكمات الـ QR Stream.",
      impactEn: "Enabled seamless in-store QR voucher redemptions with zero fraudulent claims across partner retailers.",
      impactAr: "تمكين الاستبدال الفوري لقسائم الشراء بـ QR بدون تزوير لدى شبكة المتاجر الشريكة.",
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
      techStack: ["Flutter", "GetX", "Digital Wallet Engine", "OTP Phone Auth", "Multi-Store Architecture", "REST APIs"],
      category: "E-commerce",
      icon: Icons.store_rounded,
      primaryColor: Color(0xFFEC4899),
      isFeatured: false,
      imagePath: "assets/projects/nuess_shop.png",
      galleryImages: [
        "assets/projects/nuess_shop.png",
      ],
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
      subtitleAr: "نظام تتبع أسطول النقل ومحطات المعالجة مدعوم بأربع لغات عالمية",
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
      techStack: ["Flutter", "GetX", "Flutter Map", "Multi-Language (4)", "SMTP OTP", "Clean Architecture"],
      category: "Tools",
      icon: Icons.local_shipping_rounded,
      primaryColor: Color(0xFF14B8A6),
      isFeatured: false,
      imagePath: "assets/projects/al_muhanes.png",
      galleryImages: [
        "assets/projects/al_muhanes.png",
      ],
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
          noteAr: "فصل كامل للمسؤوليات لضمان سهولة الفحص والاختبار وتوسعة التطبيق.",
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
          noteAr: "رسم واجهات تفاعلية مخصصة وتأثيرات زجاجية وإضاءات نيون ناعمة.",
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
          noteAr: "بناء وحدات تحكم سريعة مع متغيرات تفاعلية وتنقلات برمجية مرنة.",
        ),
        SkillModel(
          name: "Provider & Riverpod",
          level: 0.90,
          proficiency: "Modern Reactive",
          icon: Icons.cable_rounded,
          color: Color(0xFF3B82F6),
          tagEn: "ChangeNotifier • AutoDispose",
          tagAr: "إدارة التبعيات الحديثة",
          noteEn: "Compile-safe dependency graph with scoped lifetime management.",
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
          noteAr: "بناء عميل شبكي متكامل يتعامل مع الأخطاء وتجديد التوكن التلقائي.",
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
