package dinhhoa.ecproject.payLoad;

import dinhhoa.ecproject.Models.Category;
import org.springframework.web.multipart.MultipartFile;

public class Product_payLoad {
    private int product_id;
    private String product_name;
    private int product_price;
    private String product_description;
    private MultipartFile file_image;
    private int quantity;
    private boolean active = true;
    private Category category;
    private  String image_link;

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
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

    public MultipartFile getFile_image() {
        return file_image;
    }

    public void setFile_image(MultipartFile file_image) {
        this.file_image = file_image;
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
