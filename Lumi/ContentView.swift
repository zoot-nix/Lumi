//
//  ContentView.swift
//  Lumi
//
//  Created by Owais Shaikh on 08/08/22.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()

                                    VStack {
                                        Text(mission.DisplayName)
                                            .font(.headline)
                                        Text(mission.FormattedDate)
                                            .font(.caption)
                                    }
                                    .foregroundColor(.mainFont)
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBG.opacity(0.5))
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBG)
                                )
                            }
                        }
                    }   
                    .padding([.horizontal, .bottom])
                }
                .navigationBarHidden(true)
                .background(
                    Image("lumi-BG")
                )
                .preferredColorScheme(.dark)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

