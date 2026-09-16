import Foundation

/// 一趟旅行。
///
/// `struct` 是 Swift 的「值型別」：複製一份就是完全獨立的一份。
/// SwiftUI 的資料模型幾乎都用 struct，因為簡單、沒有共享狀態的問題。
///
/// `Identifiable` 是一個 protocol（約定）：只要有一個叫 `id` 的屬性就算符合。
/// `List` 需要它來分辨「這一列是哪一筆資料」。
struct Trip: Identifiable {
    let id = UUID()          // 自動產生的唯一識別碼
    var name: String
    var flag: String
    var startDate: Date
    var endDate: Date
    var photoCount: Int

    /// 「計算屬性」：不存資料，每次讀取時算出來。
    /// 這種「從既有資料推導出來的值」在 Swift 裡就用計算屬性，不要多存一個變數。
    var dayCount: Int {
        let days = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        return days + 1   // 6/22 到 6/23 是 2 天，不是 1 天
    }
}

// MARK: - 假資料
// 在還沒接相簿之前，先用假資料把畫面做出來。
// 這是 iOS 開發很常見的做法：UI 和資料來源分開做，互不等待。
extension Trip {
    static let samples: [Trip] = [
        Trip(name: "Italy", flag: "🇮🇹",
             startDate: .from(2026, 6, 22), endDate: .from(2026, 7, 8),
             photoCount: 1284),
        Trip(name: "Japan", flag: "🇯🇵",
             startDate: .from(2025, 11, 23), endDate: .from(2025, 11, 30),
             photoCount: 632),
    ]
}

// 小工具：讓建立日期不用寫一長串 DateComponents。
extension Date {
    static func from(_ year: Int, _ month: Int, _ day: Int) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
    }
}
