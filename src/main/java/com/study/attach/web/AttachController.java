package com.study.attach.web;


import com.study.attach.dao.IAttachDao;
import com.study.attach.service.IAttachService;
import com.study.attach.vo.AttachVO;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
public class AttachController {

    @Value("#{util['file.upload.path']}")
    private String uploadPath;

    @Inject
    IAttachDao attachDao;

    @Inject
    IAttachService attachService;

//     첨부파일 다운로드
//    @RequestMapping("/attach/download/{atchNo}")
//    public void download(@PathVariable("atchNo") int atchNo, HttpServletResponse response) throws IOException {
//        // 1. atchNo로 attachVO 찾기 - 파일경로, 파일이름, 원래이름, 크기 등등
//        AttachVO attach = attachDao.getAttach(atchNo);
//        // 2. attachVO(경로 + 이름)으로 파일찾기
//        String filePath = attach.getAtchPath();
//        String fileName = attach.getAtchFileName();
//        File file = new File(filePath, fileName);
//        // 3. response에 다운로드할 파일 추가
//        // 4. response에서는 '다운로드 하세요' 라는 header를 세팅하면 끝
//        response.setHeader("Content-Type", "application/octet-stream;");
//        String originFileName = new String(attach.getAtchOriginalName().getBytes("UTF-8"), "ISO-8859-1");
//        response.setHeader("Content-Disposition", "attachment;filename=\"" + attach.getAtchOriginalName() + "\";");
//        response.setHeader("Content-Transfer-Encoding", "binary;");
//        response.setContentLength((int) file.length()); // 진행율
//        response.setHeader("Pragma", "no-cache;");
//        response.setHeader("Expires", "-1;");
//
//        FileUtils.copyFile(file, response.getOutputStream());
//        response.getOutputStream().close();
//    }

    @RequestMapping("/attach/showImg.wow")
    public ResponseEntity<byte[]> getFile(String fileName, String filePath) throws IOException {
        File file = new File(filePath, fileName);
        System.out.println(file);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", Files.probeContentType(file.toPath()));
        ResponseEntity<byte[]> result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);

        return result;
    }
}
