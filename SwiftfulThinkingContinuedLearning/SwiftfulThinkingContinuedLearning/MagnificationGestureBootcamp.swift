import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    // State variables to manage the scaling during and after the gesture
    @State private var currentAmount: CGFloat = 0 // Temporary scaling factor during the gesture
    @State private var finalAmount: CGFloat = 1  // Final scaling factor applied after the gesture ends

    var body: some View {
        VStack {
            // Header section with a title, icon, and a menu button
            HStack {
                Circle()
                    .frame(width: 35, height: 35) // Small circular avatar/icon
                Text("Swiftful Thinking") // Title text
                Spacer() // Pushes content to opposite ends
                Image(systemName: "ellipsis") // Menu or options icon
            }
            .padding() // Adds padding around the header

            // Rectangle with scaling gesture applied
            Rectangle()
                .frame(height: 300) // Fixed height for the rectangle
                .scaleEffect(1 + currentAmount) // Combines the base and ongoing scaling factors
                .gesture(
                    MagnificationGesture() // Pinch-to-zoom gesture
                        .onChanged { value in
                            currentAmount = value - 1 // Calculate the change in scale from the base (1.0)
                        }
                        .onEnded { value in
                            finalAmount += currentAmount // Add the accumulated scale to the final amount
                            withAnimation(.spring) {
                                currentAmount = 0 // Reset temporary scaling to avoid residual effects
                            }
                        }
                )
            
            // Footer section with action icons
            HStack {
                Image(systemName: "heart.fill") // Like icon
                Image(systemName: "text.bubble.fill") // Comment icon
                Spacer() // Pushes icons to the left
            }
            .padding(.horizontal) // Adds padding to the horizontal edges
            .font(.headline) // Sets the font style and size

            // Caption text for the rectangle
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left
                .padding(.horizontal) // Adds padding to the horizontal edges
        }
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
