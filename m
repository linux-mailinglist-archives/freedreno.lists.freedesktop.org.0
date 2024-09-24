Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD6C984EF0
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413B10E910;
	Tue, 24 Sep 2024 23:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LXloAXjD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFBD10E911
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:25:40 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so57129831fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727220338; x=1727825138; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d5Wwc/j7Kd/NlR3Xj8Oc5OdD8mZfVErehGoE1BXoduc=;
 b=LXloAXjD7A3MV0ZTq0zXJRsL2pIfSLZg2IeiRY4OyAA62Ff5QfimY9ZB706ZlBjrcm
 hidJefzBrP07pz/mvJU4o945xELiBxe7cBXiOh9GCcosmSoc1fn1cfv8QEdddWGHI8cB
 K/T0SUFO7Yd+SmVLL62UCdu7wjS6FCuJIY8h31HL25yU0r5zvznBYG4wKTbGEMl2DA4X
 AOXe5Umgu28lZk2zLgoVmx/YcAAJH957oaWgRK3KhornW44G8PrkzbWO8mAf8asepfLU
 kYQrqBQTLeLWCjBg9AhdFlq4R6LQq3MPPSPgTcR0y19asa6VVnhuqDL2gOyYmK1bvI6+
 WpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727220338; x=1727825138;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5Wwc/j7Kd/NlR3Xj8Oc5OdD8mZfVErehGoE1BXoduc=;
 b=mv7Kg+/hU16PQJ0Cl2ijyaD/JI5foCugvaJk52rGwPIWDwTQQxvSwbwQLHYPlsN6Vc
 GGAO+uSyvfQalm68cxy+Sq8/uqLQdUh3juXItjcWp0T3dH+G2Iwd57cpmFwqncsJd9BA
 mUvrWtAYAak1Obf8+j9YgXoo9jxOZM/vU5x9OhOFtXkOYJtLEZiF50TF3LmlcwlYVPG2
 cx9wRBKFiZzuNrLtrpDcsGaYvOWMo96WSNg5fUYB7AVX7m3YtE7rOcx6bw9kyjk7pFEk
 TCXabiGbwmt+9y5m0yp1ppyrkvY2y2I7Z59TlEvbXOcR3rX76g9aT6I8Qvqho57hTk0n
 yhgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvcXQMLZZa2WEBPWxX4LiaRY3WqKgsBtlWRYVTQs0g6mnUnKegX28Kwhi2+WfIL6pBEUQ/LWT7O/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS5B7TzXbnssqUGrSSM7F6swzLMJs2Qz03lrCGyptZ4r+4DDDR
 Bp6efnhWsHb4m2ioO1zb5GfcHcCDsvrALOni7mvdQqApu3Yx+CWcMIGC+fp3saI=
X-Google-Smtp-Source: AGHT+IErsYJZb/9+fEt9XssuASamiPaxtmHUQDk1h71SglBIowclioR5xw+YLXxMNA+DUF09H9FMLQ==
X-Received: by 2002:a05:651c:2220:b0:2f7:4e9b:93e1 with SMTP id
 38308e7fff4ca-2f91ca4270amr3930561fa.36.1727220338324; 
 Tue, 24 Sep 2024 16:25:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b683sm3401301fa.105.2024.09.24.16.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:25:36 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:25:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 14/22] drm/msm/dpu: Require modeset if clone mode
 status changes
Message-ID: <yjfe5wajajeqmcp65kbvcttzgkrsfv5rhkbvqvioqx3rwdn6g6@2h2byk2l2imy>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-14-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-14-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:30PM GMT, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned

Sima's comment regarding crtc_state->mode_changed seems to be ignored...

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a7850bf844db..f20e44e9fc05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1268,6 +1268,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>  									  crtc);
> +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> +									      crtc);
>  	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>  	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>  
> @@ -1279,6 +1281,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(old_crtc_state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1286,6 +1290,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +	    (!clone_mode_requested && clone_mode_enabled))
> +		crtc_state->mode_changed = true;
> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
