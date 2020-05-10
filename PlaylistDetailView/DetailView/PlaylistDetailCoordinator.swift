import UIKit

final class PlaylistDetailCoordinator {

	let viewController: PlaylistDetailViewController

	init(window: UIWindow, playlistId: Int = 79670980, apiClient: ApiClient) {
		viewController = PlaylistDetailCoordinator.loadPlaylistDetailVC()
		viewController.viewModel = PlaylistDetailViewModel(client: apiClient, playlistId: playlistId)
		window.rootViewController = viewController
	}

	static func loadPlaylistDetailVC() -> PlaylistDetailViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailView") as! PlaylistDetailViewController
	}
}
