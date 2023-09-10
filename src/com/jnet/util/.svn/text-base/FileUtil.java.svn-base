package com.jnet.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;

public class FileUtil {
	/**
	 * 디렉토리내의 하위 폴더 및 파일 모두 삭제
	 * 
	 * @param file
	 *            file
	 */
	public static void deleteAllFile(File file) {
		if (file.isDirectory()) {
			if (file.listFiles().length != 0) {
				File[] fileList = file.listFiles();
				for (int i = 0; i < fileList.length; i++) {
					// 디렉토리이고 서브 디렉토리가 있을 경우 리커젼을 한다...
					deleteAllFile(fileList[i]);
					file.delete();
				}
			} else {
				// 파일 트리의 리프까지 도달했을때 삭제...
				file.delete();
			}
		} else {
			// 파일 일 경우 리커젼 없이 삭제...
			file.delete();
		}
	}

	public static void filDown(HttpServletRequest request,
			HttpServletResponse response, String filePath, String rltFilNm,
			String fileNm) throws IOException {
		String dftFilePath = CommonUtil.getRealRootPath(request);
		// /////////// 추후에는 File.separator 하나만.. /////////////
		String sepa = "";
		if (CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) {
			sepa = File.separator + File.separator;
		} else {
			sepa = File.separator;
		}
		File file = new File(dftFilePath
				+ filePath.substring(1).replaceAll("/", sepa) + rltFilNm);
		if (file.exists() && file.isFile()) {
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(fileNm, browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null)
				fis.close();
			out.flush();
			out.close();
		}
	}

	private static String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}

	private static String getDisposition(String filename, String browser)
			throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
					"\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename =

			"\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename =

			"\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new RuntimeException("Not supported browser");
		}

		return dispositionPrefix + encodedFilename;
	}

	public static boolean mkThumbNail(File src, File dest, int width, int height)
			throws IOException {
		// 이미지 객체 생성
		BufferedImage srcImg = ImageIO.read(src);
		BufferedImage destImg = new BufferedImage(width, height,
				BufferedImage.TYPE_3BYTE_BGR);

		// 렌더링
		Graphics2D g = destImg.createGraphics();
		g.drawImage(srcImg, 0, 0, width, height, null);

		// 출력
		return ImageIO.write(destImg, "jpg", dest);
	}
}
