//
//  ContentView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 7/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var onboardingState: OnboardingState = .welcome
    @StateObject private var authManager = AuthenticationManager()

    var body: some View {
        switch onboardingState {
        case .welcome:
            WelcomeView(authManager: authManager, onboardingState: $onboardingState)
        case .profile:
            ProfileSetupView(onboardingState: $onboardingState)
        case .permissions:
            HealthPermissionsView()
        }
    }
}

#Preview {
    ContentView()
}
