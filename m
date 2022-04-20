Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286CC508194
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 08:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6D610E2CC;
	Wed, 20 Apr 2022 06:59:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4010E2CC
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 06:59:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b21so1163596lfb.5
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YtGP+NMiKj9zqpbNkcXYFdd/4ffoX2YWse6i1wDf3vs=;
 b=cxGqdaDtXQufDA2nPsO9Vn6p4BlVGvnwrClfqugcSVrHwEMpSJ+I0HO9Zo8yePdZ1p
 MAjropOj7NOlfUsBdzQdJoo/Bg2bFbHAWrY1bnirzbIWr+nxthkVypR0qsexOt92wtHv
 3GX/q6vqMnvzME/b4vVTradinRzKe9h1IVnPrrTcnNJ5gPgvxr1stz4wpN3Xgg5ZDzXy
 krNO9RRGLut2RBtL5+sA92/UhbsxHIml00BSVKbG3f85CnCj3Cj6lPA9acbAdWmNzky9
 gRBgwwv22PjeV23CFNiyn11cEBVZeU2lVUXaGCrHbivfC00pexjheAQHBxceNfc59Yqc
 UGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YtGP+NMiKj9zqpbNkcXYFdd/4ffoX2YWse6i1wDf3vs=;
 b=PjBXxCp8mXchO+ppqWrOzaCIV/pEdLtkqmkYrnjlnROpEVqBserfBZuoQ7mqpmJijr
 p0X0h4jzeGVVg4OYzmEu77QTajAstOuCIf11Bhb3bVC/2auAVpCCc7WhojlnAXDZQpsH
 /zqlNLlLEssj6ryLufCwyyZg36uIgyNa3wOVS7ycfWFxAm0moBcX6ABCq7Sutz2mSbIz
 eORGDVvl7OfSDdbTZvb/Ay6jxPlCbNUw5wRs9s/CkTSWq8xePxImDMudSYnV1Q+CDMQx
 UG+B+DIqZ+4I+NkaBsmmSz2jb8+GTP2/1n/PZoevPweVtGRcQKi+QOol87y5Wt1p368A
 v71Q==
X-Gm-Message-State: AOAM532kRK/8hCUeQwVLXvTUsFlNzNJyas50zFkYKqnPFsaw9tHYTzQP
 khErPTP7O1yMi1cqhciudqfcGg==
X-Google-Smtp-Source: ABdhPJz8d1A1mVMxTlH9jABO0M0qCuHzHGKNAaPsbdvkuLXi0C5QDJjOAUbKCHM13heMXd4jMBXaeQ==
X-Received: by 2002:a05:6512:312c:b0:46f:c444:1fea with SMTP id
 p12-20020a056512312c00b0046fc4441feamr13613496lfd.476.1650437970110; 
 Tue, 19 Apr 2022 23:59:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v13-20020ac25b0d000000b0046bbbdddc01sm1725285lfn.189.2022.04.19.23.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:59:29 -0700 (PDT)
Message-ID: <9e89aa11-40aa-0ce9-4747-c7894ba79050@linaro.org>
Date: Wed, 20 Apr 2022 09:59:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-9-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-9-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/17] drm/msm/dpu: add changes to
 support writeback in hw_ctl
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> Add changes to support writeback module in the dpu_hw_ctl
> interface.
> 
> changes in v2:
> 	- keep only the wb specific changes to reset_intf_cfg
> 	- use cfg->intf / cfg->wb to identify intf or wb
> 	- use bit-wise OR for the wb bits while programming
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 43 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 15 ++++++++++-
>   2 files changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 524f024..495a9cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
>   #include <linux/delay.h>
> @@ -23,10 +24,12 @@
>   #define   CTL_SW_RESET                  0x030
>   #define   CTL_LAYER_EXTN_OFFSET         0x40
>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
> +#define   CTL_WB_ACTIVE                 0x0EC
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
>   #define   CTL_DSC_ACTIVE                0x0E8
>   #define   CTL_DSC_FLUSH                0x104
> +#define   CTL_WB_FLUSH                  0x108
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -38,6 +41,7 @@
>   #define  MERGE_3D_IDX   23
>   #define  DSC_IDX        22
>   #define  INTF_IDX       31
> +#define WB_IDX          16
>   #define CTL_INVALID_BIT                 0xffff
>   #define CTL_DEFAULT_GROUP_ID		0xf
>   
> @@ -135,6 +139,9 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   	if (ctx->pending_flush_mask & BIT(INTF_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>   				ctx->pending_intf_flush_mask);
> +	if (ctx->pending_flush_mask & BIT(WB_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
> +				ctx->pending_wb_flush_mask);
>   
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
> @@ -255,6 +262,13 @@ static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
>   	}
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
> +		enum dpu_wb wb)
> +{
> +	ctx->pending_wb_flush_mask |= BIT(wb - WB_0);
> +	ctx->pending_flush_mask |= BIT(WB_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>   		enum dpu_intf intf)
>   {
> @@ -504,6 +518,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 intf_active = 0;
> +	u32 wb_active = 0;
>   	u32 mode_sel = 0;
>   
>   	/* CTL_TOP[31:28] carries group_id to collate CTL paths
> @@ -519,11 +534,20 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> -	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
> -	intf_active |= BIT(cfg->intf - INTF_0);
> +	if (cfg->intf) {
> +		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
> +		intf_active |= BIT(cfg->intf - INTF_0);
> +	}
> +
> +	if (cfg->wb) {
> +		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
> +		wb_active |= BIT(cfg->wb - WB_0);
> +	}
>   
>   	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>   	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> +	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);

This will not work as expected. If cfg->intf is not set, CTL_INTF_ACTIVE 
will be reset to 0 (while it should have been retained). Please change 
this to always read CTL_INTF_ACTIVE/CTL_WB_ACTIVE.

> +
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> @@ -546,6 +570,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>   		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>   	}
>   
> +	if (cfg->wb)
> +		intf_cfg |= (cfg->wb & 0x3) + 2;
> +

Ugh. I see that we have the same code in downstream driver. And that we 
do not support WB_0 at all. But maybe we should be more explicit here.

>   	switch (cfg->intf_mode_sel) {
>   	case DPU_CTL_MODE_SEL_VID:
>   		intf_cfg &= ~BIT(17);
> @@ -568,12 +595,13 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 intf_active = 0;
> +	u32 wb_active = 0;
>   	u32 merge3d_active = 0;
>   
>   	/*
>   	 * This API resets each portion of the CTL path namely,
>   	 * clearing the sspps staged on the lm, merge_3d block,
> -	 * interfaces etc to ensure clean teardown of the pipeline.
> +	 * interfaces , writeback etc to ensure clean teardown of the pipeline.
>   	 * This will be used for writeback to begin with to have a
>   	 * proper teardown of the writeback session but upon further
>   	 * validation, this can be extended to all interfaces.
> @@ -592,6 +620,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   		intf_active &= ~BIT(cfg->intf - INTF_0);
>   		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>   	}
> +
> +	if (cfg->wb) {
> +		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
> +		wb_active &= ~BIT(cfg->wb - WB_0);
> +		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
> +	}
>   }
>   
>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> @@ -622,6 +656,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   			dpu_hw_ctl_update_pending_flush_intf_v1;
>   		ops->update_pending_flush_merge_3d =
>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> +		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;

Do we also need the update_pending_flush_wb for non-ACTIVE_CTL case? I 
think we do.

>   	} else {
>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index c61a8fd..df8f8e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_CTL_H
> @@ -44,6 +45,7 @@ struct dpu_hw_stage_cfg {
>    */
>   struct dpu_hw_intf_cfg {
>   	enum dpu_intf intf;
> +	enum dpu_wb wb;
>   	enum dpu_3d_blend_mode mode_3d;
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
> @@ -102,6 +104,15 @@ struct dpu_hw_ctl_ops {
>   		u32 flushbits);
>   
>   	/**
> +	 * OR in the given flushbits to the cached pending_(wb_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx       : ctl path ctx pointer
> +	 * @blk       : writeback block index
> +	 */
> +	void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
> +		enum dpu_wb blk);
> +
> +	/**
>   	 * OR in the given flushbits to the cached pending_(intf_)flush_mask
>   	 * No effect on hardware
>   	 * @ctx       : ctl path ctx pointer
> @@ -199,6 +210,7 @@ struct dpu_hw_ctl_ops {
>    * @mixer_hw_caps: mixer hardware capabilities
>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>    * @pending_intf_flush_mask: pending INTF flush
> + * @pending_wb_flush_mask: pending WB flush
>    * @ops: operation list
>    */
>   struct dpu_hw_ctl {
> @@ -212,6 +224,7 @@ struct dpu_hw_ctl {
>   	const struct dpu_lm_cfg *mixer_hw_caps;
>   	u32 pending_flush_mask;
>   	u32 pending_intf_flush_mask;
> +	u32 pending_wb_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   
>   	/* ops */


-- 
With best wishes
Dmitry
