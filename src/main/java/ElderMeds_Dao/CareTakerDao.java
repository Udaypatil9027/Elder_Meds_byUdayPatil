package ElderMeds_Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import ElderMeds_Models.CareTaker;

public class CareTakerDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public long insertCaretaker(CareTaker careTaker){
		return (Long) hibernateTemplate.save(careTaker);
	}
	
	@Transactional
	public void deleteCaretakerByContact(long contactId) {
	    CareTaker ct = hibernateTemplate.get(CareTaker.class, contactId);
	    if (ct != null) {
	        hibernateTemplate.delete(ct);
	    }
	}

	public List<CareTaker> getAllCaretakers() {
	    return hibernateTemplate.loadAll(CareTaker.class);
	}

	
	public CareTaker getCareTakerByContact(long contId){
		return hibernateTemplate.get(CareTaker.class, contId);
	}
	
	
	@Transactional
	public void deleteCareTaker(long contId){
		CareTaker careTaker = hibernateTemplate.get(CareTaker.class, contId);
		
		if(careTaker != null){
			hibernateTemplate.delete(careTaker);
		}
	}
	
	
	
}
