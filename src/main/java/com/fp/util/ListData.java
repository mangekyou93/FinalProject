package com.fp.util;

import org.springframework.stereotype.Component;

@Component
public class ListData {
	private int curPage;
	private int perPage;
	private String kind;
	private String search;
	
	public ListData() {
		curPage = 1;
		kind = "title";
		search = "";
		this.perPage = 10;
	}
	
	public RowNum makeRow() {
		RowNum rowNum = new RowNum();
		
		rowNum.setStartRow((curPage-1)*perPage+1);
		rowNum.setLastRow(curPage*perPage);
		rowNum.setKind(kind);
		rowNum.setSearch(search);
		
		return rowNum;
	}
	
	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public Pager makePage(int totalCount) {
		Pager pager = new Pager();
		int perBlock = 5;
		
		//1. totalPage 구하기
		int totalPage = 0;
		
		if(totalCount % perPage == 0)
		{
			totalPage = totalCount / perPage;
		}
		else
		{
			totalPage = totalCount / perPage + 1;
		}
		
		//2. totalBlock 구하기
		int totalBlock = 0;
		
		if(totalPage % perBlock == 0)
		{
			totalBlock = totalPage / perBlock;
		}
		else
		{
			totalBlock = totalPage / perBlock + 1;
		}
		
		//3. curBlock 구하기
		int curBlock = 0;
		
		if(curPage % perBlock == 0)
		{
			curBlock = curPage / perBlock;
		}
		else
		{
			curBlock = curPage / perBlock + 1;
		}
		
		//4. startNum , lastNum 구하기
		int startNum = ((curBlock-1)*perBlock)+1;
		int lastNum = curBlock*perBlock;
		
		//5. curBlock이 마지막 block일때 lastNum 처리
		if(curBlock == totalBlock)
		{
			lastNum = totalPage;
		}
		
		pager.setKind(kind);
		pager.setSearch(search);
		pager.setCurBlock(curBlock);
		pager.setTotalBlock(totalBlock);
		pager.setStartNum(startNum);
		pager.setLastNum(lastNum);
		
		return pager;
	}
	
	public int getCurPage() {
		if(curPage==0){
			curPage=1;
		}
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public String getKind() {
		if(kind==null){
			kind="title";
		}
		return kind;
	}
	public void setKind(String kind) {
		if(kind==null){
			this.kind="title";
		}else {
			this.kind = kind;
		}
	}
	public String getSearch() {
		if(search==null){
			search="";
		}
		return search;
	}
	public void setSearch(String search) {
		if(search==null){
			this.search="";
		}else {
			this.search = search;
		}
	}
	
}
