Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE16FA9F5
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 12:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319D10E21F;
	Mon,  8 May 2023 10:57:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C84110E217
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 10:57:22 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C177D3F1FF;
 Mon,  8 May 2023 12:57:19 +0200 (CEST)
Date: Mon, 8 May 2023 12:57:18 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <vonnkr34hogk3r54pg5wqw3xv5ood4zkdojehcr5stonvqev6u@nnezyvphwo5k>
References: <20230508-topic-hctl_en-v1-1-0f8b5df60ed5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508-topic-hctl_en-v1-1-0f8b5df60ed5@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-08 12:29:32, Konrad Dybcio wrote:
> DPU5 and newer targets enable this unconditionally. Move it from the
> SC7280 mask to the SC7180 one.
> 
> Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")

The flag only exists since 591e34a091d17 ("drm/msm/disp/dpu1: add
support for display for SC7280 target"), and I don't know how bad it is
if it was lacking when SC7180 was added?

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I wonder if this needs any Reported-by/Suggested-by, given that I found
the DATA_COMPRESS discrepancy for your SM6375 patch (which was using
SC7280 to have the HCTL mask) and Dmitry pointing out that HCTL needs to
be in SC7180 entirely.

Fortunately none of this affects cmdmode :)

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> Depends on:
> https://lore.kernel.org/linux-arm-msm/20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27420fc863d6..7ea8fd69d5fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -98,9 +98,12 @@
>  #define INTF_SDM845_MASK (0)
>  
>  #define INTF_SC7180_MASK \
> -	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
> +	(BIT(DPU_INTF_INPUT_CTRL) | \
> +	 BIT(DPU_INTF_TE) | \
> +	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> +	 BIT(DPU_DATA_HCTL_EN))
>  
> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS)
>  
>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>  			 BIT(DPU_WB_UBWC) | \
> 
> ---
> base-commit: c47189dee0decd9ecc1e65ae376ad6d4b0b7f1f2
> change-id: 20230508-topic-hctl_en-3abb999a6c99
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
