/**
* SwiftUIVisualEffects
*/

import SwiftUI

#if canImport(UIKit)
struct BlurEffectStyleKey: EnvironmentKey {
    static var defaultValue: UIBlurEffect.Style = .systemMaterial // (Per the human-interface guidelines.)
}

struct VibrancyEffectStyleKey: EnvironmentKey {
    static var defaultValue: UIVibrancyEffectStyle?
}

extension EnvironmentValues {
    var blurEffectStyle: UIBlurEffect.Style {
        get {
            self[BlurEffectStyleKey.self]
        }
        set {
            self[BlurEffectStyleKey.self] = newValue
        }
    }
}

extension EnvironmentValues {
    var vibrancyEffectStyle: UIVibrancyEffectStyle? {
        get {
            self[VibrancyEffectStyleKey.self]
        }
        set {
            self[VibrancyEffectStyleKey.self] = newValue
        }
    }
}
#endif
