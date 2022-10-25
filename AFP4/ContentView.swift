//
//  ContentView.swift
//  AFP4
//
//  Created by Klesya Loha on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
   @State var selected = 2
    var body: some View {
        TabView (selection: $selected){
            Staff(title: "Le Staff", symbole: "person.2.circle.fill")
                .tag(1)
            Page(title: "AFP", symbole: "applelogo")
                .tag(2)
            Promo(title: "La promo", symbole: "pc")
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Staff: View {
    var title : String
    var symbole : String
    var body: some View {
        VStack {
            ForEach(personnes){ personne in
                HStack{
                    Spacer()
                    Image(personne.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100.0)
                    Spacer()
                    Text(personne.name)
                        .fontWeight(.bold)
                        .frame(width: 200.0,alignment: .leading)
                    Spacer()
                    Text(personne.groupe)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Divider()
            }
            }
                .tabItem{
                    Text(title)
                    Image(systemName: symbole)
        }
    }
}

struct Promo: View {
    var title : String
    var symbole : String
    var body: some View {
        VStack {
            ForEach(teams){ personne in
                
                HStack{
                    Spacer()
                    Image(personne.photo)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100.0, height: 100.0)
                        .clipShape(Circle())
                    Spacer()
                    Text(personne.name)
                        .fontWeight(.bold)
                        .frame(width: 200.0,alignment: .leading)
                    Spacer()
                    Text(personne.groupe)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Divider()
            }
            }
                .tabItem{
                    Text(title)
                    Image(systemName: symbole)
        }
    }
}

struct Page: View {
    var title : String
    var symbole : String
    var body: some View {
        VStack (spacing: 10){
            Text("Apple Foundation Program")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Text("Bienvenue")
                .fontWeight(.bold)
            Image("afp4.logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100.0, height: 100.0)
            Image(systemName: "applelogo")
        }
                .tabItem{
                    Text(title)
                    Image(systemName: symbole)
        }
    }
}


struct Personne : Identifiable {
    var id = UUID()
    var photo : String
    var name : String
    var groupe : String
}

var personnes = [
    Personne(photo: "dimitri", name: "Dimitri Klopfstein", groupe: "Formateur"),
    Personne(photo: "abdellah", name: "Abdellah Skoundri", groupe: "Formateur"),
    Personne(photo: "kelian", name: "Kelian Daste", groupe: "Formateur"),
    Personne(photo: "pauline", name: "Pauline Puechbroussoux", groupe: "Chargé de projet")
    
]
var teams = [
    Personne(photo: "music", name: "Musicall", groupe: "5"),
    Personne(photo: "sport", name: "L'AS Cacahouète", groupe: "4"),
    Personne(photo: "espace", name: "Mass Effect", groupe: "5"),
    Personne(photo: "education", name: "Edu-up", groupe: "5"),
    Personne(photo: "solidarité", name: "Tous Unis", groupe: "5"),
]

