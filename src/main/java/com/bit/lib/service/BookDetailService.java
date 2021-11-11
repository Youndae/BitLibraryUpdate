package com.bit.lib.service;

import java.util.List;

import com.bit.lib.dto.BookDetailDTO;

public interface BookDetailService {

	List<BookDetailDTO> bookDetail(int bookCode);

	int rentCount(String id);

}
