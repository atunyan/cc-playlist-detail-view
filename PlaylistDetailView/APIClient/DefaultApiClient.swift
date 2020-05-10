import Foundation

protocol  ApiClient {
	func fetchPlaylist(with id: Int, _ onComplete: @escaping (Playlist?, String?) -> Void)
}

private enum Path: String {
	case playlists = "/playlists/"
}

struct DefaultApiClient: ApiClient {

	let service: NetworkAdaptor
	let endpoint: EndpointUrlHelping

	func fetchPlaylist(with id: Int, _ onComplete: @escaping (Playlist?, String?) -> Void) {

		let url = endpoint.playlistUrl(with: Path.playlists.rawValue, playlistId: String(id))

		service.request(url) { (data, error) in
			do {
				guard let data = data else {
					if let error = error {
						DispatchQueue.main.async {
							onComplete(nil, Errors.network(description: error.localizedDescription).errorDescription)
						}
					}
					return
				}
				let result = try JSONDecoder().decode(Playlist.self, from: data)

				DispatchQueue.main.async {
					onComplete(result, nil)
				}
			} catch {
				DispatchQueue.main.async {
					onComplete(nil, Errors.unknown.localizedDescription)
				}
			}
		}
	}
}

