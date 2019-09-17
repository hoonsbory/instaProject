package vo;

import java.util.HashMap;

public class EmpVO {
	int sal;
	String dname;
	
	
	public EmpVO(int sal, String dname) {
		this.sal = sal;
		this.dname = dname;
	}

	public EmpVO() {
		// TODO Auto-generated constructor stub
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	@Override
	public String toString() {
		return "EmpVO [sal=" + sal + ", dname=" + dname + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dname == null) ? 0 : dname.hashCode());
		result = prime * result + sal;
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
		EmpVO other = (EmpVO) obj;
		if (dname == null) {
			if (other.dname != null)
				return false;
		} else if (!dname.equals(other.dname))
			return false;
		if (sal != other.sal)
			return false;
		return true;
	}

}
