//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Finnian Phelan on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var state = StateController()
	
	var body: some View {
		VStack {
			Text(state.artistsByLocation)
				.padding()
			Spacer()
			Button("Find Music", action: {
				state.findMusic()
			})
		}.onAppear(perform: {
			state.requestAccessToLocationData()
		})
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
