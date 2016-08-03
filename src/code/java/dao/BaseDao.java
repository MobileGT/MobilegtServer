package code.java.dao;

import java.io.Serializable;
import java.lang.reflect.*;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/**
 *
 * 描述：基本Dao类<br/>
 * 功能：封装了基本的和持久化方法，由其他dao类继承。<br/>
 * @author super deng
 * @version 2015-04-22
 * 
 * */
public class BaseDao<T, PK extends Serializable> {
	
	private static final Log log = LogFactory.getLog(BaseDao.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
	    return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 *
	 * 功能：保存单个实例<br/>
	 * @param T t
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Long save(final T t) {
		try{
			return (Long) this.getSessionFactory().getCurrentSession().save(t);
		}catch(DaoException e){
			log.error("保存 " + t.getClass().getName() + " 实例到数据库失败", e);
			throw e;
		}
	}
	
	/**
	 *
	 * 功能：保存单个实例<br/>
	 * @param String sql
	 * @return int 注意：executeUpdate()对于insert,delete,update,select都是0~多行操作，create,drop是0行，返回操作行数
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public int saveOrUpdate(final String sql) {
		try{
			return this.getSessionFactory().getCurrentSession().createSQLQuery(sql).executeUpdate(); 
		}catch(DaoException e){
			log.debug(sql);
			throw e;
		}
	}
	
	/**
	 *
	 * 功能：批量保存实例<br/>
	 * @param List<T> objs
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean batchSave(List<T> objs) throws DaoException {
		for(T t : objs){
			try{
				this.getSessionFactory().getCurrentSession().save(t);
			}catch(DaoException e){
				log.error("批量保存 " + t.getClass().getName() + " 实例到数据库失败", e);
				throw e;
			}
		}
		return true;
	}	

	/**
	 *
	 * 功能：删除实例<br/>
	 * @param T t
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean delete(final T t) {
		try{
			this.getSessionFactory().getCurrentSession().delete(t);
			return true;
		}catch(DaoException e){
			log.error("从数据中删除 " + t.getClass().getName() + " 实例失败", e);
			throw e;
		}
	}
	
	/**
	 *
	 * 功能：批量删除实例<br/>
	 * @param Class<T> entityClass
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean batchDelete(List<T> objs) throws DaoException {
		for(T t : objs){
			try{
				getSession().delete(t);
			}catch(DaoException e){
				log.error("批量从数据中删除 " + t.getClass().getName() + " 实例失败", e);
				throw e;
			}
		}
		return true;
	}
	
	/**
	 *
	 * 功能：根据id删除实例<br/>
	 * @param Class<T> entityClass
	 * @param PK id
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean deleteById(final Class<T> entityClass, final PK id) {
		try{
			getSession().delete(this.findById(entityClass, id));
			return true;
		}catch(DaoException e){
			log.error("根据主键删除 " + entityClass.getName() + " 实例失败", e);
			throw e;
		}
	}

	/**
	 *
	 * 功能：更新实例<br/>
	 * @param T t
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean update(final T t) {
		try{
			this.getSessionFactory().getCurrentSession().update(t);
			return true;
		}catch(DaoException e){
			log.error("更新 " + t.getClass().getName() + " 实例到数据库失败", e);
			throw e;
		}
	}
	
	
	/**
	 *
	 * 功能：批量更新实例<br/>
	 * @param List<T> objs
	 * @return boolean
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public Boolean batchUpdate(List<T> objs) throws DaoException {
		for(T t : objs){
			try{
				this.getSessionFactory().getCurrentSession().update(t);
			}catch(DaoException e){
				log.error("批量更新 " + t.getClass().getName() + " 实例到数据库失败", e);
				throw e;
			}
		}
		return true;
	}
	
	/**
	 *
	 * 功能：根据实例id查找实例<br/>
	 * @param Class<T> entityClass
	 * @param PK id
	 * @return T
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	public T findById(final Class<T> entityClass, final PK id) {
		T t = null;
		try{
			return (T) getSession().get(entityClass, id);
		}catch(DaoException e){
			log.error("根据主键ID查找 " + entityClass.getName() + " 实例失败", e);
			throw e;
		}
	}
	
	/**
	 *
	 * 功能：根据sql查找实例<br/>
	 * @param String sql
	 * @return List<Object[]>
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	@SuppressWarnings("unchecked")
	public List<Object[]> queryObjectsBySql(String sql) {
	   return (List<Object[]>) this.getSessionFactory().getCurrentSession().createSQLQuery(sql).list();
	}
	
	/**
	 *
	 * 功能：根据sql查找实例<br/>
	 * @param String sql
	 * @param Class<T> entityClass
	 * @return T
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	@SuppressWarnings("unchecked")
	public T queryTBySql(String sql, Class<T> entity) {
	   return (T) this.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity(entity).uniqueResult();
	}
	
	/**
	 *
	 * 功能：根据sql查找从start开始的limt条记录和总记录数<br/>
	 * @param String sql
	 * @param int start
	 * @param int limit
	 * @return Map<Object, Object>
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	@SuppressWarnings("unchecked")
	public Map<Object, Object> queryMapBySql(String sql, int start, int limit) {
		log.debug(sql);
		Map<Object, Object> map = new HashMap<Object, Object>();
		long total = queryCount(sql);//所有记录数；
		List<Map<Object, Object>> list = queryByPage(sql, start, limit);
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	/**
	 *
	 * 功能：根据sql查找实例集合总数<br/>
	 * @param String sql
	 * @return int
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public long queryCount(String sql) {
		sql=sql.toLowerCase();
		int select=sql.indexOf("select");
		int from =sql.indexOf("from");
		StringBuffer sb=new StringBuffer(sql);
		sb.replace(select+7, from-1, "count(*)");
		final String count=sb.toString();
		Object object = this.sessionFactory.getCurrentSession().createSQLQuery(count).uniqueResult();
		if(object == null){
			return 0;
		}
		return ((BigInteger) object).longValue();
	}
	
	/**
	 *
	 * 功能：根据sql查找从start开始的limt条记录<br/>
	 * @param String sql
	 * @param int start
	 * @param int limit
	 * @return List<Map<Object, Object>>
	 * @author super deng
	 * @version 2015-06-25
	 * 
	 * */
	@SuppressWarnings("unchecked")
	public List<Map<Object, Object>> queryByPage(String sql, int start,int limit) throws DaoException {
		return getSession().createSQLQuery(sql).setFirstResult(start).setMaxResults(limit).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();		
	}

	
}