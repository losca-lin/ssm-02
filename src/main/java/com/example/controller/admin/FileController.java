package com.example.controller.admin;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.example.vo.R;
import com.example.vo.WangEditorItem;
import com.example.vo.WangEditorVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class FileController {

    @PostMapping("/upload")
    @ResponseBody
    public WangEditorVO upload(MultipartFile[] files) throws Exception {
        String endpoint = "https://oss-cn-hangzhou.aliyuncs.com";
        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
        String accessKeyId = "LTAI5tNUc1KMg8xH7tau7FLV";
        String accessKeySecret = "AhfzyMDYYojQ5qao3atlzXExKrC5LG";

        // 填写Bucket名称，例如examplebucket。
        String bucketName = "adopt-zuo";
        List<WangEditorItem> list = new ArrayList<>();
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        for (MultipartFile file : files) {
            String picName = UUID.randomUUID().toString();
            // 获取上传文件得元素得名称
            String fileName = file.getOriginalFilename();
            String substring = fileName.substring(fileName.lastIndexOf("."));
            String name = picName + substring;
            try {
                InputStream inputStream = file.getInputStream();
                ossClient.putObject(bucketName, name, inputStream);
                list.add(new WangEditorItem("https://adopt-zuo.oss-cn-hangzhou.aliyuncs.com/" + name, "", ""));
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ossClient != null) {
                    ossClient.shutdown();
                }
            }
        }

        return WangEditorVO.success(list);
    }

    @PostMapping("/upload2")
    @ResponseBody
    public R upload2(MultipartFile file) {
        String endpoint = "https://oss-cn-hangzhou.aliyuncs.com";
        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
        String accessKeyId = "LTAI5tNUc1KMg8xH7tau7FLV";
        String accessKeySecret = "AhfzyMDYYojQ5qao3atlzXExKrC5LG";

        // 填写Bucket名称，例如examplebucket。
        String bucketName = "adopt-zuo";
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        String picName = UUID.randomUUID().toString();
        // 获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        String name = picName + substring;
        try {
            InputStream inputStream = file.getInputStream();
            ossClient.putObject(bucketName, name, inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
            return R.ok(name);

        }
    }

// @PostMapping("/upload")
// @ResponseBody
// public String uploadPub(MultipartFile file) {
//     String picName = UUID.randomUUID().toString();
//     //获取上传文件得元素得名称
//     String fileName = file.getOriginalFilename();
//     String substring = fileName.substring(fileName.lastIndexOf("."));
//     String name = picName + substring;
//     String endpoint = "https://oss-cn-hangzhou.aliyuncs.com";
//     // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
//     String accessKeyId = "LTAI5t7rce8g8Rorg2izGPtC";
//     String accessKeySecret = "bBM26XoqmgSILuTAxXHdHLEZokHvPL";
//     // 填写Bucket名称，例如examplebucket。
//     String bucketName = "adopt-zuo";
//     // 创建OSSClient实例。
//     OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
//     file.getOriginalFilename();
//     try {
//         InputStream inputStream = file.getInputStream();
//         ossClient.putObject(bucketName, name, inputStream);
//     } catch (Exception e) {
//         e.printStackTrace();
//         return "";
//     }
//     finally {
//         if (ossClient != null) {
//             ossClient.shutdown();
//         }
//         return name;
//     }
// }

}
