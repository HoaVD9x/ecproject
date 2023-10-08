package dinhhoa.ecproject.Controllers;

import dinhhoa.ecproject.Daos.OrderDetailReponsitory;
import dinhhoa.ecproject.Daos.OrderRepository;
import dinhhoa.ecproject.Models.Login;
import dinhhoa.ecproject.Models.Order;
import dinhhoa.ecproject.Models.OrderDetail;
import dinhhoa.ecproject.Models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.*;

@Controller
public class checkoutController {
    @Autowired
    OrderRepository orderRepo;

    @Autowired
    private OrderDetailReponsitory orderDetailRepo;
    @GetMapping("check_out")
    public String get_check_out ( Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user==  null){
            model.addAttribute("login", new Login());
            return "authentication/login";
        }
        HashMap<Integer, OrderDetail> orderDetail = (HashMap<Integer, OrderDetail>) session.getAttribute("orderSession");
        List<OrderDetail> orders = new ArrayList<>();
        for (Map.Entry<Integer, OrderDetail> entry :orderDetail.entrySet()){
            orders.add(entry.getValue());
        }
        Order order = new Order();
        order.setUser(user);
        order.setOrder_details(orders);
        order.setLocalDateTime(LocalDateTime.now());
        orderRepo.save(order);
        orders.forEach(e->{
            e.setOrder(order);
        });
        orderDetailRepo.saveAll(orders);


        model.addAttribute("user", user);
        model.addAttribute("order", new Order());
        model.addAttribute("message", "買い上げありがとございます");
        session.removeAttribute("totalQuantityOrderSession");
        session.removeAttribute("orderSession");
        return "redirect:/";
    }
}
