//
//  AccountPage.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct Profile : Hashable{
    var userName: String
    var avatar: String
    var following : Int
    var followers: Int
    var posts : Int
}

struct AccountPage: View {
   var profile : Profile
    @State var buttonTitle = "Follow"
    @State var isFollowed = false
    var body: some View {
        VStack{
            HStack{
                VStack {
                    Image(profile.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.horizontal, 10)
                    
                    Text(profile.userName)
                        .font(.system(size: 20))
                }
                .padding(.horizontal)
                Spacer()
                VStack {
                    Text("\(profile.posts)")
                        .font(.system(size: 20))
                    Text("Posts")
                }
                .padding()
                VStack {
                    Text("\(profile.followers)")
                        .font(.system(size: 20))
                    Text("Followers")
                }
 
                .frame(width: 80)
                .padding(.trailing, -20)
                VStack {
                    Text("\(profile.following)")
                        .font(.system(size: 20))
                    Text("Following")
                }
                .padding(20)
            }
            Button {
                isFollowed.toggle()
                if isFollowed == false {
                    buttonTitle = "Follow"
//                    profile.followers -= 1
                } else {
                    buttonTitle = "Following"
//                    profile.followers += 1
                }
//                print(profile.followers)
            } label: {
                Text(buttonTitle)
                    .frame(width: 340)
                    .padding(6)
                    .foregroundStyle(isFollowed ? .black : .white)
                    .font(.system(size: 23))
                    .background(isFollowed ? .gray.opacity(0.2) : .blue)
                    .cornerRadius(10)
            }
            Divider()
                .frame(height: 4)
                .overlay(.gray)
        }
        Spacer()
    }
}

#Preview {
    AccountPage(profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0))
}
