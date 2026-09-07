import SwiftUI

enum AnimationPreset {
    static func pulse(duration: Double = 2) -> Animation {
        Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)
    }

    static func float(duration: Double = 3) -> Animation {
        Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)
    }
}
