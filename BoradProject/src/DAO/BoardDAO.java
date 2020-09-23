package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAO.BoardVO;
import common.DBUtil;

public class BoardDAO {
	
//	public String getDate() {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "select reg_date from board";
//		try {
//			conn = DBUtil.getConnection();
//			ps = conn.prepareStatement(sql);
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				return rs.getString(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return ""; // 데이터베이스 오류
//	}
	
	public int getNext() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select board_no from board order by board_no desc";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫 번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String title, String userID, String content) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into board (board_no, userID, title, content, views, likes) values (?,?,?,?,?,?)";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, getNext()); // 1번은 게시물 번호여야 하니까 getNext()를 사용
			ps.setString(2, userID);
			ps.setString(3, title);
			ps.setString(4, content);
			ps.setInt(5, getViews());
			ps.setInt(6, getLikes());
			return ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int getViews() {
		return 1;
	}
	
	public int getLikes() {
		return 1;
	}
	
	public ArrayList<BoardVO> getList(int pageNumber){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from board where board_no < ? order by board_no desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>(); 
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoard_no(rs.getInt(1));
				board.setUserID(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setViews(rs.getInt(5));
				board.setLikes(rs.getInt(6));
				board.setReg_date(rs.getString(7));
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from board where board_no < ? order by board_no desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>(); 
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public BoardVO getBoard(int board_no) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from board where board_no = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoard_no(rs.getInt(1));
				board.setUserID(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setViews(rs.getInt(5));
				board.setLikes(rs.getInt(6));
				board.setReg_date(rs.getString(7));
				return board;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean updateBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "update board set title=?, content=?, views=?, likes=? where board_no=?";
		
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setInt(3, board.getViews());
			ps.setInt(4, board.getLikes());
			ps.setInt(5, board.getBoard_no());
			
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
