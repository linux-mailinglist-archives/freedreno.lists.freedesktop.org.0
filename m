Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA125A23A1
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 10:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880EF10E788;
	Fri, 26 Aug 2022 08:57:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565E610E788
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 08:57:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d8so1206317lfq.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 01:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=22eStSU9ItXlWoRnrD595PIr4R701OkoJy+fkWXSTyE=;
 b=rA+ZcQ5v1aIg1zXjq5ukDZB2TBClaxUfjELeOhnFDiyygvppat2Vadq5QCbGjf5POQ
 M+V4+1J+SOn76CACYx6F2OYdL9CETEgpy1u4uzRdAvL77l3HCIGfdkaCLVGhg5toXIaq
 033HvZUH6xXp4kdUpNmMSVjTHolgVyUpiaOSHmfV1zR7VWpq1N0ihZTQfj0zgaBShBm0
 +gyKIWsnCQg3lJLKKTEJqZHSZB3U3VQcktbDO9NQ1KrRLap0uNysz3bvtk9eaQxzOKNd
 ofFKgAXx40xLBvhyxHCguIEcUn5CkObt2P0oVW4mOJkyZRETGCEZ1E0RyHHVVQiN8pWN
 ufHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=22eStSU9ItXlWoRnrD595PIr4R701OkoJy+fkWXSTyE=;
 b=aZ8ktak7eBnNl8AcVAad6ryn3H16WvwmBMQMCrbYQHfVQI7Fb3GKDGacnuTHK8DFrn
 WAmzoItrkRFklhk4h39+5XZFV6NufEtsIeqG1M4PiSlU0H5Ujp0LAHni9hfQcjMi2nMy
 dEC8ui0JWap5dZW9XLDmvr5bAN8y4HSH8HMeGzvDqAapTQWYGa1CN7Xxh478GI50l/PO
 lQEEeWo6xb9fcbRKjVhOyFumzV/7WzEaWAw2HoVHSVsjjcj+eHB0wUPxXoC/KSv3TCHI
 qwlDXzlA6wbzrZuj93f8qVzH6pybfdTMBFJW66P5ojqEI+FJP6UOe5Rk1DkXDZf4PLrO
 1SAg==
X-Gm-Message-State: ACgBeo3eO6DcwHIpgUA/UHFiFcnUgXNnqgd4h+Av56jSfrC5OnOzElgR
 w7ZmB+pzdR1nOlx7kI/316/BjQ==
X-Google-Smtp-Source: AA6agR6RayAC+v5sOQnaoJuZ+WyUJ4dXh4UUETdwa6psWLxW+EIOeGJrtg9zj7txwlimKbPC3mvJfg==
X-Received: by 2002:a05:6512:1091:b0:491:f135:4633 with SMTP id
 j17-20020a056512109100b00491f1354633mr2496905lfg.553.1661504257559; 
 Fri, 26 Aug 2022 01:57:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c03c100b00261b6faab6dsm381798ljp.115.2022.08.26.01.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 01:57:36 -0700 (PDT)
Message-ID: <d2d94589-8513-c261-c5d8-b7ffa3db8616@linaro.org>
Date: Fri, 26 Aug 2022 11:57:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
 <20220616075947.347888-4-dmitry.baryshkov@linaro.org>
 <41ca91c6-dc38-af0a-c955-a276f5824cc8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <41ca91c6-dc38-af0a-c955-a276f5824cc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/hdmi: move resource allocation
 to probe function
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/08/2022 02:58, Abhinav Kumar wrote:
> 
> 
> On 6/16/2022 12:59 AM, Dmitry Baryshkov wrote:
>> Rather than having all resource allocation happen in the _bind function
>> (resulting in possible EPROBE_DEFER returns and component bind/unbind
>> cycles) allocate and check all resources in _probe function. While we
>> are at it, use platform_get_irq() to get the IRQ rather than going
>> through the irq_of_parse_and_map().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/hdmi/hdmi.c | 295 +++++++++++++++-----------------
>>   1 file changed, 134 insertions(+), 161 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 8dfe5690366b..429abd622c81 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -75,8 +75,6 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>>       if (hdmi->i2c)
>>           msm_hdmi_i2c_destroy(hdmi->i2c);
>> -
>> -    platform_set_drvdata(hdmi->pdev, NULL);
> Do we still not need to do this in .remove?
>>   }
>>   static int msm_hdmi_get_phy(struct hdmi *hdmi)
>> @@ -116,138 +114,10 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>>    * we are to EPROBE_DEFER we want to do it here, rather than later
>>    * at modeset_init() time
>>    */
>> -static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>> +static int msm_hdmi_init(struct hdmi *hdmi)
>>   {
>> -    struct hdmi_platform_config *config = pdev->dev.platform_data;
>> -    struct hdmi *hdmi = NULL;
>> -    struct resource *res;
>> -    int i, ret;
>> -
>> -    hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>> -    if (!hdmi) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pdev = pdev;
>> -    hdmi->config = config;
>> -    spin_lock_init(&hdmi->reg_lock);
>> -
>> -    hdmi->mmio = msm_ioremap(pdev, "core_physical");
>> -    if (IS_ERR(hdmi->mmio)) {
>> -        ret = PTR_ERR(hdmi->mmio);
>> -        goto fail;
>> -    }
>> -
>> -    /* HDCP needs physical address of hdmi register */
>> -    res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -        "core_physical");
>> -    if (!res) {
>> -        ret = -EINVAL;
>> -        goto fail;
>> -    }
>> -    hdmi->mmio_phy_addr = res->start;
>> -
>> -    hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
>> -    if (IS_ERR(hdmi->qfprom_mmio)) {
>> -        DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
>> -        hdmi->qfprom_mmio = NULL;
>> -    }
>> -
>> -    hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_reg_cnt,
>> -                      sizeof(hdmi->hpd_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_reg_cnt; i++)
>> -        hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, 
>> hdmi->hpd_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_reg_cnt,
>> -                      sizeof(hdmi->pwr_regs[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_regs) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -
>> -    for (i = 0; i < config->pwr_reg_cnt; i++)
>> -        hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
>> -
>> -    ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, 
>> hdmi->pwr_regs);
>> -    if (ret) {
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: 
>> %d\n", ret);
>> -        goto fail;
>> -    }
>> -
>> -    hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
>> -                      config->hpd_clk_cnt,
>> -                      sizeof(hdmi->hpd_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->hpd_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->hpd_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get hpd clk: %s 
>> (%d)\n",
>> -                    config->hpd_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->hpd_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
>> -                      config->pwr_clk_cnt,
>> -                      sizeof(hdmi->pwr_clks[0]),
>> -                      GFP_KERNEL);
>> -    if (!hdmi->pwr_clks) {
>> -        ret = -ENOMEM;
>> -        goto fail;
>> -    }
>> -    for (i = 0; i < config->pwr_clk_cnt; i++) {
>> -        struct clk *clk;
>> -
>> -        clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
>> -        if (IS_ERR(clk)) {
>> -            ret = PTR_ERR(clk);
>> -            DRM_DEV_ERROR(&pdev->dev, "failed to get pwr clk: %s 
>> (%d)\n",
>> -                    config->pwr_clk_names[i], ret);
>> -            goto fail;
>> -        }
>> -
>> -        hdmi->pwr_clks[i] = clk;
>> -    }
>> -
>> -    hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>> GPIOD_IN);
>> -    /* This will catch e.g. -EPROBE_DEFER */
>> -    if (IS_ERR(hdmi->hpd_gpiod)) {
>> -        ret = PTR_ERR(hdmi->hpd_gpiod);
>> -        DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", 
>> ret);
>> -        goto fail;
>> -    }
>> -
>> -    if (!hdmi->hpd_gpiod)
>> -        DBG("failed to get HPD gpio");
>> -
>> -    if (hdmi->hpd_gpiod)
>> -        gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>> -
>> -    devm_pm_runtime_enable(&pdev->dev);
>> +    struct platform_device *pdev = hdmi->pdev;
>> +    int ret;
> 
> What about the rest of the msm_hdmi_init() function?
> 
> msm_hdmi_i2c_init, msm_hdmi_get_phy and msm_hdmi_hdcp_init have been 
> left behind. Any reason for that?

msm_hdmi_i2c_init() allocates new adapter, so it should be part of bind().

msm_hdmi_hdcp_init() just allocates a chunk of memory (other actions are 
infallible). Also I did not want to move a piece of code that I can not 
really test.

As for the msm_hdmi_get_phy(), I don't remember why I didn't move it. 
But you are right, it makes sense to move it. I'll check it for v2.

> 
> 
>>       hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);

-- 
With best wishes
Dmitry

