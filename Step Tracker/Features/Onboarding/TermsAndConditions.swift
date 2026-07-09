//
//  TermsAndConditions.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 7/8/26.
//

import SwiftUI

struct TermsAndConditions: View {
    let termsURL: URL
    let privacyURL: URL
    
    var body: some View {
        Text(attributedString)
            .font(.footnote)
            .foregroundStyle(.secondary)
            .tint(.blue)
            .multilineTextAlignment(.center)
    }
    
    private var attributedString: AttributedString {
        let markdown = "By continuing, you agree to our [Terms](\(termsURL.absoluteString)) and [Privacy Policy](\(privacyURL.absoluteString))."
        return (try? AttributedString(markdown: markdown)) ?? AttributedString(markdown.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: ""))
        
    }
}

#Preview {
    TermsAndConditions(
        termsURL: URL(string: "https://example.com")!,
        privacyURL: URL(string: "https://example.com")!
    )
}
