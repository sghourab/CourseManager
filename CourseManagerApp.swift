//
//  CourseManagerApp.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()
        return true
    }
}

@main
struct CourseManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var model = Model()
        

    var body: some Scene {
        WindowGroup {
            //CoursesView()
            CoursesView()
                .environmentObject(model)
        }
    }
}
