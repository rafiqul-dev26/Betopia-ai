import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application_state/startup_provider/startup_provider.dart';
import '../../router/router_state/router_state_provider.dart';
import '../../router/routes.dart';
import '../failure_view.dart';

class StartupWidget extends ConsumerWidget {
  const StartupWidget({super.key, required this.loading, required this.loaded});

  final Widget loading;
  final Widget loaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(routerStateProvider, (previous, next) {
      if (next != Routes.splash) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            context.go(next.path);
          }
        });
      }
    });

    final startupState = ref.watch(startupProvider);

    return startupState.when(
      loading: () => loading,
      error: (error, stackTrace) => Scaffold(
        body: FailureView(
          error: error,
          onRetry: () => ref.invalidate(startupProvider),
        ),
      ),
      data: (_) {
        final gate = ref.read(routerStateProvider);
        if (gate != Routes.splash) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              context.go(gate.path);
            }
          });
        }
        return loaded;
      },
    );
  }
}
