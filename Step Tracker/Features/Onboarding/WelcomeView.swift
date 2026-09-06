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

// MARK: - Leaderboard Card Component
struct LeaderboardCard: View {
    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: Spacing.space3) {
                Text("1st").font(.labelSmallText).fontWeight(.bold).foregroundStyle(Color.textStrong).frame(width: 26, alignment: .leading)
                Circle().fill(Color.surfaceSunken).frame(width: 38, height: 38).overlay(Text("🦁").font(.system(size: 20)))
                Text("Sam").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong).frame(maxWidth: .infinity, alignment: .leading)
                Text("14,902").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(Color.clear)
            .cornerRadius(BorderRadius.medium)

            HStack(spacing: Spacing.space3) {
                Text("2nd").font(.labelSmallText).fontWeight(.bold).foregroundStyle(Color.textMuted).frame(width: 26, alignment: .leading)
                Circle().fill(Color.surfaceSunken).frame(width: 38, height: 38).overlay(Text("🦊").font(.system(size: 20)))
                Text("You").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong).frame(maxWidth: .infinity, alignment: .leading)
                Text("12,438").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(Color.surfaceSunken)
            .cornerRadius(BorderRadius.medium)

            HStack(spacing: Spacing.space3) {
                Text("3rd").font(.labelSmallText).fontWeight(.bold).foregroundStyle(Color.textMuted).frame(width: 26, alignment: .leading)
                Circle().fill(Color.surfaceSunken).frame(width: 38, height: 38).overlay(Text("🐧").font(.system(size: 20)))
                Text("Mia").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong).frame(maxWidth: .infinity, alignment: .leading)
                Text("9,120").font(.bodyText).fontWeight(.bold).foregroundStyle(Color.textStrong)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(Color.clear)
            .cornerRadius(BorderRadius.medium)

            Divider().padding(.vertical, 6)

            HStack(spacing: 6) {
                Image(systemName: "clock.badge.xmark.fill").font(.system(size: 14, weight: .semibold)).foregroundStyle(Color.textMuted)
                Text("4 days left · $40 pool").font(.captionText).foregroundStyle(Color.textMuted)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 6)
        }
        .padding(8)
        .background(Color.surfaceCard)
        .cornerRadius(BorderRadius.medium)
        .cardShadow()
    }
}

// MARK: - Step Count Display Component
struct StepCountDisplay: View {
    var body: some View {
        VStack(spacing: 14) {
            VStack(spacing: 0) {
                Text("Steps today").font(.overlineText).foregroundStyle(Color.textMuted).frame(maxWidth: .infinity, alignment: .leading)
                Text("12,438").font(.system(size: 76, weight: .semibold, design: .default)).tracking(-0.01).foregroundStyle(Color.textStrong).frame(maxWidth: .infinity, alignment: .leading).lineLimit(1)
            }

            HStack(spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.up.right.fill").font(.system(size: 16, weight: .semibold)).foregroundStyle(Color.success)
                    Text("+2,180 on yesterday").font(.labelSmallText).fontWeight(.bold).foregroundStyle(Color.textStrong)
                }
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color.surfaceSunken)
                .cornerRadius(BorderRadius.pill)

                HStack(spacing: 6) {
                    Image(systemName: "heart.fill").font(.system(size: 16, weight: .semibold)).foregroundStyle(.red)
                    Text("Apple Health").font(.labelSmallText).fontWeight(.bold).foregroundStyle(Color.textInverse)
                }
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color.textStrong)
                .cornerRadius(BorderRadius.pill)

                Spacer()
            }
        }
        .padding(16)
        .background(Color.surfaceCard)
        .cornerRadius(BorderRadius.medium)
        .cardShadow()
    }
}

// MARK: - Pool Card Component
struct PoolCard: View {
    let accentColor: Color = .sky

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Pool").font(.overlineText).foregroundStyle(Color.textMuted)
                    Text("$40").font(.system(size: 46, weight: .semibold, design: .default)).tracking(-0.01).foregroundStyle(Color.textStrong).lineLimit(1)
                }

                Spacer()

                Circle().fill(accentColor).frame(width: 56, height: 56).overlay(
                    Image(systemName: "trophy.fill").font(.system(size: 28, weight: .semibold)).foregroundStyle(.white)
                )
            }

            Divider()

            HStack {
                Text("Winner takes 90%").font(.bodyText).foregroundStyle(Color.textBody)
                Spacer()
                Text("$36").font(.titleText).fontWeight(.bold).foregroundStyle(Color.textStrong)
            }

            HStack(spacing: 10) {
                HStack(spacing: -8) {
                    ForEach(["🦊", "🦁", "🐧", "🐝"], id: \.self) { emoji in
                        Circle().fill(Color.surfaceSunken).frame(width: 30, height: 30).overlay(Circle().stroke(Color.surfaceCard, lineWidth: 2)).overlay(Text(emoji).font(.system(size: 15)))
                    }
                }
                Spacer()
                Text("4 players in · settles Sunday").font(.captionText).foregroundStyle(Color.textMuted)
            }
        }
        .padding(20)
        .background(Color.surfaceCard)
        .cornerRadius(BorderRadius.medium)
        .cardShadow()
    }
}

// MARK: - Welcome View
struct WelcomeView: View {
    @State private var currentPage: Int = 0
    @ObservedObject var authManager: AuthenticationManager

    let accentColor: Color = .sky

    var body: some View {
        ZStack {
            Color.surfaceCard.ignoresSafeArea()

            VStack(spacing: 0) {
                // Logo
                Text("Stept")
                    .font(.titleText)
                    .foregroundStyle(Color.textStrong)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Spacing.space4)
                    .padding(.horizontal, Spacing.space6)
                    .padding(.bottom, Spacing.space3)

                // Pages Container
                ZStack {
                    TabView(selection: $currentPage) {
                        // Page 0 - Launch
                        VStack(spacing: Spacing.space6) {
                            Spacer().frame(height: Spacing.space3)
                            LeaderboardCard().padding(.horizontal, Spacing.space6)
                            Spacer()
                            VStack(spacing: Spacing.space4) {
                                Text("Race your friends").font(.heroText).fontWeight(.bold).foregroundStyle(Color.textStrong)
                                Text("Set up a challenge with your crew and watch the leaderboard shuffle every time someone moves.").font(.bodyLargeText).foregroundStyle(Color.textBody).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Spacing.space6)
                        }
                        .tag(0)

                        // Page 1a - Race your friends
                        VStack(spacing: Spacing.space6) {
                            Spacer().frame(height: Spacing.space3)
                            LeaderboardCard().padding(.horizontal, Spacing.space6)
                            Spacer()
                            VStack(spacing: Spacing.space4) {
                                Text("Race your friends").font(.heroText).fontWeight(.bold).foregroundStyle(Color.textStrong)
                                Text("Set up a challenge with your crew and watch the leaderboard shuffle every time someone moves.").font(.bodyLargeText).foregroundStyle(Color.textBody).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Spacing.space6)
                        }
                        .tag(1)

                        // Page 1b - Steps that count
                        VStack(spacing: Spacing.space6) {
                            Spacer().frame(height: Spacing.space3)
                            StepCountDisplay().padding(.horizontal, Spacing.space6)
                            Spacer()
                            VStack(spacing: Spacing.space4) {
                                Text("Steps that count").font(.heroText).fontWeight(.bold).foregroundStyle(Color.textStrong)
                                Text("Stept reads your daily step count straight from Apple Health. Nothing to log, nothing to fake.").font(.bodyLargeText).foregroundStyle(Color.textBody).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Spacing.space6)
                        }
                        .tag(2)

                        // Page 1c - Winner takes the pot
                        VStack(spacing: Spacing.space6) {
                            Spacer().frame(height: Spacing.space3)
                            PoolCard().padding(.horizontal, Spacing.space6)
                            Spacer()
                            VStack(spacing: Spacing.space4) {
                                Text("Winner takes the pot").font(.heroText).fontWeight(.bold).foregroundStyle(Color.textStrong)
                                Text("Highest total when the clock runs out wins 90% of the pool. The rest is bragging rights.").font(.bodyLargeText).foregroundStyle(Color.textBody).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Spacing.space6)
                        }
                        .tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                }
                .frame(maxHeight: .infinity)

                // Error Message
                if let error = authManager.errorMessage {
                    HStack(spacing: Spacing.space3) {
                        Image(systemName: "exclamationmark.circle.fill").foregroundStyle(Color.danger)
                        Text(error).font(.bodySmallText).foregroundStyle(Color.danger)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, Spacing.space3)
                    .padding(.horizontal, Spacing.space4)
                    .background(Color.surfaceRaised)
                    .cornerRadius(BorderRadius.small)
                    .padding(.horizontal, Spacing.space6)
                    .padding(.bottom, Spacing.space4)
                }

                // Page indicator dots
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.sky : Color.textFaint)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, Spacing.space4)

                // CTA Section
                VStack(spacing: Spacing.space4) {
                    Button(action: { authManager.signInWithApple() }) {
                        HStack(spacing: 12) {
                            Image(systemName: "apple.logo").font(.system(size: 20, weight: .semibold))
                            Text("Sign in with Apple").font(.labelText)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: MeasurementTokens.controlHeight)
                        .foregroundStyle(.white)
                        .background(Color.textStrong)
                        .cornerRadius(BorderRadius.small)
                        .overlay(RoundedRectangle(cornerRadius: BorderRadius.small).stroke(Color.textStrong, lineWidth: 2))
                    }

                    TermsAndConditions(termsURL: URL(string: "https://example.com/terms")!, privacyURL: URL(string: "https://example.com/privacy")!)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, Spacing.space6)
                .padding(.vertical, Spacing.space4)
            }
        }
    }
}

#Preview {
    WelcomeView(authManager: AuthenticationManager())
}
