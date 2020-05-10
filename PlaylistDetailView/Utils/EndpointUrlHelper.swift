import Foundation

protocol EndpointUrlHelping {
	var baseUrl: URL { get }
	var clientId: String { get }
	var clientSecret: String { get }

	func playlistUrl(with path: String, playlistId: String) -> URL
}

struct EndpointUrlHelper: EndpointUrlHelping {
	let baseUrl: URL
	let clientId: String
	let clientSecret: String

	func playlistUrl(with path: String, playlistId: String) -> URL {
		let endpoint = baseUrl
			.appendingPathComponent(path)
			.appendingPathComponent(playlistId)

		return urlQuery(urlString: endpoint.absoluteString)
	}

	func urlQuery(urlString: String) -> URL {
		var urlQuery = URLComponents(string: urlString)
		urlQuery?.queryItems = [URLQueryItem(name:"client_id", value: clientId),
														URLQueryItem(name: "client_secret", value: clientSecret)]

		guard let url = urlQuery?.url else {
			fatalError("\(String(describing: urlQuery?.string)) is not valid url")
		}

		return url
	}

}

extension EndpointUrlHelper {
	static var `default`: EndpointUrlHelping {
		return EndpointUrlHelper(baseUrl: Environment.gatewayUrl,
														 clientId: Environment.clientId,
														 clientSecret: Environment.clientSecret)
	}
}
