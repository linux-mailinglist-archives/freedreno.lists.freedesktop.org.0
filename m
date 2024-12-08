Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05899E84EB
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 13:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036010E44F;
	Sun,  8 Dec 2024 12:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LdcJ/u2D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7E10E461
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 12:03:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1898615e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 04:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733659432; x=1734264232; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9KXx0ApNlsijlOZA0ju99Q+G9M5R7Yx2sQkciVcDS4=;
 b=LdcJ/u2DJ5YE40VPwIgea5+TzRbvtu9A8PdWzRV+B3EmGF0DtXkwiO9TaHQa4CCnDa
 okeG3nn3Qlj31VjFjKDyJSDrBpoThYBnX4nYE6TW9E2Vmlxhl1B2OOhwbi+N8n64xVLV
 sw5m5psHsP/cIEJSZ9gXl7/T702YyKfJWzev6/q1cf9z8zgdEmx05hArzqB/sK6fTnDf
 4xjs3GZnZDR1pN5u88zllM6m+quj/uF7IYpD89ipufZ88MO070ePGOmOJRbKlduwrs9h
 PKaGmdOCy4zfwe1LWa5mYoRj2BiSrzLuDaw33SMyhmDkJXOEnTG/nyr1H/PpoHWB3tz1
 Ct5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733659432; x=1734264232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9KXx0ApNlsijlOZA0ju99Q+G9M5R7Yx2sQkciVcDS4=;
 b=ueZoV1ZnsMlR2AFXqtEHJ9WeeYyu6QP2A6lLAdXgpUiN/uc9UE94VDKT0krUE0nvGV
 uslIayNQCdsod2dhkvhYR1MN7HFxx+1rJv13YhTXAZ6ROSNWP+wv0EzTmwbNuhj+7P5k
 ckIJoIpWkqOXJrWIJZAHcie3OwlbzISl7R5d3L7BTY/Q3+QxMkqZVX84rVo9BP0u0T88
 8IPe42q6657xTOxRgAzNs9SYcFVnXRshozsg3M6c5HfnZkvghi5BlCeiek26vReI+iG6
 3gCWVtvbVg44t8blu6kbKohdEfcftUBCpnzYtHfkC7wgKfC9HtwrnJtqY+4YxBVaw5ug
 uRhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSTLkbM6cbiHgGBB8yVYuf8TPQuoxmMjbSctlN5UOCFG6ELBtk5HOc8850EbvefWNbLggqmw3VbC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDGffxA9q/PMhCFS+wV7MTHs06IuCOf4sDs7XUFBEOOWS5Mxl/
 t9ZVepKxamVyjqv1cO5szjY6OfgEI8SQ0RiisOVeeBNSsdIHQ+Cfk1lYOM1L4fs=
X-Gm-Gg: ASbGncuOr2w9m/3VSvwCCLJOTd1UhEkZ5l3HCusF0wruewkSKgOmLyu4/CI2uZW9ufH
 7HL+TAY6KGVBSSQcOKyCMjkmkG2AumU1vLRDC2vVZEqL13wQglT69F5KkSFfiKTXzheNIhLexZD
 e4qM+4GL5Q5GDoNrVXon0HN0rjH8okn/OU600vWHK4SiPP6MiCWOK7qTHRJCfZDK+UGSLH8sNjl
 HoojP2dm0vIkfWjTcb3F/HMR1IdNwAegGf7txWVcVSZDwa9vy5twQU0mdqDqHYjqzCZi46mFK65
 77QVDuXowZkh8khl4AN/ZL/Qxz781w==
X-Google-Smtp-Source: AGHT+IE3O1vDcG2I7HunwmWrjoW+AhnlewTum6tSDC7QGhQdfWJpHRGs4D0Utg5tFcMzbQvnOUmbyQ==
X-Received: by 2002:a05:6512:33d1:b0:539:e58a:9704 with SMTP id
 2adb3069b0e04-53e2c2c2e2dmr2716844e87.33.1733659432037; 
 Sun, 08 Dec 2024 04:03:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e395e0c65sm589206e87.256.2024.12.08.04.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 04:03:50 -0800 (PST)
Date: Sun, 8 Dec 2024 14:03:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 08/45] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Message-ID: <7bscw5btxqonvfo4fqbalhjdhs3hewtkcr3svpxonhsuawzpio@d4wbamnobcdl>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-8-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-8-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:39PM -0800, Abhinav Kumar wrote:
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++-------------
>  3 files changed, 31 insertions(+), 27 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nevertheless,

> @@ -905,20 +905,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
> -	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
> -		msm_dp_ctrl_off(dp->ctrl);
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +
> +	/* dongle is still connected but sinks are disconnected */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_ctrl_psm_config(dp->ctrl);
> +
> +	msm_dp_ctrl_off(dp->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (dp->link->sink_count == 0)

It might be better to have just two codepaths:

if (sink_count == 0) {
  msm_dp_ctrl_clear_vsc_sdp_pkt()
  msm_dp_ctrl_psm_config()
  msm_dp_ctrl_off()
  msm_dp_ctrl_reinit_phy()
} else {
  msm_dp_ctrl_clear_vsc_sdp_pkt()
  msm_dp_ctrl_off()
  msm_dp_display_host_phy_exit()
}

> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
> +	else
>  		msm_dp_display_host_phy_exit(dp);
> -	}
>  
>  	msm_dp_display->power_on = false;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
