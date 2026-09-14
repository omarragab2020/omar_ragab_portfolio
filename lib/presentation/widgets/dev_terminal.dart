import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/portfolio_controller.dart';
import '../../core/theme/app_colors.dart';

class DevTerminalWidget extends StatefulWidget {
  const DevTerminalWidget({super.key});

  @override
  State<DevTerminalWidget> createState() => _DevTerminalWidgetState();
}

class _DevTerminalWidgetState extends State<DevTerminalWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final isMatrix = controller.isMatrixMode;

    final terminalBg = isMatrix
        ? const Color(0xFF031A0B)
        : const Color(0xFF0D1117);

    final promptColor = isMatrix
        ? const Color(0xFF22C55E)
        : AppColors.secondary;

    final textColor = isMatrix
        ? const Color(0xFF86EFAC)
        : AppColors.textDarkPrimary;

    final isMobile = MediaQuery.of(context).size.width < 650;

    return Container(
      height: isMobile ? 260 : 380,
      decoration: BoxDecoration(
        color: terminalBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isMatrix ? const Color(0xFF15803D) : AppColors.borderDark,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: (isMatrix ? Colors.green : AppColors.primary).withValues(
              alpha: 0.2,
            ),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Terminal Top Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isMatrix
                  ? const Color(0xFF052e16)
                  : const Color(0xFF161B22),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(13),
              ),
              border: Border(
                bottom: BorderSide(
                  color: isMatrix
                      ? const Color(0xFF15803D)
                      : AppColors.borderDark,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // Window dots
                Row(
                  children: [
                    Container(
                      width: 11,
                      height: 11,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF5F56),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      width: 11,
                      height: 11,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFBD2E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      width: 11,
                      height: 11,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27C93F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 14),
                Flexible(
                  child: Text(
                    "omar@dev: ~/portfolio",
                    style: TextStyle(
                      fontFamily: "monospace",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isMatrix
                          ? const Color(0xFF86EFAC)
                          : const Color(0xFF8B949E),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                // Quick suggestions
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ["help", "projects", "quran", "hire"].map((cmd) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: InkWell(
                          onTap: () {
                            controller.executeTerminalCommand(cmd);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  (isMatrix ? Colors.green : AppColors.primary)
                                      .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              cmd,
                              style: TextStyle(
                                fontFamily: "monospace",
                                fontSize: 10,
                                color: promptColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Output Area
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(14),
              itemCount: controller.terminalHistory.length,
              itemBuilder: (context, index) {
                final entry = controller.terminalHistory[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "omar@flutter:~\$ ",
                            style: TextStyle(
                              fontFamily: "monospace",
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: promptColor,
                            ),
                          ),
                          Text(
                            entry.command,
                            style: TextStyle(
                              fontFamily: "monospace",
                              fontSize: 12.5,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entry.response,
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 12,
                          color: entry.isError
                              ? Colors.redAccent
                              : (isMatrix
                                    ? const Color(0xFF86EFAC)
                                    : const Color(0xFF9CA3AF)),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
