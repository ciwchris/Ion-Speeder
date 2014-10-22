public class CollisionApplier {
    private GameComponents gameComponents;
    private CollisionChecker collisionChecker;

    CollisionApplier(GameComponents gameComponents) {
        this.gameComponents = gameComponents;
        collisionChecker = new CollisionChecker();
    }

    public void applyCollisions() {
        Ship ship = gameComponents.Ship;
        for (int i = 0; i < gameComponents.Rocks.size(); i++) {
            Rock rock = gameComponents.Rocks.get(i);

            applyShipCollisions(ship, rock);
            applyBulletCollisions(rock);
        }

        applyFuelRechargerCollisions(ship);
    }

    private void applyShipCollisions(Ship ship, Rock rock) {
        if (collisionChecker.hasCollisionOccurred(ship.getPosition(), rock.getPosition())) {
            if (gameComponents.Shield.isDestroyed()) {
                gameComponents.Health.lowerHealth(rock.damage);
                ship.displayHealthHit();
            } else {
                gameComponents.Shield.damage(rock.damage);
                ship.displayShieldHit();
            }
            rock.destroy();
        }
    }

    private void applyBulletCollisions(Rock rock) {
        for (int i = 0; i < gameComponents.Bullets.size(); i++) {
            if (collisionChecker.hasCollisionOccurred(
                        gameComponents.Bullets.get(i).getPosition(),
                        rock.getPosition())) {
                rock.destroy();
                gameComponents.Bullets.remove(i);
            }
        }
    }

    private void applyFuelRechargerCollisions(Ship ship) {
        if (collisionChecker.hasCollisionOccurred(
                    ship.getPosition(),
                    gameComponents.FuelRecharger.getPosition())) {
            gameComponents.FuelBar.increaseFuel();
            gameComponents.FuelRecharger.destroy();
        }
    }
}
