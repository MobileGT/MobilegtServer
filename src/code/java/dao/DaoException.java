package code.java.dao;

/**
* **********************************************************************************************************************************
* 创建<br/>
* 功能：DaoException类在Dao层继承RuntimeException，以便其他Dao层类调用它在本层立即进行异常处理，进而让上层代码异常检查有选择余地、统一异常处理风格、性能得到优化<br/>
* 作者： super deng<br/>
* 版本： 2015-08-13 12:00:00<br/>
* 
* **********************************************************************************************************************************
* 修改<br/>
* 描述：<br/>
* 作者：<br/>
* 版本：<br/>
* 
* **********************************************************************************************************************************
* */
public class DaoException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public DaoException() {
		super();
	}

	public DaoException(String message, Throwable cause) {
		super(message, cause);
	}

	public DaoException(String message) {
		super(message);
	}

	public DaoException(Throwable cause) {
		super(cause);
	}
}
