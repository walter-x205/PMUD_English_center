package websiteEnglishCenter.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import websiteEnglishCenter.dao.ContactDAO;
import websiteEnglishCenter.dto.ContactModel;

@Controller
public class ContactController {
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String getContactModel(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		ContactModel contactModel = new ContactModel();
		model.addAttribute("contactModel", contactModel);
		return "user/contact";

	}
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String postContactModel(final ModelMap model
			, final HttpServletRequest request
			, final HttpServletResponse response) throws IOException {
		ContactModel contactModel = new ContactModel();
		model.addAttribute("contactModel", contactModel);
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String message = request.getParameter("message");
		System.out.println(fullname+email+phone+address+message);
		ContactDAO contactDAO =new ContactDAO();
		contactDAO.insertContactModel(fullname, phone, email, address, message);
		
		model.addAttribute("advertise","Cảm ơn bạn đã liên hệ với chúng tôi!");
		return "user/contact";

	}
}
