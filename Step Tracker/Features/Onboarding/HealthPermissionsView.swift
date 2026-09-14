import SwiftUI

struct HealthPermissionsView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Skip for now")
                            .font(.custom("Figtree-Regular", size: 15))
                            .foregroundStyle(Color(red: 0.420, green: 0.388, blue: 0.329))
                    }
                    .padding(.trailing, 24)
                    .padding(.top, 12)
                }

                Spacer()
                    .frame(height: 60)

                VStack(spacing: 32) {
                    VStack(spacing: 20) {
                        Image(systemName: "heart.pulse.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(Color(red: 0.910, green: 0.333, blue: 0.247))
                            .frame(width: 100, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color(red: 1.0, green: 0.878, blue: 0.835))
                            )

                        VStack(spacing: 20) {
                            Text("Connect your steps")
                                .font(.custom("YoungSerif-Regular", size: 34))
                                .fontWeight(.bold)
                                .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))

                            Text("Step reads your step count from Apple Health so your progress updates on its own. Nothing else, ever.")
                                .font(.custom("Figtree-Regular", size: 15))
                                .foregroundStyle(Color(red: 0.231, green: 0.212, blue: 0.173))
                                .lineSpacing(1.2)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                    VStack(spacing: 12) {
                        HealthPermissionRow(
                            icon: "footprints.fill",
                            title: "Steps",
                            isEnabled: true
                        )

                        HealthPermissionRow(
                            icon: "figure.walk",
                            title: "Walking + running distance",
                            isEnabled: true
                        )
                    }
                    .padding(.horizontal, 24)
                }

                Spacer()

                VStack(spacing: 0) {
                    Button(action: {}) {
                        HStack(spacing: 12) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 18))
                            Text("Connect Apple Health")
                                .font(.custom("Figtree-Bold", size: 17))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(red: 0.086, green: 0.075, blue: 0.055))
                        .clipShape(Capsule())
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

struct HealthPermissionRow: View {
    let icon: String
    let title: String
    let isEnabled: Bool

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(Color(red: 0.122, green: 0.616, blue: 0.416))
                .frame(width: 32)

            Text(title)
                .font(.custom("Figtree-Bold", size: 17))
                .foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))

            Spacer()

            if isEnabled {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .foregroundStyle(Color(red: 0.122, green: 0.616, blue: 0.416))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Color(red: 0.963, green: 0.945, blue: 0.906))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HealthPermissionsView()
}
