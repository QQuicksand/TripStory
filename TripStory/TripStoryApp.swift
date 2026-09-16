import SwiftUI

/// `@main`：整個 app 從這裡開始。
/// 一個 App 裡有 Scene（視窗），Scene 裡放第一個 view。
@main
struct TripStoryApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
