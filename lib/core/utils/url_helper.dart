import 'package:url_launcher/url_launcher.dart';
import '../constants/portfolio_data.dart';

class UrlHelper {
  static Future<void> launchURL(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $urlString");
    }
  }

  static Future<void> openEmail([String? subject, String? body]) async {
    final Map<String, String> params = {};
    if (subject != null) params["subject"] = subject;
    if (body != null) params["body"] = body;

    final Uri emailLaunchUri = Uri(
      scheme: "mailto",
      path: PortfolioData.email,
      query: _encodeQueryParameters(params),
    );
    if (!await launchUrl(emailLaunchUri)) {
      await launchURL("mailto:${PortfolioData.email}");
    }
  }

  static Future<void> openWhatsApp([String? message]) async {
    final String text = message ?? "Hello Omar! I saw your Flutter portfolio and would like to discuss an opportunity.";
    final String url = "https://wa.me/201018027405?text=${Uri.encodeComponent(text)}";
    await launchURL(url);
  }

  static Future<void> openCall() async {
    final Uri callUri = Uri(scheme: "tel", path: PortfolioData.phone);
    if (!await launchUrl(callUri)) {
      await launchURL("tel:${PortfolioData.phone}");
    }
  }

  static Future<void> openLinkedIn() async {
    await launchURL(PortfolioData.linkedinUrl);
  }

  static Future<void> openGitHub() async {
    await launchURL(PortfolioData.githubUrl);
  }

  static String? _encodeQueryParameters(Map<String, String> params) {
    if (params.isEmpty) return null;
    return params.entries
        .map((MapEntry<String, String> e) =>
            "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}")
        .join("&");
  }
}
