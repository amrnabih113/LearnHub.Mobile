import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../core/helpers/my_helper_functions.dart';
import '../core/helpers/my_loaders.dart';
import '../core/ui/my_avatar.dart';
import '../core/ui/my_buttons.dart';
import '../core/utils/my_colors.dart';

class ThemePreviewScreen extends StatefulWidget {
  const ThemePreviewScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<ThemePreviewScreen> createState() => _ThemePreviewScreenState();
}

class _ThemePreviewScreenState extends State<ThemePreviewScreen> {
  bool notificationsEnabled = true;
  bool rememberMe = true;

  String selectedCourse = 'Flutter Development';

  final List<String> courses = [
    'Flutter Development',
    'ASP.NET Core',
    'Database Design',
    'Clean Architecture',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('LearnHub Design System'),
        actions: [
          Row(
            children: [
              Icon(
                widget.isDark
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
              ),
              const SizedBox(width: 4),
              Switch(
                value: widget.isDark,
                onChanged: (_) => widget.onToggleTheme(),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),

                _buildSection(
                  context,
                  title: 'Typography',
                  child: _buildTypography(context),
                ),

                _buildSection(
                  context,
                  title: 'Colors',
                  child: _buildColors(context),
                ),

                _buildSection(
                  context,
                  title: 'Buttons',
                  child: _buildButtons(context),
                ),

                _buildSection(
                  context,
                  title: 'Text Fields',
                  child: _buildTextFields(context),
                ),

                _buildSection(
                  context,
                  title: 'Dropdown',
                  child: _buildDropdown(context),
                ),

                _buildSection(
                  context,
                  title: 'Checkbox & Switch',
                  child: _buildSelectionControls(context),
                ),

                _buildSection(
                  context,
                  title: 'Chips',
                  child: _buildChips(context),
                ),

                _buildSection(
                  context,
                  title: 'Cards & Surfaces',
                  child: _buildCards(context),
                ),

                _buildSection(
                  context,
                  title: 'Progress Indicators',
                  child: _buildProgress(context),
                ),

                _buildSection(
                  context,
                  title: 'Semantic Colors',
                  child: _buildSemanticColors(context),
                ),

                _buildSection(
                  context,
                  title: 'Dialogs & Bottom Sheets',
                  child: _buildDialogs(context),
                ),

                _buildSection(
                  context,
                  title: 'SnackBars & Toasts',
                  child: _buildSnackBars(context),
                ),

                _buildSection(
                  context,
                  title: 'Icons',
                  child: _buildIcons(context),
                ),

                const SizedBox(height: 40),

                MyAvatar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [MyColors.navy, MyColors.blue]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: MyColors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: MyColors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LearnHub',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Design System Preview',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: MyColors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),

          Icon(
            widget.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            color: MyColors.yellow,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION
  // ============================================================

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 14),

          child,
        ],
      ),
    );
  }

  // ============================================================
  // TYPOGRAPHY
  // ============================================================

  Widget _buildTypography(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Headline Large', style: textTheme.headlineLarge),
            Text('Headline Medium', style: textTheme.headlineMedium),
            Text('Headline Small', style: textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('Title Large', style: textTheme.titleLarge),
            Text('Title Medium', style: textTheme.titleMedium),
            Text('Title Small', style: textTheme.titleSmall),
            const SizedBox(height: 12),
            Text('Body Large', style: textTheme.bodyLarge),
            Text('Body Medium', style: textTheme.bodyMedium),
            Text('Body Small', style: textTheme.bodySmall),
            const SizedBox(height: 12),
            Text('Label Large', style: textTheme.labelLarge),
            Text('Label Medium', style: textTheme.labelMedium),
            Text('Label Small', style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // COLORS
  // ============================================================

  Widget _buildColors(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _colorBox(context, 'Navy', MyColors.navy),
        _colorBox(context, 'Blue', MyColors.blue),
        _colorBox(context, 'Blue Dark', MyColors.blueDark),
        _colorBox(context, 'Yellow', MyColors.yellow),
        _colorBox(context, 'Surface', MyColors.surface(context)),
        _colorBox(context, 'Surface Alt', MyColors.surfaceAlt(context)),
      ],
    );
  }

  Widget _colorBox(BuildContext context, String name, Color color) {
    return Container(
      width: 145,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: MyColors.border(context)),
      ),
      padding: const EdgeInsets.all(12),
      alignment: Alignment.bottomLeft,
      child: Text(
        name,
        style: TextStyle(
          color: color.computeLuminance() > 0.5
              ? MyColors.foregroundLight
              : MyColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============================================================
  // BUTTONS
  // ============================================================

  Widget _buildButtons(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('With Icon'),
            ),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),

            TextButton(onPressed: () {}, child: const Text('Text Button')),
            MyButtons.primary(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
            MyButtons.accent(
              onPressed: () {},
              child: const Text('Secondary Button'),
            ),

            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TEXT FIELDS
  // ============================================================

  Widget _buildTextFields(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your name',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person_outline),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.lock_outline),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.visibility_outlined),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Bio',
                hintText: 'Tell us about yourself...',
              ),
            ),

            const SizedBox(height: 16),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Error Example',
                errorText: 'This field contains an error',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget _buildDropdown(BuildContext context) {
    return Card(
      color: MyColors.surfaceAlt(context),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownMenu<String>(
          inputDecorationTheme: InputDecorationThemeData(
            filled: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: MyColors.border(context)),
            ),
          ),
          menuStyle: MenuStyle(
            maximumSize: const WidgetStatePropertyAll(Size(300, 300)),
            elevation: WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
          width: double.infinity,
          initialSelection: selectedCourse,
          label: const Text('Course'),
          leadingIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.school_outlined),
          ),
          dropdownMenuEntries: courses
              .map(
                (course) =>
                    DropdownMenuEntry<String>(value: course, label: course),
              )
              .toList(),
          onSelected: (value) {
            if (value != null) {
              setState(() {
                selectedCourse = value;
              });
            }
          },
        ),
      ),
    );
  }

  // ============================================================
  // CHECKBOX / SWITCH
  // ============================================================

  Widget _buildSelectionControls(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CheckboxListTile(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value ?? false;
              });
            },
            title: const Text('Remember me'),
            subtitle: const Text('Keep me signed in on this device'),
          ),

          const Divider(height: 1),

          SwitchListTile(
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
            title: const Text('Notifications'),
            subtitle: const Text('Receive course notifications'),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CHIPS
  // ============================================================

  Widget _buildChips(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            const Chip(label: Text('Flutter')),

            const Chip(avatar: Icon(Icons.code, size: 18), label: Text('.NET')),

            FilterChip(
              label: const Text(
                'Selected',
                style: TextStyle(color: MyColors.white),
              ),
              selected: true,
              onSelected: (_) {},
            ),

            FilterChip(
              label: const Text('Not Selected'),
              selected: false,
              onSelected: (_) {},
            ),

            InputChip(label: const Text('LearnHub'), onDeleted: () {}),

            const Chip(label: Text('Disabled'), onDeleted: null),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // CARDS
  // ============================================================

  Widget _buildCards(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: MyColors.secondary(context),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.play_circle_outline,
                    color: MyColors.primary(context),
                    size: 30,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Clean Architecture',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Learn how to build scalable Flutter apps.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),

                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MyColors.surfaceAlt(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: MyColors.border(context)),
          ),
          child: const Text('Alternative surface / container'),
        ),
      ],
    );
  }

  // ============================================================
  // PROGRESS
  // ============================================================

  Widget _buildProgress(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const LinearProgressIndicator(value: 0.65),

            const SizedBox(height: 24),

            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(strokeWidth: 4),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.35,
                      minHeight: 8,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                const Text('35%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SEMANTIC COLORS
  // ============================================================

  Widget _buildSemanticColors(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _semanticBox(
          context,
          'Success',
          MyColors.successColor(context),
          MyColors.successBackground,
        ),

        _semanticBox(
          context,
          'Warning',
          MyColors.warningColor(context),
          MyColors.warningBackground,
        ),

        _semanticBox(
          context,
          'Error',
          MyColors.errorColor(context),
          MyColors.errorBackground,
        ),

        _semanticBox(
          context,
          'Info',
          MyColors.infoColor(context),
          MyColors.infoBackground,
        ),

        _semanticBox(
          context,
          'Pro',
          MyColors.proColor(context),
          MyColors.proBackground,
        ),

        _semanticBox(
          context,
          'Premium',
          MyColors.premiumColor(context),
          MyColors.premiumBackground,
        ),
      ],
    );
  }

  Widget _semanticBox(
    BuildContext context,
    String title,
    Color color,
    Color background,
  ) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background.withValues(
          alpha: MyHelperFunctions.isDarkMode(context) ? 0.18 : 1,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),

          const SizedBox(width: 8),

          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DIALOG / BOTTOM SHEET
  // ============================================================

  Widget _buildDialogs(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                MyHelperFunctions.showAlertDialog(
                  context,
                  title: 'Delete Course?',
                  message: 'Are you sure you want to delete this course?',
                  confirmLabel: 'Delete',
                  cancelLabel: 'Cancel',
                );
              },
              icon: const Icon(Icons.warning_amber_rounded),
              label: const Text('Show Dialog'),
            ),

            OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bottom Sheet',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'This previews the LearnHub bottom sheet theme.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.expand_less),
              label: const Text('Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SNACKBARS
  // ============================================================

  Widget _buildSnackBars(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                MyLoaders.successSnackBar(
                  context: context,
                  title: 'Success',
                  message: 'Course enrolled successfully.',
                );
              },
              child: const Text('Success'),
            ),

            ElevatedButton(
              onPressed: () {
                MyLoaders.warningSnackBar(
                  context: context,
                  title: 'Warning',
                  message: 'Your subscription expires soon.',
                );
              },
              child: const Text('Warning'),
            ),

            ElevatedButton(
              onPressed: () {
                MyLoaders.errorSnackBar(
                  context: context,
                  title: 'Error',
                  message: 'Something went wrong.',
                );
              },
              child: const Text('Error'),
            ),

            OutlinedButton(
              onPressed: () {
                MyLoaders.customToast(
                  context: context,
                  message: 'This is a LearnHub toast.',
                );
              },
              child: const Text('Toast'),
            ),

            TextButton(
              onPressed: () {
                MyHelperFunctions.showSnackBar(
                  context,
                  'Standard LearnHub SnackBar',
                  actionLabel: 'UNDO',
                  onAction: () {},
                );
              },
              child: const Text('Standard SnackBar'),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ICONS
  // ============================================================
  Widget _buildIcons(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _iconPreview(context, Iconsax.home_2, 'Home'),
            _iconPreview(context, Iconsax.teacher, 'Courses'),
            _iconPreview(context, Iconsax.profile_circle, 'Profile'),
            _iconPreview(context, Iconsax.archive_book, 'Saved'),
            _iconPreview(context, Iconsax.notification, 'Notifications'),
            _iconPreview(context, Iconsax.setting_2, 'Settings'),
            _iconPreview(context, Iconsax.search_normal, 'Search'),
            _iconPreview(context, Iconsax.heart, 'Favorite'),
          ],
        ),
      ),
    );
  }

  Widget _iconPreview(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: MyColors.primary(context)),
        const SizedBox(height: 6),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
