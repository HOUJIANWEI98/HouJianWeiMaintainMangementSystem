package com.dao;


import static com.util.common.Constants.EDUCATIONTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pojo.Education;
public interface EducationDao {
	//查询
	@Select("select * from "+EDUCATIONTABLE+" ")
	List<Education> selectAllEducation();

	@Select("select * from "+EDUCATIONTABLE+" where name like CONCAT('%',#{content},'%')")
	List<Education> selectLikeAllEducation(String content);

	@Select("select * from "+EDUCATIONTABLE+" where id = #{id}")
	Education get_Info(Integer id);
}
