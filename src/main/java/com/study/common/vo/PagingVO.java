package com.study.common.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

public class PagingVO implements Serializable {
	public static void main(String[] args) {
		PagingVO pagingVO=new PagingVO();
		pagingVO.setCurPage(3); // ROW는 기본적으로 한페이지당 10개
		// 1페이지 row 1~10		, 2페이지 row 11~20 , 13페이지 121~130
		// 13 페이지면 페이지는 11~20
		pagingVO.setTotalRowCount(36);
		// totalPage는 26

		// curPage = 26 으로 하면 firstRow 는 251 lastRow 251, firstPage 21, lastPage 26
		//
		pagingVO.pageSetting();
		System.out.println(pagingVO);
		
	}
	
	//입력받는 데이터
	private int curPage=1;           // 현재 페이지 번호
	private int rowSizePerPage=12;   // 한 페이지당 레코드 수      기본10
	private int pageSize=10;         // 페이지 리스트에서 보여줄 페이지 갯수  이거는 보통 10 or 5 안 변함
	private int totalRowCount ;      // 총 레코드 건수, pageSetting하기 전 DB조회함. 
	
	
	//입력받는 데이터를 통해 계산되는 값
	private int firstRow ;           // 시작 레크드 번호   
	private int lastRow;             // 마지막 레크드 번호 
	private int totalPageCount;      // 총 페이지 건수
	private int firstPage; 	         // 페이지 리스트에서 시작  페이지 번호 
	private int lastPage;            // 페이지 리스트에서 마지막 페이지 번호 
	
	
	
	
	//page계산
	public void pageSetting() {
		firstPage = ((curPage - 1)/ 10 * 10) + 1;
		firstRow = ((curPage-1) * rowSizePerPage) + 1;
		lastRow = ((curPage-1) * rowSizePerPage) + rowSizePerPage;

		totalPageCount = ((totalRowCount-1) / rowSizePerPage) + 1;
		lastPage = ((curPage-1) / pageSize * 10) + rowSizePerPage;

		if(lastPage > totalPageCount){
			lastPage = totalPageCount;
		}
		if(lastRow > totalRowCount){
			lastRow = totalRowCount;
		}

		

	}
	 @Override 
	  public String toString() {
		  return ToStringBuilder.reflectionToString(this,
				  ToStringStyle.MULTI_LINE_STYLE); 
		}
	
	
	
	
	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getRowSizePerPage() {
		return rowSizePerPage;
	}


	public void setRowSizePerPage(int rowSizePerPage) {
		this.rowSizePerPage = rowSizePerPage;
	}


	public int getFirstRow() {
		return firstRow;
	}


	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}


	public int getLastRow() {
		return lastRow;
	}


	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}


	public int getTotalRowCount() {
		return totalRowCount;
	}


	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}


	public int getTotalPageCount() {
		return totalPageCount;
	}


	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getFirstPage() {
		return firstPage;
	}


	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}


	public int getLastPage() {
		return lastPage;
	}


	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}



}
