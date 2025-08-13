package ElderMeds_Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import ElderMeds_Models.Medicine;

public class MedicineDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Transactional 
	public int insertMedicine(Medicine medicine){
		return (Integer) hibernateTemplate.save(medicine);
	}
	
	public List<Medicine> getAllMedicine(){
		List<Medicine> allMedicine =  hibernateTemplate.loadAll(Medicine.class);
		
		return allMedicine;
	}
	
	public Medicine getMedicineById(int id){
		return hibernateTemplate.get(Medicine.class, id);
	}
	
	@Transactional
	public void deleteMedicine(Medicine medicine) {
		hibernateTemplate.delete(medicine);
	}
	
	@Transactional
	public void deleteMedicineById(int id) {
	    Medicine m = hibernateTemplate.get(Medicine.class, id);
	    if (m != null) {
	        hibernateTemplate.delete(m);
	    }
	}


}
