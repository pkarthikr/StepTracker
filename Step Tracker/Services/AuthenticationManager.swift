//
//  AuthenticationManager.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 9/5/26.
//

import AuthenticationServices
import SwiftUI
import Combine

#if canImport(UIKit)
import UIKit
#endif

@MainActor
class AuthenticationManager: NSObject, ObservableObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @Published var userFullName: String?
    @Published var userEmail: String?
    @Published var isAuthenticated = false
    @Published var errorMessage: String?

    override init() {
        super.init()
        checkAuthenticationState()
    }

    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            errorMessage = "Failed to retrieve credentials"
            return
        }

        let givenName = appleIDCredential.fullName?.givenName ?? ""
        let familyName = appleIDCredential.fullName?.familyName ?? ""
        let fullName = "\(givenName) \(familyName)".trimmingCharacters(in: .whitespaces)
        let email = appleIDCredential.email ?? ""

        userFullName = fullName.isEmpty ? "Apple User" : fullName
        userEmail = email

        persistAuthentication(fullName: userFullName ?? "", email: userEmail ?? "")
        isAuthenticated = true
        errorMessage = nil
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let error = error as? ASAuthorizationError, error.code != .canceled {
            errorMessage = "Sign in failed. Please try again."
        } else {
            errorMessage = nil
        }
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        #if canImport(UIKit)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            fatalError("Unable to find presentation anchor")
        }
        return window
        #else
        fatalError("Unable to find presentation anchor")
        #endif
    }

    private func persistAuthentication(fullName: String, email: String) {
        UserDefaults.standard.set(true, forKey: "isAuthenticated")
        UserDefaults.standard.set(fullName, forKey: "userFullName")
        UserDefaults.standard.set(email, forKey: "userEmail")
    }

    private func checkAuthenticationState() {
        let isAuthenticatedStored = UserDefaults.standard.bool(forKey: "isAuthenticated")
        if isAuthenticatedStored {
            userFullName = UserDefaults.standard.string(forKey: "userFullName")
            userEmail = UserDefaults.standard.string(forKey: "userEmail")
            isAuthenticated = true
        }
    }

    func signOut() {
        UserDefaults.standard.removeObject(forKey: "isAuthenticated")
        UserDefaults.standard.removeObject(forKey: "userFullName")
        UserDefaults.standard.removeObject(forKey: "userEmail")
        userFullName = nil
        userEmail = nil
        isAuthenticated = false
        errorMessage = nil
    }
}
