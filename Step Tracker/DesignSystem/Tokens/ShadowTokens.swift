import SwiftUI

enum ShadowToken {
    static let card = (color: Color.black.opacity(0.12), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(8))
}

extension View {
    func cardShadow() -> some View {
        self.shadow(
            color: ShadowToken.card.color,
            radius: ShadowToken.card.radius,
            x: ShadowToken.card.x,
            y: ShadowToken.card.y
        )
    }
}
