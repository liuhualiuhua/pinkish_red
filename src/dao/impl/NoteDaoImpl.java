package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.NoteDao;
import entity.Note;
import entity.PageBean;
import entity.Users;

public class NoteDaoImpl extends BaseDao implements NoteDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findOldNotes(PageBean pageBean, Note note, Map map) {
		List list = new ArrayList();
		String sql = "select top " + pageBean.getRows()
				+ " * from NOTE where noteId not in (select top "
				+ pageBean.getStart() + " noteId from NOTE  where fromId="
				+ note.getFromId() + " and toId=" + note.getToId()
				+ " or toId=" + note.getFromId() + " and fromId="
				+ note.getToId() + "  order by noteId desc) and (fromId="
				+ note.getFromId() + " and toId=" + note.getToId()
				+ " or toId=" + note.getFromId() + " and fromId="
				+ note.getToId() + ") order by noteId desc";

		try {
			conn = super.getConn();
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Note n = new Note();
				n.setNoteId(rs.getInt(1));
				n.setFromId(rs.getInt(2));
				n.setFromName(rs.getString(3));
				n.setToId(rs.getInt(4));
				n.setToName(rs.getString(5));
				n.setContent(rs.getString(6));
				n.setPostTime(rs.getString(7));
				n.setReadSign(rs.getInt(8));

				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List findNotes(PageBean pageBean, Note note, Map map) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " * from NOTE where noteId not in(select top "
				+ pageBean.getStart() + " noteId from NOTE ");
		if (note.getToId() != 0) {
			sb.append(" and toId= " + note.getToId() + " ");
		}
		if (note.getFromId() != 0) {
			sb.append(" and fromId=" + note.getFromId() + " ");
		}
		if (note.getContent() != null) {
			sb.append(" and content like '%" + note.getContent() + "%' ");
		}
		if (note.getReadSign() != -1) {
			sb.append(" and readSign=" + note.getReadSign() + " ");
		}
		if (note.getNoteId() != 0) {
			sb.append(" and noteId=" + note.getNoteId() + " ");
		}
		if (note.getPostTime() != null) {
			sb.append(" and postTime > '" + note.getPostTime() + "' ");
		}
		if (map != null && !map.isEmpty() && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		sb.append(" order by noteId desc");
		sb.append(" ) ");
		if (note.getToId() != 0) {
			sb.append(" and toId= " + note.getToId() + " ");
		}
		if (note.getFromId() != 0) {
			sb.append(" and fromId=" + note.getFromId() + " ");
		}
		if (note.getContent() != null) {
			sb.append(" and content like '%" + note.getContent() + "%' ");
		}
		if (note.getReadSign() != -1) {
			sb.append(" and readSign=" + note.getReadSign() + " ");
		}
		if (note.getNoteId() != 0) {
			sb.append(" and noteId=" + note.getNoteId() + " ");
		}
		if (note.getPostTime() != null) {
			sb.append(" and postTime > '" + note.getPostTime() + "' ");
		}
		if (map != null && !map.isEmpty() && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		sb.append(" order by noteId desc");

		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Note n = new Note();
				n.setNoteId(rs.getInt(1));
				n.setFromId(rs.getInt(2));
				n.setFromName(rs.getString(3));
				n.setToId(rs.getInt(4));
				n.setToName(rs.getString(5));
				n.setContent(rs.getString(6));
				n.setPostTime(rs.getString(7));
				n.setReadSign(rs.getInt(8));

				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return list;
	}

	@Override
	public int countNotes(PageBean pageBean, Note note, Map map) {
		int total = 0;
		StringBuffer sb = new StringBuffer("select count(*) from NOTE ");
		if (note.getToId() != 0) {
			sb.append(" and toId= " + note.getToId() + " ");
		}
		if (note.getFromId() != 0) {
			sb.append(" and fromId=" + note.getFromId() + " ");
		}
		if (note.getContent() != null) {
			sb.append(" and content like '%" + note.getContent() + "%' ");
		}
		if (note.getReadSign() != -1) {
			sb.append(" and readSign=" + note.getReadSign() + " ");
		}
		if (note.getNoteId() != 0) {
			sb.append(" and noteId=" + note.getNoteId() + " ");
		}
		if (note.getPostTime() != null) {
			sb.append(" and postTime > '" + note.getPostTime() + "' ");
		}
		if (!map.isEmpty() && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return total;
	}

	@Override
	public int addNote(Note note) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into NOTE values(?,?,?,?,?,?,1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, note.getFromId());
			pstmt.setString(2, note.getFromName());
			pstmt.setInt(3, note.getToId());
			pstmt.setString(4, note.getToName());
			pstmt.setString(5, note.getContent());
			pstmt.setString(6, note.getPostTime());
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteNotesByIds(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from NOTE where noteId in (" + delIds + ") ";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int updateNote(Note note) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update NOTE set content=? where noteId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note.getContent());
			pstmt.setInt(2, note.getNoteId());
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int readNote(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update NOTE set readSign=0 where noteId in ("
					+ delIds + ") ";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public List unreadCount(Users currentUsers) {
		List list = new ArrayList();

		try {
			conn = super.getConn();
			String sql = "select count(*),fromId,fromName from NOTE where toId=? and readSign=1 group by fromId,fromName";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, currentUsers.getUserId());
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Note note = new Note();
				note.setToId(rs.getInt(1));
				note.setFromId(rs.getInt(2));
				note.setFromName(rs.getString(3));
				list.add(note);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public List findFromList(Users currentUsers) {
		List list = new ArrayList();

		try {
			conn = super.getConn();
			String sql = "select fromId,fromName from  NOTE where toId=? group by fromId,fromName";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, currentUsers.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Users u = new Users();
				u.setUserId(rs.getInt(1));
				u.setName(rs.getString(2));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

}
