Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F7673AFD
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 15:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8D510E94A;
	Thu, 19 Jan 2023 14:02:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ADB10E94A
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 14:02:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so5928378ejc.4
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
 b=PJhN37dt3vvxsYzj0Eg4zdSaSMqu97099U86iUJCurKx6eBfan8IS3fZiG0zE3ZsUW
 VMQGbhgeqbtfRVUTXp7RqFepqE5o1L0xd8vpdc9YZajcYqEiMN3+tJPBQM7Ussvhb8AW
 bLnMSjmvJLHQQKSuR/OOaVoq86Mu1IBCf2yPVX7Cv0c57eP4KRmsjUq0L9rZSLNzgwkL
 Kwmui1y9eZhv3kNQXXDfFV+r/8OnWAxKtT+FBr7voZg/KLXRAWqC/vLc6PPv9Rd4S17i
 WrUIikWJcFcp4haP0Qhao2VCQh5Qtp0ofPPehKsz493kPFTc6fGwAAfpscGVOH4A4Mnc
 o5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2x8S9tVFIZqDRv9aHkQ6xKCyTS3jpAIYNRHtCcpELmw=;
 b=UbmCdrBujI+pGVmJLUPHgysfICEIJUUPu2N5N8MxdiYdFCIXKvY58k1eRI8oXn9ZPd
 DAdM3WzxkREwULkKnc8goaJaHkLnbLXGmA8+4RQBNBjvYpoUfGBo/Jeivpctm4Zb/z88
 ShzvuGJqAxAMFoNcr787HXBJBPs7c9LrqfDgB14PByQMOvXsRm3zq1sRRvRYdgMi5FNc
 bYJodNbMSFAM5CUSPJBTaaKy4c3kV3Fr8hlbYqebB2t43uY21KLkj/jAUASmiliO+dnp
 EUuw+hlFm7eGxm2ct87oHdeHjsBGyBwWOnKHMDt3bEGQvSvHDOZPxc+kd89Tg2EO5gmU
 hrhw==
X-Gm-Message-State: AFqh2kq67yi20WNGrpk6lJRGnbfTe+GIsu3cDDcZg76KvQuQybDiLw6s
 s30yOHW8XJA8LEg59Y/p/ZJqtA==
X-Google-Smtp-Source: AMrXdXtxY4A4oBDtDd979MmrlD50V8QEnayPnQI0J2QTJ0QFspExAuwf02HDsF7SIivQLI4+nCtuxw==
X-Received: by 2002:a17:907:d15:b0:862:e612:effe with SMTP id
 gn21-20020a1709070d1500b00862e612effemr16052636ejc.14.1674136918662; 
 Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm6522221ejg.223.2023.01.19.06.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 06:01:58 -0800 (PST)
Message-ID: <efd3d3df-4d0e-8cd4-24f5-11aeb4682948@linaro.org>
Date: Thu, 19 Jan 2023 15:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk
 provider
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8960 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index c3e7ff45e52a..cb35a297afbd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct hdmi_pll_8960 *pll;
> -	struct clk *clk;
> -	int i;
> +	int i, ret;
>  
>  	/* sanity check: */
>  	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
> @@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  	pll->pdev = pdev;
>  	pll->clk_hw.init = &pll_init;
>  
> -	clk = devm_clk_register(dev, &pll->clk_hw);
> -	if (IS_ERR(clk)) {
> +	ret = devm_clk_hw_register(dev, &pll->clk_hw);
> +	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
> -		return -EINVAL;
> +		return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
> +		return ret;
>  	}
>  
>  	return 0;
