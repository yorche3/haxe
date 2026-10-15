class HelloUser {
    static public function main() {
        Sys.print("Enter your name: ");
        var name = Sys.stdin().readLine();
        haxe.Log.trace("Hello, " + name + "!", null);
    }
}