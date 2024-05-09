//
//  UserProfile.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 08.05.2024.
//

import SwiftUI
struct UserProfileView: View {
    @ObservedObject var  userProfileViewModel = UserProfileViewModel()
    var body: some View{
        VStack {
            gradienColorNavigationBar
                .frame(height: 70)
            avatarImageView
            labelNameView
            locationlElementView
            infoUserProfileView
            
        }
    }
    
    var infoUserProfileView: some View {
            List {
                ForEach(userProfileViewModel.listInfoUserProfile) { element in
                    HStack {
                        Image(element.imageName)
                        Text(element.title)
                        if element.isCircleVisible {
                            circleView
                        }
                    }
                    .font(.custom("Verdana", size: 20))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                }
            }
            .listStyle(.plain)
    }
    
    var avatarImageView: some View {
        Image(.avatar)
            .frame(width: 150, height: 150)
    }
    
    var labelNameView: some View {
        Text("Your Name")
            .font(.verdana(size: 24))
            .bold()
            .foregroundStyle(.myGrey)
    }
    
    var locationlElementView: some View {
        HStack {
            Image(.location)
            Text("Sity")
                .font(.verdana(size: 20))
                .foregroundStyle(.myGrey)
        }
    }
    
    var circleView: some View {
        HStack {
            Spacer()
            ZStack {
                Circle().frame(width: 25,height: 25)
                    .makeGridient(colors: [.numberOneColorGradient, .numberTwoColorGradient], startPoint: .top, endPoint: .bottom)
                Text("4").foregroundStyle(.white)
            }
        }
    }
}
