class HelloUser {
    static public function main() {
        haxe.Log.trace("Enter your name: ", null);
        var name = Sys.stdin().readLine();
        haxe.Log.trace("Hello, " + name, null);
    }
}