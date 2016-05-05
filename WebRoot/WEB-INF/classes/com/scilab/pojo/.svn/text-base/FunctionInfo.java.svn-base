package com.scilab.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="tbl_function")
public class FunctionInfo {

	private Long funId;
	private Long userId;
	private String funName;
	private String funContent;
	private String funHelp;
	private String funExample;
	private Date saveTime;
	/**
	 * 0 未发布，1已发布
	 */
	private int funStatue;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="funId", nullable=false)
	public Long getFunId() {
		return funId;
	}
	public void setFunId(Long funId) {
		this.funId = funId;
	}
	@Column(nullable=false)
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	@Column(length=100,nullable=false)
	public String getFunName() {
		return funName;
	}
	public void setFunName(String funName) {
		this.funName = funName;
	}
	@Lob
	@Column(nullable=false, columnDefinition="blob")
	public String getFunContent() {
		return funContent;
	}
	public void setFunContent(String funContent) {
		this.funContent = funContent;
	}
	@Lob
	@Column(nullable=false, columnDefinition="blob")
	public String getFunHelp() {
		return funHelp;
	}
	public void setFunHelp(String funHelp) {
		this.funHelp = funHelp;
	}
	@Lob
	@Column(nullable=false, columnDefinition="blob")
	public String getFunExample() {
		return funExample;
	}
	public void setFunExample(String funExample) {
		this.funExample = funExample;
	}
	
	@Column(nullable=false)
	public Date getSaveTime() {
		return saveTime;
	}
	public void setSaveTime(Date saveTime) {
		this.saveTime = saveTime;
	}
	
	@Column(nullable=false)
	public int getFunStatue() {
		return funStatue;
	}
	public void setFunStatue(int funStatue) {
		this.funStatue = funStatue;
	}
	
}
