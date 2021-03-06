package com.dao;

import static com.util.common.Constants.RECRUITMENTSTATUSTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pojo.RecruitmentStatus;

public interface RecruitmentStatusDao {


	//查询
	@Select("select * from "+RECRUITMENTSTATUSTABLE+" ")
	List<RecruitmentStatus> selectAllRecruitmentStatus();

	@Select("select * from "+RECRUITMENTSTATUSTABLE+" where name like CONCAT('%',#{content},'%')")
	List<RecruitmentStatus> selectLikeAllRecruitmentStatus(String content);

	@Select("select * from "+RECRUITMENTSTATUSTABLE+" where id = #{id}")
	RecruitmentStatus get_Info(Integer id);
}
