Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE1F6A00F5
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 02:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B998710E207;
	Thu, 23 Feb 2023 01:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6D10E207
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 01:59:42 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-536bf92b55cso153728987b3.12
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 17:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IP6lDzcBIzEEnBgehiJD2Dl3S2juwhkS/TNCDBV4bqk=;
 b=vzANCIUaqHw3c7P03agBctNixVdLAdG+6pPZcSEUFfgf5gsb19BeUraB2ZZKYTWUSE
 PKHWYuCw2UtdRMzBStkdZvpTF4n8XPGx5wYi9XQFKMwnHw4AUVByG6US80YPQMYnDPKA
 f4TjrkPTgT58cK/kDXObq+PFYgyLzIlHOneERxEzrKOtzr2mivmi42cjdCFEJClSPfov
 +EGAQroSjTAZzzCJV+g7Fq10Ei5Lg5yZKXNPRSxXkOk+8IKToVaO6nUY5XS7IOVe56t+
 eh1Q1FqAD/h2lFQ6QtSrOzl1AaPDWJ3Vr+60S3taoQfIPSdJ9g0hibc+qFp/S6z77Yry
 KWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IP6lDzcBIzEEnBgehiJD2Dl3S2juwhkS/TNCDBV4bqk=;
 b=6h+1Ey/vXMKfClcACRagek+jYhD8v5CR8vA+heUkBxB09cQhgdDBxdqo3V3UqameuE
 0SnM5aAotgQcCvAvle0uccQ43/RNCa3rrDavuLmEfeHGvEjdi7smGs7Kqtif6ozPC50c
 obzoVlSO4Atcxv1of5W/h2jI0ElBa+y+nvKYRGfGyjFJ2uAOjfwwVv+j5SGDBCweG/xA
 dU0dNbNXY1bAOypN4MJz3ZDt3s7en8auyQwpu4hWsCzVDmNSgIafUFNJRJAN1tXp4P1P
 RCCttVPXzsRDRvCzVMT4sNVGQGTsBNM6dHu4hMo6nT1a81h3UGIg61GAOm1/TCOGGLfH
 SpOw==
X-Gm-Message-State: AO0yUKVa3mPv0QY5cxJM8PxT7di/dKBdy35Bno4rOzUOhYqHlBorDoDR
 uB5D7D5wTjBLIQ9gc5UjcxlqRREZjz3h1oDLN6UndA==
X-Google-Smtp-Source: AK7set9F5W2lrAqWpjZeQLGOdq45GnY7482NBqzW+2+US4qyL2EIzk7Ov1OS/drJfPF6ndIUcZshRtPP2zJQkmMROeg=
X-Received: by 2002:a81:b660:0:b0:533:9ffb:cb13 with SMTP id
 h32-20020a81b660000000b005339ffbcb13mr1614152ywk.3.1677117581829; Wed, 22 Feb
 2023 17:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
 <20230223-topic-opp-v2-2-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-2-24ed24cd7358@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 03:59:31 +0200
Message-ID: <CAA8EJpoQG014xZp23VeT4FYC_GNjTw7M3q9CMvtj0AEJrhknPA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/6] drm/msm/adreno: Use OPP for every
 GPU generation
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 03:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Some older GPUs (namely a2xx with no opp tables at all and a320 with
> downstream-remnants gpu pwrlevels) used not to have OPP tables. They
> both however had just one frequency defined, making it extremely easy
> to construct such an OPP table from within the driver if need be.
>
> Do so and switch all clk_set_rate calls on core_clk to their OPP
> counterparts.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 99 +++++++++++++++------------------
>  drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
>  3 files changed, 48 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ce6b76c45b6f..8721e3d6231a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -922,73 +922,48 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
>                         ring->id);
>  }
>
> -/* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
> -static int adreno_get_legacy_pwrlevels(struct device *dev)
> -{
> -       struct device_node *child, *node;
> -       int ret;
> -
> -       node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
> -       if (!node) {
> -               DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
> -               return -ENXIO;
> -       }
> -
> -       for_each_child_of_node(node, child) {
> -               unsigned int val;
> -
> -               ret = of_property_read_u32(child, "qcom,gpu-freq", &val);
> -               if (ret)
> -                       continue;
> -
> -               /*
> -                * Skip the intentionally bogus clock value found at the bottom
> -                * of most legacy frequency tables
> -                */
> -               if (val != 27000000)
> -                       dev_pm_opp_add(dev, val, 0);
> -       }
> -
> -       of_node_put(node);
> -
> -       return 0;
> -}
> -
> -static void adreno_get_pwrlevels(struct device *dev,
> +static int adreno_get_pwrlevels(struct device *dev,
>                 struct msm_gpu *gpu)
>  {
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         unsigned long freq = ULONG_MAX;
>         struct dev_pm_opp *opp;
>         int ret;
>
>         gpu->fast_rate = 0;
>
> -       /* You down with OPP? */
> -       if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
> -               ret = adreno_get_legacy_pwrlevels(dev);
> -       else {
> -               ret = devm_pm_opp_of_add_table(dev);
> -               if (ret)
> -                       DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
> -       }
> -
> -       if (!ret) {
> -               /* Find the fastest defined rate */
> -               opp = dev_pm_opp_find_freq_floor(dev, &freq);
> -               if (!IS_ERR(opp)) {
> -                       gpu->fast_rate = freq;
> -                       dev_pm_opp_put(opp);
> +       /* devm_pm_opp_of_add_table may error out but will still create an OPP table */
> +       ret = devm_pm_opp_of_add_table(dev);
> +       if (ret == -ENODEV) {
> +               /* Special cases for ancient hw with ancient DT bindings */
> +               if (adreno_is_a2xx(adreno_gpu)) {
> +                       dev_warn(dev, "Unable to find the OPP table. Falling back to 200 MHz.\n");
> +                       dev_pm_opp_add(dev, 200000000, 0);
> +               } else if (adreno_is_a320(adreno_gpu)) {
> +                       dev_warn(dev, "Unable to find the OPP table. Falling back to 450 MHz.\n");
> +                       dev_pm_opp_add(dev, 450000000, 0);
> +               } else {
> +                       DRM_DEV_ERROR(dev, "Unable to find the OPP table\n");
> +                       return -ENODEV;
>                 }
> +       } else if (ret) {
> +               DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
> +               return ret;
>         }
>
> -       if (!gpu->fast_rate) {
> -               dev_warn(dev,
> -                       "Could not find a clock rate. Using a reasonable default\n");
> -               /* Pick a suitably safe clock speed for any target */
> -               gpu->fast_rate = 200000000;
> +       /* Find the fastest defined rate */
> +       opp = dev_pm_opp_find_freq_floor(dev, &freq);
> +
> +       if (IS_ERR(opp))
> +               return PTR_ERR(opp);
> +       else {
> +               gpu->fast_rate = freq;
> +               dev_pm_opp_put(opp);
>         }

Nit: you can drop else {} here.

>
>         DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
> +
> +       return 0;
>  }
>
>  int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> @@ -1046,6 +1021,20 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         struct adreno_rev *rev = &config->rev;
>         const char *gpu_name;
>         u32 speedbin;
> +       int ret;
> +
> +       /*
> +        * This can only be done before devm_pm_opp_of_add_table(), or
> +        * dev_pm_opp_set_config() will WARN_ON()
> +        */
> +       if (IS_ERR(devm_clk_get(dev, "core"))) {
> +               /*
> +                * If "core" is absent, go for the legacy clock name.
> +                * If we got this far in probing, it's a given one of them exists.
> +                */
> +               devm_pm_opp_set_clkname(dev, "core_clk");
> +       } else
> +               devm_pm_opp_set_clkname(dev, "core");
>
>         adreno_gpu->funcs = funcs;
>         adreno_gpu->info = adreno_info(config->rev);
> @@ -1070,7 +1059,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         adreno_gpu_config.nr_rings = nr_rings;
>
> -       adreno_get_pwrlevels(dev, gpu);
> +       ret = adreno_get_pwrlevels(dev, gpu);
> +       if (ret)
> +               return ret;
>
>         pm_runtime_set_autosuspend_delay(dev,
>                 adreno_gpu->info->inactive_period);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 380249500325..cdcb00df3f25 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -59,7 +59,7 @@ static int disable_pwrrail(struct msm_gpu *gpu)
>  static int enable_clk(struct msm_gpu *gpu)
>  {
>         if (gpu->core_clk && gpu->fast_rate)
> -               clk_set_rate(gpu->core_clk, gpu->fast_rate);
> +               dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
>
>         /* Set the RBBM timer rate to 19.2Mhz */
>         if (gpu->rbbmtimer_clk)
> @@ -78,7 +78,7 @@ static int disable_clk(struct msm_gpu *gpu)
>          * will be rounded down to zero anyway so it all works out.
>          */
>         if (gpu->core_clk)
> -               clk_set_rate(gpu->core_clk, 27000000);
> +               dev_pm_opp_set_rate(&gpu->pdev->dev, 27000000);
>
>         if (gpu->rbbmtimer_clk)
>                 clk_set_rate(gpu->rbbmtimer_clk, 0);
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index e27dbf12b5e8..ea70c1c32d94 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>                 gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>                 mutex_unlock(&df->lock);
>         } else {
> -               clk_set_rate(gpu->core_clk, *freq);
> +               dev_pm_opp_set_rate(dev, *freq);
>         }
>
>         dev_pm_opp_put(opp);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
