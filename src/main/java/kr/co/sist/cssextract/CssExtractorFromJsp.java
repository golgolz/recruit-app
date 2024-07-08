package kr.co.sist.cssextract;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CssExtractorFromJsp {

    public static void main(String[] args) {
        String jspFileUrl = "https://doberman-ready-termite.ngrok-free.app/recruit-app/main/main.jsp";  // JSP ���� URL (���� ��� ����)
        String outputDirectory = "C:/dev/recruit-app/src/main/webapp/assets/css/main";// �ƿ�ǲ ���� ���� ��� (���� �ʿ�)
        String updatedJspFilePath = "C:/dev/recruit-app/src/main/webapp/main/main_updated.jsp"; // ������Ʈ ���� ���� ���+ ����� ���� (���� �ʿ�)
        String baseUrl = "https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/main/"; //CSS ���ϳ��� ���ҽ� ������ ��� ��θ� ���� ��η� ������ �� ���Ǵ� �⺻ URL
        //(CSS ���� ���� ��ο� ���ƾ� ��)

        try {
            // URL���� HTML �ε�
            Document doc = Jsoup.connect(jspFileUrl)
                                .timeout(60000) // Ÿ�Ӿƿ� ���� (60��)
                                .header("Content-Type", "text/html; charset=UTF-8")
                                .get();

            // CSS ���� ��ũ ����
            Elements links = doc.select("link[rel=stylesheet], link[as=style]");

            // ��� ���丮 ����
            File dir = new File(outputDirectory);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // CSS ���� �ٿ�ε� �� ����, ��ũ ����
            for (Element link : links) {
                String cssUrl = link.attr("href");
                String fileName = cssUrl.substring(cssUrl.lastIndexOf('/') + 1);
                File outputFile = new File(dir, fileName);

                // ���� �ٿ�ε�
                FileUtils.copyURLToFile(new URL(cssUrl), outputFile);
                System.out.println("Downloaded: " + cssUrl + " to " + outputFile.getAbsolutePath());

                // ���� ���� ���� Ȯ��
                if (outputFile.exists()) {
                    System.out.println("File exists: " + outputFile.getAbsolutePath());

                    // CSS ���� ������ ��� ���� �� ���ҽ� �ٿ�ε�
                    String cssContent = new String(Files.readAllBytes(outputFile.toPath()), StandardCharsets.UTF_8);
                    Pattern pattern = Pattern.compile("url\\(([^)]+)\\)");
                    Matcher matcher = pattern.matcher(cssContent);
                    while (matcher.find()) {
                        String resourceUrl = matcher.group(1).replace("\"", "").replace("'", "");
                        // ��� ��ο� ���� ��� ��� ó��
                        if (!resourceUrl.startsWith("http")) {
                            try {
                                // ���� ��Ʈ�� ����
                                String resourceFileName = resourceUrl.contains("?") ? resourceUrl.substring(resourceUrl.lastIndexOf('/') + 1, resourceUrl.indexOf('?')) : resourceUrl.substring(resourceUrl.lastIndexOf('/') + 1);
                                File resourceOutputFile = new File(dir, resourceFileName);

                                // ���ҽ� �ٿ�ε�
                                FileUtils.copyURLToFile(new URL(new URL(cssUrl), resourceUrl.split("\\?")[0]), resourceOutputFile);
                                System.out.println("Downloaded resource: " + resourceUrl + " to " + resourceOutputFile.getAbsolutePath());

                                // CSS ���� ����
                                String absoluteResourceUrl = baseUrl + resourceFileName;
                                cssContent = cssContent.replace(resourceUrl, absoluteResourceUrl);
                            } catch (IOException e) {
                                System.out.println("Failed to download resource: " + resourceUrl + " - " + e.getMessage());
                            }
                        }
                    }

                    // ������ CSS ���� ����
                    try (BufferedWriter cssWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputFile), StandardCharsets.UTF_8))) {
                        cssWriter.write(cssContent);
                    }
                } else {
                    System.out.println("File does not exist: " + outputFile.getAbsolutePath());
                }

                // ��ũ�� ���� ��η� ����
                String localCssPath = baseUrl + fileName;
                link.attr("href", localCssPath);
            }

            // ������ JSP ������ ���ο� ���Ͽ� ����
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(updatedJspFilePath), StandardCharsets.UTF_8))) {
                writer.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\"\r\n"
                        + "    pageEncoding=\"UTF-8\"%>\r\n");
                writer.write(doc.outerHtml());
            }
            System.out.println("Updated JSP file saved to: " + updatedJspFilePath);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
