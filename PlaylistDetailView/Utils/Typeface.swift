import UIKit

final class Typeface {
	 static func preferredFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
		var size: CGFloat = 0.0

		switch style {
		case .headline:
			size = 30.0
		case .title1:
			size = 20.0
		default:
			break
		}

		return UIFont.systemFont(ofSize: size)
	}
}
