import SwiftUI

/// 首頁：列出所有旅行。
///
/// SwiftUI 的 view 也是 struct。它不是「一個畫面物件」，而是「畫面長什麼樣子的描述」。
/// 每次資料變了，SwiftUI 就重新呼叫 `body` 拿到新的描述，再自己算出要改哪些地方。
struct HomeView: View {

    /// `@State`：這個 view 自己擁有、而且會變的資料。
    /// 加了 @State，SwiftUI 就會盯著它；一旦改變，畫面自動更新。
    /// 之後這個陣列會從相簿算出來，現在先放假資料。
    @State private var trips: [Trip] = Trip.samples

    var body: some View {
        // NavigationStack：提供上方的大標題，以及「點一列進到下一頁」的能力。
        NavigationStack {
            List(trips) { trip in
                // NavigationLink：點下去會推進到 destination 那一頁。
                NavigationLink {
                    // 下一頁先放佔位文字，下一課會換成真的 Trip 頁。
                    Text(trip.name)
                        .navigationTitle(trip.name)
                } label: {
                    TripRow(trip: trip)
                }
            }
            .navigationTitle("Your trips")
            .toolbar {
                Button("New Trip", systemImage: "plus") {
                    // 下一課接相簿匯入。
                }
            }
        }
    }
}

/// 列表裡的一列。
///
/// 把一列拆成獨立的 view 是好習慣：HomeView 只管「有哪些列」，TripRow 只管「一列長怎樣」。
struct TripRow: View {
    let trip: Trip   // `let`：這個 view 只讀不改，資料從外面傳進來

    var body: some View {
        HStack(spacing: 12) {
            Text(trip.flag)
                .font(.largeTitle)

            VStack(alignment: .leading, spacing: 4) {
                Text(trip.name)
                    .font(.headline)
                Text(dateRange)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("\(trip.dayCount) days · \(trip.photoCount) photos")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    /// 「Jun 22 – Jul 8」這種字串。
    private var dateRange: String {
        let style = Date.FormatStyle().month(.abbreviated).day()
        return "\(trip.startDate.formatted(style)) – \(trip.endDate.formatted(style))"
    }
}

// Xcode 右邊的即時預覽。改 code 存檔就會更新，不用跑模擬器。
#Preview {
    HomeView()
}
