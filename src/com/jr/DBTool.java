package com.jr;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class DBTool {
	/**
	 *  1    不和业务关联
	 *  2    方法通用性
	 *  3    方法简洁性方便使用
	 *  4   人性化返回值
	 * 
	 */
	
	
	//驱动
	private static final String DRVIER="com.mysql.jdbc.Driver";
	//数据库连接
	private static final String URL="jdbc:mysql://localhost:3306/wjsx";
	//用户
	private static final String USER="root";
	//密码
	private static final String PWD="123456";
	
	
	//创建全局的连接对象
	private static  Connection conn=null;
	
	
	/**
	   * 创建数据库连接
	 */
	private static void getConnection() {
		
		try {
			if(conn==null) {
				//加载驱动
				Class.forName(DRVIER);
				
				//创建连接
				conn=  DriverManager.getConnection(URL,USER,PWD);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int executeUpdateWithSqlAndParams(String sql,List<Object> params) {
		//调用创建连接方法
		getConnection();
		
		
		try {
			//创建句柄
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//设置参数
			if(params!=null) {
				for(int i=0;i<params.size();i++) {
					pstmt.setObject(i+1, params.get(i));
				}
			}
			
			//执行数据库
			int  rsult=pstmt.executeUpdate();
			return rsult;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	
	/**
	 * 判断数据是否存在
	 * @param sql 必须是    select count(*) num
	 * @param params 必须List列表
	 * @return 布尔类型是与否
	 * 
	 *  
	 */
	public static boolean isExistWithSqlAndParams(String sql,List<Object> params) {
		//调用创建连接方法
		getConnection();
		
		try {
			//创建句柄
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//设置参数
			if(params!=null) {
				for(int i=0;i<params.size();i++) {
					pstmt.setObject(i+1, params.get(i));
				}
			}
			
			//执行数据库
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("num")>0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	private static ResultSet executeQuery(String sql,List<Object> params) {
		//调用创建连接方法
		getConnection();
		
		try {
			//创建句柄
			PreparedStatement pstmt= conn.prepareStatement(sql);
			//设置参数
			if(params!=null) {
				for(int i=0;i<params.size();i++) {
					pstmt.setObject(i+1, params.get(i));
				}
			}
			
			//执行数据库
			ResultSet rs=pstmt.executeQuery();
			return rs;
		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
		
		
	
	
	

	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static <T> List<T> executeQueryWithSqlAndParams(String sql,List<Object> params,T  t) {
		//调用创建连接方法
		getConnection();
		
		
		//循环结果集，封装成T的列表集合
		ResultSet rs=executeQuery(sql, params);
		
		//定义一个集合
		List<T> list=new ArrayList<T>();
		
		//通过传入的对象反射出来原来的类
		Class<?> c=t.getClass();
		
		
		try {
			//遍历结果集
			while(rs.next()) {
				
				//创建一个对象
				@SuppressWarnings("unchecked")
				T obj=(T)c.newInstance();
				
				//获取这个类的所有属性
				Field [] fields=c.getDeclaredFields();
				for(Field f:fields) {
					
					//获取属性类型的简写 java.lang.String
					String ftype=f.getType().getSimpleName();
					//获取属性名
					String fname=f.getName();
					
					//全局的value
					Object value=null;
					
					if(ftype.equalsIgnoreCase("string")) {
						  value=rs.getString(fname);
					}else if(ftype.equalsIgnoreCase("int")) {
						  value=rs.getInt(fname);
					}else if(ftype.equalsIgnoreCase("float")) {
						  value=rs.getFloat(fname);
					}else if(ftype.equalsIgnoreCase("boolean")) {
						  value=rs.getBoolean(fname);
					}else if(ftype.equalsIgnoreCase("date")) {
						  value=rs.getDate(fname);
					}
					
					//将取出来的值放进obj
					//找到当前属性对应的set方法
					Method[] methods=c.getDeclaredMethods();
					for(Method m:methods) {
						//获取方法名字
						String mName=m.getName();
						//setname  getname setid getid
						//当前方法是不是set+fname
						if(mName.equalsIgnoreCase("set"+fname)) {
							//调用该set方法
							m.invoke(obj, value);
						}
						
					}
				}
				//++++++++++++++++++++
				list.add(obj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	 
		
	}
	
	
}
