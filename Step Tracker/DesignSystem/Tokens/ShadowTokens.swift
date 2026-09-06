import SwiftUI

enum ShadowToken {
    static let card = (color: Color.black.opacity(0.06), radius: CGFloat(10), x: CGFloat(0), y: CGFloat(4))
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
