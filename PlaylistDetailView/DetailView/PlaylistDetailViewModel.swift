
protocol PlaylistDetailViewModelling {
	var cellViewModels : [TrackCellViewModel] { get }
	var playlistTitle: String? { get }
	
	var finishedFetching: (() -> ())? { set get }
	var animateLoadingView: ((Bool) -> ())? { set get }
	var displayError: ((String) -> ())? { set get }

	func notifyViewDidLoad()
}

final class PlaylistDetailViewModel: PlaylistDetailViewModelling {

	private(set) var cellViewModels = [TrackCellViewModel]()
	private(set) var playlistTitle: String?
	var finishedFetching: (() -> ())?
	var animateLoadingView: ((Bool) -> ())?
	var displayError: ((String) -> ())?

	let playlistId: Int
	let apiClient: ApiClient

	init(client: ApiClient, playlistId: Int) {
		self.playlistId = playlistId
		self.apiClient = client
	}

	func notifyViewDidLoad() {
		fetchPlaylistDetails()
	}

	private func fetchPlaylistDetails() {
		animateLoadingView?(true)
		apiClient.fetchPlaylist(with: playlistId) { [weak self] (result, error) in
			self?.animateLoadingView?(false)
			if let error = error {
				self?.displayError?(error)
				return
			}

			guard let playlist = result else { return }

			self?.playlistTitle = playlist.title
			self?.cellViewModels = playlist.tracks.map{ TrackCellViewModel(track: $0.title,
																																		 artist:$0.artist.name)}
			self?.finishedFetching?()
		}
	}

}
