Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D12733CB5
	for <lists+freedreno@lfdr.de>; Sat, 17 Jun 2023 01:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F610E6A7;
	Fri, 16 Jun 2023 23:03:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7CE10E6A8
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 23:03:32 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8F29F214E1;
 Sat, 17 Jun 2023 01:03:30 +0200 (CEST)
Date: Sat, 17 Jun 2023 01:03:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <66cakf7oasg3dyzlybzdk5r52ary5uo33gpzccvzmuwxaqcmt4@ji57gxfjfeya>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-20-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-20-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 19/19] drm/msm/dpu: drop empty features
 mask INTF_SDM845_MASK
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-16 13:03:17, Dmitry Baryshkov wrote:
> The INTF_SDM845_MASK features mask is zero. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>  3 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index d78cedd35c01..060e6a49b2f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -246,7 +246,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
>  	{
>  		.name = "intf_0", .id = INTF_0,
>  		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,
>  		.prog_fetch_lines_worst_case = 21,
> @@ -256,7 +255,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
>  	}, {
>  		.name = "intf_1", .id = INTF_1,
>  		.base = 0x6a800, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DSI,
>  		.controller_id = MSM_DSI_CONTROLLER_0,
>  		.prog_fetch_lines_worst_case = 21,
> @@ -266,7 +264,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
>  	}, {
>  		.name = "intf_2", .id = INTF_2,
>  		.base = 0x6b000, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DSI,
>  		.controller_id = MSM_DSI_CONTROLLER_1,
>  		.prog_fetch_lines_worst_case = 21,
> @@ -276,7 +273,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
>  	}, {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_HDMI,
>  		.prog_fetch_lines_worst_case = 21,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index de26f469ebb1..54d7475e1591 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -260,7 +260,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	{
>  		.name = "intf_0", .id = INTF_0,
>  		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,
>  		.prog_fetch_lines_worst_case = 24,
> @@ -270,7 +269,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	}, {
>  		.name = "intf_1", .id = INTF_1,
>  		.base = 0x6a800, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DSI,
>  		.controller_id = MSM_DSI_CONTROLLER_0,
>  		.prog_fetch_lines_worst_case = 24,
> @@ -280,7 +278,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	}, {
>  		.name = "intf_2", .id = INTF_2,
>  		.base = 0x6b000, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DSI,
>  		.controller_id = MSM_DSI_CONTROLLER_1,
>  		.prog_fetch_lines_worst_case = 24,
> @@ -290,7 +287,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	}, {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SDM845_MASK,
>  		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_1,
>  		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 4a18fc66a412..3efa22429e5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -95,8 +95,6 @@
>  
>  #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>  
> -#define INTF_SDM845_MASK (0)
> -
>  #define INTF_SC7180_MASK \
>  	(BIT(DPU_INTF_INPUT_CTRL) | \
>  	 BIT(DPU_INTF_TE) | \
> -- 
> 2.39.2
> 
