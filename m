Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE652C4A5
	for <lists+freedreno@lfdr.de>; Wed, 18 May 2022 22:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5E310E2C1;
	Wed, 18 May 2022 20:51:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8F10E331
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 20:51:57 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f16a3e0529so4325724fac.2
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
 b=Mz/2VNmF/Qm8XBKO6jjH1wqNziZBqj3x/FvlMJSGBhS8qVox7pMhMTd1dQTEc7+Ko4
 UC0w0+n72k87GmLubXCiTT29p5zwoYExdtWWSM1UBnvP/F7TG1YnWvF3Nejy5yHG7Yw2
 LA4Aqe/62+afm1veBCNg10hLbltcuXqnLE3Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
 b=oq0Bu51q8LDizyg990fe+q6cbU6zYPayMjbKIO7IzbCQw8QhzoAUq0BkejE4Onzk/p
 HrHSKXg9EazrYeFZ+ZXgH0TCCuRjHXxuL/YWWIa8EuQnhlKT2QP3hAq3+9vI7bkmoE6o
 TNAF1uhbIMextzDBl4VZnb/jhWMsYcaHyMA4NPV05+woKQb9QXQju4W0l9AVJXSjeH7J
 /hm+cza3y/xxb5B0LZW6lbP2gLyIfSE3NNY3g8IF9j50rkJJaNHaBhhlQUuUbiY1ymUs
 RKO1iuyGQ7VgL+MZcbz9w1SpqRmiPprI5ikn0t/FhLgr8r04SyayI43nIuF/d3Gyvu41
 ukcw==
X-Gm-Message-State: AOAM533uo8CvhOBLXKT9JpMkNVt7bevdAFy4axuRg3KaK296cVg/Yqm7
 JYIDCutvPQ5CXbXb0DcoRm+2APVzk/Y1NmnkJvruXg==
X-Google-Smtp-Source: ABdhPJzgJw3GN2UAR/UMlvVpHQSaAwYbNIOCn2Obfjno00YjCblW9KW9QVE/gAlCwH22JwjiaD+tCtmZTlvXU0isFu0=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr739706oap.193.1652907116977; Wed, 18
 May 2022 13:51:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:51:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com>
 <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:51:55 -0700
Message-ID: <CAE-0n533Rf55ypeCY=A4dpxzdviUO3G9NFS41nceds6ZVFt-BQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/3] phy/qualcomm: add regulator_set_load
 to edp phy
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Should subject be "phy: qcom:" prefix?

Quoting Kuogee Hsieh (2022-05-18 13:24:02)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Changes in v3:
> -- no regulator_set_load before disable regulator
> -- no supply name string change at probe
> -- split into two patches

These don't go here because this isn't a drm patch.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..00b6726 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* 1.2 V */
> +       edp->enable_load[1] = 36000;    /* 1.2 V */

What does the comment mean? This is the load for 1.2V supply? Can we
have that sort of comment instead of "1.2 V"?

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
