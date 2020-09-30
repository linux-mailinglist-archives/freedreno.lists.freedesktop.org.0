Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC427EF11
	for <lists+freedreno@lfdr.de>; Wed, 30 Sep 2020 18:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592CF89CA2;
	Wed, 30 Sep 2020 16:25:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA989CA2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Sep 2020 16:25:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601483118; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=jjwXbMwHhIuNgHWIpJci+mOICpDxoypRVYnKqXx1W/A=;
 b=PzBJB1nM2sg8XRCiTbjdeJzDGM+2XiyBAhOZwQIkVrtcR0tA9pN+wmsLawfMAPB/Ng4lcgtl
 hbNLtTv1F7MmcNmUvvdBlNDsPYIV6QYDhdZdlleYVD3n7jGN4n65+LRdFrqb8B2/fYh/ZmNB
 i3PWSxySx3P6epf7p0M1QoIFwPk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f74b1621fdd3a13909887f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 16:25:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1AC1EC433CA; Wed, 30 Sep 2020 16:25:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.0.118] (unknown [49.207.198.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3100C433CA;
 Wed, 30 Sep 2020 16:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3100C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=rnayak@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 robdclark@gmail.com, sean@poorly.run
References: <20200929171026.30551-1-khsieh@codeaurora.org>
 <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <01467014-1190-6e1b-8120-472719861a5e@codeaurora.org>
Date: Wed, 30 Sep 2020 21:54:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add voltage corners voting
 support base on dp link rate
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 9/30/2020 1:54 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-09-29 10:10:26)
>> Set link rate by using OPP set rate api so that CX level will be set
>> accordingly base on the link rate.
> 
> s/base/based/
> 
>>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 2e3e1917351f..e1595d829e04 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>                  return ERR_PTR(-ENOMEM);
>>          }
>>   
>> +       ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");

I see that downstream has multiple DP clocks which end up voting on CX, we don't have a
way of associating multiple OPP tables with a device upstream, so whats usually done is
(assuming all the clocks get scaled in lock step, which I assume is the case here) we pick
the clock with the 'highest' CX requirement and associate that with the OPP table.
I haven't looked but I am hoping thats how we have decided to associate "ctrl_link" clock
here?

>> +
>> +       if (IS_ERR(ctrl->opp_table)) {
>> +               dev_err(dev, "invalid DP OPP table in device tree\n");
>> +               ctrl->opp_table = NULL;
>> +       } else {
>> +               /* OPP table is optional */
>> +               ret = dev_pm_opp_of_add_table(dev);
>> +               if (ret && ret != -ENODEV) {
>> +                       dev_err(dev, "add DP OPP table\n");
> 
> This is debug noise right?
> 
>> +                       dev_pm_opp_put_clkname(ctrl->opp_table);
>> +                       ctrl->opp_table = NULL;
>> +               }
>> +       }
>> +
>>          init_completion(&ctrl->idle_comp);
>>          init_completion(&ctrl->video_comp);
>>   
>> @@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>          return &ctrl->dp_ctrl;
>>   }
>>   
>> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
>> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
>>   {
>> +       struct dp_ctrl_private *ctrl;
>> +
>> +       if (!dp_ctrl)
> 
> Can this happen?
> 
>> +               return;
>> +
>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +       if (ctrl->opp_table != NULL) {
> 
> This is usually written as
> 
> 	if (ctrl->opp_table)
> 
>> +               dev_pm_opp_of_remove_table(dev);
>> +               dev_pm_opp_put_clkname(ctrl->opp_table);
>> +               ctrl->opp_table = NULL;
>> +       }
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index f60ba93c8678..19b412a93e02 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>                          struct dp_panel *panel, struct drm_dp_aux *aux,
>>                          struct dp_power *power, struct dp_catalog *catalog,
>>                          struct dp_parser *parser);
>> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);
> 
> Is 'dev' not inside 'dp_ctrl'?
> 
>>   
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 17c1fc6a2d44..3d75bf09e38f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -8,12 +8,14 @@
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/pm_opp.h>
>>   #include "dp_power.h"
>>   #include "msm_drv.h"
>>   
>>   struct dp_power_private {
>>          struct dp_parser *parser;
>>          struct platform_device *pdev;
>> +       struct device *dev;
>>          struct clk *link_clk_src;
>>          struct clk *pixel_provider;
>>          struct clk *link_provider;
>> @@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
>>          return 0;
>>   }
>>   
>> +static int dp_power_clk_set_link_rate(struct dp_power_private *power,
>> +                       struct dss_clk *clk_arry, int num_clk, int enable)
>> +{
>> +       u32 rate;
>> +       int i, rc = 0;
>> +
>> +       for (i = 0; i < num_clk; i++) {
>> +               if (clk_arry[i].clk) {
>> +                       if (clk_arry[i].type == DSS_CLK_PCLK) {
>> +                               if (enable)
>> +                                       rate = clk_arry[i].rate;
>> +                               else
>> +                                       rate = 0;
>> +
>> +                               rc = dev_pm_opp_set_rate(power->dev, rate);
> 
> Why do we keep going if rc is non-zero?
> 
>> +                       }
>> +
>> +               }
>> +       }
>> +       return rc;
>> +}
>> +
>>   static int dp_power_clk_set_rate(struct dp_power_private *power,
>>                  enum dp_pm_type module, bool enable)
>>   {
>>          int rc = 0;
>>          struct dss_module_power *mp = &power->parser->mp[module];
>>   
>> -       if (enable) {
>> -               rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
>> +       if (module == DP_CTRL_PM) {
>> +               rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
>>                  if (rc) {
>> -                       DRM_ERROR("failed to set clks rate.\n");
>> +                       DRM_ERROR("failed to set link clks rate.\n");
>>                          return rc;
>>                  }
>> +       } else {
>> +
>> +               if (enable) {
>> +                       rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
>> +                       if (rc) {
>> +                               DRM_ERROR("failed to set clks rate.\n");
> 
> Not sure we need the period on these error messages.
> 
>> +                               return rc;
>> +                       }
>> +               }
>>          }
>>   
>>          rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
>>
>> base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
>> prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445
> 
> Can you rebase this on Rob's msm-next tree
> (https://gitlab.freedesktop.org/drm/msm.git) and test? It doesn't apply
> for me because I have the dp phy patch from there.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
