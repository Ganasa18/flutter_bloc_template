import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/bloc/locale/locale_bloc.dart';
import 'package:my_template/bloc/theme/theme_bloc.dart';
import 'package:my_template/bloc/user/user_bloc.dart';
import 'package:my_template/config/app_config.dart';
import 'package:my_template/core/components/idle/idle_item.dart';
import 'package:my_template/core/components/loading/loading_listview.dart';
import 'package:my_template/core/constant/utils.dart';
import 'package:my_template/extension/extensions.dart';
import 'package:my_template/theme/theme.dart';
import 'package:my_template/utils/snackbar/fancy_snackbar.dart';
import 'package:my_template/l10n/app_localizations.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.homeScreenTitle,
          style: MyTheme.style.title.copyWith(
            color: MyTheme.color.white,
            fontSize: AppSetting.setFontSize(45),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor:
            context.isDark ? context.containerColor : MyTheme.color.primary,
        actions: [
          BlocBuilder<LocaleBloc, LocaleState>(
            builder: (context, state) {
              final deviceLocale = Localizations.localeOf(context);
              final code = state.maybeWhen(
                loaded: (locale) => locale?.languageCode,
                orElse: () => null,
              );
              final currentCode = code ?? deviceLocale.languageCode;
              final isId = currentCode == 'id';
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isId ? 'ID' : 'EN',
                    style: MyTheme.style.subtitle.copyWith(
                      color: MyTheme.color.white,
                      fontSize: AppSetting.setFontSize(30),
                    ),
                  ),
                  Switch.adaptive(
                    value: isId,
                    onChanged: (_) {
                      final next =
                          isId ? const Locale('en') : const Locale('id');
                      context.read<LocaleBloc>().setLocale(next);
                    },
                    activeColor: MyTheme.color.white,
                    inactiveThumbColor: MyTheme.color.white,
                    inactiveTrackColor: MyTheme.color.white.withOpacity(0.4),
                  ),
                ],
              );
            },
          ),

          /// Icon button choose popup menu button theme from Light, Dark or System
          PopupMenuButton<ThemeMode>(
            icon: Icon(
              Icons.more_vert,
              color: MyTheme.color.white,
            ),
            onSelected: (ThemeMode mode) {
              context.read<ThemeBloc>().setTheme(mode);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<ThemeMode>>[
                const PopupMenuItem<ThemeMode>(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                const PopupMenuItem<ThemeMode>(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
                const PopupMenuItem<ThemeMode>(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => UserBloc()..getUsers(params: {'page': 1}),
        child: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.when(
          initial: () => const IdleLoading(),
          loading: () => const LoadingListView(),
          error: (message) => IdleNoItemCenter(title: message),
          loaded: (users, page, hasReachedMax, onLoadMore) {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar ?? ""),
                  ),
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text(user.email ?? ""),
                  onTap: () {
                    final name =
                        "${user.firstName ?? ''} ${user.lastName ?? ''}".trim();
                    final localizations = AppLocalizations.of(context)!;
                    showFancySnackbar(
                      title: localizations.selectedUserTitle,
                      message: localizations.selectedUserMessage(
                        name.isEmpty ? localizations.unknownName : name,
                        user.email ?? localizations.noEmail,
                      ),
                      contentType: ContentType.success,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
