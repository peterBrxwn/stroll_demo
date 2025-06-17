// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:stroll_demo/gen/assets.gen.dart';
import 'package:stroll_demo/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.background.image(fit: BoxFit.cover, height: 502.h),
          Assets.images.fade.image(fit: BoxFit.cover, width: double.infinity),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 7.h),
              child: Column(
                children: [
                  14.verticalSpace,
                  _TopBar(),
                  Spacer(),
                  _ProfileBar(),
                  14.verticalSpace,
                  _AnswerOptionsGrid(),
                  14.verticalSpace,
                  _ActionBar(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: _NavIcon(icon: Assets.icons.cards.svg()),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _NavIcon(icon: Assets.icons.bonfire.svg(), label: ''),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _NavIcon(icon: Assets.icons.chat.svg(), label: '10'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _NavIcon(icon: Assets.icons.user.svg()),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.label});

  final SvgPicture icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    if (label == null) return icon;

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(padding: EdgeInsets.only(right: 8.23.w), child: icon),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.bottomNavigationBarTheme.backgroundColor!,
              width: 1.4.sp,
            ),
            borderRadius: BorderRadius.circular(6.5.sp),
            color: theme.badgeTheme.backgroundColor,
          ),
          width: 16.w,
          height: 13.h,
          alignment: Alignment.center,
          padding: Platform.isIOS ? EdgeInsets.only(top: 1.h) : null,
          child: Text(
            label!,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 7.sp,
              color: colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    const String exampleTime = "22";
    const String exampleMinutes = "00";
    const String exampleCount = "103";
    const List<Shadow> textShadows = [
      Shadow(color: Color(0x4D000000), blurRadius: 1.0, offset: Offset(0, 1)),
      Shadow(color: Color(0x33000000), blurRadius: 4.0, offset: Offset(0, 1)),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.strollBonfireTitle,
              style: textTheme.headlineLarge?.copyWith(
                color: colorScheme.primaryContainer,
                shadows: const [
                  Shadow(
                    color: Color(0x33000000),
                    blurRadius: 7.9,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0xFFBEBEBE),
                    blurRadius: 2.0,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0x8024232F),
                    blurRadius: 2.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
            Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0, 0.3),
                  child: Assets.icons.downArrow.svg(
                    colorFilter: const ColorFilter.mode(
                      Color(0x80000000),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Assets.icons.downArrow.svg(),
              ],
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _ShadowedIcon(
              iconPath: Assets.icons.clock.path,
              shadows: textShadows,
              color: colorScheme.onSurface,
            ),
            4.horizontalSpace,
            Text(
              l10n.timeRemaining(exampleTime, exampleMinutes),
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                shadows: textShadows,
              ),
            ),
            20.horizontalSpace,
            _ShadowedIcon(
              iconPath: Assets.icons.person.path,
              shadows: textShadows,
              color: colorScheme.onSurface,
            ),
            4.horizontalSpace,
            Text(
              l10n.participantCount(exampleCount),
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                shadows: textShadows,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ShadowedIcon extends StatelessWidget {
  const _ShadowedIcon({
    required this.iconPath,
    required this.shadows,
    required this.color,
  });

  final String iconPath;
  final List<Shadow> shadows;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...shadows.map(
          (s) => Transform.translate(
            offset: s.offset,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(s.color, BlendMode.srcIn),
            ),
          ),
        ),
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ],
    );
  }
}

class _ProfileBar extends StatelessWidget {
  const _ProfileBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    const String exampleName = "Angelina";
    const String exampleAge = "28";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                height: 20.h,
                padding: EdgeInsets.only(right: 8.w, left: 32.w),
                margin: EdgeInsets.only(left: 32.w, top: 7.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1,
                  child: Text(
                    l10n.profileNameAge(exampleName, exampleAge),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 69.w, top: 36.h, right: 15.w),
                child: Text(
                  l10n.favoriteTimeQuestion,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  softWrap: true,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.surfaceContainerHighest,
                    width: 5.sp,
                  ),
                ),
                child: CircleAvatar(
                  radius: 25.sp,
                  backgroundImage: Assets.images.profilePicture.provider(),
                ),
              ),
            ],
          ),
        ),
        9.verticalSpace,
        Center(
          child: Text(
            l10n.profileQuote,
            style: textTheme.bodySmall?.copyWith(
              color: const Color(0xB3CBC9FF),
              fontStyle: FontStyle.italic,
              height: 1.2,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _AnswerOptionsGrid extends StatelessWidget {
  const _AnswerOptionsGrid();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_OptionButton('A', l10n.optionA), _OptionButton('B', l10n.optionB)],
        ),
        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _OptionButton('C', l10n.optionC),
            _OptionButton('D', l10n.optionD, isSelected: true),
          ],
        ),
      ],
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String letter;
  final String text;
  final bool isSelected;

  const _OptionButton(this.letter, this.text, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      width: 166.w,
      height: 57.h,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          width: 2.w,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(-1, -1),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Color(0x4D484848),
            offset: Offset(1, 1),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(2, 2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration:
                isSelected
                    ? BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    )
                    : BoxDecoration(
                      border: Border.all(color: colorScheme.outline, width: 1),
                      shape: BoxShape.circle,
                    ),
            child: Center(
              child: Text(
                letter,
                style: textTheme.bodySmall?.copyWith(
                  color:
                      isSelected ? colorScheme.onPrimary : colorScheme.outline,
                ),
              ),
            ),
          ),
          10.horizontalSpace,
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

class _ActionBar extends StatelessWidget {
  const _ActionBar();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        3.5.horizontalSpace,
        Expanded(
          child: Text(
            l10n.pickOptionPrompt,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.secondary,
              height: 1.2,
            ),
            softWrap: true,
          ),
        ),
        6.horizontalSpace,
        _CircleButton(
          onTap: () {},
          hasBorder: true,
          child: Assets.icons.microphone.svg(),
        ),
        6.horizontalSpace,
        _CircleButton(
          onTap: () {},
          backgroundColor: colorScheme.primary,
          child: Assets.icons.forward.svg(),
        ),
        3.5.horizontalSpace,
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.child,
    required this.onTap,
    this.hasBorder = false,
    this.backgroundColor,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool hasBorder;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border:
              hasBorder
                  ? Border.all(color: colorScheme.primary, width: 2.2.w)
                  : null,
        ),
        width: 48.w,
        height: 48.h,
        child: Center(child: child),
      ),
    );
  }
}
