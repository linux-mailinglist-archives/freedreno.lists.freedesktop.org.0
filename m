Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98C58F6F6
	for <lists+freedreno@lfdr.de>; Thu, 11 Aug 2022 06:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AC09E238;
	Thu, 11 Aug 2022 04:28:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3F111BF47
 for <freedreno@lists.freedesktop.org>; Thu, 11 Aug 2022 04:28:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w3so21555980edc.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 21:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qutPgoHsh0aNCJy6BIy763iqIP4xzHSujrtPjVld1S4=;
 b=JC58/VnqGkEFxA8QdfMx6um+WZA77XEzMoUJ8+lZrQ9UY1GhAHWxQfnmx0PT/vTx1p
 YfAWwam3u+Xi+jpc/dPrSDdWgEMGFHb45OePgxBtTK+oA6lizgEDgE2F3z7LINwj4sUd
 ZhOuDWhqGrzhYtzFvUfIPsAw0BE6ErZU0ApqQ5cKSsiYuh1fB1AP3Db7sFYrrmuPhSsd
 HfcabtG5aZDGqED+MioGWEJ4B+3LhdWYzAV8Yo7hZ8AF8Atj8zuBa83ttJJuk904cC+I
 4FHX++Pnq4Xd42iIaJaIy+NMZebZKIU5Y2guizRdFAJPNQg6XXS2zzZ7B5O4jx7UqWzY
 NA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qutPgoHsh0aNCJy6BIy763iqIP4xzHSujrtPjVld1S4=;
 b=YiVuu49rDjVBum7g2ARMydJsnCqKbPKhy1jPGHtlFUG1SRghgV45n4yAMqsC2rPDwl
 8GQ1qhrOY7vH/REaILv7lYmcJ98+eLTTT7rkJAfwMxAmpDkvR9A2U+RD7PImRvk8gmrB
 aKfXeC0TqvKtw5aCTijdVOcL08iScvv2un/wdEIUbqs6jW29c9K4Ln4QL+OEFoSnoc+d
 S09o1Pb6oe+tJEUkGMtK/KQSThaUEbWzjw3voHXf3dL2JOVfpPmeH0RA8YPAYnWUgixS
 v1P+oaSKUJtBHvWMWfQvt6Zv70tT0hcq+xyYQaaJogw0vl8ERMUm/KvS11rz1xuorDDI
 Bm4g==
X-Gm-Message-State: ACgBeo3nV3BIKWMVRWJ+JqgIGKbVF/cvy7HE3Si44zY4280U/ImlF7RD
 pfeSRxopcc5sUhgdYwJxMCG/2PBmpoPt047wGqJqPg==
X-Google-Smtp-Source: AA6agR5OCSm/LTkv0sym9nG7SAwBRmVM5H24o1M2VJPyeC3mXlp7Brw8D/MXOG8y0RYzCQi6N+I/5Lj2WwdI7nok9mg=
X-Received: by 2002:a05:6402:449a:b0:442:c81c:b938 with SMTP id
 er26-20020a056402449a00b00442c81cb938mr5079087edb.289.1660192093537; Wed, 10
 Aug 2022 21:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-4-bjorn.andersson@linaro.org>
In-Reply-To: <20220811040121.3775613-4-bjorn.andersson@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Wed, 10 Aug 2022 23:28:02 -0500
Message-ID: <CAKXuJqhWn8bcG3x-xvyJ5-1kGXBVqCEuG31aHNidCqKA81NSqQ@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Introduce SC8280XP
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Bjorn,


On Wed, Aug 10, 2022 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Qualcomm SC8280XP platform contains DPU version 8.0.0, has 9
> interfaces, 2 DSI controllers and 4 DisplayPort controllers. Extend the
> necessary definitions and describe the DPU in the SC8280XP.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Note that MSM_DP_CONTROLLER_3 is also defined in the DP series and as such a
> trivial conflict will occur when merging the latter of the two series.
>
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 211 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                |   2 +
>  8 files changed, 239 insertions(+)
>
<snip>
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b3689a2d27d7..5978c6e26a1e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -55,6 +55,7 @@ enum msm_dp_controller {
>         MSM_DP_CONTROLLER_0,
>         MSM_DP_CONTROLLER_1,
>         MSM_DP_CONTROLLER_2,
> +       MSM_DP_CONTROLLER_3,
>         MSM_DP_CONTROLLER_COUNT,
>  };
>
This seems to also be part of
https://lore.kernel.org/r/20220810040745.3582985-6-bjorn.andersson@linaro.org
(but only th msm_drv.h hunk

>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..7c391fab6263 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -208,6 +208,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>                 writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
>                 break;
>         case DPU_HW_VER_600:
> +       case DPU_HW_VER_800:
>                 /* TODO: 0x102e for LP_DDR4 */
>                 writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
>                 writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> @@ -445,6 +446,7 @@ static const struct of_device_id mdss_dt_match[] = {
>         { .compatible = "qcom,sc7180-mdss" },
>         { .compatible = "qcom,sc7280-mdss" },
>         { .compatible = "qcom,sc8180x-mdss" },
> +       { .compatible = "qcom,sc8280xp-mdss" },
>         { .compatible = "qcom,sm8150-mdss" },
>         { .compatible = "qcom,sm8250-mdss" },
>         {}
> --
> 2.35.1
>
-- steev
