package dinhhoa.ecproject.Controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import dinhhoa.ecproject.Daos.CategoryRepository;
import dinhhoa.ecproject.Daos.OrderRepository;
import dinhhoa.ecproject.Daos.ProductRepository;
import dinhhoa.ecproject.Daos.UserRepository;
import dinhhoa.ecproject.Models.*;
import dinhhoa.ecproject.payLoad.Product_payLoad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private CategoryRepository categoryRepo;

    @Autowired
    private OrderRepository orderRepo;

    //    @Value("${static.file.location}")
//    private String staticResource;
    private static final String UPLOAD_DIR = "src/main/resources/static/images/";

    @GetMapping(value = {"/", "/home"})
    public String home_admin(Model model) {
        model.addAttribute("login", new Login());
        return "authentication/login";
    }


    @GetMapping("/all_user")
    public String get_all_user(Model model) {
        List<User> users = userRepo.getUsers();
        model.addAttribute("users", users);
        return "admin/user/user_list";
    }

    // user
    @GetMapping("edit_user")
    public String edit_admin_user(Model model, @RequestParam("user_id") int user_id) {
        User user = userRepo.getById(user_id);
        model.addAttribute("register", user);
        return "authentication/register";
    }

    @PostMapping("update_user")
    public String update_user(Model model, @ModelAttribute User user) {
        User user1 = userRepo.loadUserByUserName(user.getEmail());
        user1.setFull_name(user.getFull_name());
        user1.setUser_name(user.getUser_name());
        user1.setEmail(user.getEmail());
        user1.setPassword(user.getPassword());
        userRepo.save(user1);
        if (user1.getRole().equals("admin")) {
            model.addAttribute("message", "ユーザー :" + user.getUser_name() + " を修正しました。");
            return "admin/index";
        } else {
            model.addAttribute("message", "ユーザー :" + user.getUser_name() + " を修正しました。");
            model.addAttribute("register", user);
            return "authentication/register";
        }
    }


    // category
    @GetMapping("/all_category")
    public String get_all_category(Model model) {
        List<Category> categories = categoryRepo.getCategories();
        model.addAttribute("categories", categories);
        return "admin/category/category_list";
    }

    @GetMapping("/new_category")
    public String get_new_category(Model model) {
        model.addAttribute("category", new Category());
        return "admin/category/category_new";
    }

    @GetMapping("/edit_category")
    public String edit_category(Model model, @RequestParam("category_id") int category_id) {
        Category category = categoryRepo.getById(category_id);
        model.addAttribute("category", category);
        return "admin/category/category_new";
    }

    @GetMapping("/delete_category")
    public String delete_category(Model model, @RequestParam("category_id") int category_id) {
        Category category = categoryRepo.getById(category_id);
        category.setActive(false);
        categoryRepo.save(category);
        model.addAttribute("message", "カテゴリー : " + category.getCategory_name() + " を消しました !");
        List<Category> categories = categoryRepo.getCategories();
        model.addAttribute("categories", categories);
        return "admin/category/category_list";
    }

    @PostMapping("/update_category")
    public String update_category(@ModelAttribute Category category, Model model) {
        categoryRepo.save(category);
        model.addAttribute("message", "カテゴリー : " + category.getCategory_name() + " を修正しました !");
        List<Category> categories = categoryRepo.getCategories();
        model.addAttribute("categories", categories);
        return "admin/category/category_list";
    }

    @PostMapping("/new_category")
    public String save_new_category(@ModelAttribute Category category, Model model) {
        categoryRepo.save(category);
        model.addAttribute("message", "新しカテゴリを追加しました。");
        model.addAttribute("category", new Category());
        return "admin/category/category_new";
    }


    //product
    @GetMapping("/all_product")
    public String get_all_product(Model model) {
        List<Product> products = productRepo.getProducts();
        model.addAttribute("products", products);
        return "admin/product/product_list";
    }


    @GetMapping("/new_product")
    public String get_new_product(Model model) {
        List<Category> categories = categoryRepo.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("product", new Product_payLoad());
        return "admin/product/product_new";
    }

    @GetMapping("/edit_product")
    public String edit_product(Model model, @RequestParam("productId") int productId) {
        Product product1 = productRepo.getById(productId);
        Product_payLoad product_payLoad = new Product_payLoad();
        product_payLoad.setProduct_id(product1.getProduct_id());
        product_payLoad.setProduct_name(product1.getProduct_name());
        product_payLoad.setProduct_price(product1.getProduct_price());
        product_payLoad.setProduct_description(product1.getProduct_description());
        product_payLoad.setImage_link(product1.getProduct_image_link());
        List<Category> categories = categoryRepo.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("product", product_payLoad);
        return "admin/product/product_new";
    }

    @GetMapping("delete_product")
    public String delete_product(Model model, @RequestParam("product_id") int product_id) {
        Product product = productRepo.getById(product_id);
        product.setActive(false);
        productRepo.save(product);
        model.addAttribute("message", "商品 : " + product.getProduct_name() + "　を消しました！");
        return "admin/product/product_list";
    }

    @PostMapping("/new_product")
    public String save_product(@ModelAttribute Product_payLoad product_payLoad, HttpServletRequest request, Model model) {
        Product product = new Product();
        List<Category> categories = categoryRepo.getCategories();
        product.setProduct_id(product_payLoad.getProduct_id());
        product.setProduct_name(product_payLoad.getProduct_name());
        product.setProduct_price(product_payLoad.getProduct_price());
        product.setProduct_description(product_payLoad.getProduct_description());
        product.setQuantity(product_payLoad.getQuantity());
        product.setCategory(product_payLoad.getCategory());
        product.setProduct_image_link(save_image(product_payLoad, request));
        productRepo.save(product);
        model.addAttribute("message", "新商品を追加しました。");
        model.addAttribute("product", new Product_payLoad());
        model.addAttribute("categories", categories);
        return "admin/product/product_new";
    }

    @PostMapping("/update_product")
    public String update_product(@ModelAttribute Product_payLoad product_payLoad, Model model, HttpServletRequest request) {
        List<Product> products = productRepo.getProducts();
        Product product = new Product();
        product.setProduct_id(product_payLoad.getProduct_id());
        product.setProduct_name(product_payLoad.getProduct_name());
        product.setProduct_price(product_payLoad.getProduct_price());
        product.setProduct_description(product_payLoad.getProduct_description());
        product.setQuantity(product_payLoad.getQuantity());
        product.setCategory(product_payLoad.getCategory());
        product.setProduct_image_link(save_image(product_payLoad, request));
        productRepo.save(product);
        model.addAttribute("message", "商品 : " + product.getProduct_name() + "を修正しました。");
        model.addAttribute("products", products);
        return "admin/product/product_list";
    }

    private String save_image(Product_payLoad product_payLoad, HttpServletRequest request) {
        String link_image;
        try {
            String fileName = StringUtils.cleanPath(product_payLoad.getFile_image().getOriginalFilename());

            // Define the file path where you want to save the image
            Path filePath = Paths.get(UPLOAD_DIR + fileName);

            // Copy the file to the target location
            Files.copy(product_payLoad.getFile_image().getInputStream(), filePath);
            String uri =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            link_image= uri.concat("/images/"+fileName+"");
            return link_image;
        } catch (IOException e) {
            e.printStackTrace();
            return "message";
        }
    }

    @GetMapping("/all_order")
    public String all_order(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null){
            model.addAttribute("login", new Login());
            return "authentication/login";
        }
        List<Order> orders = orderRepo.findAll();
        model.addAttribute("orders", orders);
        model.addAttribute("user", user);
        return "admin/order_list";
    }


}
