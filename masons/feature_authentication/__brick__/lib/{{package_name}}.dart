library {{package_name}};

// Domain
export 'domain/entities/auth_user.dart';
export 'domain/repositories/auth_repository.dart';

// Features
// Login
export 'features/login/domain/usecases/sign_in.dart';
export 'features/login/presentation/cubit/login_cubit.dart';
export 'features/login/presentation/pages/login_page.dart';

// Forgot Password
export 'features/forgot_password/domain/usecases/reset_password.dart';
export 'features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
export 'features/forgot_password/presentation/pages/forgot_password_page.dart';

// Auth Status
export 'features/auth_status/domain/usecases/auth_state_changes.dart';
export 'features/auth_status/domain/usecases/sign_out.dart';
export 'features/auth_status/presentation/cubit/auth_cubit.dart';
export 'features/auth_status/presentation/pages/splash_page.dart';

// Data
export 'data/repositories/api_auth_repository.dart';
export 'data/repositories/firebase_auth_repository.dart';
export 'data/repositories/mock_auth_repository.dart';

// Module
export 'src/authentication_module.dart';
