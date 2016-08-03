package code.java.util;

import java.io.UnsupportedEncodingException;   
import java.text.DateFormat;   
import java.text.SimpleDateFormat;
import java.util.Date;   
   

import javax.servlet.http.HttpServletRequest;

public class ParamUtil { 
	   public static String getStringParameter(HttpServletRequest request, String name,   
	            String defaultStr) {   
	        try {   
	            request.setCharacterEncoding("utf-8");   
	        } catch (UnsupportedEncodingException ex) {
	        	ex.printStackTrace();
	        }   
	   
	        String temp = request.getParameter(name);

	        if (temp != null && !temp.equals("")) {
	        	return temp;
	        } else {
	            return defaultStr;
	        }   
	    }   
	   
	  
	    public static String[] getStringParameters(HttpServletRequest request, String name) {   
	        try {   
	            request.setCharacterEncoding("utf-8");   
	        } catch (UnsupportedEncodingException ex) {
	        	ex.printStackTrace();
	        }   
	        String[] temp = request.getParameterValues(name);
	        if (temp != null) {   
	            return temp;
	        } else {
	            return new String[0];   
	        }   
	    }   
	   
	    
	    public static boolean getBooleanParameter(HttpServletRequest request,   
	            String name) {   
	        return getBooleanParameter(request, name, false);
	    }   
	   
	    
	    public static boolean getBooleanParameter(HttpServletRequest request,   
	            String name, boolean defaultVal) {   
	        String temp = request.getParameter(name);   
	        if ("true".equals(temp) || "on".equals(temp)) {   
	            return true;   
	        } else if ("false".equals(temp) || "off".equals(temp)) {   
	            return false;   
	        } else {   
	            return defaultVal;   
	        }   
	    }   
	   
	  
	    public static int getIntAttribute(HttpServletRequest request, String name,   
	            int defaultNum) {   
	        String temp = (String) request.getAttribute(name);   
	        if (temp != null && !temp.equals("")) {   
	            int num = defaultNum;   
	            try {   
	                num = Integer.parseInt(temp);   
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }
	            return num;   
	        } else {   
	            return defaultNum;   
	        }   
	    }   
	   
	 
	    public static int getIntParameter(HttpServletRequest request, String name,   
	            int defaultNum) {   
	        String temp = request.getParameter(name);   
	        if (temp != null && !temp.equals("")) {   
	            int num = defaultNum;   
	            try {   
	                num = Integer.parseInt(temp);   
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }   
	            return num;   
	        } else {   
	            return defaultNum;   
	        }   
	    }   
	   
	
	    public static int[] getIntParameters(HttpServletRequest request,   
	            String name, int defaultNum) {   
	        String[] paramValues = request.getParameterValues(name);   
	        if (paramValues == null) {   
	            return null;   
	        }   
	        if (paramValues.length < 1) {   
	            return new int[0];   
	        }   
	        int[] values = new int[paramValues.length];   
	        for (int i = 0; i < paramValues.length; i++) {   
	            try {   
	                values[i] = Integer.parseInt(paramValues[i]);   
	            } catch (Exception e) {   
	                values[i] = defaultNum;
	                e.printStackTrace();
	            }   
	        }   
	        return values;   
	    }   
	   
	   
	    public static long getLongParameter(HttpServletRequest request,   
	            String name, long defaultNum) {   
	        String temp = request.getParameter(name);   
	        if (temp != null && !temp.equals("")) {
	            long num = defaultNum;
	            try {   
	                num = Long.parseLong(temp);   
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }   
	            return num;
	        } else {   
	            return defaultNum;   
	        }   
	    }   
	   
	   
	    public static long getLongAttribute(HttpServletRequest request,   
	            String name, long defaultNum) {   
	        String temp = (String) request.getAttribute(name);   
	        if (temp != null && !temp.equals("")) {   
	            long num = defaultNum;   
	            try {   
	                num = Long.parseLong(temp);   
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }   
	            return num;   
	        } else {   
	            return defaultNum;   
	        }   
	    }   
	   
	    
	    public static long[] getLongParameters(HttpServletRequest request,   
	            String name, long defaultNum) {   
	        String[] paramValues = request.getParameterValues(name);   
	        if (paramValues == null) {   
	            return null;   
	        }   
	        if (paramValues.length < 1) {   
	            return new long[0];   
	        }   
	        long[] values = new long[paramValues.length];   
	        for (int i = 0; i < paramValues.length; i++) {   
	            try {   
	                values[i] = Long.parseLong(paramValues[i]);   
	            } catch (Exception e) {   
	                values[i] = defaultNum;
	                e.printStackTrace();
	            }   
	        }   
	        return values;   
	    }   
	  
	    public static double getDoubleParameter(HttpServletRequest request,   
	            String name, double defaultNum) {   
	        String temp = request.getParameter(name);   
	        if (temp != null && !temp.equals("")) {   
	            double num = defaultNum;   
	            try {   
	                num = Double.parseDouble(temp);   
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }   
	            return num;   
	        } else {   
	            return defaultNum;   
	        }   
	    }
	    
	 
	    public static double[] getDoubleParameters(HttpServletRequest request,   
	            String name, double defaultNum) {   
	        String[] paramValues = request.getParameterValues(name);   
	        if (paramValues == null) {   
	            return null;   
	        }   
	        if (paramValues.length < 1) {   
	            return new double[0];   
	        }   
	        double[] values = new double[paramValues.length];   
	        for (int i = 0; i < paramValues.length; i++) {   
	            try {   
	                values[i] = Double.parseDouble(paramValues[i]);   
	            } catch (Exception e) {   
	                values[i] = defaultNum;
	                e.printStackTrace();
	            }   
	        }   
	        return values;   
	    }   
	   
	   
	    public static Date getDateParameter(HttpServletRequest request, String name) {   
	        String temp = request.getParameter(name);   
	        if(temp==null||temp==""){   
	            return null;   
	        }else{   
	             DateFormat df = DateFormat.getDateInstance();
	             Date date = null;   
	             try {   
	                 date = df.parse(temp);   
	             } catch (Exception e) {   
	                 e.printStackTrace(); 
	             }   
	             return date;
	        }    
	    }
	    
	    public static Date getFormatDateParameter(HttpServletRequest request, String name, String format) {   
	        String temp = request.getParameter(name);   
	        if(temp==null||temp==""){   
	            return null;   
	        }else{   
	        	SimpleDateFormat sdf = new SimpleDateFormat(format);
	             Date date = null;
	             try {   
	                 date = sdf.parse(temp);   
	             } catch (Exception e) {   
	                 e.printStackTrace(); 
	             }   
	             return date;
	        }    
	    }
}
