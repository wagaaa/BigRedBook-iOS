import SwiftUI

struct RecommendView: View {
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                    ForEach(0..<10) { index in
                        CardView(title: "Test")
                            //.frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    RecommendView()
}
