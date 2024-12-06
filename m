Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA89E6953
	for <lists+freedreno@lfdr.de>; Fri,  6 Dec 2024 09:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424FB10E185;
	Fri,  6 Dec 2024 08:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sbFw/tU1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25B410E184
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2024 08:52:17 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so3217181e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 00:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733475136; x=1734079936; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uWvF0H0EGmUGSVxOV1MB8umQ2kXN27sOruVW1MZF7lM=;
 b=sbFw/tU1FyWWnqPszTC+DdIZidl29AtlGUlexoXjxETH9oNrJjAscehYCyhWi5UrnX
 Om1SeXhbXq+QYBFd05oQqyvosoDMOC8q/o58TKd6TgaIlTnEo/a15ylnOPFgKTTdrDSw
 TKr+joaFll8U6BHrbMU4oQx6h1iH/Mi1LXFkU7aoMed0LAan+17OhkjZK9YCw0eMLQLk
 Q7eZ+cyk+EW5V9NYNQ1zs3UUpq+gc/FYBV7ehzew5Ugc9qm2sIeMsfMZIVPaPmuVUZ3P
 k2f5wlCt+ClZhFkGUeU9msLdCur/Qw9/72iiYUfdGD8CmP4ua5W/vt8KEB9rFR3cI0n7
 zJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733475136; x=1734079936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWvF0H0EGmUGSVxOV1MB8umQ2kXN27sOruVW1MZF7lM=;
 b=sNmf66xxnjUzVpSpEvh60PpU4TILWY4rhoJCJK15+AV2/a5e5b2HXBDSgBrY7QbAVo
 L35mPZUMjI39+iA/1PeNNFHmZdbdbJxVDh6Abz1BKi4ZLSMnDuW1FexRsGrsigjZgX64
 Kcqi+5KogUvj869nBs5aGG9Y+glRmZiDBt9Vo6Nh/xcERSkKX4pmm78lV9ksieKeNYya
 0/mgD+DvKYCQWKJm25jI7DMiyPCsZ8Fp/2/szhPmB9V2hCTEm/oZAqXtNwTVXLgyEEH1
 sL8g5WwTGIO7vZe22UDfeMIybuqAdydBf5ReSrIHAdUa1K7lVyPG++tzSYJxKYwF9/+R
 sQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvIlK9C3zZ7+4uRUQ/9nUy0kZ3dX/DZxLY1kY0E3fT4qFOkPb2RChmtP+S7vKO54r6trYxaDfNlII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCgt1gfxRROyZZrTMGgNyYxOJydMEKwxx5bq4Q59Nltg1DZWP1
 ZJYF7Fm/NUirHCUU/GFs62v3WwEGQhPKHejhf2v0cb2lRapZu2584jS3a/RexF4=
X-Gm-Gg: ASbGncso6NHfpPP00aDH4vBwyH6Vlru3q9p7QBuqxFRIggUn984+PyNZR3e4sl93WQN
 FAITR3K2EvqCkLHgH8CxE0nk97y2ftpU7HQRwjFUDZMRwV9yZ9UBzTn8/f1dTfUolgM1cip+7T+
 Ugfs+5XGHv8yzf7z0s5tMeZomITKCkkKwHBMYPKqAtFtsdYdw9gJeMgep8Al4YW9F0smzPvaChT
 wZCPYmKQr5Rvuf8CSMaNWUQJ28+NnNy6m6R6s2w0l6Aq/dXKp2SDecyHhjnZlm1iiSjuFdNqVum
 VCDF7yEtvG8065fj0rDzXSplUsJXMQ==
X-Google-Smtp-Source: AGHT+IF6Vdn52CT8JySCn5wU2COywbsd5j5s7R3p4rxRLjto9tXn/oJVzfxtra1uUQQ11wKfZqg7fw==
X-Received: by 2002:a05:6512:3d0c:b0:53e:2246:c262 with SMTP id
 2adb3069b0e04-53e2246c7d1mr2115452e87.0.1733475135953; 
 Fri, 06 Dec 2024 00:52:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229479e6sm444272e87.28.2024.12.06.00.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 00:52:14 -0800 (PST)
Date: Fri, 6 Dec 2024 10:52:12 +0200
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
Subject: Re: [PATCH 05/45] drm/msm/dp: add a helper to read mst caps for
 dp_panel
Message-ID: <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:36PM -0800, Abhinav Kumar wrote:
> Add a helper to check whether a dp_panel is mst capable.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.h   |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..cb97a73cdd6ea74b612053bec578247a42214f23 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -8,6 +8,7 @@
>  
>  #include "dp_catalog.h"
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  
>  int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
>  void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index d277e9b2cbc03688976b6aa481ee724b186bab51..172de804dec445cb08ad8e3f058407f483cd6684 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -108,6 +108,20 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  	return min_supported_bpp;
>  }
>  
> +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_panel_private *panel;
> +
> +	if (!msm_dp_panel) {
> +		DRM_ERROR("invalid input\n");
> +		return 0;
> +	}
> +
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +
> +	return drm_dp_read_mst_cap(panel->aux, msm_dp_panel->dpcd);

So, it's a one-line wrapper. Do we actually need it?

> +}
> +
>  int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
>  				struct drm_connector *connector)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 7a38655c443af597c84fb78c6702b2a3ef9822ed..363b416e4cbe290f9c0e6171d6c0c5170f9fea62 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -67,6 +67,7 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
>  void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
> +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *dp_panel);
>  
>  /**
>   * is_link_rate_valid() - validates the link rate
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
