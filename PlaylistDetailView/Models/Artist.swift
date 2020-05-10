import Foundation

struct Artist {
	let name: String
}

extension Artist: Codable {
	enum CodingKeys: String, CodingKey {
		case name = "username"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		name = try container.decode(String.self, forKey: .name)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(name, forKey: .name)
	}

}
