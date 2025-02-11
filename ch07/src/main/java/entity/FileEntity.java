package entity;

public class FileEntity {

	private int seq;
	private String title;
	private String name;
	private String oName;
	private String sName;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	
	@Override
	public String toString() {
		return "File [seq=" + seq + ", title=" + title + ", name=" + name + ", oName=" + oName + ", sName=" + sName
				+ "]";
	}
	
	
}
