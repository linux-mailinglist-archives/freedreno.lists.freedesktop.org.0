Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD96D7076F8
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 02:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7375110E4BD;
	Thu, 18 May 2023 00:35:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5B010E4BD
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 00:35:34 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af0eb50b4aso9849321fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 17:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684370132; x=1686962132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C7H9lyxDxkDg61JKpVX8LIy2P7Ao18JUXxapxUbMICc=;
 b=Xk0Qw5NSWZMJW3vyY1uJCjV3ljtw/lISS3MHID/Ixq3DNVIBvOBgHA/CqW5JXhtrQh
 dRLbFCWM21ZVDplBv0Czt5VyQfs5IUH2T6+JJ+Kdwa+tqUtBMXNZt1/YtaP7zbqdhU3g
 ICnMZ3SFYQEFwt3tZ+DFogNIvxVW6NhGIArUKoIgfOrema/xiO9YkqmJbbwwjN1jS7Fm
 rCYpsnuZFNwEwOEJ+X9zYd3UmXlH53sr11BKSuZW6ju4KEXtGBYBzwV0xNEWXizhp5Z3
 udT38AGLyBLWIfgAlQGNhvI49jp6oUrQiLOmLnySNdzqi5vB481DoYDXg/PRetVnc9uB
 4LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684370132; x=1686962132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7H9lyxDxkDg61JKpVX8LIy2P7Ao18JUXxapxUbMICc=;
 b=ZDo3FUGJaOoChqspA/dhcX8lC+gdXkx8HSL1H3kpM+OwyTy77A7Ox5O/w4rLK7os8T
 Qz9wzMsNFIMMTc/6slGoyNkAnPiPPeBcdk59SGowL16lqPNG8+eoZofd6neam2rzG+tD
 YXqAt6lzRHfevkCObZLKu1Z0/VLrMBzZVqFzbCtVI9K9DkONjBMbH0L6cgWrs2lunpXM
 C//1WBCQx3OhVLRMY8kQEVIGxf1YUnb6VGduPbQ9+Y4NrEMykqL/n29yAqp5AcB+nIDR
 nh0xvN8A5kgDFIvn43ZDYpA19UVW6m9yAXTPDfnJaP0pd/XDFB90hcfM9M1PPFAVQSge
 v6fg==
X-Gm-Message-State: AC+VfDwDejmAc6QkJZuCBQcLOrh8LhgpG1eTD1AYjV448TQsUkHqTC0u
 Z+EVc/a/+VyJ2yuzE+VBJJ3BIA==
X-Google-Smtp-Source: ACHHUZ6/bBHV4OVUk6eVqbH/BFUswLQE8b3ckWHp/5nr6Ou60zCjGmQc81O9FiaSfjPUSzHUeLNMQg==
X-Received: by 2002:a05:651c:212:b0:2a8:c75c:96cb with SMTP id
 y18-20020a05651c021200b002a8c75c96cbmr10096891ljn.1.1684370132479; 
 Wed, 17 May 2023 17:35:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a19c51a000000b004eb3b6da6f5sm55081lfe.228.2023.05.17.17.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 17:35:31 -0700 (PDT)
Message-ID: <82be767c-1c61-7685-5432-2f5f62bee9e8@linaro.org>
Date: Thu, 18 May 2023 03:35:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v10 6/8] drm/msm/dpu: separate DSC flush
 update out of interface
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/05/2023 01:01, Kuogee Hsieh wrote:
> Currently DSC flushing happens during interface configuration at
> dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
> dpu_hw_ctl_intf_cfg_v1() by adding dpu_hw_ctl_update_pending_flush_dsc_v1()
> to handle both per-DSC engine and DSC flush bits at same time to make it
> consistent with the location of flush programming of other DPU sub-blocks.
> 
> Changes in v10:
> -- rewording commit text
> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
>   3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ffa6f04..1957545 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1834,7 +1834,8 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>   	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>   }
>   
> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
> +				     struct dpu_hw_dsc *hw_dsc,
>   				     struct dpu_hw_pingpong *hw_pp,
>   				     struct drm_dsc_config *dsc,
>   				     u32 common_mode,
> @@ -1854,6 +1855,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   
>   	if (hw_pp->ops.enable_dsc)
>   		hw_pp->ops.enable_dsc(hw_pp);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>   }
>   
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> @@ -1861,6 +1865,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   {
>   	/* coding only for 2LM, 2enc, 1 dsc config */
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>   	int this_frame_slices;
> @@ -1898,7 +1903,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> -		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
> +		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i], dsc,
> +					 dsc_common_mode, initial_lines);

Moving dsc to the next line would be more logical.

>   }
>   
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4f7cfa9..4e132d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>   		}
> +
> +	if (ctx->pending_flush_mask & BIT(DSC_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> +			      ctx->pending_dsc_flush_mask);
> +
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
> +						   enum dpu_dsc dsc_num)
> +{
> +	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
> +	ctx->pending_flush_mask |= BIT(DSC_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>   	enum dpu_dspp dspp, u32 dspp_sub_blk)
>   {
> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>   
> -	if (cfg->dsc)
> -		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> -
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +
> +	if (cfg->dsc)
>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> @@ -630,6 +638,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   		ops->update_pending_flush_merge_3d =
>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>   		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +		ops->update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
>   	} else {
>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 6292002..d5f3ef8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>   		enum dpu_dspp blk, u32 dspp_sub_blk);
>   
>   	/**
> +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx: ctl path ctx pointer
> +	 * @blk: interface block index
> +	 */
> +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
> +		enum dpu_dsc blk);

Please align to the opening parenthesis.

> +
> +	/**
>   	 * Write the value of the pending_flush_mask to hardware
>   	 * @ctx       : ctl path ctx pointer
>   	 */
> @@ -229,6 +238,9 @@ struct dpu_hw_ctl_ops {
>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>    * @pending_intf_flush_mask: pending INTF flush
>    * @pending_wb_flush_mask: pending WB flush
> + * @pending_merge_3d_flush_mask: pending merge_3d flush
> + * @pending_dspp_flush_mask: pending dspp flush

These two can go to a separate patch.

> + * @pending_dsc_flush_mask: pending dsc flush
>    * @ops: operation list
>    */
>   struct dpu_hw_ctl {
> @@ -245,6 +257,7 @@ struct dpu_hw_ctl {
>   	u32 pending_wb_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> +	u32 pending_dsc_flush_mask;
>   
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;

-- 
With best wishes
Dmitry

