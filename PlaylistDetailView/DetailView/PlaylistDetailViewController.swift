import UIKit

class PlaylistDetailViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.dataSource = self
			tableView.rowHeight = UITableView.automaticDimension
			tableView.register(UINib(nibName: TrackCell.reuseIdentifier, bundle: nil),
												 forCellReuseIdentifier: TrackCell.reuseIdentifier)
		}
	}

	@IBOutlet weak var headerTitle: UILabel! {
		didSet {
			headerTitle.text = ""
			headerTitle.font = Typeface.preferredFont(forTextStyle: UIFont.TextStyle.headline)
		}
	}

	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

	var viewModel: PlaylistDetailViewModelling?

	override func viewDidLoad() {
		super.viewDidLoad()
		bindViewModel()
		viewModel?.notifyViewDidLoad()
	}

	func bindViewModel() {

		viewModel?.finishedFetching = { [weak self] in

			self?.headerTitle.text = self?.viewModel?.playlistTitle
			self?.tableView.reloadData()
		}

		viewModel?.animateLoadingView = { [weak self] animate in
			if animate {
				self?.loadingIndicator.startAnimating()
			} else {
				self?.loadingIndicator.stopAnimating()
			}
		}

		viewModel?.displayError = { [weak self] message in
			self?.presentAlert(with: message)
		}

	}

	func presentAlert(with message: String) {
		let alertView = UIAlertController(title: "Ooops!", message: message, preferredStyle: .alert)
		alertView.addAction(UIAlertAction(title: "OK", style: .cancel))

		self.present(alertView, animated: true, completion: nil)
	}
	
}

extension PlaylistDetailViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.cellViewModels.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseIdentifier) as? TrackCell else {
			return UITableViewCell()
		}

		cell.setup(with: viewModel?.cellViewModels[indexPath.row])
		return cell
	}
}

