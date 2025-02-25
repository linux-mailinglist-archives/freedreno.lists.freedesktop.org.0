Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3FEA4492B
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 18:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8B10E725;
	Tue, 25 Feb 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VBOwjnmz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C312810E1A7
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 17:58:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so83713e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506307; x=1741111107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
 b=VBOwjnmzK3A3wWVRcy/d51uqH1jXUoAK6S1ilhaQG9sdvTRs7ne0KFj1D1oLUM55QN
 56j+voTIto3x0autOwxv454A9tqplSsIpa/NxzvRXp0WVytROrKj0UMJ9UZEJ+QrDJGj
 zO0BXQa7+jSKnGPCLXKDMTdQ8KO03fY1ybEeJPCzZ9roi+feHNVrXIa2sfEgPkfpWxhn
 sPbDpD8jHjIXdaV21sDtiQvnuR1UrseXBuNjHuWHPXdVbuUpLFP3NlPMciVmmpqxtPlI
 s0fv9wiTpye0smwHZAyyhtx+NH79hNXokxVwmUEU/qEq/DZknefQCD08oFBzmIkyo6KL
 ApUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506307; x=1741111107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
 b=E/xh65Az2KyN9WU2YNTIMcUlD7d5YCyJtyqxrp59Yejb9pPTCBAhZeL0PJrImwXdps
 TROpCY3X0CVIVWd5+Ddt19UIhD0GOcbtai4OGP6n6hSghOBX/Ewm+SiK3gGhJhgzYhDj
 26oXlKFQFrcGzxee2s90BBgfT4EVpAI1GFIcuaA7i91nDRpuS5xbIhLKMzn07AycOhJp
 +v6wGVITjd4wyMNGjVoHhepV83+Zd2Mtl4Pkcpua1Tk5RC+WUHq/uPlsCswJ40dS/63Y
 bKlQc+WDhwfnBcPZ+DbzignPFjbo3BPG5eigrOkIFsR2ZdVGAWJ3+vmnh2EJrJqFXnAJ
 2r/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgyedlqe6aQfU9es5s+dxHSEfM4osskBtCQtreIJh12Mtkd2JMzgU7ccGdmy/7uCnJTvMU3RH03As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM62Ikr1SkiVFJxPenvLDWlLu13roJUH998n49s8I1yFqMBhkJ
 dJAIID6T+JDRFhQDqD+5r8S8ghNuFZBsyrM3nBpI+9IhWBUkbujlZMhGgy4y0t8=
X-Gm-Gg: ASbGncuCpRQG9rlMXCdC4U+R0T4BbHrHe83huC5JtETXfdFNmMxUnVFRqJcj45/Jgb7
 VY9n2qTzUAQA0+ndCcmkZomAGViHUGwENyzWlIbqa8BRJQWD9jLurX8qQotJwf58zkQEtnsRl+w
 yv/yCnyK4+7LKXJzei1a/O+Xz6gBq9JUs673eZD83mkBAh+2npLTTQ3+haL0GBpjsz/5+JInwW6
 U0UTwxJqOWmlWHJlsngZ+j5jLIKZOPLssQwgrDhdeb03lBqVTd4CCzctxmPrBv5y9b8E+GNGF4C
 aKYK0kSd3GpKkDEHEri4KHLIVOpgl+2fPtpJK9TzrlgeXTLXXUQ/m6miuBRibEnZ0fCwCqxtT/N
 D9X5eGA==
X-Google-Smtp-Source: AGHT+IGkHEvgIIfbZAqOgHLpKus9PcVasPLlY5V6IFk/rGEQb+8IEPE9UGG2WuATzUd3x9e1FtOaEw==
X-Received: by 2002:a05:6512:3ba1:b0:545:31d8:f384 with SMTP id
 2adb3069b0e04-546e418d42emr8418369e87.10.1740506306966; 
 Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4ce7sm230452e87.159.2025.02.25.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Date: Tue, 25 Feb 2025 19:58:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-11-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-11-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:23PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is a not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, we should verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is of the DisplayPort type, we should add
> DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
> operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d2655bf46842..9b6303267924 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> @@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge ||
> +	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

This is incorrect, because there can be other kinds of bridges in the DP
chain. I think it's better to check for !eDP instead.

> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> +	}
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
