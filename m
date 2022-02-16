Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712844B7D7B
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA110E610;
	Wed, 16 Feb 2022 02:31:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBEA10E60D
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:31:57 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id o23so1025182oie.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
 b=f9qRjcip1axnB3gsByayybsK2LUKhi3YC+5I8hPNWYz6Dq2oILdp9UBT/UtbbY1G6L
 xIfZ0+QkOMs82ifVOLbQ/sYS6IJn8zSrkH1nuz2EU9qf3QDTCzvH3WK5zX0TS5/ugxUr
 3fPAtiy0aQcdYmPaZjbe5RmoiyJvHigmR1Zm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
 b=eUyP5NJShtMhrakg+khV32fqRqLfBT8AEvnbypnLRKTPTCqIFaqJzbJIfCO7zZIGf7
 SBmNbYs859nhlx3/KAuLScL4l/1+GFP5QN3PAfdZcn2fCalip/i74gPKi+O5i4Flf662
 rIFguc9q0QXd5cTzH7+vfTDdn8bx4nOli3zEH9Mxid24Vb+/JaxCW41AOsN1mlD8/sqr
 rW0FPCA+wy9BUDRO6M/T/thSHqPNc6f+I0vPQBLwA2k+XlkU20uP+iOVLFGjn2iDIPrG
 Rek00CHl67PYc0bqW/hjTA21TdOi8GbvQTJufMphh05ZeT0Tm7hSJGz+TvG9T64WRE/N
 d+jw==
X-Gm-Message-State: AOAM531TsD/1qeWOx7SvfDNuZ4eFv9yXmv0g+QYxXQ6mWrF+lwgshUSL
 gRf4G9NV3HVnPfwlDbH73vFw48CWVkTRy8K9AH/ztA==
X-Google-Smtp-Source: ABdhPJyDbvUvZ6RkYHBL3/aUIR1aZh7KmHgpodA7AcbRXrRAGWGGpOYV87YtSNdxv0zicH+MiICs9s/7a1UNaneOVZg=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr337010oij.112.1644978716695; Tue, 15
 Feb 2022 18:31:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:31:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
 <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:31:55 -0800
Message-ID: <CAE-0n520mZdGaMWwjBEb7SSbLf31Sd7t3pe9dJ5FLVnsSVJZFg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/2] drm/msm/dpu: simplify clocks handling
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

Quoting Dmitry Baryshkov (2022-01-31 13:05:12)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 60fe06018581..4d184122d63e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -405,10 +394,11 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>
>                 trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>
> -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> +               if (clk_rate > kms->perf.max_core_clk_rate)
> +                       clk_rate = kms->perf.max_core_clk_rate;

Using

	clk_rate = min(clk_rate, kms->perf.max_core_clk_rate)

would be type safer. And min_t() would be explicit if the types don't
match, but we should try to make them be compatible.

> +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>                 if (ret) {
> -                       DPU_ERROR("failed to set %s clock rate %llu\n",
> -                                       kms->perf.core_clk->clk_name, clk_rate);
> +                       DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
>                         return ret;
>                 }
>
> @@ -529,13 +519,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>                 struct drm_device *dev,
>                 struct dpu_mdss_cfg *catalog,
> -               struct dss_clk *core_clk)
> +               struct clk *core_clk)
>  {
>         perf->dev = dev;
>         perf->catalog = catalog;
>         perf->core_clk = core_clk;
>
> -       perf->max_core_clk_rate = core_clk->max_rate;
> +       perf->max_core_clk_rate = clk_get_rate(core_clk);
>         if (!perf->max_core_clk_rate) {
>                 DPU_DEBUG("optional max core clk rate, use default\n");
>                 perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4b7f5e..5f562413bb63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -21,7 +21,6 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_interrupts.h"
>  #include "dpu_hw_top.h"
> -#include "dpu_io_util.h"
>  #include "dpu_rm.h"
>  #include "dpu_core_perf.h"
>
> @@ -113,7 +112,8 @@ struct dpu_kms {
>         struct platform_device *pdev;
>         bool rpm_enabled;
>
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>
>         /* reference count bandwidth requests, so we know when we can
>          * release bandwidth.  Each atomic update increments, and frame-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 131c1f1a869c..8c038416e119 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -29,7 +29,8 @@ struct dpu_irq_controller {
>  struct dpu_mdss {
>         struct msm_mdss base;
>         void __iomem *mmio;
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>         struct dpu_irq_controller irq_controller;
>  };
>
