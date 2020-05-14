package ahualy.neepu.dao;

import static ahualy.neepu.util.common.Constants.JOBTYPETABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import ahualy.neepu.pojo.JobType;;

public interface JobTypeDao {

	//查询
	@Select("select * from "+JOBTYPETABLE+" ")
	List<JobType> selectAllJobType();
	
	@Select("select * from "+JOBTYPETABLE+" where name like CONCAT('%',#{content},'%')")
	List<JobType> selectLikeAllJobType(String content);

	@Select("select * from "+JOBTYPETABLE+" where id = #{id}")
	JobType get_Info(Integer id);
}
