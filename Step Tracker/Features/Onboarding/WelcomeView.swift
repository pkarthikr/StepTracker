//
//  WelcomeView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 8/30/26.
//

import SwiftUI

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
                // Logo - close to safe area
                Text("Stept")
                    .font(.custom("YoungSerif-Regular", size: 22))
                    .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)

                // Hero Section - Centered with flex
                VStack(spacing: 0) {
                    Spacer()

                    ZStack {
                        // Main Circle
                        Circle()
                            .fill(accentColor)
                            .frame(width: 206, height: 206)
                            .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)

                        // Hero Icon - Sneaker with pulse animation
                        Image(systemName: "figure.walk")
                            .font(.system(size: 98, weight: .semibold))
                            .foregroundStyle(.white)
                            .opacity(isAnimating ? 0.7 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: 2)
                                    .repeatForever(autoreverses: true),
                                value: isAnimating
                            )

                        // Step Badge (Top-left)
                        HStack(spacing: 8) {
                            Image(systemName: "figure.walk")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color(red: 0.122, green: 0.616, blue: 0.416))

                            Text("12,438")
                                .font(.custom("Figtree-Bold", size: 13))
                                .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 14)
                        .background(Color(.white))
                        .cornerRadius(999)
                        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
                        .offset(x: -120, y: -130)

                        // Pool Badge (Bottom-right)
                        HStack(spacing: 8) {
                            Image(systemName: "trophy.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(accentColor)

                            Text("$120 pool")
                                .font(.custom("Figtree-Bold", size: 13))
                                .foregroundStyle(Color(red: 0.992, green: 0.980, blue: 0.964))
                        }
                        .padding(.vertical, 9)
                        .padding(.horizontal, 14)
                        .background(Color(red: 0.086, green: 0.075, blue: 0.055))
                        .cornerRadius(999)
                        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
                        .offset(x: 120, y: 116)
                    }
                    .frame(width: 250, height: 250)

                    Spacer()
                }
                .frame(maxHeight: .infinity)

                // Headline and Description
                VStack(spacing: 14) {
                    Text("Turn your steps into stakes")
                        .font(.custom("YoungSerif-Regular", size: 34))
                        .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Challenge your friends, pool a little cash, and let your daily walk decide who takes it all.")
                        .font(.custom("Figtree-Regular", size: 17))
                        .foregroundStyle(Color(red: 0.231, green: 0.212, blue: 0.173))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)

                // CTA Section
                VStack(spacing: 16) {
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
                        .cornerRadius(10)
                    }

                    TermsAndConditions(
                        termsURL: URL(string: "https://example.com/terms")!,
                        privacyURL: URL(string: "https://example.com/privacy")!
                    )
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
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
