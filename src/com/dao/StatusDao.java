package com.dao;


import static com.util.common.Constants.STATUSTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pojo.Status;
public interface StatusDao {
	//查询
	@Select("select * from "+STATUSTABLE+" ")
	List<Status> selectAllStatus();

	@Select("select * from "+STATUSTABLE+" where name like CONCAT('%',#{content},'%')")
	List<Status> selectLikeAllStatus(String content);

	@Select("select * from "+STATUSTABLE+" where id = #{id}")
	Status get_Info(Integer id);
}
