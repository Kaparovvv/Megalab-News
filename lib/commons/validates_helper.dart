class ValidatesHelper {
  passwordValidate(String value) {
    if (value.isNotEmpty) {
      if (RegExp("(?:[a-z])").hasMatch(value)) {
        if (RegExp("(?:[A-Z])").hasMatch(value)) {
          if (RegExp("(?:[0-9])").hasMatch(value)) {
            if (RegExp(".{8,}").hasMatch(value)) {
              return null;
            } else {
              return 'Длина пароля должна быть не меньше 8 символов';
            }
          } else {
            return 'Пароль должен содержать цифры';
          }
        } else {
          return 'Пароль должен содержать буквы верхнего регистра';
        }
      } else {
        return 'Пароль должен содержать буквы нижнего регистра';
      }
    } else {
      return 'Введите пароль, пожалуйста';
    }
  }

  titleValidate(String value, String valueType) {
    if (value.isEmpty) {
      return 'Введите $valueType, пожалуйста';
    } else {
      return null;
    }
  }
}
