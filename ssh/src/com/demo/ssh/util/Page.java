package com.demo.ssh.util;

import java.util.List;

public class Page<T> {
	private int currentPage;
	private int pageSize;
	private int totalRow;
	private List<T> rows;
	private boolean isFirstPage;
	private boolean isLastPage;
	private String customizedHql;
	private int totalPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public boolean isLastPage() {
		return isLastPage;
	}

	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	public String getCustomizedHql() {
		return customizedHql;
	}

	public void setCustomizedHql(String customizedHql) {
		this.customizedHql = customizedHql;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totalRow=" + totalRow + ", rows=" + rows
				+ ", isFirstPage=" + isFirstPage + ", isLastPage=" + isLastPage
				+ ", customizedHql=" + customizedHql + ", totalPage="
				+ totalPage + "]";
	}

}
