//
//  SuccessView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 9/5/26.
//

import SwiftUI

struct SuccessView: View {
    let fullName: String?
    let email: String?

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

                // Success Section
                VStack(spacing: 0) {
                    Spacer()

                    ZStack {
                        // Success Circle
                        Circle()
                            .fill(Color.success)
                            .frame(width: 206, height: 206)
                            .cardShadow()

                        // Success Icon
                        Image(systemName: "checkmark")
                            .font(.system(size: 98, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 250, height: 250)

                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, Spacing.space10)

                // Headline and Description
                VStack(spacing: Spacing.space3) {
                    Text("You're all set!")
                        .font(.heroText)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.textStrong)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(-2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Welcome to Stept, \(fullName ?? "Friend")")
                        .font(.bodyLargeText)
                        .foregroundStyle(Color.textBody)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, Spacing.space6)
                .padding(.bottom, Spacing.space6)

                // User Info Section
                VStack(spacing: Spacing.space4) {
                    UserInfoCard(label: "Name", value: fullName ?? "—")
                    UserInfoCard(label: "Email", value: email ?? "—")
                }
                .padding(.horizontal, Spacing.space6)
                .padding(.bottom, Spacing.space10)
            }
        }
    }
}

struct UserInfoCard: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.space2) {
            Text(label)
                .font(.captionText)
                .foregroundStyle(Color.textMuted)
                .textCase(.uppercase)

            Text(value)
                .font(.bodyText)
                .foregroundStyle(Color.textStrong)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, Spacing.space4)
        .padding(.horizontal, Spacing.space4)
        .background(Color.surfaceRaised)
        .cornerRadius(BorderRadius.small)
    }
}

#Preview {
    SuccessView(fullName: "Karthik Ragubathy", email: "karthik@example.com")
}
