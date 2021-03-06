package com.dao.provider;

import com.pojo.PunchClock;
import org.apache.ibatis.jdbc.SQL;

import static com.util.common.Constants.PUNCHCLOCKTABLE;

public class PunchClockDynaSqlProvider {

    // 动态插入
    public String insert_PunchClock(PunchClock punchClock){

        return new SQL(){
            {
                INSERT_INTO(PUNCHCLOCKTABLE);
                if(punchClock.getId()!=null) {
                    VALUES("id", "#{id}");
                }
                if(punchClock.getUserId() != null){
                    VALUES("userId", "#{userId}");
                }
                if(punchClock.getDate()!= null){
                    VALUES("date", "#{date}");
                }
                if(punchClock.getSgin_status_id()!= null){
                    VALUES("sgin_status_id", "#{sgin_status_id}");
                }
            }
        }.toString();

    }

}
