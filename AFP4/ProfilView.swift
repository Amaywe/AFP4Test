//
//  SwiftUIView.swift
//  AFP4
//
//  Created by Klesya Loha on 15/11/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ProfilView: View {
   @State var name = ""
    @State var mail = ""
    @State var mdp = ""
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.red]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 20){
                    
                    NavigationLink(destination: {
                        VStack{
                            TextField("Adresse Mail", text: $mail)
                                .padding()
                                .background(.red)
                                .cornerRadius(30)
                            SecureField("Mot de Passe", text: $mdp)
                                .padding()
                                .background(.red)
                                .cornerRadius(30)
                            Button(action: {
                                
                            }, label: {
                                Text("Me Connecter")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.red)
                                    .cornerRadius(30)
                            })
                        }.padding()
                    }, label: {
                        Text("Me Connecter")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 200.0)
                            .foregroundColor(.red)
                            .background(.white)
                            .cornerRadius(30)
                    })
                    NavigationLink(destination: {
                        ZStack {
                            Color("Color")
                                .ignoresSafeArea()
                            VStack{
                                    
                                TextField("Name", text: $name)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(30)
                                TextField("Adresse Mail", text: $mail)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(30)
                                SecureField("Mot de Passe", text: $mdp)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(30)
                                Button(action: {
                                    Auth.auth().createUser(withEmail: mail, password: mdp) { authResult, error in
                                      // ...
                                    }
                                    
                                }, label: {
                                    Text("M'inscrire")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.red)
                                        .cornerRadius(30)
                                })
                            }
                            .padding()
                        }
                        
                    }, label: {
                        Text("Nouveau ?")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 200.0)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(30)
                    })
                    
                }
            }.navigationTitle("Profile")
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
