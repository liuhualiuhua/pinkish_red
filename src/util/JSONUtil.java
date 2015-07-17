package util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class JSONUtil {
	public static JSONArray formatRsToJsonArray(ResultSet rs) throws Exception {

		ResultSetMetaData md = rs.getMetaData();
		int num = md.getColumnCount();

		JSONArray array = new JSONArray();
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			for (int i = 1; i <= num; i++) {
				Object o = rs.getObject(i);
				obj.put(md.getColumnName(i), rs.getObject(i));
			}
			array.add(obj);
		}

		return array;
	}

}
