Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE336544E2
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 17:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB6710E53A;
	Thu, 22 Dec 2022 16:08:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8AD10E53A
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 16:08:32 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id 4so2446496plj.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH7Zh92eryTWmCMxjucYh6kr7rGobPqkxZWYyehfDV0=;
 b=r236SpDsWUYa12FF7nRSMu6mPBqxqO+2P0PbY1NFdoUyHyFPZRjGmYbldui+TqAO2a
 qounXUoll65HTzqqtqPN/Q6KxEgDnyaOUNMOMTv4ckI2O6mo+CIb1NmgNJk4BcN1SJ3i
 u/7oyXxyB/wthuCCl55v0M69nsjesx69tsNaQZy3F5OBzk02DVL/Fjm/hEV059imMpu0
 43r/2lwia5JA47gBDsxTKcYatkHZMCuoSlI/heyYmXk9TJPdCLGc8KGAg66Ulvxu+nnU
 NIhc2hhCHflSBIa8UC36Z4fXnpvyaaZri36cuZeXaXHdiSV1s5M3iY+PXCfKRaz3HfzD
 Q1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZH7Zh92eryTWmCMxjucYh6kr7rGobPqkxZWYyehfDV0=;
 b=kPC6Le/Eu7V8Xnd81KKy2MekAOPBdI4VVhfehkZ+BTWEeToRxNknu4dHi8abeqhGP0
 s8slCO2ISyzEdrF00rKBOkab1gafzQgEQaPUFm7Rr+rrWg2TIlGcn+ayyDx8Fs66mFZj
 QnGpd1SopPBuU1ogoLKypEQS4wytCBsVSjjDuK4pblBqP33vD+plizG29FqHgurmMOg+
 g4y7FFzHyHolr2IaiAN1MQLp/a07saDXKeb1xT5wN4I1IiJGnMHQh9VBlGqMU/5uc6wV
 LB+/5z8TNze8vczCAlVlWu10hxEMyA2ftisdAVkdvZvYJGbhnz/yz7K6pXnkay3cp7os
 w3BQ==
X-Gm-Message-State: AFqh2ko/w1YEgkiHjHZlr1NGxroAFUi8DcycLxDMRaTM8X3DjNuSpAt6
 GKelasDmwtOKw2cJiDQI9AOqlXka7By+3E1yuYRDlA==
X-Google-Smtp-Source: AMrXdXsf2I0+vdD8DuU3+/SehD5zu5kIqZZcsfr5+AQ/kzBZkVEglzKHBliayWS5QR4S8ndYudqmtDTpgVqs5m5/lhM=
X-Received: by 2002:a17:90a:be0c:b0:219:ef02:a5eb with SMTP id
 a12-20020a17090abe0c00b00219ef02a5ebmr636760pjs.84.1671725311989; Thu, 22 Dec
 2022 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221221224338.v4.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
In-Reply-To: <20221221224338.v4.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Dec 2022 17:07:55 +0100
Message-ID: <CAPDyKFrCv_uqA9Pa5UE2oCbD7cpwn_ZjBESQGKoNk7xT=gFaaA@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 5/5] drm/msm/a6xx: Use genpd notifier to
 ensure cx-gdsc collapse
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 Chia-I Wu <olvaffe@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> As per the recommended recovery sequence of adreno gpu, cx gdsc should
> collapse at hardware before it is turned back ON. This helps to clear
> out the stale states in hardware before it is reinitialized. Use the
> genpd notifier along with the newly introduced
> dev_pm_genpd_synced_poweroff() api to ensure that cx gdsc has collapsed
> before we turn it back ON.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Select PM_GENERIC_DOMAINS from Kconfig
>
>  drivers/gpu/drm/msm/Kconfig           |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
>  4 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 3c9dfdb0b328..74f5916f5ca5 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -28,6 +28,7 @@ config DRM_MSM
>         select SYNC_FILE
>         select PM_OPP
>         select NVMEM
> +       select PM_GENERIC_DOMAINS
>         help
>           DRM/KMS driver for MSM/snapdragon.
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1580d0090f35..c03830957c26 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1507,6 +1507,17 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>         gmu->initialized = false;
>  }
>
> +static int cxpd_notifier_cb(struct notifier_block *nb,
> +                       unsigned long action, void *data)
> +{
> +       struct a6xx_gmu *gmu = container_of(nb, struct a6xx_gmu, pd_nb);
> +
> +       if (action == GENPD_NOTIFY_OFF)
> +               complete_all(&gmu->pd_gate);
> +
> +       return 0;
> +}
> +
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  {
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> @@ -1640,6 +1651,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>                 goto detach_cxpd;
>         }
>
> +       init_completion(&gmu->pd_gate);
> +       complete_all(&gmu->pd_gate);
> +       gmu->pd_nb.notifier_call = cxpd_notifier_cb;
> +
>         /*
>          * Get a link to the GX power domain to reset the GPU in case of GMU
>          * crash
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 5a42dd4dd31f..0bc3eb443fec 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -4,8 +4,10 @@
>  #ifndef _A6XX_GMU_H_
>  #define _A6XX_GMU_H_
>
> +#include <linux/completion.h>
>  #include <linux/iopoll.h>
>  #include <linux/interrupt.h>
> +#include <linux/notifier.h>
>  #include "msm_drv.h"
>  #include "a6xx_hfi.h"
>
> @@ -90,6 +92,10 @@ struct a6xx_gmu {
>         bool initialized;
>         bool hung;
>         bool legacy; /* a618 or a630 */
> +
> +       /* For power domain callback */
> +       struct notifier_block pd_nb;
> +       struct completion pd_gate;
>  };
>
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4b16e75dfa50..dd618b099110 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> +#include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
>  #define GPU_PAS_ID 13
> @@ -1258,6 +1259,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>         int i, active_submits;
>
>         adreno_dump_info(gpu);
> @@ -1290,6 +1292,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gpu->active_submits = 0;
>
> +       reinit_completion(&gmu->pd_gate);
> +       dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
> +       dev_pm_genpd_synced_poweroff(gmu->cxpd);
> +
>         /* Drop the rpm refcount from active submits */
>         if (active_submits)
>                 pm_runtime_put(&gpu->pdev->dev);
> @@ -1297,6 +1303,11 @@ static void a6xx_recover(struct msm_gpu *gpu)
>         /* And the final one from recover worker */
>         pm_runtime_put_sync(&gpu->pdev->dev);
>
> +       if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
> +               DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
> +
> +       dev_pm_genpd_remove_notifier(gmu->cxpd);
> +
>         pm_runtime_use_autosuspend(&gpu->pdev->dev);
>
>         if (active_submits)
> --
> 2.7.4
>
