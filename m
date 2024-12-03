Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF939E1E31
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914F10E469;
	Tue,  3 Dec 2024 13:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jjEu8S2j";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455AE10E469
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:50:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53dd2fdcebcso6377663e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233821; x=1733838621; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i5bRAEVBnLCWLf2N/lte8AbWq1y/ZyDLk/58hb1dzyY=;
 b=jjEu8S2jX2CckS4GAIEx0VLyg8JWU6g26pVh1/0iWF4av2XQDeVnAZwY+2Mm82wxoX
 gnGFVXGp2UR/3tItX+5hGo9rwPfcmGPqo6oVR8bDfLIT66uyYWu71RkJ8/XyQg/20JYX
 GwBgMTuG8Yrj8ilrF21HSG0n6znTMFciqQDNSL5mF4DyANZn9SRfB7ZF3OhUGuqTROEq
 fAiCuM/9NMycmcJY7xMN0PtAlOBw3ACcn4a25rIysY6qWKHa2aX2dX/l5dlD1oASF54Y
 4sg52ZGeIfIBPN8BIQzj/7X3YpjpoNZKmEa1HTpP0vgy8Za7R7EF25VXjkLEuPXPMol3
 Nr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233821; x=1733838621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5bRAEVBnLCWLf2N/lte8AbWq1y/ZyDLk/58hb1dzyY=;
 b=XnIGnf910B5V1u7Wuj+Y83Ych/O87zyfQJkVaHk7f5kfCeMqqIxPjh8AjVjx/mJx1H
 FV8F+VgCiGu4MZhAtToOwHMQIxmGyRnN4kAd/8TE/v7O7f/9vmAZHm+e4D1OaC9xL2Uf
 rxZVvwZEXpx6Prh39aRpGXGoZ92ZtCpjNy4T3bXXKGKQui06XQ2oHgs3MCSosUzB1AmM
 QCrvr5cWegbqKsS7erzm+I3ex5fNPlAbcKwW21RSk6QorXAqtmr0xHh6qLfrHB5Zy1QE
 VYg8wJa+zo20xbml0QfevchHbXXZTY50HVk5pXVEV8eheBPFbOz4iP5YjWwphK488C/8
 Qg8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfQv3Az2Yql6r8hU8EMXy+UI7Gt25+snNvXXRc6GOcu0tTl3UXB7Ag1AppT4Uoq5gKFwbwaBCkZVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPosvOQcPD8UpNjS+ZpOclNJuvT2jTiix1Cl4jDcr8F5ODa7Jw
 wGKNSWfffxyhBj/t6SpqGPq0ME7Zq1CfkptFG1Ouf4MSX6Xhq6EvLBYPiZJEJ8U=
X-Gm-Gg: ASbGncu12k8jgv/bqcxWRwHZdnSlpXtsOOdHlhCy8isv/93s4vPCASB1ELPaUf8/BuI
 A+F/FihZp3eBNZ2ecQq5HHh9p4tKUKPsh+V98XPxeH7fGDVBPutibzncBNvhH257WlkFoqUmn57
 dLn8M3o3TIb62LmpyR3hYH9vU564tzJyNQNJPtg71Q4pHGxaRAemD5Oo4UyUgVThIbOaAXFf/0g
 xjNNjEn/ECr+KH1RAo0etEeWPSUX/QH2P26Z+xzJoGvGW1PbsINGuCa9UGNbxZrx796RBAs9sCT
 z9S5e1EyKUG3Q7BN4Q1RSotFYy5Z1A==
X-Google-Smtp-Source: AGHT+IE9N/OcxHC2ukSRbkQj4jXmTNc0VQUObxjzYPEdTf0i7Xv2g8tPoaKlRXy71a7L1/Z26oJOwQ==
X-Received: by 2002:a05:6512:104f:b0:53d:e780:3ff7 with SMTP id
 2adb3069b0e04-53e12a210f0mr1503999e87.39.1733233821319; 
 Tue, 03 Dec 2024 05:50:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1b625009sm48584e87.119.2024.12.03.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:50:20 -0800 (PST)
Date: Tue, 3 Dec 2024 15:50:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Message-ID: <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:39:00PM -0800, Abhinav Kumar wrote:
> In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
> checks were introduced to avoid handling any plug or irq hpd events in
> ST_DISPLAY_OFF state.
> 
> Even if we do get hpd events, after the bridge was disabled,
> it should get handled. Moreover, its unclear under what circumstances
> these events will fire because ST_DISPLAY_OFF means that the link was
> still connected but only the bridge was disabled. If the link was untouched,
> then interrupts shouldn't fire.

What about the link being untouched, but the monitor being toggled
somehow, which might generate HPD / attention events?

> 
> Even in the case of the DP compliance equipment, it should be raising these
> interrupts during the start of the test which is usually accompanied with either
> a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
> to handle these anyway. In the absence of a better reason to keep these checks,
> drop these and if any other issues do arise, it should be handled in a different
> way.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aba925aab7ad..992184cc17e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF) {
> -		mutex_unlock(&dp->event_mutex);
> -		return 0;
> -	}
> -
>  	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
> @@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF) {
> -		mutex_unlock(&dp->event_mutex);
> -		return 0;
> -	}
> -
>  	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
>  		/* wait until ST_CONNECTED */
>  		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
