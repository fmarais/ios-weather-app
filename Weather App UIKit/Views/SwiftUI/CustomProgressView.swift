import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
    }
}

#Preview {
    CustomProgressView()
}
