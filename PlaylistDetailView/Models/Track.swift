import Foundation

struct Track {
	let title: String
	let artist: Artist
}

extension Track: Codable {
	enum CodingKeys: String, CodingKey {
		case title
		case artist = "user"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		title = try container.decode(String.self, forKey: .title)
		artist = try container.decode(Artist.self, forKey: .artist)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(title, forKey: .title)
		try container.encode(artist, forKey: .artist)
	}

}
