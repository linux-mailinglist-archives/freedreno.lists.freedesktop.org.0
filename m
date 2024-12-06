Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134339E694D
	for <lists+freedreno@lfdr.de>; Fri,  6 Dec 2024 09:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F10610E184;
	Fri,  6 Dec 2024 08:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uPiY0ziT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30710E037
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2024 08:51:33 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so1844021e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733475091; x=1734079891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWBX1bs+iy55emzBKbojkLtAmT1gtlPvb/CKsCaSB7Q=;
 b=uPiY0ziTQErKuKAGqz1t/FAIr5Si8WcQU3hc+EGfuuFYr4Pw6bDogQgmXDHX3MLjri
 DAIcOE1cEbB3GX3CaHS3fyoRJO/9wieiiiA9YQpbw7ug0c8ct/hHfXoSd4zKHI8PIDcN
 bcAVPEHKMAbc7vnuGdeUW193uiU2LC5Iruit0djJwdrDEqJqPw6XQfJ6cpSGeO3va7gh
 2XElMAsbZw8ey0GPhli0MzErw2m0uediOWX22j8c4BZIrXHOANDIJIWK9PjVqN9MOD38
 oj+5YTgCBnYgFk82tv3bfqjfSpFDkSoUdiMDJda0/ZQa0vMmr7KPBvyxfXFr4Cln8/ik
 7jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733475091; x=1734079891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWBX1bs+iy55emzBKbojkLtAmT1gtlPvb/CKsCaSB7Q=;
 b=HzMOLu+dbYuv38m8mmuU+q4zAbqMxOjXWI4bvMXRkUHCmiU/JwT/Fbirp0MFHzq7SR
 wM07Q5YIKqaWoktOhhOO6h9MLojs5mvGalOs/DlDOdd4d39RM32C63eq/tuGZeMD9ZFH
 /Btnl0zbJ89IqNHudjwA5ivqlPb+LsWtwJYGWdBQ3i7y1FKMzflwhEKayK2jTEQh9Nl8
 vPls+gFuPnA1l9HIMyRtJ6jfQ642MmOFBD7rjCfsBbZUEHjgZX7Nzj6G8/tkaLTnLRjF
 7+45UaEbZ+isSgBCT4TrhDAetNj5oeMGLOJpT8e4mbmcIH9h2knkMM9yR1qc3oWpaqYs
 QKOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7hcL97Ydl4TlZrS+oSDWsN5DEzmk+endC3H914Us9rMiErxxs4mT1eqI4I42DbnC3koZW1oeW0To=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysdl7jjMEJRLa0MZ0TFMYUCDwanf2irGW0rzPyk9Z6z/QBs8aH
 xkQV7ntFEfOLKpaNgu1yjI/XwzTMtelvFhIWRNNOabW1xmVU+VcNVRby4QEa9XA=
X-Gm-Gg: ASbGncvW834mpdPT8ESKAAueNWg1mJUakV0ZX3qJUWQmcn+rYooInn1OdxKNoilw90b
 DP6EOxqYG7a5tF86L8665LTdT5Jn9feso1/nimrN3c1focceEM33Vf8m/akTqFMbgdz49qWkG5G
 oLgErdP7VG5WmrTMv/Ys9AcfOcWyWg8+rHNaIaPJgkIvU8qtfq+35/T9lLHQHBgcRSFK/wNmTPM
 jF2sKlcMjAYZvawq0Zs2SxIP8kCjq6rAdx9N1KbGEDoCwqMoVoc548sZzXn+9iTU08YfegmmQWk
 GlYjvnLOjZoGDkJZBVypHvtfNT06IA==
X-Google-Smtp-Source: AGHT+IG7K+8pO9XWmqftdiowiVqy5iu4YcxeozZAlByNHWqu9xY6PzbGFMUJZK1MaeFk29r2ZsG3OQ==
X-Received: by 2002:a05:6512:4024:b0:53e:1c89:1bb1 with SMTP id
 2adb3069b0e04-53e2c2b9eaamr622234e87.16.1733475091210; 
 Fri, 06 Dec 2024 00:51:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca205sm440371e87.242.2024.12.06.00.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 00:51:29 -0800 (PST)
Date: Fri, 6 Dec 2024 10:51:27 +0200
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
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
Message-ID: <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
> In preparation of DP MST where link caps are read for the
> immediate downstream device and the edid is read through
> sideband messaging, split the msm_dp_panel_read_sink_caps() into
> two parts which read the link parameters and the edid parts
> respectively.

As you are touching this part, could you please refactor the code
instead by dropping the msm_dp_panel->drm_edid? There should be no need
to store EDID in the panel structure.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 +++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 25 +++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  5 ++++-
>  3 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index be26064af9febf4f4761e21ea7db85ab1ac66081..052db80c6a365f53c2c0a37d3b69ea2b627aea1f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -372,7 +372,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
> +	if (rc)
> +		goto end;
> +
> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>  	if (rc)
>  		goto end;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..d277e9b2cbc03688976b6aa481ee724b186bab51 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -108,8 +108,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  	return min_supported_bpp;
>  }
>  
> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> -	struct drm_connector *connector)
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
> +				struct drm_connector *connector)

This function doesn't require connector anymore.

>  {
>  	int rc, bw_code;
>  	int count;
> @@ -150,8 +150,19 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  
>  	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>  					 msm_dp_panel->downstream_ports);
> -	if (rc)
> -		return rc;
> +	return rc;
> +}
> +
> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
> +{
> +	struct msm_dp_panel_private *panel;
> +
> +	if (!msm_dp_panel || !connector) {
> +		DRM_ERROR("invalid input\n");
> +		return -EINVAL;
> +	}

Neither panel nor connector can be NULL here, please drop.

> +
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  
>  	drm_edid_free(msm_dp_panel->drm_edid);
>  
> @@ -163,13 +174,11 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  		DRM_ERROR("panel edid read failed\n");
>  		/* check edid read fail is due to unplug */
>  		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
> -			rc = -ETIMEDOUT;
> -			goto end;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> -end:
> -	return rc;
> +	return 0;
>  }
>  
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7a38655c443af597c84fb78c6702b2a3ef9822ed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -59,7 +59,10 @@ void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
> -			u32 mode_pclk_khz);
> +			      u32 mode_pclk_khz);
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel,
> +				struct drm_connector *connector);
> +int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
