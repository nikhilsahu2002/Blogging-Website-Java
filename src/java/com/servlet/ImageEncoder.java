/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import java.io.InputStream;
import java.sql.Blob;
import java.util.Base64;

/**
 *
 * @author NIKHIL
 */
public class ImageEncoder {
    public static String encodeImageToBase64(Blob blob) {
        try (InputStream inputStream = blob.getBinaryStream()) {
            byte[] bytes = new byte[(int) blob.length()];
            inputStream.read(bytes);
            return Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
