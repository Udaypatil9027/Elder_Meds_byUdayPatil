package ElderMeds_Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="requests")
@Component
public class requests {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private long caretakerContactId;
	private String medicineName;
	private int medicineId;
	private String quantityRequested;
	private String requestDate;
	private String status = "pending";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getCaretakerContactId() {
		return caretakerContactId;
	}
	public void setCaretakerContactId(long caretakerContactId2) {
		this.caretakerContactId = caretakerContactId2;
	}
	//
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	//
	public int getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}
	//
	public String getQuantityRequested() {
		return quantityRequested;
	}
	public void setQuantityRequested(String quantityRequested) {
		this.quantityRequested = quantityRequested;
	}
	//
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	//
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}