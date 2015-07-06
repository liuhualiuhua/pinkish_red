package util;

import java.util.List;

import entity.Note;

public class DeleteUtil {

	public static String delIds(List list) {
		StringBuffer delIds = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			Note note = (Note) list.get(i);
			delIds.append("," + note.getNoteId());
		}
		return delIds.toString().replaceFirst(",", "");
	}

}
