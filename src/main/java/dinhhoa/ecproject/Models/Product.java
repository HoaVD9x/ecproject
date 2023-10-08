package dinhhoa.ecproject.Models;


import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;

import java.util.Set;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false, unique = true)
    private int product_id;

    @Column(name = "product_name")
    private String product_name;

    @Column(name = "product_price")
    private int product_price;

    @Column(name = "product_description")
    private String product_description;

    @Column(name = "product_image_link")
    private String product_image_link;


    @Column(name = "quantity")
    private int quantity;


    @Column(name = "active")
    private boolean active = true;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    public Product() {
    }


    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public String getProduct_image_link() {
        return product_image_link;
    }

    public void setProduct_image_link(String product_image_link) {
        this.product_image_link = product_image_link;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
