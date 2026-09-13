import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/portfolio_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  final bool isArabic;

  const ContactSection({super.key, required this.isArabic});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _sendMessage() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final text = "Hello Omar, I am $name ($email). \n\nMessage: $message";
    UrlHelper.openWhatsApp(text);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          SectionTitle(
            tag: widget.isArabic ? "تواصل معي" : "Get In Touch",
            title: widget.isArabic
                ? "دعنا نبني تطبيقك القادم سوياً"
                : "Let's Build Something Exceptional",
            subtitle: widget.isArabic
                ? "سواء كان لديك مشروع جديد، استفسار تقني، أو ترغب في ضمّي لفريقك الرائع، أنا دائماً جاهز للنقاش."
                : "Whether you have a new mobile product, technical inquiry, or job opportunity, feel free to reach out!",
            icon: Icons.support_agent_rounded,
          ),
          const SizedBox(height: 36),

          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildContactCards(context, isDark),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 5,
                      child: _buildContactForm(context, isDark),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildContactCards(context, isDark),
                    const SizedBox(height: 28),
                    _buildContactForm(context, isDark),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactCards(BuildContext context, bool isDark) {
    final channels = [
      {
        "titleEn": "WhatsApp Direct Chat",
        "titleAr": "محادثة فورية على واتساب",
        "value": PortfolioData.displayPhone,
        "icon": FontAwesomeIcons.whatsapp,
        "color": const Color(0xFF25D366),
        "onTap": () => UrlHelper.openWhatsApp(),
      },
      {
        "titleEn": "Direct Email",
        "titleAr": "البريد الإلكتروني",
        "value": PortfolioData.email,
        "icon": FontAwesomeIcons.envelope,
        "color": AppColors.secondary,
        "onTap": () => UrlHelper.openEmail(),
      },
      {
        "titleEn": "LinkedIn Profile",
        "titleAr": "حساب لينكد إن",
        "value": "linkedin.com/in/omar-ragab",
        "icon": FontAwesomeIcons.linkedinIn,
        "color": const Color(0xFF0A66C2),
        "onTap": () => UrlHelper.openLinkedIn(),
      },
      {
        "titleEn": "GitHub Repository",
        "titleAr": "مستودع جيت هاب",
        "value": "github.com/omarragab2020",
        "icon": FontAwesomeIcons.github,
        "color": isDark ? Colors.white : Colors.black87,
        "onTap": () => UrlHelper.openGitHub(),
      },
    ];

    return Column(
      children: channels.map((c) {
        final color = c["color"] as Color;
        final onTap = c["onTap"] as VoidCallback;
        final icon = c["icon"] as FaIconData;

        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: FaIcon(icon, color: color, size: 20),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.isArabic
                              ? c["titleAr"] as String
                              : c["titleEn"] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.textDarkMuted
                                : AppColors.textLightMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          c["value"] as String,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : AppColors.textLightPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: isDark
                        ? AppColors.textDarkMuted
                        : AppColors.textLightMuted,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContactForm(BuildContext context, bool isDark) {
    return GlassContainer(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isArabic ? "أرسل لي رسالة مباشرة" : "Send a Direct Message",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: widget.isArabic ? "الاسم الكريم" : "Your Name",
              prefixIcon: const Icon(Icons.person_outline, size: 20),
              filled: true,
              fillColor: isDark
                  ? AppColors.bgDarkSecondary.withValues(alpha: 0.6)
                  : AppColors.bgLightSecondary.withValues(alpha: 0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: widget.isArabic ? "البريد الإلكتروني" : "Your Email",
              prefixIcon: const Icon(Icons.email_outlined, size: 20),
              filled: true,
              fillColor: isDark
                  ? AppColors.bgDarkSecondary.withValues(alpha: 0.6)
                  : AppColors.bgLightSecondary.withValues(alpha: 0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          TextField(
            controller: _messageController,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: widget.isArabic ? "تفاصيل الرسالة أو المشروع" : "Project Details / Message",
              alignLabelWithHint: true,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Icon(Icons.chat_bubble_outline, size: 20),
              ),
              filled: true,
              fillColor: isDark
                  ? AppColors.bgDarkSecondary.withValues(alpha: 0.6)
                  : AppColors.bgLightSecondary.withValues(alpha: 0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _sendMessage,
              icon: const FaIcon(FontAwesomeIcons.paperPlane, size: 16),
              label: Text(
                widget.isArabic ? "إرسال الرسالة عبر واتساب" : "Send via WhatsApp",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: AppColors.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
