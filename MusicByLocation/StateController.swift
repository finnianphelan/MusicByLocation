//
//  StateController.swift
//  MusicByLocation
//
//  Created by Finnian Phelan on 14/03/2024.
//

import Foundation

class StateController: ObservableObject {
	let locationHandler: LocationHandler = LocationHandler()
	let iTunesAdaptor = ITunesAdaptor()
	@Published var artistsByLocation: String = ""
	var lastKnownLocation: String = "" {
		didSet {
			iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
		}
	}
	
	func findMusic() {
		locationHandler.updateLocation()
	}
	
	func requestAccessToLocationData() {
		locationHandler.stateController = self
		locationHandler.requestAuthorisation()
	}
	
	func updateArtistsByLocation(artists: [Artist]?) {
		let names = artists?.map { return $0.name }
		DispatchQueue.main.async {
			self.artistsByLocation = names?.joined(separator: ", ") ?? "Error finding Artists from your Location"
		}
	}
}
