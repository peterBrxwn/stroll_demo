import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: screenHeight * 0.25,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Image.asset('assets/images/fade.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 7,
                left: 15,
                right: 15,
              ),
              child: Column(
                children: const [
                  SizedBox(height: 14),
                  _TopBar(),
                  Spacer(),
                  _ProfileBar(),
                  SizedBox(height: 14),
                  _ButtonsBar(),
                  SizedBox(height: 14),
                  _BottomBar(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/cards.svg', height: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              label: Text(
                '',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 7,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.asset('assets/icons/bonfire.svg', height: 28),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Badge.count(
              count: 10,
              textStyle: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              child: SvgPicture.asset('assets/icons/chat.svg', height: 28),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/user.svg', height: 28),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stroll Bonfire',
              style: textTheme.headlineLarge?.copyWith(
                color: const Color(0xFFCCC8FF),
                shadows: const [
                  Shadow(
                    color: Color(0x33000000),
                    blurRadius: 7.9,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0x8024232F),
                    blurRadius: 7.9,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset('assets/icons/down_arrow.svg'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.5),
              child: SvgPicture.asset('assets/icons/clock.svg'),
            ),
            const SizedBox(width: 4),
            Text(
              '22h 00m',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.5),
              child: SvgPicture.asset('assets/icons/person.svg'),
            ),
            const SizedBox(width: 4),
            Text(
              '103',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileBar extends StatelessWidget {
  const _ProfileBar();

  static const double _xOffset = 37.5;
  static const double _yOffset = 12.5;
  // This padding is used to separate the text from the avatar,
  static const double _textPadding = 40.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Transform.translate(
                    offset: const Offset(_xOffset, _yOffset),
                    child: Padding(
                      // This padding ensures the text column doesn't extend too far right,
                      // effectively reserving space relative to the avatar's overlap.
                      padding: const EdgeInsets.only(right: _xOffset),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.only(
                              right: 12,
                              top: 4,
                              bottom: 4,
                              left: _textPadding,
                            ),
                            child: Text(
                              'Angelina, 28',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: _textPadding),
                            child: Text(
                              'What is your favorite time of the day?',
                              style: textTheme.titleLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w700,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surfaceContainerHighest,
                        width: 5,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1527980965255-d3b416303d12',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: _yOffset + 10),
        Center(
          child: Text(
            '“Mine is definitely the peace in the morning.”',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.primaryContainer,
              fontStyle: FontStyle.italic,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

class _ButtonsBar extends StatelessWidget {
  const _ButtonsBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          children: [
            Expanded(child: _Button('A', 'The peace in the early mornings')),
            SizedBox(width: 12),
            Expanded(child: _Button('B', 'The magical golden hours')),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _Button('C', 'Wind-down time after dinners')),
            SizedBox(width: 12),
            Expanded(
              child: _Button(
                'D',
                'The serenity past midnight',
                isSelected: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String letter;
  final String text;
  final bool isSelected;

  const _Button(this.letter, this.text, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration:
                isSelected
                    ? BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    )
                    : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: colorScheme.outline, width: 1),
                    ),
            child: Center(
              child: Text(
                letter,
                style: textTheme.bodyMedium?.copyWith(
                  color:
                      isSelected ? colorScheme.onPrimary : colorScheme.outline,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Pick your option.\nSee who has a similar mind.',
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
            softWrap: true,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.primary, width: 2),
            ),
            padding: const EdgeInsets.all(12.5),
            child: SvgPicture.asset('assets/icons/microphone.svg'),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary,
            ),
            padding: const EdgeInsets.all(12.5),
            child: SvgPicture.asset('assets/icons/forward.svg'),
          ),
        ),
      ],
    );
  }
}
