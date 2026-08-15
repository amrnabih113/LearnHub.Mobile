import 'package:flutter/material.dart';
import '../core/adaptive/adaptive_builder.dart';
import '../core/adaptive/adaptive_content.dart';
import '../core/adaptive/adaptive_context.dart';
import '../core/adaptive/adaptive_grid.dart';
import '../core/adaptive/adaptive_layout.dart';
import '../core/adaptive/adaptive_navigation.dart';
import '../core/adaptive/adaptive_value.dart';
import '../core/adaptive/adaptive_visiability.dart';
import '../core/adaptive/window_size.dart';
import '../core/navigation/navigation.dart';


/// Development-only screen used to visually test LearnHub's responsive
/// system.
///
/// This screen should NOT be part of the production application navigation.
///
/// It is useful while developing the adaptive system because the same screen
/// can be resized in Flutter Web to verify:
///
/// - compact layouts
/// - medium layouts
/// - expanded layouts
/// - navigation changes
/// - responsive values
/// - responsive visibility
/// - content constraints
/// - adaptive grids
///
/// Add this screen temporarily to your app and remove it when the responsive
/// system has been verified.
class ResponsivePlaygroundScreen extends StatefulWidget {
  const ResponsivePlaygroundScreen({
    super.key,
  });

  @override
  State<ResponsivePlaygroundScreen> createState() =>
      _ResponsivePlaygroundScreenState();
}

class _ResponsivePlaygroundScreenState
    extends State<ResponsivePlaygroundScreen> {
  int _selectedNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Playground'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWindowInformation(context),
            const SizedBox(height: 32),

            _buildAdaptiveLayoutSection(),
            const SizedBox(height: 32),

            _buildAdaptiveBuilderSection(),
            const SizedBox(height: 32),

            _buildAdaptiveValueSection(context),
            const SizedBox(height: 32),

            _buildAdaptiveVisibilitySection(),
            const SizedBox(height: 32),

            _buildAdaptiveContentSection(),
            const SizedBox(height: 32),

            _buildAdaptiveGridSection(),
            const SizedBox(height: 32),

            _buildAdaptiveNavigationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWindowInformation(BuildContext context) {
    final adaptive = context.adaptive;

    return _SectionCard(
      title: 'Window information',
      subtitle: 'Resize the browser to test the breakpoints.',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _InfoChip(
            label: 'Width',
            value: '${adaptive.width.toStringAsFixed(0)} px',
          ),
          _InfoChip(
            label: 'Height',
            value: '${adaptive.height.toStringAsFixed(0)} px',
          ),
          _InfoChip(
            label: 'Window',
            value: adaptive.windowSize.name,
          ),
        ],
      ),
    );
  }

  Widget _buildAdaptiveLayoutSection() {
    return _SectionCard(
      title: 'AdaptiveLayout',
      subtitle: 'Completely changes the layout structure.',
      child: AdaptiveLayout(
        compact: const _PreviewBox(
          title: 'COMPACT',
          description: 'Mobile / narrow window',
          icon: Icons.phone_android,
        ),
        medium: const _PreviewBox(
          title: 'MEDIUM',
          description: 'Tablet / medium window',
          icon: Icons.tablet,
        ),
        expanded: const _PreviewBox(
          title: 'EXPANDED',
          description: 'Desktop / wide window',
          icon: Icons.desktop_windows,
        ),
      ),
    );
  }

  Widget _buildAdaptiveBuilderSection() {
    return _SectionCard(
      title: 'AdaptiveBuilder',
      subtitle: 'Builds UI according to the current window size.',
      child: AdaptiveBuilder(
        builder: (context, windowSize) {
          return _PreviewBox(
            title: 'AdaptiveBuilder',
            description: 'Current: ${windowSize.name}',
            icon: switch (windowSize) {
              WindowSize.compact => Icons.phone_android,
              WindowSize.medium => Icons.tablet,
              WindowSize.expanded => Icons.desktop_windows,
          
            }, 
          );
        },
      ),
    );
  }

  Widget _buildAdaptiveValueSection(BuildContext context) {
    final spacing = context.adaptiveValue<double>(
      compact: 8,
      medium: 16,
      expanded: 32,
    );

    final titleSize = context.adaptiveValue<double>(
      compact: 22,
      medium: 28,
      expanded: 36,
    );

    return _SectionCard(
      title: 'AdaptiveValue',
      subtitle: 'The structure stays the same while values change.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Responsive heading',
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: spacing),
          Container(
            width: double.infinity,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(),
            ),
            child: Text(
              'Spacing: ${spacing.toStringAsFixed(0)}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdaptiveVisibilitySection() {
    return _SectionCard(
      title: 'AdaptiveVisibility',
      subtitle: 'Elements can appear/disappear by window size.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveVisibility(
            child: const _VisibilityTile(
              label: 'Visible on compact',
              icon: Icons.phone_android,
            ),
            medium: true,
            expanded: true,
            compact: false,
          ),
          const SizedBox(height: 12),
          const Text(
            'Resize the window to see the content change.',
          ),
        ],
      ),
    );
  }

  Widget _buildAdaptiveContentSection() {
    return _SectionCard(
      title: 'AdaptiveContent',
      subtitle: 'Constrains large-screen content.',
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: AdaptiveContent(
          maxWidth: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Constrained LearnHub content',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              const Text(
                'On a wide desktop window this content remains constrained '
                'instead of stretching across the entire screen.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdaptiveGridSection() {
    final cards = List.generate(
      10,
      (index) => _CoursePreviewCard(
        index: index + 1,
      ),
    );

    return _SectionCard(
      title: 'AdaptiveGrid',
      subtitle: 'Resize the window and watch the column count change.',
      child: SizedBox(
        height: 500,
        child: AdaptiveGrid(
          minItemWidth: 220,
          spacing: 16,
          runSpacing: 16,
          childAspectRatio: 1.25,
          children: cards,
        ),
      ),
    );
  }

  Widget _buildAdaptiveNavigationSection() {
    return _SectionCard(
      title: 'AdaptiveNavigation',
      subtitle:
          'The same destinations become NavigationBar, NavigationRail, '
          'or Sidebar.',
      child: SizedBox(
        height: 500,
        child: AdaptiveNavigation(
          destinations: LearnHubNavigation.primary,
          selectedIndex: _selectedNavigationIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedNavigationIndex = index;
            });
          },
          railExtended: true,
          sidebarWidth: 260,
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value'),
    );
  }
}

class _PreviewBox extends StatelessWidget {
  const _PreviewBox({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}

class _VisibilityTile extends StatelessWidget {
  const _VisibilityTile({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }
}

class _CoursePreviewCard extends StatelessWidget {
  const _CoursePreviewCard({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Icon(
                Icons.play_circle_outline,
                size: 48,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Course $index',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}