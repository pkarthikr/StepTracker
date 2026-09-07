//
//  OnboardingView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 7/8/26.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var authManager = AuthenticationManager()

    var body: some View {
        if authManager.isAuthenticated {
            SuccessView(fullName: authManager.userFullName, email: authManager.userEmail)
        } else {
            WelcomeView(authManager: authManager)
        }
    }
}

#Preview {
    OnboardingView()
}
