package com.dao;

import static com.util.common.Constants.STATICIDTABLE;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.CreateStaticId;
public interface CreateStaticIdDao {


	@Select("select * from "+STATICIDTABLE+" ")
	CreateStaticId get_StaticId();


	@Update("update "+STATICIDTABLE+" set staticId=#{staticid} where staticId=#{staticid}"+"-1")
	void updata_staticId(@Param("staticid") Integer staticid);
}
