Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7F53E4D6
	for <lists+freedreno@lfdr.de>; Mon,  6 Jun 2022 15:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932F910E7FB;
	Mon,  6 Jun 2022 13:46:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A8410E7FB
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jun 2022 13:46:15 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so19168834fac.9
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jun 2022 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xTpWPSxN0cL0aVs3iLR/HmIswwTyMjklIN9jCgr7T+Q=;
 b=FcPDlAGsBBZqIo/U7deOp4+kp/FFXUkJnzTHVfhMBmEPyi9B3VzXHpf9gxN0z9WkZE
 zMex9FE2JL2CXklp11tM+RvrBj2sYpgTHD7by7BoUHU3pZmfwFqd8lcUpyC1rjyBO1bm
 YCd03N3WPWfcU+4W6kh7sCBKnMJnjOmWzjjWZWdg4XY4USYk6DjUd77G1FNecYHavaK9
 aGMnGYduuyWNrQl6bnFZuv9IHGX89Lrc6mq3xecc153xREDsJw++jqd/pn3Abtox+NkW
 wzKxonhke55kKh88L6qB9H87YfwIf04YwnblGT9+aG1335WeM4zWDlhR7pVeun0+kLQB
 ViWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xTpWPSxN0cL0aVs3iLR/HmIswwTyMjklIN9jCgr7T+Q=;
 b=wQajBRs4owNoQmNefDtWaX4GrUR8xuUHCzoUz8gYJp6J1dAMCT5FhH5DHezRozc/v2
 RA6hvszgHmaZGEoR6phEbueUt+z2LQTzyT/14iniuQ6LxZM3Rlky2PiophyIOt8h4arF
 dQLK6gd8h1R+gt4m/0tGaLzo3YHltvyp0uysLkVi+3Q52e2TnUU6rnRz24jaThg+Jrv+
 madsYDZYxugO+NwPNWKC0RqejMZiAhQ+4lD8NJ5vPKvh5UH7wjqOh5hiYUn71+lglar3
 b4AopDaA0a3SWG13MxkgTI3/03DkYCXYQq8bQrpFxhqvcYxVHRtZpday6pBIK8CXlOb7
 qL0g==
X-Gm-Message-State: AOAM532bLzMoGKUbH+uV0yW+B42eM29rByXb7CRKLiPL57owDD5b6qjr
 2MIiYGb9gBu7hUxJ2fsiUlqKuA==
X-Google-Smtp-Source: ABdhPJzjWkyxD1qfFKANpxzk990e+EpRbqV/OdMD73IIFh/8xr2wLPUb0uOpjWjw5mrkS+7u1j/ptw==
X-Received: by 2002:a05:6870:8184:b0:f5:dd95:7ef7 with SMTP id
 k4-20020a056870818400b000f5dd957ef7mr13883037oae.117.1654523174846; 
 Mon, 06 Jun 2022 06:46:14 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 pu7-20020a0568709e8700b000f5e33aaa66sm6770625oab.0.2022.06.06.06.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 06:46:14 -0700 (PDT)
Date: Mon, 6 Jun 2022 06:48:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <Yp4FtznlEzNKmRPZ@ripper>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v13 1/3] phy: qcom-edp: add
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

On Wed 25 May 14:02 PDT 2022, Kuogee Hsieh wrote:

> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..7e357078 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +	if (ret) {
> +		dev_err(dev, "failed to set load at %s\n", edp->supplies[0].supply);
> +		return ret;
> +	}
> +
> +	ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> +	if (ret) {
> +		dev_err(dev, "failed to set load at %s\n", edp->supplies[1].supply);
> +		return ret;
> +	}
> +
>  	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
>  	if (ret)
>  		return ret;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
