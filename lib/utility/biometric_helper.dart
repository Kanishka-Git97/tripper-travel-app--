import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final bool isAuthenticated = await _auth.authenticate(
        localizedReason: 'Please Authenticate to Proceed',
        options: const AuthenticationOptions(biometricOnly: false));
    return isAuthenticated;
  }
}
