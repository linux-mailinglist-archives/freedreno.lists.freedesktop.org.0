Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89984CC979
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812310E3BD;
	Thu,  3 Mar 2022 22:50:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C3110E3AA
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:50:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id l25so6197849oic.13
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KeDmke7qScTaAmmjjyQpyutbM2DWizHtambCdZkz9so=;
 b=c7uNVxCrj7GWjWl8k15rd3NWuQMjPYmBmVx9kC/NvH/2mYFJpmqswTrYbwyAjtUVT0
 XC+Ya9MELFv9OKGEGj4MaSGRxQiuhylUuua9ECXenWnE0XYmPgg2+6oimoL7ONr4mh+E
 NhAyMHITEtLx0K0RbybO+ZHvp19uo/sYUII1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KeDmke7qScTaAmmjjyQpyutbM2DWizHtambCdZkz9so=;
 b=svoQGDKzJpJf4pEpuequodvCDQWvWpoSEcnKrnGa0DEbapOSn0lTjYuKaXa2yEVU6f
 Ibf6EW2rpNd2TkMPzp/9wcz83Q+H2ASISKxO4y/4K8wqjPnht4PJl3xjVHx8K95pAs7m
 V505jU3aVamlGzJRxsb2HFv1hW2fNyDTnazBcL5qEHbLxSv8SFclR23Bh2LVQtxzNq2X
 xmOxmKOHi7eDVe0A5ed0CZet71JnsZzyZq81NZEsEyV2EimVfl6COwUUVx0Nhdpyxgpc
 Z1LBFLcdz1P9fagJRN6Rcu8TVcHezULCUyo0DZSin8pz1pR/ZZs/Lx1Xy5bTKMxMJ/Av
 3faQ==
X-Gm-Message-State: AOAM5321PzTNGZ0sAA//K86zg7lif9Fxv3egm31E2gyjim4s8ejEd7l7
 DdBSo9cpkVuvsOiTyLkwwULpOzxZ3qFyVhxp/Ms4fg==
X-Google-Smtp-Source: ABdhPJxA0gclpLTZ0n3tm36YIjXGwbHs5/bZqav5p1HszkHa+lfQd5VovmMf1U0kgnme3ZuS28Lh/1eE7rePS9rZovo=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6732813oiw.64.1646347849504; Thu, 03
 Mar 2022 14:50:49 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:50:49 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-2-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:50:49 -0800
Message-ID: <CAE-0n526yEZzk8Yzje+HszN79MFPkovVFDKXPffMwL8sE9n_8w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/4] drm/msm: unify MDSS drivers
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

Quoting Dmitry Baryshkov (2022-01-19 14:40:02)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> similarity index 58%
> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> rename to drivers/gpu/drm/msm/msm_mdss.c
> index 9f5cc7f9e9a9..f5429eb0ae52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -188,22 +182,64 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
>
>         pm_runtime_suspend(mdss->dev);
>         pm_runtime_disable(mdss->dev);
> -       _dpu_mdss_irq_domain_fini(dpu_mdss);
> +       irq_domain_remove(dpu_mdss->irq_controller.domain);
> +       dpu_mdss->irq_controller.domain = NULL;
>         irq = platform_get_irq(pdev, 0);
>         irq_set_chained_handler_and_data(irq, NULL, NULL);
> -
> -       if (dpu_mdss->mmio)
> -               devm_iounmap(&pdev->dev, dpu_mdss->mmio);
> -       dpu_mdss->mmio = NULL;
>  }
>
>  static const struct msm_mdss_funcs mdss_funcs = {
> -       .enable = dpu_mdss_enable,
> -       .disable = dpu_mdss_disable,
> -       .destroy = dpu_mdss_destroy,
> +       .enable = msm_mdss_enable,
> +       .disable = msm_mdss_disable,
> +       .destroy = msm_mdss_destroy,
>  };
>
> -int dpu_mdss_init(struct platform_device *pdev)
> +/*
> + * MDP5 MDSS uses at most three specified clocks.
> + */
> +#define MDP5_MDSS_NUM_CLOCKS 3
> +int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)

static?

> +{
> +       struct clk_bulk_data *bulk;
> +       struct clk *clk;
> +       int num_clocks = 0;
> +
> +       if (!pdev)
> +               return -EINVAL;
> +
> +       bulk = devm_kcalloc(&pdev->dev, MDP5_MDSS_NUM_CLOCKS, sizeof(struct clk_bulk_data), GFP_KERNEL);
> +       if (!bulk)
> +               return -ENOMEM;
> +
> +       /* We ignore all the errors except deferral: typically they mean that the clock is not provided in the dts. */
> +       clk = msm_clk_get(pdev, "iface");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "iface";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       clk = msm_clk_get(pdev, "bus");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "bus";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       clk = msm_clk_get(pdev, "vsync");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "vsync";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       return num_clocks;
> +}
> +
> +int msm_mdss_init(struct platform_device *pdev, bool mdp5)

Maybe is_mdp5 so the if reads simpler.

>  {
>         struct msm_drm_private *priv = platform_get_drvdata(pdev);
>         struct dpu_mdss *dpu_mdss;
> @@ -220,27 +256,28 @@ int dpu_mdss_init(struct platform_device *pdev)
>
>         DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>
> -       ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
> +       if (mdp5)
> +               ret = mdp5_mdss_parse_clock(pdev, &dpu_mdss->clocks);
> +       else
> +               ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
>         if (ret < 0) {
> -               DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
> -               goto clk_parse_err;
> +               DRM_ERROR("failed to parse clocks, ret=%d\n", ret);
> +               return ret;
>         }
>         dpu_mdss->num_clocks = ret;
