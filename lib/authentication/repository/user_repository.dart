// Repository class for user authentication
class UserRepository {
  // Asynchronous method to simulate user login
  Future<bool> getLogin(String username, String password) async {
    // Check if the provided username and password match the hardcoded values
    if (username == "admin@dev.com" && password == "admin") {
      // Return true if authentication succeeds
      return true;
    }
    // Return false if authentication fails
    return false;
  }
}
