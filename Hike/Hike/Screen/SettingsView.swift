//
//  SettingsView.swift
//  Hike
//
//  Created by ANKIT KUMAR on 01/08/23.
//

import SwiftUI

struct SettingsView: View {
    //Mark :- Properties
    private let alternateAppIcons: [String] = [
  
  "AppIcon-MagnifyingGlass",
   "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
  
       
    
    
    ]
    var body: some View {
        List {
            // Mark :- Section : Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80 , weight: .black))
                    VStack(spacing : -10) {
                        Text("Hike")
                            .font(.system(size : 66, weight : .black))
                        
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80 , weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top , 10)
                VStack(spacing: 12){
                    Text("Where can you find \n perfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    
                    Text("The hike which looks gorgeous in photos but is  even better once you are actually there. The hike  that you hope to  do again someday. \n Find the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text(" Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            // Mark :- Section : Icons
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12){
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            
                            Button {
                                print("Icon was pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item])
                                { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon : \(String(describing: error?.localizedDescription))")
                                    }else {
                                        print("Success! You have changed the app's icon to\(alternateAppIcons[item])")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(20)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top , 12)
             Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth:  .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom , 12)
            }
            .listSectionSeparator(.hidden)
            
            // Mark :- Section : About
            
            Section( header: Text("About The App"),
                     footer: HStack {
                Spacer()
                Text("copyright © All right reserved.")
                Spacer()
            }.padding(.vertical , 8)
            ) {
                CustomListView(rowLabel: "Applications", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                CustomListView(rowLabel: "Compatiblity", rowIcon: "info.circle", rowContent: "ios, ipadOS", rowTintColor: .red)
                CustomListView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                CustomListView(rowLabel: "Designer",
                               rowIcon: "paintpalette", rowContent: "Ankit Kumar", rowTintColor: .pink)
            
                CustomListView(rowLabel: "Website",
                               rowIcon: "globe", rowContent: nil, rowTintColor: .indigo,
                                  rowLinkLabel: "Ankit Profile Linkedin" ,
                              rowLinkDestination: "https://www.linkedin.com/in/ankit-kumar-01a52827b/")
                
            }
                     
                
            
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
