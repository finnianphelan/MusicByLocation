//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Finnian Phelan on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var locationHandler = LocationHandler()
	
	var body: some View {
		VStack {
			Text(locationHandler.lastKnownLocation)
				.padding()
			Spacer()
			Button("Find Music", action: {
				locationHandler.requestLocation()
			})
		}.onAppear(perform: {
			locationHandler.requestAuthorisation()
		})
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
