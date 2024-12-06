Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BB9E6DD6
	for <lists+freedreno@lfdr.de>; Fri,  6 Dec 2024 13:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09C10E413;
	Fri,  6 Dec 2024 12:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WPxQEfbI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AF110F0CB
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2024 12:12:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa503cced42so282619966b.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733487132; x=1734091932; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q3dVJRMa0TfmjWnvrA4GwhBptLmOPXIzRSr4Tl/7cq0=;
 b=WPxQEfbIOLIiyvNVjl6pN5cQvDktkbbIckpPnm8R4jx9EOW//k8QOnDpu+GQTLCDVV
 Z/3L7dNW94oVNzDSxKrUGYgAAJbs+le1aEdzj1Lx3djCbpSjYE6iU/q1WWyHfwOUMCwU
 45q8ih7fwwbsKmeqLmR5B+yYIpFxs0+HGyGa+k3MG20Z/J2Fd6xlHEe1/AIDw0hi1JOP
 7ziBkrXrZuoXbfxMuEcS9rJ7Ke0aXIuVOzTxMW/SprgW8dcVAMxwL7DnAUxkeUEGOTbs
 97utRvSCgpaOa5Ea2ts6sjRqq6TI9W5cu4EJmzAAaiH7f5eUCD9833YcRoTy6W4Q6Lwe
 nJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733487132; x=1734091932;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3dVJRMa0TfmjWnvrA4GwhBptLmOPXIzRSr4Tl/7cq0=;
 b=i3QItD1FTlfp8P71nzKVsrM67UEMu628CFff3Qep7BqQIwm/GirdqlKdrqmu8Qs/fE
 FHuEhGdTX6qF58JROIie3yvOeEGJwKkFdgkYsbOpMniHKrso+g/DMqrz4HSJN5RUzQWq
 M9fl9phTgeAnWXkWqyH8wE36ahZceeQorI0W4di1Yi5wUDJ3cEgEHZ6661tBp0mZfBWy
 UClujlo/zUED9UPEhu7RcjU+4T1U+WHXw+bFx1OxG/xFWO8kVv61bYcvCSO2l6T0Nw7H
 72tz9ZBKd4hxWGKmWveQ4YFBmwC6AI1d/xOgwIvneUzsflD+ly3gDgFypyYl3Y4oax4z
 Ac+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaR6lxDRo+aFgrhOaNHRks77I/wRlwKJLR8yIVX04W5jdUiBRTDlUVm3SCKERkY9zeFV71QHOsOug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJV35G3fW7n9dY2yZKmKQUEbsjZdwO/CwqzXyMLVRT6yv06Omn
 +pnLO5dRWlSe5AeAzJRm1v7YbfiRORXuh+uRSddvmFwCpIJgkbqIiK4qFvAe6i4=
X-Gm-Gg: ASbGncvDciIC6/HfBjCjWN1jr1aiIVwroPJfX5zAhAmbAABEThrTYcUSLETjoU1v7dk
 iG/OeCcu4iThZqURSawdusyq/nrKBDOPUSFKhFkHNrya/wBvgTjhKZL7psHD4bN30xvE6nXqey+
 PZz5AhvNtyPPshmo2v16QNFH864Ils128T0d2i7rxr9Ka5enZeiIAl+U66ldNBTF8XYRHTOzNMB
 1JhWvfw6iAOwXwFyPuylYvkoRrYSiaij8jnzCrAr5LNzsoVQrmEikzyZiarAA==
X-Google-Smtp-Source: AGHT+IFUBtKqDnQ9TdUxArZ0TKaVsJSrVKXuzX74MKt4//gCX0PMHcMHzQXS+cSEiOZgDyWc5Brq9g==
X-Received: by 2002:a17:906:2922:b0:aa5:76f1:4051 with SMTP id
 a640c23a62f3a-aa63a1a162cmr145435666b.35.1733487132526; 
 Fri, 06 Dec 2024 04:12:12 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:7aba:3257:28e7:dce9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa62601c1ddsm235148666b.126.2024.12.06.04.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 04:12:12 -0800 (PST)
Date: Fri, 6 Dec 2024 13:12:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 13/45] drm/msm/dp: separate dp_display_prepare() into its
 own API
Message-ID: <Z1LqF_jIHhqRImsf@linaro.org>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-13-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-13-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:44PM -0800, Abhinav Kumar wrote:
> dp_display_prepare() only prepares the link in case its not
> already ready before dp_display_enable(). Hence separate it into
> its own API.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2f8650d60202deaa90de1a5e0dd6d8bc50f09782..02282f58f1b31594601692b406215cee4ca41032 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1525,26 +1525,36 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> -void msm_dp_display_atomic_enable(struct msm_dp *dp)
> +void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> -
>  	struct msm_dp_display_private *msm_dp_display;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> -	if (dp->is_edp)
> -		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> -
>  	mutex_lock(&msm_dp_display->event_mutex);
>  
>  	rc = msm_dp_display_prepare(msm_dp_display);
>  	if (rc) {
>  		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
>  	}

FWIW: This patch breaks the eDP panel on the X1E80100 CRD for me. If you
don't do the msm_dp_hpd_plug_handle() before msm_dp_display_prepare(),
then the link_params (rate/num_lanes etc) are not initialized. Moving it
back here seems to fix it.

Maybe I'm missing some dependent patches or so, I was just experimenting
a bit. :-)

Thanks,
Stephan

[   17.724076] phy phy-aec5a00.phy.15: phy poweron failed --> -22
[   17.724698] ------------[ cut here ]------------
[   17.724699] disp_cc_mdss_dptx3_link_clk status stuck at 'off'
[   17.724709] WARNING: CPU: 9 PID: 705 at drivers/clk/qcom/clk-branch.c:88 clk_branch_toggle+0x124/0x16c
[   17.724877] CPU: 9 UID: 0 PID: 705 Comm: (udev-worker) Not tainted 6.13.0-rc1 #1
[   17.724883] pstate: 614000c5 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   17.724887] pc : clk_branch_toggle+0x124/0x16c
[   17.724889] lr : clk_branch_toggle+0x120/0x16c
[   17.724927] Call trace:
[   17.724929]  clk_branch_toggle+0x124/0x16c (P)
[   17.724933]  clk_branch_toggle+0x120/0x16c (L)
[   17.724935]  clk_branch2_enable+0x1c/0x28
[   17.724938]  clk_core_enable+0x78/0xb4
[   17.724944]  clk_core_enable_lock+0x88/0x118
[   17.724947]  clk_enable+0x1c/0x28
[   17.724950]  clk_bulk_enable+0x38/0xb0
[   17.724953]  msm_dp_ctrl_enable_mainlink_clocks+0x140/0x234 [msm]
[   17.724974]  msm_dp_ctrl_prepare_stream_on+0x10c/0x19c [msm]
[   17.724985]  msm_dp_display_atomic_prepare+0x9c/0x1b4 [msm]
[   17.724994]  msm_edp_bridge_atomic_enable+0x60/0x78 [msm]
[...]
[   17.725216] ---[ end trace 0000000000000000 ]---
[   17.725218] Failed to enable clk 'ctrl_link': -16
[   17.725220] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* Unable to start link clocks. ret=-16
[   17.725231] [drm:msm_dp_ctrl_prepare_stream_on [msm]] *ERROR* Failed to start link clocks. ret=-16
[   17.725240] [drm:msm_dp_display_atomic_prepare [msm]] *ERROR* DP display prepare failed, rc=-16
