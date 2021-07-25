Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDC3D4B5D
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ADE737F2;
	Sun, 25 Jul 2021 04:08:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975B2737F2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:08:12 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id l126so6895143oib.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VMaB3vY2dufbHq4l3p72oIac6AlNtvIq05CVprUMmII=;
 b=p7mTtrsn+eU1+Xe9EUhFCAN3TifiVNSH7Ikny4Cl5I9RPHw1Ow4Ufh9ysP4r3e9VC8
 S1E0yz2Qts+9Zefyyj3nc+eV7bOGn65dFktOFSQYbS2SKVHY2n4qMLKRk7mLcgrMZXUw
 gr36j5GIBtzfXfB2datfx59ILOoPKjMPPirFgjeio/fxAGxzkmdRa9EfUONwxzNOZvv8
 ANJhkjXeIrpyoXVZHpicXS3A9DfcYVE26j8I0sWHuIs3kL7wjivBSALkFToBr9a/v1PU
 C0+dpKdxQJ06dMrVFbY4+RG4pg1x88NMg/aJ5gEMN0QUnZbxfZxt2w7iLbA5I5NA4CqX
 SBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VMaB3vY2dufbHq4l3p72oIac6AlNtvIq05CVprUMmII=;
 b=R6zFTfucaG9AKK0kgWQtjivOul0WsYblOcpzkfY8ejTErSU4GMeSsfYmTOWwm/KmYr
 7qXyb5DeEcRm3Fsi0paeXAdn5GiPQqHHGiA0Jfzqz5V20bhYAfTlAo61xJLdzr2osobL
 QGmqyjHxrcGNC9edBmwNJfDoYWfNEoMozx890QI5uM5n6IqYunwXbu+zXeAF2+Roc5WC
 /Ck3A949OTUO8InPYWsBFkyfMss41sGCXi0n2JGlPqO0W9nKscvXV7Sfy58IKUn4d/FC
 TqTwMd3UUOf1WYmV6Fg0/x5FvM5oLfj20XXz84BiTlynLN2v4zy+1WWlntlwiKiahoPK
 f1aA==
X-Gm-Message-State: AOAM533dNAch9JrFIKlQRVM4sJS0Ujb3d3RDvvf4t75AIm8HSPsYF3e1
 arRlF8oWKpI6OFJcqeRzbPg0sA==
X-Google-Smtp-Source: ABdhPJyES/Xh7ilkq1oDNnPV7WeA0Q9JIif9yMQxTMwm78l+CsYTi6M0FP1UUnJH73UCZSxPUHJ0CQ==
X-Received: by 2002:aca:1215:: with SMTP id 21mr13005806ois.37.1627186091976; 
 Sat, 24 Jul 2021 21:08:11 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x31sm6593605ota.24.2021.07.24.21.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:08:11 -0700 (PDT)
Date: Sat, 24 Jul 2021 23:08:09 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YPzjqYLVM/G/YzrD@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 5/7] drm/msm/dp: stop calling
 set_encoder_mode callback
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> None of the display drivers now implement set_encoder_mode callback.
> Stop calling it from the modeset init code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 051c1be1de7e..70b319a8fe83 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -102,8 +102,6 @@ struct dp_display_private {
>  	struct dp_display_mode dp_mode;
>  	struct msm_dp dp_display;
>  
> -	bool encoder_mode_set;
> -
>  	/* wait for audio signaling */
>  	struct completion audio_comp;
>  
> @@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
>  }
>  
>  
> -static void dp_display_set_encoder_mode(struct dp_display_private *dp)
> -{
> -	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -
> -	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
> -				kms->funcs->set_encoder_mode) {
> -		kms->funcs->set_encoder_mode(kms,
> -				dp->dp_display.encoder, false);
> -
> -		dp->encoder_mode_set = true;
> -	}
> -}
> -
>  static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
>  
> -	dp_display_set_encoder_mode(dp);
> -
>  	dp_power_init(dp->power, flip);
>  	dp_ctrl_host_init(dp->ctrl, flip, reset);
>  	dp_aux_init(dp->aux);
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
