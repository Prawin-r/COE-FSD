package WarehouseInventoryManagement;

import java.util.Comparator;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class InventoryManager {
	private final Map<String, Product> inventory = new ConcurrentHashMap<>();
    private final PriorityQueue<Order> orderQueue = new PriorityQueue<>(Comparator.comparing(o -> o.priority));

    public void addProduct(Product product) {
        inventory.put(product.id, product);
    }

    public void placeOrder(Order order) {
        orderQueue.offer(order);
    }

    public void processOrders() {
        ExecutorService executor = Executors.newFixedThreadPool(3);
        while (!orderQueue.isEmpty()) {
            Order order = orderQueue.poll();
            executor.execute(() -> fulfillOrder(order));
        }
        executor.shutdown();
    }

    private void fulfillOrder(Order order) {
        for (String productId : order.productIDs) {
            Product product = inventory.get(productId);
            if (product == null || !product.reduceStock(1)) {
                System.out.println("Failed: Product " + productId + " out of stock!");
                return;
            }
        }
        System.out.println("Order " + order.id + " processed successfully!");
    }

    public void displayInventory() {
        inventory.values().forEach(System.out::println);
    }
}
