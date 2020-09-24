package tvxq.borad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tvxq.borad.common.DBUtil;
import tvxq.borad.vo.RepleVO;


public class RepleDAO {
	public boolean addReple(RepleVO reple) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into reple (no, board_no, userrID, content) values(?,?,?,?)";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reple.getNo());
			ps.setInt(2, reple.getBoardNo());
			ps.setString(3, reple.getUserId());
			ps.setString(4, reple.getContent());

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public RepleVO getReple(int no) {
		RepleVO reple = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select no, board_no, userID, content from reple where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();

			if (rs.next()) {
				reple = new RepleVO();
				reple.setNo(rs.getInt(1));
				reple.setBoardNo(rs.getInt(2));
				reple.setUserId(rs.getString(3));
				reple.setContent(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		return reple;
	}
	
	public boolean updateReple(RepleVO reple) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "update reple set content=? where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, reple.getContent());
			ps.setInt(2, reple.getNo());

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public boolean deleteReple(int no) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "delete from reple where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
}
