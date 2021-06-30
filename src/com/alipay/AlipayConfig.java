package com.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117660681";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCQAcfhpFzVRWea3pu/tnBK44Sglk77zSDVNwdEfhbQDE60q9RgqB8G5/+NK/kY0tPylBab6jppZTpSpumWiug5aZ+j0W2+ErEfGs9XzlU/9lkgk3i0YNBcBZw5Kx1pWxPyvMrxRRsRhJXLPWT09dGYwYVDs9L5BPG2t25wPtiNtsBqZytOiPuGMn5QhauWw/tR8SOwxUR5nakGDYOS4QVG4ualKXjvYOEa60U4iInmcvDvJp2ObcNvXMLt2miLPgPq3AEEZGn7OWvY/UWv4tCv80AM2x2IaO44T4bYVXwZALr2U4Nq8/apDn6YgO68jRwhfF6ZOSbSmSaOc3cVPKM3AgMBAAECggEAemTZEsGUmTtc/DbZX07bD/th3O8DgGXu0ujrR153WyoqtsoYPnKFtGP4Qm8uTtfZhiIxOSERtkRwFpGAlQ/IogtQwHYedN8EJXCu620V7cAeLl7Ix15FmQC3r6siW0oqoTOutPNMN05d1hh/Nue61b8c2db7p+R44Bf1SHdRrNdty43KybuT03wDOdr7KLKkd4hkLPttbk8wXbtcX2QmxPLCBjNDUrmVUFCZ4J62DebURtyHCarLp3bbrGyLBtmnfbZF5kULCBgQXnyuDwDJjw8NoK3sl+utlBRM0YgImT42iNwTBZeO/WTyjqTnpDGQG11JqMhVNjdJPSbIKBrGWQKBgQDeCLeIm0WJzLxoZN5CVaDSD2uRb1GY/cLrC//iXO3RrV3tpZC+KQIjwbosqLc4fEKF6syfYsgfSLl6dM4rcLk2ujjitrLWewcx8uoUcp1DBtoYx9hk60wY/hDjkA7k6qT8+rOmvKXwgwHpYCJUDwuPKCym3RRRRzVto1kLWwhIQwKBgQCmCV8yAmGgw48x2c+7RDCiwzyxw4+X0s6ssRM7UulQnRMECJXCGKgeYi+9P4J1EnUNq3KyVzoNf541YUDkgolCDyW/K0eBI6WRrLGvtm+XEIlxiqj0v4HyTqyf2GbApjQk79U/1MsYlCQpEduZdGxWwpqRShJukuuH9cnqmqrT/QKBgQDXrMf63jjR/hoVncV30g2BfpESmHs+jWDFSMaqb3JjdnAC5AyRauw1J31c3BX9vFYyFz3kpOOX3+CrXsLV141R59pR/v4A8Uiv8DII4rx32zQHVjiQ7y7gKArnwYt2OadCRZQ0ppLZ6af1tfgihurHiFK3U5Dk0rLHaSCZszd8WQKBgGnfHflodVIqgJtb9M7HO2/9qCz9swkvXaPWQZoZUzaZAfAXfU7HpCPDngdBgPEftM3jnf5ECnti/cGx4swSxGz/9aTBdxXMYh3SjXaqkNs1qz5gGT3/A2A7dG10coizMhq/Zy4NhPeGNsyNW4atKwvjiOXN4pTpUBBg1MCooPcNAoGAcLIDyP6DNC2HZE1gf3wb51Ndw26C5/guMb2tTnnbPlHO3DMmj4UxlfwptqQ/r7yO6HcWk9Ql9dUHcyUGCugxEdKTCLsglkcIKa9Q+SVdK4oE2mNIl1T3EzhpxNMEhr0kbhAfyDpmEQ15qBQKOqOr/g1o5dj4AXY3EF0CBSahr70=";
    		
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlUORUB0iEUUKqZa9gan5kzjzwfNATsOkzx+4mMDj8muR554Iz9XOBFJxU7psLXKpWp10drzHP9f11h1lLtg9uqSHFjy7vW+5eo08/woEABPrBSiM+tJ0G1nyXju5V9CJpZgHzUEkLjEUE2CE1935rXY+QWTlSQtHQgxLD807A7t7FUpbkbYpEi1mF5pG1Tngoy5OMv/DLQUyoRz6lqrzkuBA29zvxw8o/vvfu/tgaeg65MsbxOEFBfKB6c++i7S6pqLe57ncq6EF9oy4ceuDQpJmZIYzBub9y3IhuvkakODCjUOk3cu+28QnCnvT8/7Ysln+dqiSuRx/htnVqHPLBQIDAQAB";
    
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://121.89.192.213:8080/wefly/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	
	public static String return_url = "http://121.89.192.213:8080/wefly/return_url.jsp";
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

