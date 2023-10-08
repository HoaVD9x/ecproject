package dinhhoa.ecproject.Controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorsController implements ErrorController {

	@GetMapping("/error")
	public String handleError(HttpServletRequest request, @ModelAttribute("error") String error, Model m) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		if (status != null) {
			int statusCode = Integer.parseInt(status.toString());

			if (statusCode == 404) {
				m.addAttribute("title", "404 Not Found ");
				return "errors/404";
			}

		}
		m.addAttribute("title", "Something Went Wrong ");
		return "errors/500";

	}
}
