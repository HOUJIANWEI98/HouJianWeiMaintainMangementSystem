package ahualy.neepu.dao;

import ahualy.neepu.pojo.PunchTime;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import static ahualy.neepu.util.common.Constants.PUNCHTIMETABLE;

public interface PunchTimeDao {

    @Select("select * from "+PUNCHTIMETABLE+" where id = 1")
    PunchTime getPt();

    @Update("update "+PUNCHTIMETABLE+" set am = #{am},pm = #{pm} where id = #{id}")
    void updatePt(@Param("am") String am, @Param("pm") String pm, @Param("id") Integer id);
}
