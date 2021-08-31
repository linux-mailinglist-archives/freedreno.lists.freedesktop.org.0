Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389963FC0DB
	for <lists+freedreno@lfdr.de>; Tue, 31 Aug 2021 04:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBD689A20;
	Tue, 31 Aug 2021 02:38:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643B89A20
 for <freedreno@lists.freedesktop.org>; Tue, 31 Aug 2021 02:38:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630377485; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f5PH1c2Q9OdWIhu2QIBmQoNKRUvL9mV+r77gAYAqJl4=;
 b=EgtQz2+t0JkH/MYFahi0BUnHQgbPvpVaIsSzMGRVrLNqC38/MbI+clZrUI0oq3CHOcDLOvX+
 4H43vccCDmnpfuHlWCwN68fYZ9ZWrxIaKs18qsGCmw3Yr7x1aK0plDCJNLEDPzaJVLl/PWfk
 zzU2Q9QlS/75Wlpg6XQM/zE4t+Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 612d960cb52e91333cd2bffa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 02:38:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3278C43460; Tue, 31 Aug 2021 02:38:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D6BDC4338F;
 Tue, 31 Aug 2021 02:38:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 30 Aug 2021 19:38:02 -0700
From: abhinavk@codeaurora.org
To: Mark Yacoub <markyacoub@chromium.org>
Cc: freedreno@lists.freedesktop.org, seanpaul@chromium.org,
 robdclark@chromium.org, Mark Yacoub <markyacoub@google.com>
In-Reply-To: <20210830181359.124267-1-markyacoub@chromium.org>
References: <20210811180844.2130484-1-markyacoub@chromium.org>
 <20210830181359.124267-1-markyacoub@chromium.org>
Message-ID: <3afb697f8bbe4a8d557612a6717f2c37@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Change
 dpu_crtc_get_vblank_counter to use vsync count.
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-08-30 11:13, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [why]
> vsync_cnt atomic counter increments for every hw vsync. On the other
> hand, frame count is a register that increments when the frame gets
> actually pushed out. We cannnot read this register whenever the timing
> engine is off, but vblank counter should still return a valid number.
> This behavior also matches the downstream driver.
> 
> [How]
> Read the encoder vsync count instead of the dpu_encoder_phys frame
> count.
> 
> Suggested-by: Abhinav Kumar <abhinavk@codeaurora.org>
> CC: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

LGTM,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  8 +++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
>  3 files changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9a5c70c87cc86..cfd426b6776e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -78,15 +78,13 @@ static struct drm_encoder
> *get_encoder_from_crtc(struct drm_crtc *crtc)
> 
>  static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>  {
> -	struct drm_encoder *encoder;
> -
> -	encoder = get_encoder_from_crtc(crtc);
> +	struct drm_encoder *encoder = get_encoder_from_crtc(crtc);
>  	if (!encoder) {
>  		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> -		return false;
> +		return 0;
>  	}
> 
> -	return dpu_encoder_get_frame_count(encoder);
> +	return dpu_encoder_get_vsync_count(encoder);
>  }
> 
>  static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c04b7cce43e3..41d5643327709 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -397,19 +397,11 @@ int dpu_encoder_helper_unregister_irq(struct
> dpu_encoder_phys *phys_enc,
>  	return 0;
>  }
> 
> -int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
> +int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
>  {
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
> -	int framecount = 0;
> -
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	phys = dpu_enc ? dpu_enc->cur_master : NULL;
> -
> -	if (phys && phys->ops.get_frame_count)
> -		framecount = phys->ops.get_frame_count(phys);
> -
> -	return framecount;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct dpu_encoder_phys *phys = dpu_enc ? dpu_enc->cur_master : NULL;
> +	return phys ? atomic_read(&phys->vsync_cnt) : 0;
>  }
> 
>  int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 99a5d73c9b886..e241914a96777 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -163,9 +163,9 @@ void dpu_encoder_set_idle_timeout(struct
> drm_encoder *drm_enc,
>  int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
> 
>  /**
> - * dpu_encoder_get_frame_count - get interface frame count for the 
> encoder.
> + * dpu_encoder_get_vsync_count - get vsync count for the encoder.
>   * @drm_enc:    Pointer to previously created drm encoder structure
>   */
> -int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
> +int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
> 
>  #endif /* __DPU_ENCODER_H__ */
