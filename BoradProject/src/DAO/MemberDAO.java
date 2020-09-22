package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	static final String url = "jdbc:mysql://127.0.0.1:3306/dongjindb?serverTimezone=UTC";
	static final String user = "dongjin";
	static final String password = "dongjinpw";

	// 로그인을 시도하는 함수
	public int login(String userID, String userPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, userID);
			rs = ps.executeQuery();

			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}
	
	// 회원가입
	public int join(MemberVO member) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			String SQL = "INSERT INTO USER (userID, userPassword, userName, userGender, userEmail) VALUES (?,?,?,?,?)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, member.getUserID());
			ps.setString(2, member.getUserPassword());
			ps.setString(3, member.getUserName());
			ps.setString(4, member.getUserGender());
			ps.setString(5, member.getUserEmail());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
}
