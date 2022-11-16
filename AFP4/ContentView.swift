//
//  ContentView.swift
//  AFP4
//
//  Created by Klesya Loha on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
   @State var selected = 3
    var body: some View {
        TabView (selection: $selected){
            Staff(title: "Le Staff", symbole: "person.2.circle.fill")
                .tag(1)
            Page(title: "AFP", symbole: "applelogo")
                .tag(2)
            Promo(title: "La promo", symbole: "pc")
                .tag(3)
            ProfilView().tabItem{
                Image(systemName: "person.fill")
                Text("Profil")
            }
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
        NavigationStack {
            ForEach(personnes){ personne in
                NavigationLink(destination: {
                    Image(personne.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 350.0, height: 350.0)
                    Text(personne.name)
                        .font(.title)
                        .bold()
                    Text(personne.groupe)
                        .foregroundColor(Color.gray)
                    Text(personne.city)
                }, label: {
                    HStack{
                        Image(personne.photo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 100.0)
                        Text(personne.name)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width: 152.0,alignment: .leading)
                        Text(personne.groupe)
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right.circle.fill")
                    }
                })
                Divider()
            }.navigationTitle("Le Staff")
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
        NavigationStack {
            ScrollView {
                Spacer()
                ForEach(teams){ personne in
                    NavigationLink(destination: {
                        Image(personne.photo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 350.0, height: 350.0)
                        Text(personne.name)
                            .font(.title)
                            .bold()
                        Text("Nombres de membres : \(personne.groupe)")
                            .foregroundColor(Color.gray)
                        List(personne.team,id:\.self){ membres in
                            Text(membres)
                        }
                    }, label: {
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
                                .foregroundColor(Color.black)
                                .frame(width: 200.0,alignment: .leading)
                            Spacer()
                            Text(personne.groupe)
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.right.circle.fill")
                            Spacer()
                        }
                    })
                    .navigationTitle("La Promo")
                    Divider()
                }
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
    var city : String = "Toulouse"
    var team : [String] = []
}

var personnes = [
    Personne(photo: "dimitri", name: "Dimitri Klopfstein", groupe: "Formateur"),
    Personne(photo: "abdellah", name: "Abdellah Skoundri", groupe: "Formateur"),
    Personne(photo: "kelian", name: "Kelian Daste", groupe: "Formateur"),
    Personne(photo: "pauline", name: "Pauline Puechbroussoux", groupe: "Chargé de projet")
    
]
var teams = [
    Personne(photo: "music", name: "Musicall", groupe: "5",team: ["Theo","Mehdi","Mohammed","Dylan","Coralie"]),
    Personne(photo: "sport", name: "L'AS Cacahouète", groupe: "3",team: ["Sacha","Félix","Tom"]),
    Personne(photo: "espace", name: "Mass Effect", groupe: "5",team: ["Simon","Teck","Emma","Audrey","Alexis"]),
    Personne(photo: "education", name: "Edu-up", groupe: "5",team: ["Pongo","Amira","Sambatra","Klesya","Thierno"]),
    Personne(photo: "solidarité", name: "Tous Unis", groupe: "5",team: ["Claire","Marry","Mohammed","Nyams","Valérie"])
]

