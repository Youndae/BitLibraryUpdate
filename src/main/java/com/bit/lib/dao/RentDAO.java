package com.bit.lib.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.lib.dto.RentDTO;

public interface RentDAO {

	public List<RentDTO> getRentHistoryList(String id);

	public List<RentDTO> selectRentNow(String id);

	void bookRent(@Param("bookNo") String bookNo, @Param("id")String id);
	void bookstUpdate(String bookNo);
	void reserveCancel(String bookNo);
	public void renew(String bookNo);
	public void bookReturn(String bookNo);
	public void updateReserveFin(String bookNo);
}
