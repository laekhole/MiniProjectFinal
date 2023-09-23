package com.kosa.project_final.member.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	
	private String id;
	private String pwd;
	private String uname;
	private String birth;
	private String gender;
	private String phone;
	private String email;
	
	private String [] ids;         // 삭제시 사용될 아이디들

	//검색필드
	private String searchTitle = "";
	
	
	// 로그인 - 비밀번호 일치여부
	public boolean isEqualsPwd(MemberDTO member) {
		return pwd.equals(member.getPwd());
	}
	
	
} // memberDTO


/*
 * //로그인 public MemberDTO(String id, String pwd) { this.id = id; this.pwd = pwd;
 * }
 * 
 * 
 * public MemberDTO(String id, String name, String pwd) { this.id = id;
 * this.name = name; this.pwd = pwd; }
 * 
 * public MemberDTO(String id, String name, String pwd, String phone) { this.id
 * = id; this.name = name; this.pwd = pwd; this.phone = phone; }
 * 
 * 
 * @Override public boolean equals(Object obj) { if (this == obj) return true;
 * if (obj == null) return false; if (getClass() != obj.getClass()) return
 * false; MemberDTO other = (MemberDTO) obj; return Objects.equals(id,
 * other.id); }
 * 
 * 
 * @Override public int hashCode() { return Objects.hash(id); }
 */
