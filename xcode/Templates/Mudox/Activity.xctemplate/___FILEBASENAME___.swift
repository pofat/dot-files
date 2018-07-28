import MudoxKit

enum Activity {
  case githubSearch
}

extension Activity: ActivityType {
  /// Default: true
  var oneAtATime: Bool {
    return true
  }

  /// Log out each events of this kind of tasks.
  /// Used for debugging.
  /// Default: false
  var isLoggingEnbaled: Bool {
    return false
  }

  /// Keep UIApplication.shared.isNetworkActivityIndicatorVisible to true
  /// when this kind of tasks are executing.
  /// Default: false
  var isNetworkActivity: Bool {
    return false
  }
}

extension The {
  static let activityCenter = ActivityTracker<Activity>()
}

