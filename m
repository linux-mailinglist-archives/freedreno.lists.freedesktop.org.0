Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6A25A124
	for <lists+freedreno@lfdr.de>; Wed,  2 Sep 2020 00:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9FD6E0AF;
	Tue,  1 Sep 2020 22:06:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AFB6E03F
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 22:06:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598997971; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=37vuzzoeSb7NLlot1nvDeIDm5w8vt0B+4whlw60ZvDI=;
 b=a5q+V6BNpj2XBy/tBOzpHtNFPUiUS/CaRzddMgvhf1Updm9MarGF/x2DaRUPa9dlc/RtgrhV
 3eCrNjWf8PQQxf+LN8R5o7ptRGjBse3RE4l4QDMp5pe8ikkDam3oeUoIXnyegrpEapJaLKCJ
 W2X6v9zOwsKQDPgbQtUbeGaG+cs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f4ec5d354e87432be5aaf9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 22:06:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F389C43387; Tue,  1 Sep 2020 22:06:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6865EC433C6;
 Tue,  1 Sep 2020 22:06:09 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Sep 2020 15:06:09 -0700
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20200901215942.2559119-3-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
 <20200901215942.2559119-3-swboyd@chromium.org>
Message-ID: <b68d6e231b174fb5e2c4adc22bb804d8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Drop debug print in
 _dpu_crtc_setup_lm_bounds()
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
> This function is called quite often if you have a blinking cursor on 
> the
> screen, hello page flip. Let's drop this debug print here because it
> means enabling the print via the module parameter starts to spam the
> debug console.
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 74294b5ed93f..2966e488bfd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -421,8 +421,6 @@ static void _dpu_crtc_setup_lm_bounds(struct 
> drm_crtc *crtc,
> 
>  		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>  	}
> -
> -	drm_mode_debug_printmodeline(adj_mode);
>  }
> 
>  static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
