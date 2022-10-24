Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4160AEF0
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB7F10E855;
	Mon, 24 Oct 2022 15:22:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E910E84C
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:22:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r14so17356361lfm.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GmmEDLhPtDYGFH5uDa8ewun8HTtWaYq8inIclFrr34=;
 b=GUTUlgJsaHA4De+mJhZ+UmmvwF1ZwXh+aFlXzXw1Uu4YOSsKtA8lSWxzWzqwCsvU0Z
 0W9ubaTYraX0YXrqxMJo8XFG00LMRq2xkz1EMOEcyav4RH0VPoDsyw9ITOOlvZIcxarm
 LwlLO6dKyVXgUrdQCHGaotCIYgicdqB31t4+7XplhZ733ZuBWc3ZihwOliQFIuc/o/RF
 aPPZIMoKikhNUUEgc2EQ6iUNWNtnkYRPLhVyMTeD71ZwVN3pVKHuwikMotGnLICTcDZ3
 jOhoFcYkd/11Mz9N9lwn9OmKsNteueGXfzSicazT1Q+NkvHaBK/gwiLoG6wqL3u3CNPJ
 tu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GmmEDLhPtDYGFH5uDa8ewun8HTtWaYq8inIclFrr34=;
 b=Oxn3lif0MTqj9/dDYpSdf5++vud4YW/hq98dLOh26LwbF/Ntm8Yy/0NJjEcQHi7HQs
 12C9rsk4CRU//pVLtiCF+MvWatWJUzlBfusC/9tmm+2LnDcA77qdj9wEgGWbwhU3WX+s
 NIEA1vtv1gyEO02KcC2/fHtuHDImodpVXK7SwCcEmu6Cgq7EyCWUSv2lfSQp0rgZ75eO
 2voaJkHKMTUQFNZv3enhlPht0lpPWBab7Suw+jd0/P5kK0zpai0BvoGF9iLu1s0fCd8F
 rqFSaB9Mvj8UlYRg/6hbyT76eIX6u5Pq3BdxcE3RyornNawgnZI6IMtQZqtk/HIB01qU
 hD4g==
X-Gm-Message-State: ACrzQf3sgkkoU0zjN38T9nhS4/dSFFf4v2WFi4g92YFfOyxG4EBd0sIo
 a8jSfli1p0f9FjPVKQ7AOfeUyg==
X-Google-Smtp-Source: AMsMyM7TKRK5p/7QPJQNylGLX09PsYQBF/7sdHc8UeGpUuXeCeh4znls4acnCbTNBWbBWtUevXTOrw==
X-Received: by 2002:a05:6512:a8c:b0:4a2:10f1:6e06 with SMTP id
 m12-20020a0565120a8c00b004a210f16e06mr11369220lfu.415.1666624940562; 
 Mon, 24 Oct 2022 08:22:20 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a2ea44e000000b0026dfd1fb1aesm6080ljn.25.2022.10.24.08.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:22:20 -0700 (PDT)
Message-ID: <52e7a83b-bd83-ba63-55f9-a75cf549546d@linaro.org>
Date: Mon, 24 Oct 2022 18:22:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
 <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1665576159-3749-2-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v8 01/15] drm/msm/disp/dpu: clear
 dpu_assign_crtc and get crtc from connector state instead of dpu_enc
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, quic_aravindh@quicinc.com,
 swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/10/2022 15:02, Vinod Polimera wrote:
> Update crtc retrieval from dpu_enc to dpu_enc connector state,
> since new links get set as part of the dpu enc virt mode set.
> The dpu_enc->crtc cache is no more needed, hence cleaning it as
> part of this change.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 +++++++++--------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ------
>   3 files changed, 13 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321..8ec9a13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			release_bandwidth = true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
>   	}
>   
>   	/* wait for frame_event_done completion */
> @@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>   	dpu_crtc->enabled = true;
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> -
>   	/* Enable/restore vblank irq handling */
>   	drm_crtc_vblank_on(crtc);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..d05b353 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> - * @crtc:		Pointer to the currently assigned crtc. Normally you
> - *			would use crtc->state->encoder_mask to determine the
> - *			link between encoder/crtc. However in this case we need
> - *			to track crtc in the disable() hook which is called
> - *			_after_ encoder_mask is cleared.
>    * @connector:		If a mode is set, cached pointer to the active connector
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
> @@ -181,7 +176,6 @@ struct dpu_encoder_virt {
>   
>   	bool intfs_swapped;
>   
> -	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
>   	struct dentry *debugfs_root;
> @@ -1288,7 +1282,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	unsigned long lock_flags;
> +	struct drm_crtc *crtc;
>   
>   	if (!drm_enc || !phy_enc)
>   		return;
> @@ -1296,12 +1290,13 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   	DPU_ATRACE_BEGIN("encoder_vblank_callback");
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
> -	atomic_inc(&phy_enc->vsync_cnt);
> +	if (!dpu_enc->connector || !dpu_enc->connector->state ||
> +	    !dpu_enc->connector->state->crtc)
> +		return;
>   
> -	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc)
> -		dpu_crtc_vblank_callback(dpu_enc->crtc);
> -	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> +	atomic_inc(&phy_enc->vsync_cnt);
> +	crtc = dpu_enc->connector->state->crtc;
> +	dpu_crtc_vblank_callback(crtc);

So, what if the user commits the mode setting change on another CPU, 
while we are handling the vblank callback here? Can this happen?

>   
>   	DPU_ATRACE_END("encoder_vblank_callback");
>   }
-- 
With best wishes
Dmitry

