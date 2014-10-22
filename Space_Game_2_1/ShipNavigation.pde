public static class ShipNavigation {
    public static char left = 'a';
    public static char right = 'd';
    public static char up = 'w';
    public static char down = 's';

    public static boolean isNavigationKey(char key) {
        return key == left || key == right ||
            key == up || key == down;
    }
}
