package idv.people.util;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class Image {

	private File image;
	private String imageFileName;
	
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
//	public String upload() {
//		
//		// Struts commons.io
//		FileUtils.copyFile(image, destFile);
//		
//	}
	
}
