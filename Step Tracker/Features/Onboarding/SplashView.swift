//
//  SplashView.swift
//  Step Tracker
//
//  Created by Karthik Ragubathy on 9/5/26.
//

import SwiftUI

struct SplashView: View {
    @State private var animationProgress: CGFloat = 0
    @State private var showContent = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    LogoView(size: logoSize, progress: animationProgress)
                        .frame(width: logoSize, height: logoSize)
                        .offset(y: logoVerticalOffset)

                    Spacer()
                }
                .frame(height: 56)
                .padding(.horizontal, 20)
                .background(Color.white)

                if showContent {
                    OnboardingView()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    Spacer()

                    VStack(spacing: 24) {
                        Text("Turn your steps into stakes")
                            .font(.custom("YoungSerif-Regular", size: 34))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.textStrong)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)

                        Text("Walk more, earn more. Challenge friends and compete for real rewards.")
                            .font(.custom("Figtree-Regular", size: 15))
                            .foregroundStyle(Color.textBody)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 24)
                    .opacity(animationProgress < 0.5 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4).delay(0.2), value: animationProgress)

                    Spacer()
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                animationProgress = 1
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showContent = true
                }
            }
        }
    }

    private var logoSize: CGFloat {
        let maxSize: CGFloat = 64
        let minSize: CGFloat = 32
        return maxSize - (animationProgress * (maxSize - minSize))
    }

    private var logoVerticalOffset: CGFloat {
        let startOffset: CGFloat = -80
        let endOffset: CGFloat = -14
        return startOffset + (animationProgress * (endOffset - startOffset))
    }
}

struct LogoView: View {
    let size: CGFloat
    let progress: CGFloat

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "figure.walk")
                .font(.system(size: size * 0.5, weight: .bold))
                .foregroundStyle(Color.sky)

            Text("Stept")
                .font(.custom("YoungSerif-Regular", size: size * 0.75))
                .fontWeight(.bold)
                .foregroundStyle(Color.textStrong)
        }
    }
}

#Preview {
    SplashView()
}
