//
//  AstroDetailView.swift
//  Lumi
//
//  Created by Owais Shaikh on 10/08/22.
//

import SwiftUI

struct AstroDetailView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Text(astronaut.name)
                    .font(.title.bold())
                    .foregroundColor(.mainFont)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightBG)
                    .padding()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBG)
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstroDetailView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstroDetailView(astronaut: astronauts["armstrong"]!)
    }
}
