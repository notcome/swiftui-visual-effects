/**
* SwiftUIVisualEffects
*/

import SwiftUI

#if canImport(UIKit)
public extension View {
	/// Creates a blur effect.
	func blurEffect() -> some View {
		ModifiedContent(content: self, modifier: BlurEffectModifier())
	}

	/**
	Sets the style for blur effects within this view.
	
	To set a specific style for all blur effects and vibrancy effects containing blur effects within a view, use the `blurEffectStyle(_:)` modifier:
	```
	ZStack {
		backgroundContent
			.blurEffect()
		
		foregroundContent
			.vibrancyEffect()
	}
	.blurEffectStyle(.systemMaterial)
	```
	*/
	func blurEffectStyle(_ style: UIBlurEffect.Style) -> some View {
		environment(\.blurEffectStyle, style)
	}

	func vibrancyEffect() -> some View {
		ModifiedContent(content: self, modifier: VibrancyEffectModifier())
	}

	/**
	Sets the style for vibrancy effects within this view.
	
	To set a specific style for all vibrancy effects within a view, use the `vibrancyEffectStyle(_:)` modifier:
	```
	ZStack {
		backgroundContent
			.blurEffect()
		
		VStack {
			topContent
				.vibrancyEffect()
			
			bottomContent
				.vibrancyEffect()
		}
		.vibrancyEffectStyle(.fill)
	}
	```
	*/
	func vibrancyEffectStyle(_ style: UIVibrancyEffectStyle) -> some View {
		environment(\.vibrancyEffectStyle, style)
	}
}

/// Creates a blur effect.
public struct BlurEffectModifier: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        content
            .overlay(_BlurVisualEffectViewRepresentable())
    }
}

/// Creates a vibrancy effect.
public struct VibrancyEffectModifier: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        content
            // Hide the original content, keeping its intrinsic content size.
            .hidden()
            .overlay(_VibrancyVisualEffectViewRepresentable(content: content))
    }
}
#endif
