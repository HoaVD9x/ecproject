package dinhhoa.ecproject.Controllers;

import dinhhoa.ecproject.Daos.CategoryRepository;
import dinhhoa.ecproject.Daos.OrderRepository;
import dinhhoa.ecproject.Daos.ProductRepository;
import dinhhoa.ecproject.Daos.UserRepository;
import dinhhoa.ecproject.Models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AuthenticationController {
    @Autowired
    UserRepository userRepo;

    @Autowired
    ProductRepository productRepo;
    @Autowired
    CategoryRepository categoryRepo;

    @Autowired
    OrderRepository orderRepo;

    //login
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("login", new Login());
        return "authentication/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Login login, Model model, HttpSession session) throws Exception {
        List<Product> products = productRepo.getProducts();
        User user = userRepo.loadUserByUserName(login.getEmail());
        if (user == null){
            model.addAttribute("message", "メールアドレスを確認お願いします");
            model.addAttribute("login", new Login());
            return "authentication/login";
        }
        if (login.getPassword().equals(user.getPassword())) {
            if (user.getRole().equals("admin")) {
                model.addAttribute("user", user);
                session.setAttribute("user", user);
                List<Order> orders = orderRepo.findAll();
                model.addAttribute("orders", orders);

               return "admin/order_list";
            }
            model.addAttribute("user", user);
            model.addAttribute("products", products);
            session.setAttribute("user", user);
            return "index";
        } else {
            model.addAttribute("message", "パスワードを確認してください");
            return "authentication/login";
        }
    }

    // register
    @GetMapping("/register")
    public String register_user(Model model) {
        model.addAttribute("register", new User());
        return "authentication/register";
    }

    @PostMapping("/register")
    public String Register(@ModelAttribute User user, Model model,HttpSession session) {
        user.setRole("user");
        model.addAttribute("user", user);
        session.setAttribute("user", user);
        userRepo.save(user);

        return "redirect:/";
    }

    // user_edit
    @GetMapping("/edit_user")
    public String get_edit_user(@RequestParam int user_id, Model model) {
        User user = userRepo.getById(user_id);
        model.addAttribute("register", user);
        return "authentication/register";
    }

    @PostMapping("/edit_user")
    public String save_user(@ModelAttribute User user, Model model) {
        userRepo.save(user);
        model.addAttribute("message", "お客様の情報をアップデートしました。");
        return "user_detail";
    }

}
