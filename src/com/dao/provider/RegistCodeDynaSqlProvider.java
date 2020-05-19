package com.dao.provider;

import static com.util.common.Constants.REGISTCODETABLE;

import org.apache.ibatis.jdbc.SQL;

import com.pojo.RegistCode;

public class RegistCodeDynaSqlProvider {



	public String insert_Code(RegistCode registCode){
		return new SQL(){
			{
				INSERT_INTO(REGISTCODETABLE);
				if(registCode.getCode()!= null ){
					VALUES("code", "#{code}");
				}
			}
		}.toString();
	}
}
