import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var angle: Angle = .degrees(0) // Tracks the current rotation angle
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle) // Large text style
            .fontWeight(.semibold) // Bold weight for emphasis
            .foregroundStyle(.white) // White text color
            .padding(50) // Adds padding around the text
            .background(Color.blue.cornerRadius(10)) // Blue background with rounded corners
            .rotationEffect(angle) // Applies the rotation to the view
            .gesture(
                RotationGesture() // Detects rotation gestures
                    .onChanged { rotation in
                        angle = rotation // Updates the angle as the user rotates
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0) // Resets the angle to 0 with a spring animation
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
