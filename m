Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBD25A122
	for <lists+freedreno@lfdr.de>; Wed,  2 Sep 2020 00:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328CA6E03F;
	Tue,  1 Sep 2020 22:05:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE576E03F
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 22:05:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598997945; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wiXrUylPLCtiV8vifkgAKV6u9w2mjnJrdCUbvJNOimQ=;
 b=EYRcQJ21PeuiuBKsqioN4h6SB1/qB1mCf5oaMBwjt7NDptKmurRuawTiiwPjEBUG/fobKwQy
 58axIvJlvun+iX21duY88Ca21R1YSvbLCzz4o/agEn804nbXQYje36dU7gGUzr3vsUm2Lr6y
 GNhcPEE01TGkhSN6WYLdU9U0R4Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f4ec5b0947f606f7e352a38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 22:05:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E4CA3C433C9; Tue,  1 Sep 2020 22:05:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F9E5C433C6;
 Tue,  1 Sep 2020 22:05:34 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Sep 2020 15:05:34 -0700
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20200901215942.2559119-2-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
 <20200901215942.2559119-2-swboyd@chromium.org>
Message-ID: <cfa79004980a6bd72466132dc77f99db@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Avoid div-by-zero in
 dpu_crtc_atomic_check()
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
Cc: freedreno@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sean Paul <sean@poorly.run>, linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-09-01 14:59, Stephen Boyd wrote:
> The cstate->num_mixers member is only set to a non-zero value once
> dpu_encoder_virt_mode_set() is called, but the atomic check function 
> can
> be called by userspace before that. Let's avoid the div-by-zero here 
> and
> inside _dpu_crtc_setup_lm_bounds() by skipping this part of the atomic
> check if dpu_encoder_virt_mode_set() hasn't been called yet. This fixes
> an UBSAN warning:
> 
>  UBSAN: Undefined behaviour in 
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:860:31
>  division by zero
>  CPU: 7 PID: 409 Comm: frecon Tainted: G S                5.4.31 #128
>  Hardware name: Google Trogdor (rev0) (DT)
>  Call trace:
>   dump_backtrace+0x0/0x14c
>   show_stack+0x20/0x2c
>   dump_stack+0xa0/0xd8
>   __ubsan_handle_divrem_overflow+0xec/0x110
>   dpu_crtc_atomic_check+0x97c/0x9d4
>   drm_atomic_helper_check_planes+0x160/0x1c8
>   drm_atomic_helper_check+0x54/0xbc
>   drm_atomic_check_only+0x6a8/0x880
>   drm_atomic_commit+0x20/0x5c
>   drm_atomic_helper_set_config+0x98/0xa0
>   drm_mode_setcrtc+0x308/0x5dc
>   drm_ioctl_kernel+0x9c/0x114
>   drm_ioctl+0x2ac/0x4b0
>   drm_compat_ioctl+0xe8/0x13c
>   __arm64_compat_sys_ioctl+0x184/0x324
>   el0_svc_common+0xa4/0x154
>   el0_svc_compat_handler+0x
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..74294b5ed93f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -881,7 +881,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  	struct drm_plane *plane;
>  	struct drm_display_mode *mode;
> 
> -	int cnt = 0, rc = 0, mixer_width, i, z_pos;
> +	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
> 
>  	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
>  	int multirect_count = 0;
> @@ -914,9 +914,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
> 
>  	memset(pipe_staged, 0, sizeof(pipe_staged));
> 
> -	mixer_width = mode->hdisplay / cstate->num_mixers;
> +	if (cstate->num_mixers) {
> +		mixer_width = mode->hdisplay / cstate->num_mixers;
> 
> -	_dpu_crtc_setup_lm_bounds(crtc, state);
> +		_dpu_crtc_setup_lm_bounds(crtc, state);
> +	}
> 
>  	crtc_rect.x2 = mode->hdisplay;
>  	crtc_rect.y2 = mode->vdisplay;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
