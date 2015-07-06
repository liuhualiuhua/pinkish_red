package dao;

import java.util.List;
import java.util.Map;

import entity.Note;
import entity.PageBean;
import entity.Users;

public interface NoteDao {
	/**
	 * ��ѯ�����¼(�����˵�)
	 */
	public List findOldNotes(PageBean pageBean, Note note, Map map);

	/**
	 * ��ѯ��������(һ���˵�)
	 */
	public List findNotes(PageBean pageBean, Note note, Map map);

	/**
	 * ��ѯ������������(һ���˵�)
	 */
	public int countNotes(PageBean pageBean, Note note, Map map);

	public int addNote(Note note);

	public int deleteNotesByIds(String delIds);

	public int updateNote(Note note);

	/**
	 * ���Ϊ�Ѷ�
	 */
	public int readNote(String delIds);

	/**
	 * ��ѯδ�������¼����
	 */
	public List unreadCount(Users currentUsers);

	/**
	 * ��ѯ��ʷ�����û��б�
	 */
	public List findFromList(Users currentUsers);

}
