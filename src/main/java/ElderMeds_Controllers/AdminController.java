package ElderMeds_Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ElderMeds_Dao.CareTakerDao;
import ElderMeds_Dao.DonorDao;
import ElderMeds_Dao.MedicineDao;
import ElderMeds_Dao.RequestDao;
import ElderMeds_Models.CareTaker;
import ElderMeds_Models.Donor;
import ElderMeds_Models.Medicine;
import ElderMeds_Models.requests;

@Controller
public class AdminController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Donor donor = (Donor) context.getBean("donor");
	DonorDao donorDao = (DonorDao) context.getBean("donorDao");

	CareTaker careTaker = (CareTaker) context.getBean("careTaker");
	CareTakerDao careTakerDao = (CareTakerDao) context.getBean("careTakerDao");
	RequestDao requestDao = (RequestDao) context.getBean("requestDao");
	
	MedicineDao medicineDao = (MedicineDao) context.getBean("medicineDao");
	// setter for XML injection
	public void setDonorDao(DonorDao donorDao) {
		this.donorDao = donorDao;
	}

	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	@RequestMapping("/index")
	public String openindex() {
		return "index";
	}

	@RequestMapping("/Add_Donor11")
	public String openDonorForm() {
		return "Add_Donor11";
	}

	@RequestMapping(value = "/submitdonor", method = RequestMethod.POST)
	public String saveDonor(HttpServletRequest request) {

		donor.setDname(request.getParameter("dname"));
		donor.setContactId(Long.parseLong(request.getParameter("dcontact")));
		donor.setDemail(request.getParameter("demail"));
		donor.setDpassword(request.getParameter("dpassword"));

		long i = donorDao.insertDonor(donor);

		if (i > 0) {
			return "Add_Donor11";
		} else {
			return "error";
		}

	}

	@RequestMapping("/Add_Caretaker11")
	public String openCareTakerform() {
		return "Add_Caretaker11";
	}

	@RequestMapping(value = "/submitcaretaker", method = RequestMethod.POST)
	public String saveCareTaker(HttpServletRequest request) {
		careTaker.setContId(Long.parseLong(request.getParameter("ccontact")));
		careTaker.setCemail(request.getParameter("cemail"));
		careTaker.setHomeName(request.getParameter("homeName"));
		careTaker.setName(request.getParameter("cname"));
		careTaker.setCpassword(request.getParameter("cpassword"));

		long j = careTakerDao.insertCaretaker(careTaker);

		if (j > 0) {
			return "Add_Caretaker11";
		} else {
			return "error";
		}
	}

	@RequestMapping("/Admin_Dashboard11")
	public String adminDashBoard() {
		return "Admin_Dashboard11";
	}

	// View all donors and caretakers
	@RequestMapping("/View_DonorsandCaretaker")
	public ModelAndView viewAllUsers() {
		List<Donor> donors = donorDao.getAllDonors();
		List<CareTaker> caretakers = careTakerDao.getAllCaretakers();

		ModelAndView mv = new ModelAndView("View_DonorsandCaretaker");
		mv.addObject("donors", donors);
		mv.addObject("caretakers", caretakers);
		return mv;
	}

	// Delete donor
	@PostMapping("/deletedonor")
	public String deleteDonor(HttpServletRequest request) {
		long contactId = Long.parseLong(request.getParameter("dcontact"));
		donorDao.deleteDonorByContact(contactId);
		return "redirect:/View_DonorsandCaretaker";
	}

	// Delete caretaker
	@PostMapping("/deletecaretaker")
	public String deleteCareTaker(HttpServletRequest request) {
		long contactId = Long.parseLong(request.getParameter("ccontact"));
		careTakerDao.deleteCaretakerByContact(contactId);
		return "redirect:/View_DonorsandCaretaker";
	}
	
	
	@RequestMapping("/View_MedicinDonation11")
	public String viewAllMedicines(Model model) {
	    List<Medicine> allMedicines = medicineDao.getAllMedicine();
	    model.addAttribute("medicines", allMedicines); 
	    return "View_MedicinDonation11";
	}


	
	@RequestMapping("/deleteDonorMedicine")
	public String deleteMedicine(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("medicineId"));
		medicineDao.deleteMedicineById(id);
		
		return "redirect:/View_MedicinDonation11";
	}
	
	
	
	@RequestMapping("/View_AllRequests_Admin")
	public String viewAllRequestsForAdmin(Model model) {
		List<requests> allRequests = requestDao.getAllRequests();
		model.addAttribute("allRequests", allRequests);
		return "View_AllRequests_Admin"; // JSP name
	}
}





















