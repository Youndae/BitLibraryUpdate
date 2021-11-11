package com.bit.lib.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.lib.dto.ReserveListDTO;

public interface ReserveDAO {

		void insertReserve(@Param("id") String id, @Param("bookNo") String bookNo);
		void insertReserveup(String bookNo);
		
		List<ReserveListDTO> getReserveList(String id);
		
		void reserveCancel(String bookNo);
		void reserveCancelup(String bookNo);
		
}