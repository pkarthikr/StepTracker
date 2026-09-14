import SwiftUI

struct ProfileSetupView: View {
    @State private var selectedEmoji = "🦊"
    @State private var displayName = "Jordan Blake"
    @Binding var onboardingState: OnboardingState

    let avatarOptions = ["🦊", "🐧", "🦕", "🐝", "🦁", "🐙", "🦄", "🐸", "🦖", "🐼", "🦉", "🐍"]

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.space4) {
                    // Header
                    VStack(alignment: .leading, spacing: Spacing.space2) {
                        Text("Set up your profile")
                            .font(.displayText)
                            .foregroundStyle(Color.textStrong)

                        Text("Pick an emoji and a name — this is how your crew will spot you on the leaderboard.")
                            .font(.bodyText)
                            .foregroundStyle(Color.textBody)
                            .lineLimit(nil)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Avatar Display
                    VStack(spacing: 0) {
                        Circle()
                            .fill(Color.sky)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Text(selectedEmoji)
                                    .font(.system(size: 50))
                            )
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, Spacing.space4)

                    // Choose Avatar Section
                    VStack(alignment: .leading, spacing: Spacing.space3) {
                        Text("Choose your avatar")
                            .font(.bodyLargeText)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.textStrong)

                        // Emoji Grid (6 columns, 2 rows)
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: Spacing.space2) {
                            ForEach(avatarOptions, id: \.self) { emoji in
                                Button(action: {
                                    selectedEmoji = emoji
                                }) {
                                    Text(emoji)
                                        .font(.system(size: 28))
                                        .frame(height: 56)
                                        .frame(maxWidth: .infinity)
                                        .background(selectedEmoji == emoji ? Color.textStrong : Color.surfaceSunken)
                                        .cornerRadius(BorderRadius.medium)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Display Name Section
                    VStack(alignment: .leading, spacing: Spacing.space3) {
                        Text("Display name")
                            .font(.bodyLargeText)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.textStrong)

                        TextField("Jordan Blake", text: $displayName)
                            .font(.bodyText)
                            .foregroundStyle(Color.textBody)
                            .padding(.horizontal, Spacing.space4)
                            .frame(height: MeasurementTokens.controlHeight)
                            .background(Color.surfaceCard)
                            .cornerRadius(BorderRadius.medium)
                            .overlay(
                                RoundedRectangle(cornerRadius: BorderRadius.medium)
                                    .stroke(Color.surfaceSunken, lineWidth: 1)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                        .frame(height: Spacing.space6)
                }
                .padding(.horizontal, MeasurementTokens.screenMargin)
                .padding(.vertical, Spacing.space5)
            }

            // Continue Button (Floating)
            VStack(spacing: 0) {
                Spacer()

                Button(action: {
                    onboardingState = .permissions
                }) {
                    Text("Continue")
                        .font(.labelText)
                        .foregroundStyle(Color.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: MeasurementTokens.controlHeight)
                        .background(Color.textStrong)
                        .cornerRadius(BorderRadius.pill)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    @State var state: OnboardingState = .profile
    return ProfileSetupView(onboardingState: $state)
}
