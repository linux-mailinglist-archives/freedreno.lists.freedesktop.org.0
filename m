Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A7352F116
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 18:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7D10EAE9;
	Fri, 20 May 2022 16:50:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF610EA58
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 16:50:53 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f16a3e0529so10968992fac.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=udeMWIeImL8Et9KO+nQSrMb5ZhN50mdpj9tL8FAbJ98=;
 b=dSjL9hAHlZbIAXLFy2vchTxfjAqvwKvgE1MNoILsPw9WyYz0+UXNWHA0Bk8DDpr+Yy
 ulkoazNolUDBiOy5AGpy+c7A4tJWN1T6GpN++geAI5LfyRvjbhacoj37KDkh7v4gfs1f
 OLnuxI8/tnHwDzPtXMc1iLSM2V3W+FnGQkyINXLRrhJfigGM8PkuZN8FgNNoLChZW/jn
 52BC/7Vg2ZYSvXmnO/mumTnDZcDxkO8zR4HcODOoI3HohQ5+2oDvQerdqLWXSs7c21Ui
 H3VBQs+lvfKAPGFoZgF+pilzfTFyb+VjwCY2EkAIlBdLxs7eYYaOr/FesMklva8Qn/NT
 iuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=udeMWIeImL8Et9KO+nQSrMb5ZhN50mdpj9tL8FAbJ98=;
 b=q0+zih7qlRzLFaIqmzRTQx7C4iHRg3ddKs8mJ5FsJ+ckIl7eFeXB0QO8g+6FEET+Vm
 rTn+8Mb76JOTe53kXVbUaORbka2O2Y4JNtrHuEcjqd2ft+m+J4Qm+ZsFoOWnSZqKG11l
 1Y2qBlj454LXrdoKxQYYCCDD6nwcz8tDdcz6lOOszze/kUq44WHgZp/mWT8NHJw/uk7U
 0AxeBYuVr8qh+IXdENPTvLWscA4no1kpvyBFk6TBQV2Uecu7EinJPyg16YlAwixY+Nbu
 kn6/m3Uy6zUUz/heEqt/NirGCmzhxUD6r481YRarVGppzXymRfiLAr9La03G4IwcAzgN
 36Rw==
X-Gm-Message-State: AOAM530hmLtRYuPHIQjSiFob8LxsdNqnAe9usLEEfXp32ksJk67mOjMz
 iyKdfSn+2wsDQUjHlqkSBnYLnLtDCIaDZA==
X-Google-Smtp-Source: ABdhPJygoccuSwJYhUd2CBzkd7UbxWWji/qDYdUC+b+SAmRANKb8lEqtNI/xUMGbleCdUTv+0fxA6Q==
X-Received: by 2002:a05:6870:5b89:b0:f1:d956:dee2 with SMTP id
 em9-20020a0568705b8900b000f1d956dee2mr6659444oab.72.1653065452505; 
 Fri, 20 May 2022 09:50:52 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056870214600b000f1b1ff7b8bsm1071185oae.51.2022.05.20.09.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 09:50:51 -0700 (PDT)
Date: Fri, 20 May 2022 09:53:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YofHdpcWJGQtERPy@ripper>
References: <1653064021-25400-1-git-send-email-quic_khsieh@quicinc.com>
 <1653064021-25400-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653064021-25400-2-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v8 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 20 May 09:26 PDT 2022, Kuogee Hsieh wrote:

> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..afd9e17 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,12 +87,17 @@ struct qcom_edp {
>  
>  	struct clk_bulk_data clks[2];
>  	struct regulator_bulk_data supplies[2];
> +	int enable_load[2];
>  };
>  
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>  	struct qcom_edp *edp = phy_get_drvdata(phy);
>  	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(edp->supplies); i++)
> +		regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);

The regulator framework only accounts for the load of enabled regulator
consumers, so you should be able to just call regulator_set_load() right
after devm_regulator_bulk_get() and not carry the enable_load array of
static constants.

Regards,
Bjorn

>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>  	if (ret)
> @@ -635,6 +640,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  
>  	edp->supplies[0].supply = "vdda-phy";
>  	edp->supplies[1].supply = "vdda-pll";
> +	edp->enable_load[0] = 21800;	/* load for 1.2 V vdda-phy supply */
> +	edp->enable_load[1] = 36000;	/* load for 0.9 V vdda-pll supply */
>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>  	if (ret)
>  		return ret;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
