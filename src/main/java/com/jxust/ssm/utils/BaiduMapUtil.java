package com.jxust.ssm.utils;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class BaiduMapUtil {

	public static String getAddress(String location) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String str = "";
		try {
			// 创建httpget.
			HttpGet httpget = new HttpGet("http://api.map.baidu.com/geocoder/v2/?callback=renderReverse&location="
					+ location + "&output=json&pois=1&ak=XiFYlQUERCmYwQt138GT76oPSpfp08d8");
			/* System.out.println("executing request " + httpget.getURI()); */
			// 执行get请求.
			CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				// 获取响应实体
				HttpEntity entity = response.getEntity();
				/*
				 * System.out.println("--------------------------------------");
				 * // 打印响应状态 System.out.println(response.getStatusLine());
				 */
				if (entity != null) {
					// 打印响应内容长度
					/*
					 * System.out.println("Response content length: " +
					 * entity.getContentLength());
					 */
					// 打印响应内容
					// System.out.println("Response content: " +
					// EntityUtils.toString(entity));

					String address = EntityUtils.toString(entity);
					String pre = "formatted_address";
					String suf = "business";
					/* System.out.println(address); */
					str = address.substring((address.indexOf(pre) + pre.length()), address.indexOf(suf));

				}
				/*
				 * System.out.println("------------------------------------");
				 */
			} finally {
				response.close();
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭连接,释放资源
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return str;
	}

	public static String getPositionTransfer(String location2) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String str = "";
		try {
			// 创建httpget.
			HttpGet httpget = new HttpGet("http://api.map.baidu.com/geoconv/v1/?coords=" + location2
					+ "&from=1&to=5&ak=XiFYlQUERCmYwQt138GT76oPSpfp08d8");
			/* System.out.println("executing request " + httpget.getURI()); */
			// 执行get请求.
			CloseableHttpResponse response = httpclient.execute(httpget);
			HttpEntity entity = response.getEntity();
			try {
				// 获取响应实体
				/*
				 * System.out.println("--------------------------------------");
				 * // 打印响应状态 System.out.println(response.getStatusLine());
				 */
				if (entity != null) {
					// 打印响应内容长度
					/*
					 * System.out.println("Response content length: " +
					 * entity.getContentLength());
					 */
					// 打印响应内容
					// System.out.println("Response content: " +
					// EntityUtils.toString(entity));
					String transferedAddress = EntityUtils.toString(entity);
					// str = transferedAddress;

					/* System.out.println("entity" + entity); */
					String pre = "x";
					String suf = "}]}";
					str = transferedAddress.substring((transferedAddress.indexOf(pre) + pre.length()),
							transferedAddress.indexOf(suf));

				}
				/*
				 * System.out.println("------------------------------------");
				 */
			} finally {
				response.close();
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭连接,释放资源
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return str;
	}

}
