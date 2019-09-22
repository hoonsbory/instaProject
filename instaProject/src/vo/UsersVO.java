package vo;

public class UsersVO {
	int id;
	String email;
	String password;
	String name;
	String img;
	
	public UsersVO() {
		super();
	}
	
	public UsersVO(String img) {
		super();
		this.img = img;
	}

	public UsersVO(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public UsersVO(String email, String password, String name) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
	}
	
	public UsersVO(int id, String email, String password, String name, String img) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.img = img;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "UsersVO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", img=" + img
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
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
		UsersVO other = (UsersVO) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
