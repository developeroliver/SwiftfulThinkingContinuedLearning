import SwiftUI

struct LongPressGestureBootcamp: View {
    
    // State variables to track the UI's visual and interactive states
    @State private var isComplete = false // Indicates if the long press gesture is in progress (visual feedback)
    @State private var isSuccess = false  // Indicates if the long press gesture was successfully completed

    var body: some View {
        VStack(spacing: 20) {
            // A rectangle that visually indicates progress or success
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue) // Turns green on success, blue otherwise
                .frame(maxWidth: isComplete ? .infinity : 0) // Expands fully during a long press
                .frame(height: 55) // Fixed height for the rectangle
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns rectangle to the leading edge
                .background(.gray) // Background color of the full container area
            
            HStack {
                // Long press button to trigger progress and success
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded button shape
                    .onLongPressGesture(
                        minimumDuration: 1.0, // Gesture must last at least 1 second
                        maximumDistance: 50   // Gesture must remain within 50 points of the button
                    ) { isPressing in
                        // When the press begins or is in progress
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true // Start showing progress
                            }
                        } else {
                            // When the press ends prematurely (not completed)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess { // Reset if not successfully completed
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        // Action performed when the gesture meets the minimum duration
                        withAnimation(.easeInOut(duration: 1)) {
                            isSuccess = true // Mark the action as successful
                        }
                    }
                
                // Reset button to clear the current states
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(isSuccess ? Color.green : Color.black) // Green if successful, black otherwise
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded button shape
                    .onTapGesture {
                        // Reset both states when tapped
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
