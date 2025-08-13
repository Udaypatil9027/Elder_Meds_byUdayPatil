package ElderMeds_Controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ElderMeds_Models.CareTaker;
import ElderMeds_Models.Medicine;
import ElderMeds_Models.requests;
import ElderMeds_Dao.MedicineDao;
import ElderMeds_Dao.RequestDao;

@Controller
public class RequestController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	RequestDao requestDao = (RequestDao) context.getBean("requestDao");
	MedicineDao medDao = (MedicineDao) context.getBean("medicineDao");
	// Handle form submission from caretaker for medicine request
	
	@RequestMapping(value = "/RequestMedicine", method = RequestMethod.POST)
	public String submitRequest(HttpServletRequest request) {
	    try {
	        String medIdStr = request.getParameter("medicineId");
	        String caretakerIdStr = request.getParameter("caretakerContactId");
	        String quantityRequested = request.getParameter("quantityRequested");
	        String medicineName = request.getParameter("medicineName");

	        if (medIdStr == null || caretakerIdStr == null || quantityRequested == null || medicineName == null ||
	            medIdStr.trim().isEmpty() || caretakerIdStr.trim().isEmpty()) {
	            request.setAttribute("msg", "Missing data. Please try again.");
	            return "redirect:/View_MedicineCaretaker33";
	        }

	        int medicineId = Integer.parseInt(medIdStr);
	        long caretakerContactId = Long.parseLong(caretakerIdStr);

	        requests req = new requests();
	        req.setMedicineId(medicineId);
	        req.setCaretakerContactId(caretakerContactId);
	        req.setQuantityRequested(quantityRequested);
	        req.setMedicineName(medicineName);
	        req.setRequestDate(LocalDate.now().toString());
	        req.setStatus("Pending");

	        requestDao.insertRequest(req);

	        request.setAttribute("msg", "Request submitted successfully!");
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("msg", "Something went wrong.");
	    }

	    return "redirect:/View_MedicineCaretaker33";
	}
	
	@RequestMapping("/ViewRequestsByDonor22")
	public String viewRequestsByDonor22(@RequestParam("dcontact") String donorContactId, HttpServletRequest request) {
	    List<requests> allRequests = requestDao.getAllRequests();
	    List<Medicine> allMedicines =  medDao.getAllMedicine();

	    request.setAttribute("requests", allRequests);
	    request.setAttribute("medicines", allMedicines);
	    request.setAttribute("dcontact", donorContactId);

	    return "ViewRequestsByDonor22";  // JSP name without `.jsp`
	}

	@RequestMapping(value = "/updateRequestStatus", method = RequestMethod.POST)
	public String updateRequestStatus(HttpServletRequest request) {
	    try {
	        int requestId = Integer.parseInt(request.getParameter("requestId"));
	        String newStatus = request.getParameter("newStatus");

	        requests req = requestDao.getRequestById(requestId);
	        if (req != null) {
	            req.setStatus(newStatus);
	            requestDao.updateRequest(req);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    String dcontact = request.getParameter("dcontact");
	    return "redirect:/ViewRequestsByDonor22?dcontact=" + dcontact;

	}
}
