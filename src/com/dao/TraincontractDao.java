package com.dao;


import static com.util.common.Constants.TRAINCONTRACTTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pojo.Traincontract;
public interface TraincontractDao {
	//查询
	@Select("select * from "+TRAINCONTRACTTABLE+" ")
	List<Traincontract> selectAllTraincontract();

	@Select("select * from "+TRAINCONTRACTTABLE+" where name like CONCAT('%',#{content},'%')")
	List<Traincontract> selectLikeAllTraincontract(String content);


	@Select("select * from "+TRAINCONTRACTTABLE+" where id = #{id}")
	Traincontract get_Info(Integer id);



}
