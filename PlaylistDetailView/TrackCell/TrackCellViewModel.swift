
protocol TrackCellViewModelling {
	var trackInfo: String { get }
}

struct TrackCellViewModel: TrackCellViewModelling {

	let trackInfo: String

	init (track title: String, artist name: String) {
		trackInfo = title+" 🎶 "+name
	}
	
}


