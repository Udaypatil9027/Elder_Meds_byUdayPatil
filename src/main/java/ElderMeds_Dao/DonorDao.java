package ElderMeds_Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import ElderMeds_Models.Donor;

public class DonorDao {

    private HibernateTemplate hibernateTemplate;

    // setter for injection via XML
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Transactional
    public long insertDonor(Donor donor) {
        return (Long) hibernateTemplate.save(donor);
    }

    
    @Transactional
    public void deleteDonorByContact(long contactId) {
        Donor donor = hibernateTemplate.get(Donor.class, contactId);
        if (donor != null) {
            hibernateTemplate.delete(donor);
        }
    }

    public List<Donor> getAllDonors() {
        return hibernateTemplate.loadAll(Donor.class);
    }

    public Donor getDonorByContact(long contact) {
        return hibernateTemplate.get(Donor.class, contact);
    }

    @Transactional
    public void deleteDonor(long contact) {
        Donor donor = hibernateTemplate.get(Donor.class, contact);
        if (donor != null) {
            hibernateTemplate.delete(donor);
        }
    }
}
