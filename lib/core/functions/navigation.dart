import 'package:go_router/go_router.dart';

void customNavigation(context, String path, {dynamic extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

void customReplacmentNavigation(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customPopAllandNavigate(context, String path) {
  while (true) {
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    } else {
      break;
    }
  }
  GoRouter.of(context).pushReplacement(path);
}
