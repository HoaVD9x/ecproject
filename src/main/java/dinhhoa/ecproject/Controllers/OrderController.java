package dinhhoa.ecproject.Controllers;

import dinhhoa.ecproject.Daos.OrderRepository;
import dinhhoa.ecproject.Daos.ProductRepository;
import dinhhoa.ecproject.Daos.UserRepository;
import dinhhoa.ecproject.Models.Order;
import dinhhoa.ecproject.Models.OrderDetail;
import dinhhoa.ecproject.Models.Product;
import dinhhoa.ecproject.Models.User;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.*;

@Controller
public class OrderController {

    @Autowired
    ProductRepository productRepo;

    @Autowired
    OrderRepository orderRepo;

    @Autowired
    UserRepository userRepo;

    @GetMapping("/add_order")
    public String add_order(HttpServletRequest request,
                           HttpSession httpSession,
                           Model model,
                           @RequestParam("product_id") int productId,
                           @RequestParam("quantity") int quantity) {

        HashMap<Integer, OrderDetail> order_detail = (HashMap<Integer, OrderDetail>) httpSession.getAttribute("orderSession");
        if (order_detail == null) {
            order_detail = new HashMap<>();
        }
        order_detail = add_order(productId, quantity, order_detail);
        httpSession.setAttribute("orderSession", order_detail);
        httpSession.setAttribute("totalOrderSession", order_detail.size());
        if (order_detail.isEmpty()) {
            httpSession.setAttribute("orderSession", null);
        }
        httpSession.setAttribute("totalPriceSession", totalPrice(order_detail));
        httpSession.setAttribute("totalQuantityOrderSession", totalQuantity(order_detail));
        model.addAttribute("size", totalQuantity(order_detail));

        List<Product> products = productRepo.getProducts();
        model.addAttribute("products", products);
        model.addAttribute("user", new User());

        return "index";
    }

    public HashMap<Integer, OrderDetail> add_order(int id, int quantity, HashMap<Integer, OrderDetail> orderDetail) {
        OrderDetail detail = new OrderDetail();
        Optional<Product> product = productRepo.findByProductId(id);
        if (product.isPresent() && orderDetail.containsKey(id)) {
            detail = orderDetail.get(id);
            detail.setQuantity(orderDetail.get(id).getQuantity() + quantity);
            detail.setTotalPrice(detail.getQuantity()*detail.getProduct().getProduct_price());
        } else {
            detail.setProduct(product.get());
            detail.setQuantity(quantity);
            detail.setTotalPrice(product.get().getProduct_price() * detail.getQuantity());
        }
        orderDetail.put(id, detail);
        return orderDetail;
    }

    public int totalQuantity(HashMap<Integer, OrderDetail> totalQuantity) {
        int totalQuantitys = 0;
        for (Map.Entry<Integer, OrderDetail> oderPayLoad : totalQuantity.entrySet()) {

            totalQuantitys += oderPayLoad.getValue().getQuantity();
        }
        return totalQuantitys;
    }

    public int totalPrice(HashMap<Integer, OrderDetail> totalPrice) {
        int mapValue = totalPrice.values().stream().map(s -> s.getTotalPrice()).reduce(0, (a, b) -> a + b);
        return mapValue;
    }

    @GetMapping("/view_order")
    public String viewOrder(Model model, HttpSession  httpSession) {
        model.addAttribute("user", new User());

        HashMap<Integer, OrderDetail> Orders = (HashMap<Integer, OrderDetail>) httpSession.getAttribute("orderSession");
        if (Orders == null) {
          model.addAttribute("message", "商品を追加してください");
        } else {
            List<OrderDetail> orders = new ArrayList<>();
            for (Map.Entry<Integer, OrderDetail> entry : Orders.entrySet() ){
                orders.add(entry.getValue());
            }
            model.addAttribute("orders", orders);
        }

        return "cart/index";
    }

    @GetMapping("/update_order")
    public String update_order (Model model,
                               @RequestParam("productId") int productId,
                               @RequestParam("quantity") int quantity,
                               HttpServletRequest request,
                               HttpSession httpSession) {
        HashMap<Integer, OrderDetail> orders = (HashMap<Integer, OrderDetail>) httpSession.getAttribute("orderSession");
        orders = update_order(productId, quantity, orders);
        httpSession.setAttribute("orderSession", orders);
        httpSession.setAttribute("totalOrderSession", orders.size());
        if (orders.isEmpty()) {
            httpSession.setAttribute("orderSession", null);
        }
        httpSession.setAttribute("totalPriceSession", totalPrice(orders));
        httpSession.setAttribute("totalQuantityOrderSession", totalQuantity(orders));
        return "redirect:" + request.getHeader("Referer");
    }

    public HashMap<Integer, OrderDetail> update_order(int id, int quantity, HashMap<Integer, OrderDetail> detailOrder) {
        OrderDetail order = new OrderDetail();

        if (detailOrder.containsKey(id)) {
            order = detailOrder.get(id);
            order.setQuantity(quantity);
            order.setTotalPrice(quantity * order.getProduct().getProduct_price());
        }
        detailOrder.put(id, order);
        return detailOrder;
    }

    @GetMapping("/delete_order")
    public String deleteOrder (@RequestParam("productId")int productId,
                               HttpSession httpSession,
                               HttpServletRequest request){
        HashMap<Integer, OrderDetail> Orders = (HashMap<Integer, OrderDetail>) httpSession.getAttribute("orderSession");
        Orders =  DeleteOrder(productId, Orders);
        httpSession.setAttribute("orderSession", Orders);
        if (Orders.size() == 0) {
            httpSession.setAttribute("orderSession", null);
        }
        httpSession.setAttribute("totalOrderSession", Orders.size());
        httpSession.setAttribute("totalPriceSession",  totalPrice(Orders));
        httpSession.setAttribute("totalQuantityOrderSession",  totalQuantity(Orders));
        return "redirect:" + request.getHeader("Referer");

    }
    public HashMap<Integer, OrderDetail> DeleteOrder(int id, HashMap<Integer, OrderDetail> detailOrder) {
        if (detailOrder != null) {
            if (detailOrder.containsKey(id)) {
                detailOrder.remove(id);
            }
        }
        return detailOrder;
    }
}
