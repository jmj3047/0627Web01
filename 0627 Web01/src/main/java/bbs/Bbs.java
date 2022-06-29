package bbs;

public class Bbs {
	private int bbsID;
    private String bbsTitle;
    private String writer;
    private String crDate;
    private String bbsContent;
    private int bbsAvailable;
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCrDate() {
		return crDate;
	}
	public void setCrDate(String crDate) {
		this.crDate = crDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
	
	@Override
	public String toString() {
		return "Bbs [bbsID=" + bbsID + ", bbsTitle=" + bbsTitle + ", writer=" + writer + ", crDate=" + crDate
				+ ", bbsContent=" + bbsContent + ", bbsAvailable=" + bbsAvailable + "]";
	}
    
    

}
