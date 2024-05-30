Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CF8D4AEC
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 13:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9D010E24E;
	Thu, 30 May 2024 11:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jM2cCsBc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F95010E24E
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 11:35:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ae38957e8so904690e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717068907; x=1717673707; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wxpMuKi+LXyXGnJgFY2tdfzN1kQoY6oVI5V7Y+J38bw=;
 b=jM2cCsBcY+tJ/nUyI27Oo+7K9RXbvSW3n+r56ceSL1PayG+Sw9p791f4rxJ/cTL37z
 4cvfW3UVegixj2NC8i0mMbRrH1sE64zvXn2YKZbnmvI9bIi8QdYGaCcMcz3txyEMC2kZ
 Iiq+rSK63DaJszgGRujy7KV46NDkNej+ATbXx6rNcU9v4WshC3dRqcfGCHUqDlatPB6e
 8Him8p3f+1WbSD23+lgrBd+CAIY2GkeD7KeVJQHJqvMr5YQSnCIGFvyFlixj7mvE/QsP
 Li9OsaKJqkca2EhYChhh2pZwQOQcvYVz3W0Dx639UaNoPRTXVrQcEG0oSMZzRHrCgSYD
 CNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717068907; x=1717673707;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxpMuKi+LXyXGnJgFY2tdfzN1kQoY6oVI5V7Y+J38bw=;
 b=TUQDq2IraYYVMaJ9SqjBRysJz9u8H20jlyP9+zJ4nUEUe2j0P/WF0PnbJwufjp9zPI
 uNuucecKoOeRFl/AYA502RoqMevVYjtpZgFC8ni5ujDU+2GTbVshNayAMrOISjKOChbI
 XuixjF2BwQleGtwpheHi02Z+jqNgQ/MQxP0yfnniWSw2MTQrm91mNTsYmqpsZLMFvytP
 f1mRxXdAqiA1QWrSTshrYXAdmSYvArC5nh5er8EcvkFtqlO4hN2UG2Mcg66HsGm1buri
 2y0QRFTwM9dG1zxCH9cCf7TcQe+6R9gy+JaOPhhm15c68L9ydEE9xOynzYj5lJMXCieo
 zSLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrIkxyxRCPc89XWIyofpbD8hvIfa4X8zi36EN1HTAM0E9hP0wHuj9p5jrsOq2Wu3v4OlVXXiiK7pRLIr0QTSJl/bMQJ/T7v+Ws9om7A9Uf
X-Gm-Message-State: AOJu0YxgXDEQjSsnOP0vQNTbPdYysEKFle0Oc9czzMj3bSbj+Q09ReG3
 e97Wt8TKMLfmqXTtadhX3pVZ9KG8zjiTn8ouvRsUxFlGMD9ffULhVW6zTno/TNw=
X-Google-Smtp-Source: AGHT+IEa+chLqLIDVqsM++sBJf0eXp91/FeFjOPnSviE3q1lQzzwC22rOXWI7iSC6GcMFIT55xs9Rg==
X-Received: by 2002:a19:521a:0:b0:51d:9e17:29ea with SMTP id
 2adb3069b0e04-52b7d422099mr1055198e87.15.1717068906185; 
 Thu, 30 May 2024 04:35:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b7043b402sm344963e87.211.2024.05.30.04.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 04:35:05 -0700 (PDT)
Date: Thu, 30 May 2024 14:35:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Message-ID: <u63p7wuvtrcdnbzikbgucedhsgjtyrx7zknkytcy5cu3hbbsxx@jm46d2od2jmi>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-5-a1d184d68fe3@linaro.org>
 <20240530-poised-burgundy-petrel-7affed@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-poised-burgundy-petrel-7affed@houat>
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

On Thu, May 30, 2024 at 11:16:08AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:12:28AM GMT, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> As a general comment: I really like it, it looks super tidy. Thanks!
> 
> There's a couple of minor issues below
> 
> > -int msm_hdmi_audio_update(struct hdmi *hdmi)
> > +static int msm_hdmi_audio_update(struct hdmi *hdmi)
> >  {
> >  	struct hdmi_audio *audio = &hdmi->audio;
> > -	struct hdmi_audio_infoframe *info = &audio->infoframe;
> >  	const struct hdmi_msm_audio_arcs *arcs = NULL;
> >  	bool enabled = audio->enabled;
> >  	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
> > -	uint32_t infofrm_ctrl, audio_config;
> > +	uint32_t audio_config;
> > +
> > +	if (!hdmi->hdmi_mode)
> > +		return -EINVAL;
> > +
> > +	DBG("audio: enabled=%d, channels=%d, rate=%d",
> > +	    audio->enabled, audio->channels, audio->rate);
> >  
> > -	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
> > -		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
> > -		audio->enabled, info->channels,  info->channel_allocation,
> > -		info->level_shift_value, info->downmix_inhibit, audio->rate);
> >  	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
> 
> pixclock should come from the connector state too. It's still calculated
> by the driver in msm_hdmi_bridge_mode_set

Yes, that's why I asked on IRC regarding the char rate and ALSA codec.
I'll see what I can do.

> 
> > @@ -341,8 +425,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >  	bridge->funcs = &msm_hdmi_bridge_funcs;
> >  	bridge->ddc = hdmi->i2c;
> >  	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +	bridge->vendor = "Qualcomm";
> > +	bridge->product = "Snapdragon";
> >  	bridge->ops = DRM_BRIDGE_OP_HPD |
> >  		DRM_BRIDGE_OP_DETECT |
> > +		DRM_BRIDGE_OP_HDMI |
> >  		DRM_BRIDGE_OP_EDID;
> >  
> >  	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
> 
> It looks like you're not setting either the supported formats or bpc?

I've added what looks to be sane defaults to the drm_bridge_connector:
RGB only and bpc = 8. If at some point we get to YUV or HDR support,
that would need to be reflected here.




-- 
With best wishes
Dmitry
