package ElderMeds_Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ElderMeds_Dao.CareTakerDao;
import ElderMeds_Dao.MedicineDao;
import ElderMeds_Dao.RequestDao;
import ElderMeds_Models.CareTaker;
import ElderMeds_Models.Medicine;
import ElderMeds_Models.requests;

@Controller
public class CareTakerController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	CareTaker careTaker = (CareTaker) context.getBean("careTaker");
	CareTakerDao careTakerDao = (CareTakerDao) context.getBean("careTakerDao");

	MedicineDao medicineDao = (MedicineDao) context.getBean("medicineDao");
	RequestDao requestDao = (RequestDao) context.getBean("requestDao");

	@RequestMapping("/CareTakerRegister33")
	public String RegisterCareTaker() {
		return "CareTakerRegister33";
	}

	@RequestMapping("/Caretaker_login33")
	public String LoginCareTaker() {
		return "Caretaker_login33";
	}

	@RequestMapping(value = "/caretakerregister", method = RequestMethod.POST)
	public String saveCareTaker(HttpServletRequest request) {
		careTaker.setContId(Long.parseLong(request.getParameter("ccontact")));
		careTaker.setCemail(request.getParameter("cemail"));
		careTaker.setHomeName(request.getParameter("homeName"));
		careTaker.setName(request.getParameter("cname"));
		careTaker.setCpassword(request.getParameter("cpassword"));

		long j = careTakerDao.insertCaretaker(careTaker);

		if (j > 0) {
			return "Caretaker_login33";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/caretakerlogin", method = RequestMethod.POST)
	public String Logincaretaker(HttpServletRequest request) {

		long contact = Long.parseLong(request.getParameter("contact"));
		String password = request.getParameter("cpass");

		careTaker = careTakerDao.getCareTakerByContact(contact);
		if (careTaker != null && careTaker.getCpassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCareTaker", careTaker);
			return "Caretaker_Dashboard33";
		} else {
			return "error";
		}

	}

	@RequestMapping("View_MedicineCaretaker33")
	public String viewAllMedicinect(Model model) {
		List<Medicine> allMedicines = medicineDao.getAllMedicine();
		model.addAttribute("medicines", allMedicines);
		return "View_MedicineCaretaker33";

	}

	@RequestMapping("/Caretaker_Dashboard33")
	public String CaretakerbackHome() {
		return "Caretaker_Dashboard33";
	}

	@RequestMapping("/logout_caretaker")
	public String logoutCareTaker(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "Caretaker_login33"; // redirect to login page
	}
	

	@RequestMapping("/ViewMyRequestCaretaker33")
	public String viewMyRequests(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession(false);
	    if (session == null || session.getAttribute("loggedCareTaker") == null) {
	        return "redirect:/Caretaker_login33";
	    }

	    CareTaker caretaker = (CareTaker) session.getAttribute("loggedCareTaker");
	    long contact = caretaker.getContId();

	    List<requests> myRequests = requestDao.getRequestsByCaretakerId(contact);
	    model.addAttribute("myRequests", myRequests);
	    return "ViewMyRequestCaretaker33";
	}




}
