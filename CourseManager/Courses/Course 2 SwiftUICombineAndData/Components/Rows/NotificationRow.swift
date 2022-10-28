//
//  NotificationRow.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-26.
//

import SwiftUI

struct NotificationRow: View {
    @StateObject var notificationVM = NotificationViewModel()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        Group {
            if notificationVM.permission == .authorized {
                Toggle(isOn: $notificationVM.subscribedToAllNotifications, label: {
                    HStack(spacing: 12) {
                        GradientIcon(icon: "bell.fill")

                        VStack(alignment: .leading) {
                            Text("Notify me of new content")
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Text("Max once a week.")
                                .font(.caption2)
                                .opacity(0.7)
                        }
                    }
                }).toggleStyle(SwitchToggleStyle(tint: Color(red: 0.34, green: 0.33, blue: 0.82)))
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notifications are disabled")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("We can't notify you when new content is available")
                        .font(.caption2)
                        .opacity(0.7)
                    Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                        Text("Open Settings")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onAppear {
            notificationVM.getNotificationsSettings()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                notificationVM.getNotificationsSettings()
            }
        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow()
    }
}
