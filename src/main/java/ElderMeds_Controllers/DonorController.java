package ElderMeds_Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ElderMeds_Dao.DonorDao;
import ElderMeds_Dao.MedicineDao;
import ElderMeds_Dao.RequestDao;
import ElderMeds_Models.Donor;
import ElderMeds_Models.Medicine;
import ElderMeds_Models.requests;

@Controller
public class DonorController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	
	Donor donor = (Donor) context.getBean("donor");
	DonorDao donorDao = (DonorDao) context.getBean("donorDao");
	
	Medicine medicine = (Medicine) context.getBean("medicine");
	
	MedicineDao medicineDao = (MedicineDao) context.getBean("medicineDao");

	RequestDao requestDao = (RequestDao) context.getBean("requestDao");
	
	@RequestMapping("/Medicine_Donate22")
	public String Medicinedonate(){
		return "Medicine_Donate22";
	}
	
	@RequestMapping("/DonorRegister22")
	public String RegisterDonor(){
		return "DonorRegister22";
	}
	
	@RequestMapping("/Donor_login22")
	public String LoginDonor(){
		return "Donor_login22";
	}
	
	@RequestMapping("/Donor_Dashboard22")
	public String DonorDashboard(){
		return "Donor_Dashboard22";
	}
	
	@RequestMapping(value="/registerdonor", method=RequestMethod.POST)
	public String saveDonor(HttpServletRequest request) {
         
        donor.setDname(request.getParameter("dname"));
        donor.setContactId(Long.parseLong(request.getParameter("dcontact")));
        donor.setDemail(request.getParameter("demail"));
        donor.setDpassword(request.getParameter("dpassword"));

        long i = donorDao.insertDonor(donor);
        
        if(i>0){
        	return "Donor_login22";
        }else{
        	return "error";
        }

    }
	
	@RequestMapping(value="/donorlogin", method=RequestMethod.POST)
	public String loginDonor(HttpServletRequest request){
		
		long dcontact = Long.parseLong(request.getParameter("dcontact"));
		String pass = request.getParameter("dpassword");
		
	
		donor = donorDao.getDonorByContact(dcontact);
		
		if(donor!=null && donor.getDpassword().equals(pass)){
			request.getSession().setAttribute("dcontact", String.valueOf(dcontact)); 
	        return "redirect:/Donor_Dashboard22";

		}else{
			return "Donor_login22";
		}
		
	}
	@RequestMapping(value="/medicinedonate", method=RequestMethod.POST)
	public String saveMedicine(HttpServletRequest request){
		int id=0;
		String contactId = request.getParameter("dcontact");
		String mname = request.getParameter("mname");
		String donatedate = request.getParameter("donationDate");
		String expiredate = request.getParameter("expiryDate");
		String quantity = request.getParameter("quantity");
		
		medicine.setId(id);
		medicine.setDonorContactId(contactId);
		medicine.setDonationDate(donatedate);
		medicine.setExpiryDate(expiredate);
		medicine.setMedicineName(mname);
		medicine.setQuantity(quantity);
		
		int k = medicineDao.insertMedicine(medicine);
		if(k>0){
			return "Medicine_Donate22";
		}
		else{
			return "error";
		}
	}
	
	@RequestMapping("/ViewDonation22")
	public String viewDonations(HttpServletRequest request, Model model) {
		  String dcontact = (String) request.getSession().getAttribute("dcontact");
		
		List<Medicine> allDonations = medicineDao.getAllMedicine();
		model.addAttribute("medicine", allDonations);
		model.addAttribute("dcontact", dcontact);

		return "ViewDonation22";
	}
	
	@RequestMapping("/deleteMedicine")
	public String deleteMedicine(HttpServletRequest request, Model model) {
		int medid = Integer.parseInt(request.getParameter("medId"));
		 String dcontact = (String) request.getSession().getAttribute("dcontact");

		Medicine med = medicineDao.getMedicineById(medid);
		if (med != null) {
			medicineDao.deleteMedicine(med);
		}

		List<Medicine> updatedList = medicineDao.getAllMedicine();
		model.addAttribute("medicine", updatedList);
		model.addAttribute("dcontact", dcontact);

		return "ViewDonation22";
	}
}






















