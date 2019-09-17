package vo;

import java.sql.Date;

public class Board {
//	seq number(5) constraint board_seq_pk primary key,
//	title varchar2(100) constraint title_not_null not null,
//	content varchar2(1000),
//	regdate date default sysdate,
//	cnt number(5) default 0,
//	id varchar2(10) constraint id_fk references users
//);
	
	int seq;
	String title;
	String content;
	Date regdate;
	int cnt;
	String id;
	public Board( String title, String content,   String id) {
		super();
		
		this.title = title;
		this.content = content;
		
		
		this.id = id;
	}
	public Board( int seq, String title, String id, Date regdate,   int cnt) {
		super();
		
		this.title = title;
		this.seq = seq;
		this.cnt = cnt;
		this.id = id;
		this.regdate = regdate;
	}
	
	public Board(int seq, String title, String content, String id) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cnt;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + seq;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Board other = (Board) obj;
		if (cnt != other.cnt)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (seq != other.seq)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Board [seq=" + seq + ", title=" + title + ", regdate=" + regdate + ", cnt="
				+ cnt + ", id=" + id + "]";
	}
	
	
	
	
}
