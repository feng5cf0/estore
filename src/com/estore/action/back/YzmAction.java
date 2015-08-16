package com.estore.action.back;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;

import com.estore.util.YzmUtil;
import com.landicorp.core.action.BaseActionSupport;

public class YzmAction extends BaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String createYzm() throws Exception
	 {
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpServletResponse response =ServletActionContext.getResponse();
			response.setContentType("image/jpeg");
	        response.setHeader("Pragma","No-cache");
	        response.setHeader("Cache-Control","no-cache");
	        response.setDateHeader("Expires", 0);
	       
	        // 在内存中创建图象
	        int width=110, height=38;
	        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	        // 获取图形上下文
	        Graphics g = image.getGraphics();
	        //生成随机类
	        Random random = new Random();

	        // 设定背景色
	        g.setColor(getRandColor(200,250));
	        g.fillRect(0, 0, width, height);

	        //设定字体
	        g.setFont(new Font("Times New Roman",Font.PLAIN,35));

	        //画边框
	        //g.setColor(new Color());
	        //g.drawRect(0,0,width-1,height-1);

	        // 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
	        g.setColor(getRandColor(160,200));
	        for (int i=0;i<155;i++) {
	            int x = random.nextInt(width);
	            int y = random.nextInt(height);
	            int xl = random.nextInt(12);
	            int yl = random.nextInt(12);
	            g.drawLine(x,y,x+xl,y+yl);
	        }

	        // 取随机产生的认证码(6位数字)
	        String sRand="";
	        for (int i=0;i<4;i++)
	        {
//	        	String rand=RandomStringUtils.randomAlphanumeric(1);
	            String rand=RandomStringUtils.randomNumeric(1);
	            sRand+=rand;
	            // 将认证码显示到图象中
	            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
	            g.drawString(rand,28*i+4,30);
	        }
	       
	        YzmUtil.saveYzm(sRand,request.getSession().getId());
	       
	        // 图象生效
	        g.dispose();
	        ServletOutputStream responseOutputStream =response.getOutputStream();
	        // 输出图象到页面
	        ImageIO.write(image, "JPEG", responseOutputStream);
	        //以下关闭输入流！
	        responseOutputStream.flush();
	        responseOutputStream.close();
	  return null;
	 }
	 
	 /**
	  * 给定范围获得随机颜色
	  * @param fc
	  * @param bc
	  * @return
	  */
	 private Color getRandColor(int fc,int bc){
	        Random random = new Random();
	        if(fc>255) fc=255;
	        if(bc>255) bc=255;
	        int r=fc+random.nextInt(bc-fc);
	        int g=fc+random.nextInt(bc-fc);
	        int b=fc+random.nextInt(bc-fc);
	        return new Color(r,g,b);
	    }


}
