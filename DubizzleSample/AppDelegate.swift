//
//  AppDelegate.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit
import XCGLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator: RootCoordinator?
    private var logger: XCGLogger?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        logger = defaultLogger()
        logger?.debug("Application did launch...")
        
        let initialWindow = UIWindow()
        let rootCoordinator = RootCoordinator(window: initialWindow, logger: logger)
        rootCoordinator.start()
        initialWindow.makeKeyAndVisible()
        window = initialWindow
        coordinator = rootCoordinator
        
//        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Splash", bundle: nil)
//        let newViewcontroller:UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "Splash") as! UIViewController
//        window?.rootViewController = newViewcontroller
//
        logger?.debug("Application did launch - completed.")

        return true
    }

}

extension AppDelegate {
    func defaultLogger() -> XCGLogger {
      let options: (level: XCGLogger.Level, shouldLogToConsole: Bool)

      #if DEBUG
      options = (level: .debug, shouldLogToConsole: true)
      #elseif ADHOC
      options = (level: .info, shouldLogToConsole: false)
      #else
      options = (level: .error, shouldLogToConsole: false)
      #endif

      let logger = XCGLogger(identifier: "com.dubizzle.log", includeDefaultDestinations: false)
      if options.shouldLogToConsole {
        let consoleDestination = ConsoleDestination(identifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
        logger.add(destination: consoleDestination)
      }

      logger.setup(level: options.level,
                   showThreadName: true,
                   showLevel: true,
                   showFileNames: true,
                   showLineNumbers: true,
                   showDate: true)
      return logger
    }
}

