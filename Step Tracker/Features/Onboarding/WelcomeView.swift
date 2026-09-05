//
//  WelcomeView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 8/30/26.
//

import SwiftUI

// Design System Tokens
// Note: These are imported via the individual modules, not aggregated imports
// This allows Xcode to properly resolve the types and enable code completion

func registerCustomFonts() {
    let fontNames = ["Figtree-Bold.ttf", "Figtree-Regular.ttf", "YoungSerif-Regular.ttf"]
    for fontName in fontNames {
        if let fontPath = Bundle.main.path(forResource: fontName.replacingOccurrences(of: ".ttf", with: ""), ofType: "ttf") {
            if let fontData = try? Data(contentsOf: URL(fileURLWithPath: fontPath)),
               let provider = CGDataProvider(data: fontData as CFData),
               let font = CGFont(provider) {
                var error: Unmanaged<CFError>?
                CTFontManagerRegisterGraphicsFont(font, &error)
            }
        }
    }
}

struct WelcomeView: View {
    @State private var isAnimating = false
    @ObservedObject var authManager: AuthenticationManager

    let accentColor: Color = .sky

    var body: some View {
        ZStack {
            Color.surfaceCard
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Logo
                Text("Stept")
                    .font(.titleText)
                    .foregroundStyle(Color.textStrong)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Spacing.space4)
                    .padding(.horizontal, Spacing.space6)

                // Hero Section
                VStack(spacing: 0) {
                    Spacer()

                    ZStack {
                        // Main Circle
                        Circle()
                            .fill(accentColor)
                            .frame(width: 206, height: 206)
                            .cardShadow()

                        // Hero Icon - Pulse animation
                        Image(systemName: "figure.walk")
                            .font(.system(size: 98, weight: .semibold))
                            .foregroundStyle(.white)
                            .opacity(isAnimating ? 0.7 : 1.0)
                            .animation(AnimationPreset.pulse(), value: isAnimating)

                        // Step Badge (Top-left)
                        HStack(spacing: Spacing.space2) {
                            Image(systemName: "figure.walk")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color.success)

                            Text("12,438")
                                .font(.labelSmallText)
                                .foregroundStyle(Color.textStrong)
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 14)
                        .background(Color.surfaceCard)
                        .cornerRadius(BorderRadius.pill)
                        .cardShadow()
                        .offset(x: -120, y: -130)

                        // Pool Badge (Bottom-right)
                        HStack(spacing: Spacing.space2) {
                            Image(systemName: "trophy.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(accentColor)

                            Text("$120 pool")
                                .font(.labelSmallText)
                                .foregroundStyle(Color.textInverse)
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 14)
                        .background(Color.textStrong)
                        .cornerRadius(BorderRadius.pill)
                        .cardShadow()
                        .offset(x: 120, y: 116)
                    }
                    .frame(width: 250, height: 250)

                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, Spacing.space10)

                // Headline and Description
                VStack(spacing: Spacing.space3) {
                    Text("Turn your steps into stakes")
                        .font(.heroText)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.textStrong)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(-2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Challenge your friends, pool a little cash, and let your daily walk decide who takes it all.")
                        .font(.bodyLargeText)
                        .foregroundStyle(Color.textBody)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, Spacing.space6)
                .padding(.bottom, Spacing.space4)

                // Error Message
                if let error = authManager.errorMessage {
                    HStack(spacing: Spacing.space3) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundStyle(Color.danger)
                        Text(error)
                            .font(.bodySmallText)
                            .foregroundStyle(Color.danger)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, Spacing.space3)
                    .padding(.horizontal, Spacing.space4)
                    .background(Color.surfaceRaised)
                    .cornerRadius(BorderRadius.small)
                    .padding(.horizontal, Spacing.space6)
                    .padding(.bottom, Spacing.space4)
                }

                // CTA Section
                VStack(spacing: Spacing.space4) {
                    Button(action: {
                        authManager.signInWithApple()
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 20, weight: .semibold))
                            Text("Sign in with Apple")
                                .font(.labelText)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: MeasurementTokens.controlHeight)
                        .foregroundStyle(.white)
                        .background(Color.textStrong)
                        .cornerRadius(BorderRadius.small)
                        .overlay(RoundedRectangle(cornerRadius: BorderRadius.small).stroke(Color.textStrong, lineWidth: 2))
                    }

                    TermsAndConditions(
                        termsURL: URL(string: "https://example.com/terms")!,
                        privacyURL: URL(string: "https://example.com/privacy")!
                    )
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, Spacing.space6)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}
#Preview {
    WelcomeView(authManager: AuthenticationManager())
}
