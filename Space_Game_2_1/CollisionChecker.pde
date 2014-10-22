public class CollisionChecker {
    CollisionChecker() {
    }

    public boolean hasCollisionOccurred(Position one, Position two) {
        return isXAxisAHit(one, two) && isYAxisAHit(one, two);
    }

    private boolean isXAxisAHit(Position one, Position two) {
        return isAHit(one.x, one.x + one.size, two.x, two.x + two.size);
    }

    private boolean isYAxisAHit(Position one, Position two) {
        return isAHit(one.y, one.y + one.size, two.y, two.y + two.size);
    }

    private boolean isAHit(int pointOneStart, int pointOneEnd, int pointTwoStart, int pointTwoEnd) {
        return isNumberBetween(pointOneStart, pointOneEnd, pointTwoStart) ||
            isNumberBetween(pointOneStart, pointOneEnd, pointTwoEnd);
    }

    private boolean isNumberBetween(int begin, int end, int number) {
        return begin <= number && end >= number;
    }
}
