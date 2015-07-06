package dao;

import java.util.List;
import java.util.Map;

import entity.Note;
import entity.PageBean;
import entity.Users;

public interface NoteDao {
	/**
	 * 查询聊天记录(两个人的)
	 */
	public List findOldNotes(PageBean pageBean, Note note, Map map);

	/**
	 * 查询聊天内容(一个人的)
	 */
	public List findNotes(PageBean pageBean, Note note, Map map);

	/**
	 * 查询聊天内容数量(一个人的)
	 */
	public int countNotes(PageBean pageBean, Note note, Map map);

	public int addNote(Note note);

	public int deleteNotesByIds(String delIds);

	public int updateNote(Note note);

	/**
	 * 标记为已读
	 */
	public int readNote(String delIds);

	/**
	 * 查询未读聊天记录数量
	 */
	public List unreadCount(Users currentUsers);

	/**
	 * 查询历史聊天用户列表
	 */
	public List findFromList(Users currentUsers);

}
