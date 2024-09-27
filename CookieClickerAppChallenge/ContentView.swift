//
//  ContentView.swift
//  CookieClickerAppChallenge
//
//  Created by PM Student on 9/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var cookies = 0
    @State var multiplier = 1
    @State var rebirth = 1
    @State var cheats = true
    @State var cheatText = ""
    
    var body: some View {
        TabView {
            Cookie(cookies: $cookies, multiplier: $multiplier, rebirth: $rebirth, cheatText: $cheatText)
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Cookie")
                        .font(.title)
                }
            Upgrades(cookies: $cookies, multiplier: $multiplier, rebirth: $rebirth, cheats: $cheats)
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upgrades")
                        .font(.title)
                }
            if cheats == true {
                Cheats(cookies: $cookies, multiplier: $multiplier, rebirth: $rebirth, cheatText: $cheatText)
                    .tabItem {
                        Image(systemName: "lock.fill")
                        Text("Cheats")
                    }
            }
        }
    }
}

struct Cookie: View {
    
    @Binding var cookies: Int
    @Binding var multiplier: Int
    @Binding var rebirth: Int
    @Binding var cheatText: String
    
    var body: some View {
        VStack {
            
            if cookies == 0 && rebirth == 1 {
                Text("Click the cookie to start!")
                    .font(.title)
            } else {
                Text("Click the cookie to start!")
                    .foregroundColor(.white)
                    .font(.title)
            }
            
            if cheatText.lowercased() == "negative" {
                Text("Cookies: \(cookies * -1)")
                    .font(.title)
                    .frame(width: 300, height: 50)
                    .background(Color("buttonbackground").cornerRadius(20))
                    .padding()
            } else {
                
                Text("Cookies: \(cookies)")
                    .font(.title)
                    .frame(width: 300, height: 50)
                    .background(Color("buttonbackground").cornerRadius(20))
                    .padding()
            }
            
            if cheatText.lowercased() != "no cookie" {
                Button(action: {
                    cookies += multiplier * rebirth
                }) {
                    if cheatText.lowercased() == "minecraft" {
                        Image("grassblock")
                            .padding(.bottom, 30.0)
                    } else if cheatText.lowercased() == "darkoakboat" {
                        Image("darkoakboat")
                            .padding(.bottom, 30.0)
                    } else {
                        Image("cookie")
                            .padding(.bottom, 30.0)
                    }
                }
            }
        }
    }
}



struct Upgrades: View {
    
    @Binding var cookies: Int
    @Binding var multiplier: Int
    @Binding var rebirth: Int
    @Binding var cheats: Bool
    
    var body: some View {
        
        VStack {
            Text("Cookies: \(cookies)")
                .font(.title2)
            Text("Multiplier: \(multiplier)")
                .font(.title2)
            Text("Restarts: \(rebirth - 1)")
                .font(.title2)
            
            HStack {
                Button(action: {
                    if cookies > 99 {
                        multiplier += 1
                        cookies -= 100
                    }
                }) {
                    Text("Buy multiplier\nCosts 100 cookies")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
                
                
                Button(action: {
                    if cookies > 499 {
                        multiplier += 5
                        cookies -= 500
                    }
                }) {
                    Text("Buy multiplier x5\nCosts 500 cookies")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
            }
            HStack {
                Button(action: {
                    if cookies > 1499 {
                        rebirth += 1
                        cookies = 0
                        multiplier = 1
                    }
                }) {
                    Text("Restart with multiplier\nCosts 1500 cookies")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
                
                if cheats == false {
                    
                    Button(action: {
                        if cookies > 4999 {
                            cookies -= 5000
                            cheats = true
                        }
                    }) {
                        Text("Buy cheat tab\nCosts 5000 cookies")
                    }
                    .frame(width: 180, height: 50)
                    .background(Color("buttonbackground").cornerRadius(20))
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct Cheats: View {
    
    @Binding var cookies: Int
    @Binding var multiplier: Int
    @Binding var rebirth: Int
    @Binding var cheatText: String
    
    var body: some View {
        VStack {
            
            Text("Cookies: \(cookies)")
                .font(.title2)
            Text("Multiplier: \(multiplier)")
                .font(.title2)
            Text("Restarts: \(rebirth - 1)")
                .font(.title2)
            
            HStack {
                Button(action: {
                    if cookies < 1000000000 {
                        
                        cookies *= 2
                    }
                }) {
                    Text("Duplicate cookies")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
                
                Button(action: {
                    if multiplier < 1000000000 {
                        
                        multiplier *= 2
                    }
                }) {
                    Text("Duplicate multiplier")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
            }
            
            HStack {
                
                
                Button(action: {
                    if rebirth < 1000000000 {
                        
                        rebirth *= 2
                    }
                }) {
                    Text("Duplicate restarts")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
                
                
                // resets cheatText
                Button(action: {
                    cheatText = ""
                    
                }) {
                    Text("Reset cheat code")
                }
                .frame(width: 180, height: 50)
                .background(Color("buttonbackground").cornerRadius(20))
                .foregroundColor(.black)
                
            }
            TextField("Input cheat code", text: $cheatText)
                .padding()
        }
    }
}
// cheat codes:
// no cookie
// minecraft
// darkoakboat
// negative
//

#Preview {
    ContentView()
}
