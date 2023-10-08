/* This is Main Controller, here are every view that related to public url. */

package dinhhoa.ecproject.Controllers;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;


import dinhhoa.ecproject.Daos.CategoryRepository;
import dinhhoa.ecproject.Daos.ProductRepository;
import dinhhoa.ecproject.Daos.UserRepository;
import dinhhoa.ecproject.Models.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
public class MainController {

    /* Autowired */

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private CategoryRepository categoryRepo;

    @Autowired
    private ProductRepository productRepo;
    @Autowired
    HttpSession session;
    @GetMapping(value = {"/", "/home"})
    public String home(Model model) {
        List<Product> products = productRepo.getProducts();
        model.addAttribute("size", 0);
        model.addAttribute("user", new User());
        model.addAttribute("products", products);
        model.addAttribute("order", new Order());
        return "index";
    }

    @GetMapping("/detail_product")
    public  String get_product_detail (Model model, @RequestParam int product_id){
        Product product = productRepo.getById(product_id);
        model.addAttribute("user", new User());
        model.addAttribute("product", product);
        return "product/detail_product";
    }

}
