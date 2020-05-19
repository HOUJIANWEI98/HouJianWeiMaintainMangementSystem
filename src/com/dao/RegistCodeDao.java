package com.dao;


import static com.util.common.Constants.REGISTCODETABLE;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.dao.provider.RegistCodeDynaSqlProvider;
import com.pojo.RegistCode;
public interface RegistCodeDao {

	@Select("select code from "+REGISTCODETABLE+" where code = #{code}")
	String get_Info(String code);

	@SelectProvider(type=RegistCodeDynaSqlProvider.class,method="insert_Code")
	void insert_Info(RegistCode registCode);
}
