Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604234AA465
	for <lists+freedreno@lfdr.de>; Sat,  5 Feb 2022 00:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E860210E7AE;
	Fri,  4 Feb 2022 23:36:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344910E7AE
 for <freedreno@lists.freedesktop.org>; Fri,  4 Feb 2022 23:36:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u14so15428291lfo.11
 for <freedreno@lists.freedesktop.org>; Fri, 04 Feb 2022 15:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qy+gIBYLIbKDWhN1h0m5+vUcUG6n3Zo+6kxVHhllWUg=;
 b=OMrFggrCrdYgt9+y7G/cPAgdbxJQ1RULKve5zsM5aDZX3jpVsrK4DrLBnpDQ6p247K
 /e6H6Bctk9XoXg2+FJNH6/bw0rbXFyZy+JQu5o0eRCsAnqN57j1kbpHb2t8gh51BgTyK
 LK5s87XXyiHfmSVZMuJKT/PbJEFWYwqL1iYZ9Y5MtAR4EohwXz0HphJ8OHrRDmDTOGbr
 NG6FTpVykRmCnuPK57HcN/kglhwb4U/9QfQwgHWZJ3uiCJFbwnwy3KjVWugHtJUET4Al
 brrO8YFYWwUhqMkDU8T9arT+RLboJDhP4vGLzhSmsg3pqzQxrFm8uutS4dSeC5KB3bp4
 SHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qy+gIBYLIbKDWhN1h0m5+vUcUG6n3Zo+6kxVHhllWUg=;
 b=NSOPQeojkko0dilSkeJze6HH1GpG/tTXKXv+F+ezDk5s0oqGnTwE+dt11pI6ZcnfDw
 mSVVbRgf8OZYkTnjwlkhnQrjxz4OU47jW88LgIjdtkRRe2VdUI3K2cEF1R5oXffrAVV8
 hohrL4/CxIkzooQVKQozOotlYlULSK5na3fh5reMPrJdZSSmp7HuQO3jYhh4b61yLGso
 zG61HSGM/y6HVLwoziYz7L+MQ2AN/LeOpcJXOOTjiQlhd7+R4yQUm3MBT62wDaku+xEi
 Iph6GH+JuBhenfN/+LJONB/xTnEYBH06hpi2h+MhEMUHTgTCa9MDkHHXcSobausFimno
 n/AQ==
X-Gm-Message-State: AOAM530rcPEdcMu9b9luSaaiPoSoT4gIgr6gtkLmobUIEPt5KkOPAPpy
 5o5yVZiSZn6PaDAWwosF9XkTGA==
X-Google-Smtp-Source: ABdhPJzEJJc7IiH2XqG3sFoVhgov0D9Acp6hUVFu4EiKcRl3h4PTPUaCUKg8TQ7LlQ2kC+Dhp6QfXw==
X-Received: by 2002:a05:6512:31cf:: with SMTP id
 j15mr1007959lfe.24.1644017770036; 
 Fri, 04 Feb 2022 15:36:10 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bp19sm495832lfb.66.2022.02.04.15.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 15:36:09 -0800 (PST)
Message-ID: <177eca6a-32a8-b121-30ae-d365329df7f2@linaro.org>
Date: Sat, 5 Feb 2022 02:36:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 markyacoub@chromium.org, quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Make changes to dpu_encoder to support virtual encoder needed
> to support writeback for dpu.

This patch will change significantly if

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 57 +++++++++++++++++++++--------
>   1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e977c05..947069b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -974,6 +974,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> +	enum dpu_hw_blk_type blk_type;
>   	int num_lm, num_ctl, num_pp;
>   	int i, j;
>   
> @@ -1061,20 +1062,36 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> +		if (phys->intf_mode == INTF_MODE_WB_LINE)
> +			blk_type = DPU_HW_BLK_WB;
> +		else
> +			blk_type = DPU_HW_BLK_INTF;
> +
>   		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
> -			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
> +			global_state, drm_enc->base.id, blk_type,
>   			hw_blk, ARRAY_SIZE(hw_blk));
> -		for (j = 0; j < num_blk; j++) {
> -			struct dpu_hw_intf *hw_intf;
>   
> -			hw_intf = to_dpu_hw_intf(hw_blk[i]);
> -			if (hw_intf->idx == phys->intf_idx)
> -				phys->hw_intf = hw_intf;
> +		if (blk_type == DPU_HW_BLK_WB) {
> +			for (j = 0; j < num_blk; j++) {
> +				struct dpu_hw_wb *hw_wb;
> +
> +				hw_wb = to_dpu_hw_wb(hw_blk[i]);
> +				if (hw_wb->idx == phys->intf_idx)
> +					phys->hw_wb = hw_wb;
> +			}
> +		} else {
> +			for (j = 0; j < num_blk; j++) {
> +				struct dpu_hw_intf *hw_intf;
> +
> +				hw_intf = to_dpu_hw_intf(hw_blk[i]);
> +				if (hw_intf->idx == phys->intf_idx)
> +					phys->hw_intf = hw_intf;
> +			}
>   		}

I think that if we sequentially call dpu_rm_get_assigned_resources(.., 
DPU_HW_BLK_INTF, ...) and then dpu_rm_get_assigned_resources(.., 
DPU_HW_BLK_WB, ...), the code would be cleaner.

Or even better get the WB direclty using the provided ID.

>   
> -		if (!phys->hw_intf) {
> +		if (!phys->hw_intf && !phys->hw_wb) {
>   			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf block assigned at idx: %d\n", i);
> +				      "no intf or WB block assigned at idx: %d\n", i);
>   			return;
>   		}
>   
> @@ -1224,15 +1241,22 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
>   
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return catalog->intf[i].id;
> +	if (type != INTF_WB) {
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +				&& catalog->intf[i].controller_id == controller_id) {
> +				return catalog->intf[i].id;
> +			}
> +		}
> +	} else {
> +		for (i = 0; i < catalog->wb_count; i++) {
> +			if (catalog->wb[i].id == controller_id)
> +				return catalog->wb[i].id;
>   		}
>   	}
>   
> @@ -2096,6 +2120,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   	case DRM_MODE_ENCODER_TMDS:
>   		intf_type = INTF_DP;
>   		break;
> +	case DRM_MODE_ENCODER_VIRTUAL:
> +		intf_type = INTF_WB;
> +		break;
>   	}
>   
>   	WARN_ON(disp_info->num_of_h_tiles < 1);
> @@ -2128,11 +2155,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>   				i, controller_id, phys_params.split_role);
>   
> -		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> +		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>   													intf_type,
>   													controller_id);
>   		if (phys_params.intf_idx == INTF_MAX) {
> -			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> +			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
>   						  intf_type, controller_id);
>   			ret = -EINVAL;
>   		}


-- 
With best wishes
Dmitry
