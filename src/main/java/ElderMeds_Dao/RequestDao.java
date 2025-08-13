package ElderMeds_Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;

import ElderMeds_Models.requests;

public class RequestDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Transactional
	public long insertRequest(requests req) {
		return (Integer) hibernateTemplate.save(req);

	}

	@Transactional
	public void deleteRequest(Long id) {
		requests req = hibernateTemplate.get(requests.class, id);
		if (req != null) {
			hibernateTemplate.delete(req);
		}
	}
	
	public List<requests> getRequestsByCaretakerId(long ctContact) {
	    DetachedCriteria criteria = DetachedCriteria.forClass(requests.class);
	    criteria.add(Restrictions.eq("caretakerContactId", ctContact));
	    return (List<requests>) hibernateTemplate.findByCriteria(criteria);
	}

	
	public List<requests> getAllRequests() {
		return hibernateTemplate.loadAll(requests.class);
	}

	public requests getRequestByContact(Long caretakerContactId) {
		return hibernateTemplate.get(requests.class, caretakerContactId);
	}
	
	public requests getRequestById(int id) {
	    return hibernateTemplate.get(requests.class, id);
	}

	@Transactional
	public void updateRequest(requests req) {
	    hibernateTemplate.update(req);
	}

}