Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66B70CB7B
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 22:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACFB10E38B;
	Mon, 22 May 2023 20:47:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519FF10E38B
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 20:47:12 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9CF743F273;
 Mon, 22 May 2023 22:47:10 +0200 (CEST)
Date: Mon, 22 May 2023 22:47:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <qrxir7a6l75ocavrwdfearjz6j4etwvzmqwc7o5ftrdc6awwz4@wsoftsrewqcm>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-3-15daf84f8dcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v4-3-15daf84f8dcb@quicinc.com>
Subject: Re: [Freedreno] [PATCH v4 3/5] drm/msm/dpu: Add
 DPU_INTF_DATA_COMPRESS feature flag
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
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Can you fit DPU >= 7.0 in the title?

On 2023-05-22 13:30:22, Jessica Zhang wrote:
> Add DATA_COMPRESS feature flag to DPU INTF block.

Nit: repeating the title, perhaps you can reflow this with the second
paragraph?

- Marijn

> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> PINGPONG to INTF.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7944481d0a33..8e12e07728df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -104,7 +104,8 @@
>  #define INTF_SC7180_MASK \
>  	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>  
> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> +#define INTF_SC7280_MASK \
> +	(INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS))
>  
>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>  			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4eda2cc847ef..01c65f940f2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -185,6 +185,7 @@ enum {
>   * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>   *                                  than video timing
>   * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>   * @DPU_INTF_MAX
>   */
>  enum {
> @@ -192,6 +193,7 @@ enum {
>  	DPU_INTF_TE,
>  	DPU_DATA_HCTL_EN,
>  	DPU_INTF_STATUS_SUPPORTED,
> +	DPU_INTF_DATA_COMPRESS,
>  	DPU_INTF_MAX
>  };
>  
> 
> -- 
> 2.40.1
> 
