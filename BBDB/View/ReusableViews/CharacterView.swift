//
//  CharacterView.swift
//  BBDB
//
//  Created by Илья Валито on 14.02.2025.
//

import SwiftUI

struct CharacterView: View {
    @State private var rotationDegrees = 0.0
    @State private var topElementOpacity = 0.0
    @State private var middleElementOpacity = 0.0
    @State private var bottomElementOpacity = 0.0
    
    let character: CartoonCharacter
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                
                Text(character.name)
                
                Spacer()
                
                Text(" \(character.id) ")
                    .padding(8)
                    .background(.bbdbRed)
                    .clipShape(.rect(cornerRadius: 12))
                
            }
            .padding(4)
            .font(.localizedFont(style: .filled, size: 24))
            
            ScrollView(.vertical) {
                HStack(alignment: .top, spacing: 12) {
                    AsyncImage(url: URL(string: character.image), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image.convertToIcon(named: "placeholderIcon", withSize: 96)
                            .rotationEffect(.degrees(rotationDegrees))
                            .onAppear {
                                withAnimation(.linear(duration: 1)
                                    .speed(0.1).repeatForever(autoreverses: false)) {
                                        rotationDegrees += 360.0
                                    }
                            }
                    }
                    .frame(width: 120, height: 160)
                    .background(.bbdbWhite)
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.bbdbBlack, lineWidth: 4)
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            Text("Age:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.age ?? "Unknown")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Gender:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.gender ?? "Unspecified")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Hair:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.hair ?? "Unknown")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("First episode:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.firstEpisode ?? "Unknown")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Voiced by:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.voicedBy ?? "Unknown")
                        }
                    }
                    
                    Spacer(minLength: 2)
                }
                .padding(6)
                .background(.bbdbBlue)
                .opacity(topElementOpacity)
                .clipShape(.rect(cornerRadius: 12))
                .padding(8)
                
                HStack {
                    VStack {
                        Text("Relatives: ")
                            .font(.localizedFont(style: .filled, size: 20))
                        
                        if character.relatives.isEmpty {
                            Text("Not found")
                        } else {
                            VStack(alignment: .leading) {
                                ForEach(character.relatives, id: \.id) { relative in
                                    Text("\(relative.name)")
                                }
                            }
                        }
                        
                    }
                    .padding(4)
                    .background(.bbdbGreen)
                    .clipShape(.rect(cornerRadius: 12))
                    .padding(8)
                    
                    Spacer()
                }
                .opacity(middleElementOpacity)
                
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 8) {
                        VStack {
                            Text("Occupation:")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            Text(character.occupation ?? "Unknown")
                        }
                        
                        VStack {
                            Text("Other occupations: ")
                                .font(.localizedFont(style: .filled, size: 20))
                            
                            if character.allOccupations.isEmpty {
                                Text("Unknown")
                            } else {
                                VStack(alignment: .leading) {
                                    ForEach(character.allOccupations, id: \.self) { ocupation in
                                        Text("\(ocupation)")
                                    }
                                }
                            }
                        }
                    }
                    .padding(4)
                    .background(.bbdbYellow)
                    .clipShape(.rect(cornerRadius: 12))
                    .padding(8)
                }
                .opacity(bottomElementOpacity)
            }
            .containerRelativeFrame(.vertical, alignment: .center, { size, axis in
                size * 0.6
            })
            .padding(4)
            .background(.bbdbGray)
            .clipShape(.rect(cornerRadius: 12))
            .padding(8)
            
            
            if let url = URL(string: character.wikiURL) {
                HStack {
                    Spacer()
                    
                    Text("Character's Wiki")
                        .font(.localizedFont(style: .filled, size: 20))
                    
                    Link(destination: url) {
                        Image.convertToIcon(named: "networkIcon", withSize: 36)
                            .renderingMode(.template)
                            .foregroundColor(.bbdbBlue.mix(with: .blue, by: 1))
                    }
                }
                .padding(8)
            }
        }
        .containerRelativeFrame(.horizontal, alignment: .center, { size, axis in
            size * 0.9
        })
        .background(.bbdbOrange)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.bbdbBrown, lineWidth: 4)
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                topElementOpacity = 1.0
            }
            withAnimation(.easeInOut(duration: 2)) {
                middleElementOpacity = 1.0
            }
            withAnimation(.easeInOut(duration: 2.5)) {
                bottomElementOpacity = 1.0
            }
        }
        .font(.localizedFont(style: .empty, size: 20))
    }
}

#Preview {
    CharacterView(character: CartoonCharacter.example)
}
