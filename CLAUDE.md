# Step Tracker iOS App - Agent Guide

## Project Overview

**Step Tracker** is an iOS step-counting app with gamification elements. Users track their daily steps, compete with friends, and earn real money from a shared prize pool based on their activity.

- **Primary Focus**: Design-first development (visual design only for now, functionality later)
- **Target Platform**: iOS 17.0+
- **Language**: Swift, SwiftUI
- **Design System**: Yolk Design System (custom color palette, typography, spacing)
- **Current Phase**: Welcome Screen Design Implementation ✅

## Project Structure

```
Step Tracker/
├── Features/
│   └── Onboarding/
│       ├── WelcomeView.swift          # Main welcome screen
│       ├── OnboardingView.swift       # Onboarding container
│       ├── TermsAndConditions.swift   # T&C component
│       └── Components/                # (Future: reusable components)
├── DesignSystem/                      # (Future: centralized design tokens)
├── Step_TrackerApp.swift              # App entry point
├── ContentView.swift                  # Root view (currently shows OnboardingView)
├── Assets.xcassets                    # App icons, images
├── Figtree-Regular.ttf                # Body font (Google Fonts)
├── Figtree-Bold.ttf                   # Bold variant (Google Fonts)
└── YoungSerif-Regular.ttf             # Display/headline font (Google Fonts)
```

## Design System: Yolk

The Yolk Design System is a comprehensive design language with warm, generous spacing and a distinctive color palette.

### Color Palette

#### Primary Colors (Semantic)
- **Accent Colors** (interchangeable themes):
  - **Sky**: `#3D8FD1` (primary blue) - Default
  - **Leaf**: `#1F9D6A` (green)
  - **Berry**: `#6C4AB6` (purple)
  - **Tomato**: `#E8563F` (red)
  - **Yolk**: `#FFC233` (yellow)

#### Neutral Colors
- **Cream** (light neutrals):
  - Cream-50: `#FDFBF6`
  - Cream-100: `#F6F1E7` (app background)
  - Cream-200: `#EFE7D8`
  - Cream-300: `#E3D8C3`

- **Ink** (dark neutrals):
  - Ink-900: `#16130E` (text-strong, buttons)
  - Ink-700: `#3B362C` (text-body)
  - Ink-500: `#6B6353` (text-muted)
  - Ink-300: `#9C937F` (text-faint)

#### Semantic Colors
- **Text Colors**:
  - `--text-strong`: `#16130E` (ink-900)
  - `--text-body`: `#3B362C` (ink-700)
  - `--text-muted`: `#6B6353` (ink-500)
  - `--text-faint`: `#9C937F` (ink-300)
  - `--text-inverse`: `#FDFBF6` (cream-50)

- **Surface Colors**:
  - `--surface-card`: `#FFFFFF`
  - `--surface-raised`: `#FDFBF6`
  - `--surface-sunken`: `#EFE7D8`
  - `--surface-inverse`: `#16130E`

- **Status Colors**:
  - Success (Leaf): `#1F9D6A`
  - Warning (Yolk): `#FFC233`
  - Danger (Tomato): `#E8563F`
  - Info (Sky): `#3D8FD1`

### Typography

#### Font Families
- **Display Font**: Young Serif (serif, bold headlines)
- **Body Font**: Figtree (geometric sans-serif, all body text)

#### Type Scale (Mobile-first)
- **Hero** (34px, Young Serif, bold): Onboarding heroes, main headlines
- **Display** (28px, Young Serif, bold): Screen titles
- **Title** (22px, Young Serif, bold): Section titles, logo name
- **Heading** (18px, Young Serif, bold): Card headings
- **Body-lg** (17px, Figtree, medium): Large body text
- **Body** (15px, Figtree, medium): Standard body text, descriptions
- **Body-sm** (13px, Figtree, medium): Smaller body text
- **Label** (15px, Figtree, bold): Buttons, tabs
- **Label-sm** (13px, Figtree, bold): Small labels, badges
- **Caption** (12px, Figtree, semibold): Legal text, fine print
- **Overline** (11px, Figtree, bold, uppercase, 0.08em spacing): Section labels

### Spacing System

4px base grid. All spacing values are multiples of 4px:

```
--space-1: 4px
--space-2: 8px
--space-3: 12px
--space-4: 16px
--space-5: 20px
--space-6: 24px
--space-8: 32px
--space-10: 40px
--space-12: 48px
--space-16: 64px
```

#### Common Measurements
- **Screen margin**: 20px (horizontal padding)
- **Hit target**: 44px (minimum tap size)
- **Control height**: 52px (buttons, inputs)
- **Control height (small)**: 40px

#### Border Radius
- **Small**: 10px
- **Medium**: 16px
- **Large**: 24px
- **Extra-large**: 32px
- **Pill**: 999px (fully rounded)

### Shadows (Elevation)
- **Card shadow**: `0 4px 10px rgba(0,0,0,0.06)`
- **Raised shadow**: `0 10px 20px rgba(0,0,0,0.08)`
- **Overlay shadow**: `0 20px 40px rgba(0,0,0,0.12)`

### Motion & Animation
- **Standard duration**: 300-400ms easeInOut
- **Subtle animations**: 200ms, low movement (4-8px)
- **Attention animations**: 2-3s, infinite repeat

## Font Management

### Setup (Critical)
Fonts are **programmatically registered** at app launch in `Step_TrackerApp.init()`:

```swift
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
```

**Why programmatic?** Info.plist approach conflicts with Xcode's auto-generated Info.plist. Programmatic registration is reliable and runs once at startup (negligible performance cost).

### Font Usage in Code
- PostScript name for Young Serif: `"YoungSerif-Regular"`
- PostScript name for Figtree Regular: `"Figtree-Regular"`
- PostScript name for Figtree Bold: `"Figtree-Bold"`

Usage:
```swift
.font(.custom("YoungSerif-Regular", size: 34))        // Display
.font(.custom("Figtree-Bold", size: 15))              // Bold labels
.font(.custom("Figtree-Regular", size: 15))           // Body text
```

## Current Implementation Status

### ✅ Completed

#### Welcome Screen (`WelcomeView.swift`)
- **Logo**: App name "Stept" with icon, positioned at top (16pt padding)
- **Hero Section**:
  - Animated circular gradient background (accent color)
  - Centered sneaker icon with pulse animation (opacity: 0.7-1.0, 2s cycle)
  - Two floating badges with opposing animations:
    - **Step Badge** (top-left): Shows "12,438 steps", floats UP
    - **Pool Badge** (bottom-right): Shows "$120 pool", floats DOWN
  - Badges positioned to not overlap the center icon
  - Badge animation: 3s easeInOut, infinite repeat, opposite directions

- **Messaging**:
  - Headline: "Turn your steps into stakes" (Young Serif, 34px, bold)
  - Description: "Walk more, earn more. Challenge friends and compete for real rewards." (Figtree, 15px)

- **Call-to-Action**:
  - "Sign in with Apple" button (52px height, ink-900 background, white text)
  - Apple logo icon + text with Figtree-Bold

- **Legal**:
  - Terms and Conditions component with markdown links
  - Styled in Figtree-Bold, 12px, text-muted color
  - Links styled in Sky blue

#### Supporting Components
- `OnboardingView.swift`: Container that displays WelcomeView
- `TermsAndConditions.swift`: Reusable T&C component with markdown link support
- `ContentView.swift`: Root view pointing to OnboardingView

#### App Setup
- Fonts registered in `Step_TrackerApp.init()`
- App launches directly to onboarding flow

### 🔄 In Progress
- None (design phase for Welcome screen is complete)

### 📋 Future Implementations
- Sign Up Flow (email/phone signup)
- Dashboard (main app screen showing stats, leaderboard)
- Settings
- Profile
- Leaderboard
- Challenge flow
- More onboarding screens (tutorial, permissions, etc.)

## Design Specifications: Welcome Screen

### Layout
```
┌─────────────────────────────────────┐
│  [Icon] Stept                       │ ← 16pt top, 24pt horizontal padding
├─────────────────────────────────────┤
│                                     │
│         [Step Badge]                │ ← Top-left, offset(-128, -130)
│             ↑                       │
│         [Big Circle]                │ ← 240x240px gradient, centered
│         [Icon inside]               │
│             ↓                       │
│         [Pool Badge]                │ ← Bottom-right, offset(128, 116)
│                                     │
│    "Turn your steps into stakes"    │ ← Hero text, centered
│    "Walk more, earn more..."        │ ← Subtitle
│                                     │
├─────────────────────────────────────┤
│  [Sign in with Apple Button]        │ ← 52px height, full width
│  "By signing in, you agree to..."   │ ← Legal text, 12px
└─────────────────────────────────────┘
```

### Colors
- Background: White (`#FFFFFF`)
- Hero circle: Accent color (default Sky: `#3D8FD1`)
- Icon in circle: White (or ink-900 for yolk theme)
- Step badge: White background, text-strong
- Pool badge: Ink-900 background, cream-50 text
- Button: Ink-900 background, white text

### Animations
- **Pulse** (hero icon): Opacity from 1.0 to 0.7, 2s easeInOut, infinite
- **Float Up** (step badge): translateY(-8px), 3s easeInOut, infinite
- **Float Down** (pool badge): translateY(8px), 3s easeInOut, infinite

### Accent Color Theming
All accent colors supported. Change via:
```swift
let accentColor: Color = .sky  // or .leaf, .berry, .tomato, .yolk
```

Color definitions in `WelcomeView.swift`:
```swift
extension Color {
    static let sky = Color(red: 0.239, green: 0.561, blue: 0.816)
    static let leaf = Color(red: 0.122, green: 0.616, blue: 0.416)
    static let berry = Color(red: 0.424, green: 0.290, blue: 0.714)
    static let tomato = Color(red: 0.910, green: 0.333, blue: 0.247)
    static let yolk = Color(red: 1.0, green: 0.761, blue: 0.200)
}
```

## Development Guidelines

### Design-First Approach
1. **Focus on visual design only** — no functionality needed yet
2. **Use design system tokens** — never hardcode colors, spacing, fonts
3. **Reference Yolk specs** — alignment, typography, spacing guidelines
4. **Test in preview** — always verify design in Xcode previews before committing

### Code Style
- SwiftUI only (no UIKit)
- Use descriptive variable names
- Minimal comments (code should be self-documenting)
- Group related views with MARK comments
- Follow Apple's SwiftUI best practices

### File Organization
- One view per file
- Components in `Features/[Feature]/Components/`
- Shared utilities in `DesignSystem/`
- Keep features isolated and self-contained

### Color Usage
```swift
// ✅ DO: Use semantic color tokens
.foregroundStyle(Color(red: 0.086, green: 0.075, blue: 0.055))  // text-strong

// ❌ DON'T: Hardcode arbitrary colors
.foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
```

### Spacing Usage
```swift
// ✅ DO: Use design system spacing (multiples of 4pt)
.padding(.horizontal, 24)  // space-6
.padding(.vertical, 16)    // space-4

// ❌ DON'T: Use arbitrary spacing
.padding(.horizontal, 23)
```

### Animation Usage
```swift
// ✅ DO: Use design system motion (easeInOut, 200-3000ms)
.animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: isAnimating)

// ❌ DON'T: Use complex custom animations
.animation(.custom(duration: 2.5, timingFunction: .cubicBezier(...)))
```

## Build & Run

### Prerequisites
- Xcode 15.0+
- iOS 17.0+ deployment target
- macOS 12.0+ for building

### Build Steps
1. Open `Step Tracker.xcodeproj`
2. Select target "Step Tracker"
3. Select simulator or device
4. Press Cmd+R to build and run

### Run on Simulator
```bash
cd /Users/pkarthikr/Work/Projects/Step\ Tracker
open Step\ Tracker.xcodeproj
# Then Cmd+R in Xcode
```

### Preview in Xcode
- Each view has `#Preview { WelcomeView() }` at the bottom
- Use Cmd+Opt+P to show preview canvas
- Resize preview to test different screen sizes

## Git & Version Control

### ⚠️ IMPORTANT: Claude Commit Policy
**Never make git commits automatically.** Always wait for explicit user request to commit. After making code changes, provide a summary of what was done and ask if the user wants to commit, rather than committing proactively.

### Repository
- **Remote**: `https://github.com/pkarthikr/StepTracker.git` (private)
- **Main branch**: `main`
- **Status**: Public GitHub repo

### Commit Guidelines
- **Commit frequently** after implementing each screen/feature
- **Use descriptive messages**:
  - Good: "Implement Welcome screen design with animations and badges"
  - Bad: "Update stuff"
- **Include Co-Authored-By** for Claude contributions:
  ```
  Co-Authored-By: Claude Haiku 4.5 <noreply@anthropic.com>
  ```

### Common Workflow
```bash
# Check status
git status

# Stage changes
git add -A

# Commit
git commit -m "Your message here"

# Push
git push origin main
```

## Important Lessons & Gotchas

### ⚠️ Font Registration
- **Problem**: Info.plist configuration conflicts with Xcode's auto-generation
- **Solution**: Use programmatic registration in `Step_TrackerApp.init()`
- **Lesson**: Don't try Info.plist approach; programmatic is more reliable

### ⚠️ Badge Positioning
- **Problem**: Badges need to be close to icon but not overlap
- **Solution**: Step badge at (-128, -130), Pool badge at (128, 116)
- **Lesson**: Larger offsets = further from center; test in simulator to verify

### ⚠️ Animation Overlap
- **Problem**: Both badges floating up creates visual clutter
- **Solution**: Step badge floats UP, pool badge floats DOWN
- **Lesson**: Opposing animations create better visual interest

### ⚠️ Color Accuracy
- **Problem**: Colors look different on-screen vs. design
- **Solution**: Use precise RGB values from Yolk spec
- **Lesson**: Convert hex to RGB: `#3D8FD1` → `Color(red: 0.239, green: 0.561, blue: 0.816)`

## Next Steps for Future Sessions

### High Priority
1. **Create DesignSystem folder** with centralized:
   - `Colors.swift` (all color constants)
   - `Typography.swift` (font definitions)
   - `Spacing.swift` (spacing constants)

2. **Build reusable components**:
   - `FloatingBadge.swift` (animated badge)
   - `CTAButton.swift` (primary button)
   - `GradientCircle.swift` (hero circle)

3. **Implement Sign Up screen** (design-only):
   - Email/phone input fields
   - Password field
   - Agreement checkbox
   - Sign up button

### Medium Priority
4. **Create dashboard screen** (design-only)
5. **Implement navigation flow** between screens
6. **Add dark mode support** using `@Environment(\.colorScheme)`

### Documentation
7. **Create DESIGN_MAPPING.md** (design-to-code reference)
8. **Add component library documentation**
9. **Create ARCHITECTURE.md** explaining app structure

## Quick Reference: Color Codes

```swift
// Accent Colors
.sky = Color(red: 0.239, green: 0.561, blue: 0.816)      // #3D8FD1
.leaf = Color(red: 0.122, green: 0.616, blue: 0.416)     // #1F9D6A
.berry = Color(red: 0.424, green: 0.290, blue: 0.714)    // #6C4AB6
.tomato = Color(red: 0.910, green: 0.333, blue: 0.247)   // #E8563F
.yolk = Color(red: 1.0, green: 0.761, blue: 0.200)       // #FFC233

// Ink (Dark Neutrals)
text-strong = Color(red: 0.086, green: 0.075, blue: 0.055)      // #16130E
text-body = Color(red: 0.231, green: 0.212, blue: 0.173)        // #3B362C
text-muted = Color(red: 0.420, green: 0.388, blue: 0.329)       // #6B6353
text-faint = Color(red: 0.612, green: 0.580, blue: 0.498)       // #9C937F

// Cream (Light Neutrals)
cream-50 = Color(red: 0.992, green: 0.980, blue: 0.964)         // #FDFBF6
cream-100 = Color(red: 0.963, green: 0.945, blue: 0.906)        // #F6F1E7
white = Color(red: 1.0, green: 1.0, blue: 1.0)                   // #FFFFFF
```

## Contact & Support

- **Primary Developer**: Karthik Ragubathy (me@pkarthik.in)
- **Repository**: https://github.com/pkarthikr/StepTracker
- **Design Reference**: Yolk Design System (Figma/Claude Design)

---

**Last Updated**: September 4, 2026
**Version**: 0.1.0 (Welcome Screen Complete)
