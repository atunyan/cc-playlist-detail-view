import Foundation

struct Environment {

	static var gatewayUrl: URL {
		let str = "https://api.soundcloud.com"
		guard let url = URL(string: str) else {
			fatalError("\(str) is not valid url")
		}
		return url
	}

	static var clientId: String {
		guard let apiClientId = Bundle.main.infoDictionary?[InfoPlistKey.apiClientId.rawValue] as? String else {
			fatalError(" 🙀 Value for \(InfoPlistKey.apiClientId.rawValue) is missing from info.plist ")
		}
		return apiClientId
	}

	static var clientSecret: String {
		guard let apiClientSecret = Bundle.main.infoDictionary?[InfoPlistKey.apiClientSecret.rawValue] as? String else {
			fatalError(" 🙀 Value for \(InfoPlistKey.apiClientSecret.rawValue) is missing from info.plist")
		}
		return apiClientSecret
	}

}
