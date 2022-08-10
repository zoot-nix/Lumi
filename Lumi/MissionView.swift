//
//  MissionView.swift
//  Lumi
//
//  Created by Owais Shaikh on 10/08/22.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader {geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Mission Report")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text("Launch Date: \(mission.FormattedDate)")
                            .font(.caption)
                            .foregroundColor(.secondaryFont)
                            .padding(.bottom)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBG)
                            .padding(.top)
                        
                        Text("Crew Members")
                            .font(.title.bold())
                            .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(crew, id: \.role){ CrewMember in
                                NavigationLink{
                                    AstroDetailView(astronaut: CrewMember.astronaut)
                                }label:{
                                    HStack{
                                        Image(CrewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .strokeBorder(.lightBG, lineWidth: 1)
                                            )
                                        VStack(alignment: .leading){
                                            
                                            Text(CrewMember.astronaut.name)
                                                .foregroundColor(.mainFont)
                                                .font(.headline)
                                            
                                            Text(CrewMember.role)
                                                .foregroundColor(.secondaryFont)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.DisplayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBG)
    }
    
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
