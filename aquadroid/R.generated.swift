//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `error`.
    static let error = Rswift.ImageResource(bundle: R.hostingBundle, name: "error")
    
    /// `UIImage(named: "error", bundle: ..., traitCollection: ...)`
    static func error(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.error, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 5 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `LoginVC`.
    static let loginVC = _R.storyboard.loginVC()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `RegisterVC`.
    static let registerVC = _R.storyboard.registerVC()
    /// Storyboard `RestoreVC`.
    static let restoreVC = _R.storyboard.restoreVC()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "LoginVC", bundle: ...)`
    static func loginVC(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.loginVC)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "RegisterVC", bundle: ...)`
    static func registerVC(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.registerVC)
    }
    
    /// `UIStoryboard(name: "RestoreVC", bundle: ...)`
    static func restoreVC(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.restoreVC)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 19 localization keys.
    struct localizable {
      /// Value: Unable to encode data
      static let encodingError = Rswift.StringResource(key: "encodingError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Unable to get data
      static let decodingError = Rswift.StringResource(key: "decodingError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Вход
      static let logIn = Rswift.StringResource(key: "logIn", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Для входа в аккаунт идентифицируйтесь
      static let loginBiometrics = Rswift.StringResource(key: "loginBiometrics", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: К сожалению создатель конференции не указал точные координаты конференции
      static let coordinatesNotSpecified = Rswift.StringResource(key: "coordinatesNotSpecified", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Название одной из секций отсутствует, добавьте или удалите секцию
      static let lackOfSectionName = Rswift.StringResource(key: "lackOfSectionName", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Неверный формат электронной почты
      static let emailError = Rswift.StringResource(key: "emailError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Невозможно авторизоваться с помощью индентификации, введите данные снова
      static let cantLoginWithBiometrics = Rswift.StringResource(key: "cantLoginWithBiometrics", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Невозможно идентифицировать пользователя по введенным данным
      static let wrongBiometrics = Rswift.StringResource(key: "wrongBiometrics", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Невозможно перейти на данный экран
      static let routeError = Rswift.StringResource(key: "routeError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ок
      static let ok = Rswift.StringResource(key: "ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ошибка
      static let error = Rswift.StringResource(key: "error", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Пароли не совпадают
      static let checkPasswordError = Rswift.StringResource(key: "checkPasswordError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Пароль должен содержать более 5 символов
      static let passwordError = Rswift.StringResource(key: "passwordError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Регистрация
      static let registration = Rswift.StringResource(key: "registration", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Результатов не найдено
      static let resultsNotFound = Rswift.StringResource(key: "resultsNotFound", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Сообщение
      static let message = Rswift.StringResource(key: "message", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Упс
      static let oups = Rswift.StringResource(key: "oups", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Что то пошло не так, повторите позже
      static let serverError = Rswift.StringResource(key: "serverError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: Unable to encode data
      static func encodingError(_: Void = ()) -> String {
        return NSLocalizedString("encodingError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Unable to get data
      static func decodingError(_: Void = ()) -> String {
        return NSLocalizedString("decodingError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Вход
      static func logIn(_: Void = ()) -> String {
        return NSLocalizedString("logIn", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Для входа в аккаунт идентифицируйтесь
      static func loginBiometrics(_: Void = ()) -> String {
        return NSLocalizedString("loginBiometrics", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: К сожалению создатель конференции не указал точные координаты конференции
      static func coordinatesNotSpecified(_: Void = ()) -> String {
        return NSLocalizedString("coordinatesNotSpecified", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Название одной из секций отсутствует, добавьте или удалите секцию
      static func lackOfSectionName(_: Void = ()) -> String {
        return NSLocalizedString("lackOfSectionName", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Неверный формат электронной почты
      static func emailError(_: Void = ()) -> String {
        return NSLocalizedString("emailError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Невозможно авторизоваться с помощью индентификации, введите данные снова
      static func cantLoginWithBiometrics(_: Void = ()) -> String {
        return NSLocalizedString("cantLoginWithBiometrics", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Невозможно идентифицировать пользователя по введенным данным
      static func wrongBiometrics(_: Void = ()) -> String {
        return NSLocalizedString("wrongBiometrics", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Невозможно перейти на данный экран
      static func routeError(_: Void = ()) -> String {
        return NSLocalizedString("routeError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Ок
      static func ok(_: Void = ()) -> String {
        return NSLocalizedString("ok", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Ошибка
      static func error(_: Void = ()) -> String {
        return NSLocalizedString("error", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Пароли не совпадают
      static func checkPasswordError(_: Void = ()) -> String {
        return NSLocalizedString("checkPasswordError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Пароль должен содержать более 5 символов
      static func passwordError(_: Void = ()) -> String {
        return NSLocalizedString("passwordError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Регистрация
      static func registration(_: Void = ()) -> String {
        return NSLocalizedString("registration", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Результатов не найдено
      static func resultsNotFound(_: Void = ()) -> String {
        return NSLocalizedString("resultsNotFound", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Сообщение
      static func message(_: Void = ()) -> String {
        return NSLocalizedString("message", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Упс
      static func oups(_: Void = ()) -> String {
        return NSLocalizedString("oups", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Что то пошло не так, повторите позже
      static func serverError(_: Void = ()) -> String {
        return NSLocalizedString("serverError", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.requests` struct is generated, and contains static references to 3 localization keys.
    struct requests {
      /// Value: Audience
      static let audience = Rswift.StringResource(key: "audience", tableName: "Requests", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Authorization
      static let authorization = Rswift.StringResource(key: "authorization", tableName: "Requests", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: User-Agent
      static let userAgent = Rswift.StringResource(key: "userAgent", tableName: "Requests", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: Audience
      static func audience(_: Void = ()) -> String {
        return NSLocalizedString("audience", tableName: "Requests", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Authorization
      static func authorization(_: Void = ()) -> String {
        return NSLocalizedString("authorization", tableName: "Requests", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: User-Agent
      static func userAgent(_: Void = ()) -> String {
        return NSLocalizedString("userAgent", tableName: "Requests", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try loginVC.validate()
      try main.validate()
      try registerVC.validate()
      try restoreVC.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct loginVC: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginVC
      
      let bundle = R.hostingBundle
      let name = "LoginVC"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct registerVC: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = RegisterVC
      
      let bundle = R.hostingBundle
      let name = "RegisterVC"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct restoreVC: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "RestoreVC"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
