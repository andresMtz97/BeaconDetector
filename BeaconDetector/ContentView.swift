//
//  ContentView.swift
//  BeaconDetector
//
//  Created by DISMOV on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var detector = Detector()
    
    var body: some View {
        List ( detector.beaconsArray, id: \.self) { beacon in
            Text(beacon.uuid.uuidString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
