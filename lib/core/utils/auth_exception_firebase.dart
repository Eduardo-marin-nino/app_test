enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  invalidVerificationCode,
}

class AuthExceptionHandler {
  static handleException(e) {
    AuthResultStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-request":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage =
            "Su dirección de correo electrónico parece tener un formato incorrecto.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Tu contraseña es incorrecta.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "No existe una cuenta con este correo.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage =
            "El usuario con este correo electrónico ha sido inhabilitado.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Demasiadas solicitudes. Vuelve a intentarlo más tarde.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage =
            "El inicio de sesión con correo electrónico y contraseña no está habilitado.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "El correo electrónico ya ha sido registrado. Inicie sesión o restablezca su contraseña.";
        break;
      default:
        errorMessage = "Ocurrió un error indefinido.";
    }
    return errorMessage;
  }
}
