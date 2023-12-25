import 'package:get_it/get_it.dart';

import 'register_third_dependencies.dart';

final sl = GetIt.I;

Future<void> injectDependencies() async {
  await registerThirdDependencies();
}
