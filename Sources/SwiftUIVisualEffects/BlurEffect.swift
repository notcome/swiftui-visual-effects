/**
* SwiftUIVisualEffects
*/

import SwiftUI

#if canImport(UIKit)
/// Creates a blur effect.
public struct BlurEffect: View {
	public init() {}
	
	public var body: some View {
		_BlurVisualEffectViewRepresentable()
	}
}
#endif
