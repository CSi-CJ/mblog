package com.mtons.mblog.web.controller.taobao;

import com.mtons.mblog.config.TaoBaoOptions;
import com.mtons.mblog.web.controller.BaseController;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.request.TbkDgMaterialOptionalRequest;
import com.taobao.api.response.TbkDgMaterialOptionalResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author tangqian
 * @date 2019-11-5
 */

@Controller
@RequestMapping("/taobao")
public class TuiGuangController extends BaseController {

    @Autowired
    private TaoBaoOptions taoBaoOptions;

    @RequestMapping("/index")
    public String index(ModelMap model,TbkDgMaterialOptionalRequest tbkDgMaterialOptionalRequest) {
        try {
            DefaultTaobaoClient client = new DefaultTaobaoClient(taoBaoOptions.getServer_url(), taoBaoOptions.getApp_key(),
                    taoBaoOptions.getApp_secret());
            if (StringUtils.isBlank(tbkDgMaterialOptionalRequest.getQ())) {
                tbkDgMaterialOptionalRequest.setQ("女装");
            }
            tbkDgMaterialOptionalRequest.setAdzoneId(new Long(taoBaoOptions.getAd_zone_id()));
            tbkDgMaterialOptionalRequest.setDeviceEncrypt(taoBaoOptions.getDevice_encrypt());
            tbkDgMaterialOptionalRequest.setHasCoupon(true);
            tbkDgMaterialOptionalRequest.setSort(taoBaoOptions.getSort());
            final TbkDgMaterialOptionalResponse response = client.execute(tbkDgMaterialOptionalRequest);
            model.addAttribute("result",response);
            model.addAttribute("entity",tbkDgMaterialOptionalRequest);
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return "/taobao/index";
    }
}
