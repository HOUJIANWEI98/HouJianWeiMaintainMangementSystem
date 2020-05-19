package com.dao;

import static com.util.common.Constants.LEAVETYPETABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pojo.LeaveType;

public interface LeaveTypeDao {

	//查询
	@Select("select * from "+LEAVETYPETABLE+" ")
	List<LeaveType> selectAllLeaveType();

	@Select("select * from "+LEAVETYPETABLE+" where name like CONCAT('%',#{content},'%')")
	List<LeaveType> selectLikeAllLeaveType(String content);

	@Select("select * from "+LEAVETYPETABLE+" where id = #{id}")
	LeaveType get_Info(Integer id);

}
