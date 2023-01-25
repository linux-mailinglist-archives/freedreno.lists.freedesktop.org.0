Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3167AA85
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 07:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481B910E72D;
	Wed, 25 Jan 2023 06:47:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6DA10E72D
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 06:47:08 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id a9so21839037ybb.3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Jan 2023 22:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f+Yhm+ONtgQS0SZfQy+XcB6Agb3KHSIv7CpnDfD1CbQ=;
 b=MvqzBjtSH4tlj/EjCiTVCO4vK/hUZLuKjkrAY1kqAzWuXOQguh7vRfzGAql/cthBvm
 9eGQANAPxOX3123F9NWOMDlMTM2XuSwbHqlyGVp5FXfKDm09QKjgkA0vWI20jUPpsiwG
 I0YfoomwKXw8rwhMAm2oCjn6oSV3pkuyFKmI/sU+F2WB8Bl5qlANAtZVR6Y5QjGFqJT7
 B/yaLX7LepDWzMKv/QensiS7ukApYlBmDyuixLcBnfQoUAsR8TBhNtX2W87v++wOGyBS
 hEIbEAC+w8bdLfO1q1xzsP8teSZ1U+Nom/UHEepEu3fMI9/CPfdRvSTefuApbmpZBrHK
 32Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+Yhm+ONtgQS0SZfQy+XcB6Agb3KHSIv7CpnDfD1CbQ=;
 b=pvdSl6G+FXNDmfk9CNKSlqRwFyo0Ut7yGxVSD1sTBragQKdZ+8k5SLWVzc1Z9H8ehO
 /ewlNL6RnsyCEvMC7Zv/Pfmz21esXhe+GDUPtJVBRLQ5OsVndiAM72y7mWodmuaSMhsq
 2EjsRDOOOS0ieXTdE5zIVIF15S9jPxaYl02vJWTu84x1pBBF9P4MeNVkssza650xAca8
 ADCww/5h7bAJiqELJzp3hX/3sdRVM8qDoi32yCFIrpNzJGy5XfVwHeawIIoIWWiFMsSx
 NHNQ8J5CjbKUEEhY39xsHgFLRd4NDxnZ1TsP/Piq0Ft+vQHH/Mh0m397wibK+naL/Vui
 mUwA==
X-Gm-Message-State: AFqh2kpymaSmhlle46hpEMhsWvfe4iqh8Ck8cUQxtqj+uKsPqZHAmt3e
 PmZcSZWaBTx3KQhr1FGpTmePbnmdfXHpbL71Inn8Ag==
X-Google-Smtp-Source: AMrXdXvv7fjos9dkhNOlGLzfx1JgWTKZfvB82NzZ34A8VECDUMNo+8RHEseboAPnLJgji90Q0T06yjDWv4R9eyzN2R4=
X-Received: by 2002:a05:6902:8f:b0:800:748:7d05 with SMTP id
 h15-20020a056902008f00b0080007487d05mr2270840ybs.15.1674629227758; Tue, 24
 Jan 2023 22:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
 <ecec7adb-a1ab-ba38-c38a-26f23f81cf68@quicinc.com>
 <df8a130f-2020-833c-d4f1-088c1fd7e5ef@linaro.org>
 <1642c43b-9d71-17ee-402d-d1e415e1ecc8@quicinc.com>
In-Reply-To: <1642c43b-9d71-17ee-402d-d1e415e1ecc8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Jan 2023 08:46:56 +0200
Message-ID: <CAA8EJpo+ARnJ29BrOVkrg1FkTOVKYXQJiqAqhBzhZyNVYZw2qQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: disable features unsupported
 by QCM2290
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, 25 Jan 2023 at 02:22, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 1/24/2023 12:22 AM, Dmitry Baryshkov wrote:
> > On 24/01/2023 03:32, Abhinav Kumar wrote:
> >> On 1/22/2023 11:11 PM, Dmitry Baryshkov wrote:
> >>> QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
> >>> rectangles and CSC. Drop corresponding features being incorrectly
> >>> enabled for qcm2290.
> >>>
> >>
> >> Can you please point me to which vendor DT you are referring to for this?
> >>
> >> CSC is supported on the VIG SSPPs from what I can see.
> >
> > https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi
> >
> >
> > No CSC, smart-dma, excl-rect, CDP, etc.
>
> Sorry I am missing something here.
>
> It has one Vig and one DMA
>
> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L68

Correct

>
> If Vig is present, CSC is supported.

This actually puzzled me. Usually the dtsi has qcom,sde-sspp-csc-off
and qcom,sde-csc-type properties. But not in this case.

>
> Even for smart DMA I can see it supported
> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L76
> on the DMA SSPP.
>
> Same for excl rectangle too
> https://github.com/MiCode/kernel_devicetree/blob/psyche-r-oss/qcom/scuba-sde.dtsi#L74

Ack, my mistake. Maybe I was looking at the wrong dtsi then (or just
mixed something). I'll add them back. And I see that CDP is also
there.

So, this leaves us only with the question regarding CSC. Could you
please doublecheck it?

I also don't see the UBWC (qcom,sde-ubwc-version) and regdma
(qcom,sde-reg-dma-off) properties. Are corresponding features present
on the QCM2290?

> >
> >> QCM2290 should be using the same MDP version as 6115 from the HW version.
> >
> > It is 6.3 vs 6.5 if I remember correctly.
> >
> >>
> >>
> >>> Cc: Loic Poulain <loic.poulain@linaro.org>
> >>> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
> >>>   1 file changed, 12 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> index 289fb11f99d1..1c3ffa922794 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>> @@ -12,10 +12,14 @@
> >>>   #include "dpu_hw_catalog.h"
> >>>   #include "dpu_kms.h"
> >>> -#define VIG_MASK \
> >>> +#define VIG_BASE_MASK \
> >>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> >>> +    BIT(DPU_SSPP_TS_PREFILL))
> >>> +
> >>> +#define VIG_MASK \
> >>> +    (VIG_BASE_MASK | \
> >>>       BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
> >>> -    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
> >>> +    BIT(DPU_SSPP_EXCL_RECT))
> >>>   #define VIG_MSM8998_MASK \
> >>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
> >>> @@ -29,7 +33,7 @@
> >>>   #define VIG_SM8250_MASK \
> >>>       (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) |
> >>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
> >>> -#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
> >>> +#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
> >>>   #define DMA_MSM8998_MASK \
> >>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> >>> @@ -50,6 +54,10 @@
> >>>   #define DMA_CURSOR_MSM8998_MASK \
> >>>       (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
> >>> +#define DMA_QCM2290_MASK \
> >>> +    (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
> >>> +    BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
> >>> +
> >>>   #define MIXER_MSM8998_MASK \
> >>>       (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
> >>> @@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
> >>>   static const struct dpu_caps qcm2290_dpu_caps = {
> >>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >>>       .max_mixer_blendstages = 0x4,
> >>> -    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> >>> -    .ubwc_version = DPU_HW_UBWC_VER_20,
> >>>       .has_dim_layer = true,
> >>>       .has_idle_pc = true,
> >>>       .max_linewidth = 2160,
> >>> @@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks
> >>> qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
> >>>   static const struct dpu_sspp_cfg qcm2290_sspp[] = {
> >>>       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> >>>            qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> >>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> >>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
> >>>            qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> >>>   };
> >>> @@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg
> >>> qcm2290_dpu_cfg = {
> >>>       .intf = qcm2290_intf,
> >>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >>>       .vbif = sdm845_vbif,
> >>> -    .reg_dma_count = 1,
> >>> -    .dma_cfg = &sdm845_regdma,
> >>>       .perf = &qcm2290_perf_data,
> >>>       .mdss_irqs = IRQ_SC7180_MASK,
> >>>   };
> >



-- 
With best wishes
Dmitry
