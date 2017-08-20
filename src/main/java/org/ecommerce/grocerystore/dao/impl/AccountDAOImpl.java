package org.ecommerce.grocerystore.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.ecommerce.grocerystore.dao.AccountDAO;
import org.ecommerce.grocerystore.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

// Transactional for Hibernate
@Transactional
public class AccountDAOImpl implements AccountDAO {
   
    @Autowired
    private SessionFactory sessionFactory;

    //@Override
    public Account findAccount(String userName ) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("userName", userName));
        return (Account) crit.uniqueResult();
    }

}
