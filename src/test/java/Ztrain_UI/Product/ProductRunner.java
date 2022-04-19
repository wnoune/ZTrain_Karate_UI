package Ztrain_UI.Product;

import com.intuit.karate.junit5.Karate;

public class ProductRunner {
    @Karate.Test
    Karate testUser() {
        return Karate.run().relativeTo(getClass());
    }
}