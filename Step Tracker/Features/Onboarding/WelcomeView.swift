//
//  WelcomeView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 8/30/26.
//

import SwiftUI
import UIKit

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

    let accentColor: Color = .sky

    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header - at the top
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 28, height: 28)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [accentColor, accentColor.opacity(0.7)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(8)

                        Text("Stept")
                            .font(.custom("YoungSerif-Regular", size: 22))
                            .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                    }

                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 40)

                // Hero Section
                VStack(spacing: 32) {
                    // Animated Circle with Icon and Badges
                    ZStack(alignment: .center) {
                        // Main Circle
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        accentColor,
                                        accentColor.opacity(0.8)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 240, height: 240)
                            .shadow(color: Color.black.opacity(0.08), radius: 20, x: 0, y: 20)

                        // Hero Icon with pulse animation
                        Image(systemName: "figure.walk")
                            .font(.system(size: 120, weight: .semibold))
                            .foregroundStyle(.white)
                            .opacity(isAnimating ? 0.7 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: 2)
                                    .repeatForever(autoreverses: true),
                                value: isAnimating
                            )

                        // Step Badge (Top Left)
                        VStack(spacing: 0) {
                            HStack(spacing: 8) {
                                Image(systemName: "figure.walk")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(Color(red: 0.122, green: 0.616, blue: 0.416))

                                Text("12,438")
                                    .font(.custom("Figtree-Bold", size: 13))
                                    .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(Color(.white))
                            .cornerRadius(999)
                            .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
                        }
                        .offset(x: -128, y: -130)
                        .offset(y: isAnimating ? -8 : 0)
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true)
                                .delay(0),
                            value: isAnimating
                        )

                        // Pool Badge (Bottom Right)
                        VStack(spacing: 0) {
                            HStack(spacing: 8) {
                                Image(systemName: "trophy.fill")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(accentColor)

                                Text("$120 pool")
                                    .font(.custom("Figtree-Bold", size: 13))
                                    .foregroundStyle(Color(red: 0.992, green: 0.980, blue: 0.964))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(Color(red: 0.086, green: 0.075, blue: 0.055))
                            .cornerRadius(999)
                            .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
                        }
                        .offset(x: 128, y: 116)
                        .offset(y: isAnimating ? 8 : 0)
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true)
                                .delay(0),
                            value: isAnimating
                        )
                    }
                    .frame(height: 280)

                    // Headline and Description
                    VStack(spacing: 12) {
                        Text("Turn your steps into stakes")
                            .font(.custom("YoungSerif-Regular", size: 34))
                            .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                            .lineLimit(3)

                        Text("Walk more, earn more. Challenge friends and compete for real rewards.")
                            .font(.custom("Figtree-Regular", size: 15))
                            .foregroundStyle(Color(red: 0.420, green: 0.388, blue: 0.329))
                            .lineLimit(3)
                    }
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 280)
                }
                .frame(maxHeight: .infinity)

                // CTA Section
                VStack(spacing: 12) {
                    Button(action: {}) {
                        HStack(spacing: 12) {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 20, weight: .semibold))
                            Text("Sign in with Apple")
                                .font(.custom("Figtree-Bold", size: 15))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .foregroundStyle(.white)
                        .background(Color(red: 0.086, green: 0.075, blue: 0.055))
                        .cornerRadius(12)
                    }

                    TermsAndConditions(
                        termsURL: URL(string: "https://example.com/terms")!,
                        privacyURL: URL(string: "https://example.com/privacy")!
                    )
                    .padding(.top, 8)
                }
                .padding(.horizontal, 24)
            }
            .padding(.bottom, 32)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - Color Extension for Accent Colors
extension Color {
    static let sky = Color(red: 0.239, green: 0.561, blue: 0.816)
    static let leaf = Color(red: 0.122, green: 0.616, blue: 0.416)
    static let berry = Color(red: 0.424, green: 0.290, blue: 0.714)
    static let tomato = Color(red: 0.910, green: 0.333, blue: 0.247)
    static let yolk = Color(red: 1.0, green: 0.761, blue: 0.200)
}

#Preview {
    WelcomeView()
}
