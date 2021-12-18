//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Frederick Javalera on 12/18/21.
//

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false
  var body: some View {
    ZStack {
      
      LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottomTrailing)
      
      VStack {
        Spacer()
        
        Text("Content")
          .foregroundStyle(.secondary)
          .padding(50)
          .background(.ultraThinMaterial)
          .cornerRadius(10.0)
        
        Spacer()
        
        Button(action: onButtonPress, label: {
          Label("Take Photo", systemImage: "camera.shutter.button")
        })
          .alert("Photo taken!", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {
              print("Delete button pressed!")
            }
            Button("Second button") {
              print("Second button pressed!")
            }
            Button("Cancel", role: .cancel) {
              print("Cancel button pressed!")
            }
          } message: {
            Text("This simulates a photo being taken.")
          }
          .buttonStyle(.borderedProminent)
          .tint(.secondary)
          .foregroundColor(.primary)
        
        Spacer()
      }
    }
    .ignoresSafeArea()
  }
  
  func onButtonPress() {
    showingAlert = true
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
