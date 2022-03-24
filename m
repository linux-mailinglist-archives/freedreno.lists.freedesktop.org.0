Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F14E6A32
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 22:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBFA10E28F;
	Thu, 24 Mar 2022 21:23:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200B210E169
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 21:23:39 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so6208143fac.11
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=u4jj/zOQzuXEovzke6K3cPdIWt6nW+CnDZ3+Of9Qdrw=;
 b=GogDieupr7LC079twCniLBZogLbYvk6MLpQzWbfxcPvpgRFa4/yCgsLpfmK7/AQsW6
 +nle0KfwUOxCwExyGe2tBuzsFHpI4rD4d85GD9NXAyelB1QygVh9bsgJlizXRbTBZjWV
 6fJTljnStNk5KsFtArSMzSjfFSLjJKq9iTSUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=u4jj/zOQzuXEovzke6K3cPdIWt6nW+CnDZ3+Of9Qdrw=;
 b=eMV/56fXCBRg7LHJgTXA8JIRXy5sZkL0Mj/oSSSCojv4336K80+S9H+xmApO1Yl07k
 rKAGt6pszeN5geJIJ+4LVCtU9YM9zMF3cUS5u2PDYeBShoIhRO/22Sr09zysPtDVXqpw
 O0eBEBSKr8+kEgPktDu5q0WTmOH8wux8RvZk8axtpF5QrcjklsK0pKavTHK/zvjI3DT9
 qgshdspI7h0FTfAxvxvlnbZNUNW5Y4ANnGEvqzClW2NYNUyu5vVO9vEFRSggu4dulfY7
 iN89p8n/hllIzRpAm8Do0P68bRk6yQzMAsU/lO9e0oRr7EdCy643zxFSSMQntDMtPFHi
 2jlg==
X-Gm-Message-State: AOAM531YsWX+ri+D2yoIffJKPeRCry+/DRrnoupQBPeWT0dE2LvmiEvg
 asl8Klq14Q94qJyP1HE/04k8fYclmzfrP+bFOy3VnA==
X-Google-Smtp-Source: ABdhPJyI4PlixBpMhpnkyqffokmmzaLmt4gtL9Qh8dX1otTTqY9VnE3Fm3AZyU5uMLAnZbxSES/qRj0yEKRGwRbt+2I=
X-Received: by 2002:a05:6870:46ac:b0:de:5d48:9d27 with SMTP id
 a44-20020a05687046ac00b000de5d489d27mr3497500oap.63.1648157018070; Thu, 24
 Mar 2022 14:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 16:23:37 -0500
MIME-Version: 1.0
In-Reply-To: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
 <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 16:23:37 -0500
Message-ID: <CAE-0n52rraD2tDvEPn4gG0KzArm5e1cx=Z66vCwTvcY3hCwiAg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/6] drm/msm: split the main platform
 driver
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

Quoting Dmitry Baryshkov (2022-03-23 02:25:35)
> Currently the msm platform driver is a multiplex handling several cases:
> - headless GPU-only driver,
> - MDP4 with flat device nodes,
> - MDP5/DPU MDSS with all the nodes being children of MDSS node.
>
> This results in not-so-perfect code, checking the hardware version
> (MDP4/MDP5/DPU) in several places, checking for mdss even when it can
> not exist, etc. Split the code into three handling subdrivers (mdp4,
> mdss and headless msm).
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the match table fixed and the nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 3cf476c55158..c5c0650414c5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -569,3 +569,59 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>
>         return &config;
>  }
> +
> +static const struct dev_pm_ops mdp4_pm_ops = {
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,
> +};
> +
> +static int mdp4_probe(struct platform_device *pdev)
> +{
> +       struct msm_drm_private *priv;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       /*
> +        * on MDP4 based platforms, the MDP platform device is the component
> +        * master that adds other display interface components to itself.

Just delete master. It provides no value in this sentence.

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 62007a4f29a2..512708101931 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -255,3 +258,167 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
[...]
> +               DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> +               goto fail;
> +       }
> +
> +       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> +       if (!mdp_dev) {
> +               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> +               of_platform_depopulate(dev);
> +               ret = -ENODEV;
> +               goto fail;
> +       }
> +
> +       /*
> +        * on MDP5 based platforms, the MDSS platform device is the component
> +        * that adds MDP5 and other display interface components to

Like here.
