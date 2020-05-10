import UIKit

final class TrackCell: UITableViewCell {

	@IBOutlet weak var trackInfoLabel: UILabel!

	func setup(with viewModel: TrackCellViewModelling?) {
		trackInfoLabel.text = viewModel?.trackInfo
		trackInfoLabel.font = Typeface.preferredFont(forTextStyle: UIFont.TextStyle.title1)
	}

	static var reuseIdentifier: String {
		return String(describing: self)
	}
	
}
