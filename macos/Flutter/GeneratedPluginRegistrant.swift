//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation
import path_provider_foundation
import firebase_auth
import firebase_core

import url_launcher_macos

import shared_preferences_foundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))

  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))

  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))

}
