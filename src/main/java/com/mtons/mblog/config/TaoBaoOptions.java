package com.mtons.mblog.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author tangqian
 * @date 2019-11-5
 */
@Configuration
@ConfigurationProperties(prefix = "taobao")
public class TaoBaoOptions {

    private String server_url;
    private String app_key;
    private String app_secret;
    private String ad_zone_id;
    private String device_encrypt;
    private String sort;

    public String getServer_url() {
        return server_url;
    }

    public void setServer_url(String server_url) {
        this.server_url = server_url;
    }

    public String getApp_key() {
        return app_key;
    }

    public void setApp_key(String app_key) {
        this.app_key = app_key;
    }

    public String getApp_secret() {
        return app_secret;
    }

    public void setApp_secret(String app_secret) {
        this.app_secret = app_secret;
    }

    public String getAd_zone_id() {
        return ad_zone_id;
    }

    public void setAd_zone_id(String ad_zone_id) {
        this.ad_zone_id = ad_zone_id;
    }

    public String getDevice_encrypt() {
        return device_encrypt;
    }

    public void setDevice_encrypt(String device_encrypt) {
        this.device_encrypt = device_encrypt;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
