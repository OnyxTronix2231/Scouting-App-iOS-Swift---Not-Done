//
//  AuthsFuncs.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/13/24.
//

import Foundation
import FirebaseAuth

class UserModel : ObservableObject{
    private var isAdmin : Bool = false
    @Published var username : String = ""
    private var userId : String = ""
    @Published public var isSignedIn : Bool = false
    
    func getName() -> String {
        var name : String = ""
        for char in username {
            if (char == "_") {
                name.append(" ")
            }
            else {
                name.append(char)
            }
        }
        return name
    }
    
    public func getIsAdmin() -> Bool {
        return isAdmin
    }
    public func setIsAdmin(isAdmin : Bool) -> Void {
        UserModel().isAdmin = isAdmin
    }
    
    public func getUsername() -> String {
        return username
    }
    public func setUsername(username : String) -> Void {
        UserModel().username = username
    }
    
    public func getUserId() -> String {
        return userId
    }
    public func setUserId(userId : String) -> Void {
        UserModel().userId = userId
    }
    
    public func getIsSignedIn() -> Bool {
        return isSignedIn
    }
    public func setIsSignedIn(isSignedIn : Bool) -> Void {
        UserModel().isSignedIn = isSignedIn
    }
    
}
    
extension UserModel {
    func signInWithEmailAndPassword(password : String) async -> Bool {
        let email : String = username + "@onyxtronix.com"
        do  {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userId = Auth.auth().currentUser?.uid ?? "nil";
            self.isSignedIn = true
            self.isAdmin = Auth.auth().currentUser?.email?.starts(with: "admin") ?? false
            self.userId = Auth.auth().currentUser?.uid ?? "nil"
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            return true
        }
        catch {
            return false
        }
    }
    func offlineSignIn(password : String) async -> Bool {
        self.userId = Auth.auth().currentUser?.uid ?? "nil";
        self.isSignedIn = true
        self.isAdmin = Auth.auth().currentUser?.email?.starts(with: "admin") ?? false
        self.userId = Auth.auth().currentUser?.uid ?? "nil"
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        return true
    }
    
    func logout() -> Bool {
        do {
            _ = try Auth.auth().signOut()
            self.userId = Auth.auth().currentUser?.uid ?? "nil";
            self.isSignedIn = true
            self.isAdmin = Auth.auth().currentUser?.email?.starts(with: "admin") ?? false
            self.userId = Auth.auth().currentUser?.uid ?? "nil"
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
            return true;
        }
        catch {
            return false
        }
    }
}
