//
//  UserProfile.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 08.05.2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var viewModel = UserProfileViewModel()
    
    @State private var isShowingSettingsScreen = false
    @State private var isShowingSityScreen = false
    
    var body: some View {
            VStack {
                gradienColorNavigationBar
                    .frame(height: 70)
                avatarImageView
                labelNameView
                locationlElementView
                infoUserProfileView
                Divider()
                    .background(Color(red: 218 / 255, green: 217 / 255, blue: 209 / 255))
                    .frame(width: 375, height: 1)
            }

    }
    
    var infoUserProfileView: some View {
        List {
            ForEach(viewModel.listInfoUserProfile) { element in
                if element.title == "Setting" {
                    NavigationLink(destination: AccountScreen()) {
                        HStack {
                            Image(element.imageName)
                            Text(element.title)
                            if element.circle >= 1 {
                                circleView(param: element.circle)
                            }
                        }
                        .font(.verdana(size: 20))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                      
                    }

                } else {
                    HStack {
                        Image(element.imageName)
                        Text(element.title)
                        if element.circle >= 1 {
                            circleView(param: element.circle)
                        }
                    }
                    .font(.verdana(size: 20))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    
                }
            }
        }
        .listStyle(.plain)

    }
    
    var avatarImageView: some View {
        Image("avatar")
            .frame(width: 150, height: 150)
    }
    
    var labelNameView: some View {
        Text("Your Name")
            .font(.custom("Verdana", size: 24))
            .bold()
            .foregroundColor(.gray)
    }
    
    var locationlElementView: some View {
        HStack {
            Image("location")
            Text("City")
                .font(.custom("Verdana", size: 20))
                .foregroundColor(.gray)
        }
    }
    
    func circleView(param: Int) -> some View {
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 25, height: 25)
                    .makeGridient(colors: [.numberTwoColorGradient, .numberOneColorGradient], startPoint: .bottom, endPoint: .top)
                Text("\(param)")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    UserProfileView()
}

