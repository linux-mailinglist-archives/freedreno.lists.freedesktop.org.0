Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF54CC97F
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73C10E3BE;
	Thu,  3 Mar 2022 22:54:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87510E345
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:54:15 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so7493038ooa.10
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=SWwr6PfQx9+FPyvTdo8KBfSMVcyO3fHRr3T3bQXm+ds=;
 b=QBW+znNKKa/bk/d9EArBF7hxjYyQk4nEwGsuQPFy4XkOyGaGnr2MqkogedjMGH6P6x
 IDtN+u+8Ykw/r3Mgxm1L+pc7zVn/aMdZjDLZ2isamgiU7xVKEAtCY7dXqnJkd5RQpCh+
 8Y5Yl4c26VGBMMpyT8YAIzoZVEcGktlM9tX18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=SWwr6PfQx9+FPyvTdo8KBfSMVcyO3fHRr3T3bQXm+ds=;
 b=jq8g1A/uKI9LEp3bFwdcX5o2D3AQ3spVKO8WMebOWua9X/ISVVfvQn7DaVHd3Fovbw
 TPihNFIwecokeNfIcItXyjcR/pS5Rby7xYVGBHIuIl9LCBgNV2/06ShfvlM+VxswqMn+
 zju071Z5j+ZeIid025e09xAzAQVwEYoqVgFB/I+RmByyTUArZlWHDaJfkmbWoFyMOg14
 swpZpa0bMAJBZu/mb9ttqxvmiO0X8RLWYepJDFmHJ5Qn2e7aH3t+oVRGeXjZDru7/Vnq
 OwNRymfSbqex5YwXCXlYHRzLfqqPfIurgq0i0lCjfUDG2WtFL/s3PnB/E6qMXioARaU/
 U6EQ==
X-Gm-Message-State: AOAM533bukK5WHYu7lV6BTVymREzBRQSJaju7HtkVyHn8AhUiJK7Turn
 oYt5EmZ8vMAOyyb/lc10GnKyL7PNKEBRhMWj7U1ciQ==
X-Google-Smtp-Source: ABdhPJx/6Rxm4cp68BFJJFqy3CAujhE6UWDHQU3lHjqBYT+eQ18QrGqQbyqLY4SwEdptGIgYFgUpSCqce2VueXCbcBs=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr5886672oab.64.1646348054835; Thu, 03
 Mar 2022 14:54:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:54:14 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:54:14 -0800
Message-ID: <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: remove extra indirection
 for msm_mdss
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-19 14:40:03)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index be06a62d7ccb..f18dfbb614f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1211,19 +1212,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
>
>         switch (get_mdp_ver(pdev)) {
>         case KMS_MDP5:
> -               ret = msm_mdss_init(pdev, true);
> +               mdss = msm_mdss_init(pdev, true);
> +               if (IS_ERR(mdss)) {
> +                       ret = PTR_ERR(mdss);
> +                       platform_set_drvdata(pdev, NULL);
> +
> +                       return ret;
> +               } else {

Drop else

> +                       priv->mdss = mdss;
> +                       pm_runtime_enable(&pdev->dev);
> +               }
>                 break;
>         case KMS_DPU:
> -               ret = msm_mdss_init(pdev, false);
> +               mdss = msm_mdss_init(pdev, false);
> +               if (IS_ERR(mdss)) {
> +                       ret = PTR_ERR(mdss);
> +                       platform_set_drvdata(pdev, NULL);
> +
> +                       return ret;
> +               } else {
> +                       priv->mdss = mdss;
> +                       pm_runtime_enable(&pdev->dev);
> +               }

This is the same so why can't it be done below in the deleted if (ret)?

>                 break;
>         default:
> -               ret = 0;
>                 break;
>         }
> -       if (ret) {
> -               platform_set_drvdata(pdev, NULL);
> -               return ret;
> -       }
>
>         if (get_mdp_ver(pdev)) {
>                 ret = add_display_components(pdev, &match);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 2459ba479caf..0c341660941a 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
>         return num_clocks;
>  }
>
> -int msm_mdss_init(struct platform_device *pdev, bool mdp5)
> +struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)

Ah I see it will quickly become not static. Still should have static
first and remove it here.
