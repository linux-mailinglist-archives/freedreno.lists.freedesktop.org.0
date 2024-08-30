Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8696670F
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C310E4F1;
	Fri, 30 Aug 2024 16:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fyDCK1Kg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39010E771
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 16:39:02 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so22539011fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725035940; x=1725640740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
 b=fyDCK1KgD3y44eBf1J1fRh+KKPAGd+EFtVWzg3R8XlW61RdeoDLUstdCJuJNKgpJY9
 juXlZ2o/hZUambrOux017rYCj/CKKnYwGKW1bYXYz9rbjtOLE7BALj7LkS+dhog7ru3Y
 5phwggraVq2J1LRKZH2SAwNDy2tp9/eQg6FwPvUEA+RCxqQKynOFUM6ck3NcB4qip7K2
 7iPuN8jfxwRZjyy+XM/u55jXGeE5ir+Lso+gt9yEjCrQ2C/cfpOMRurU4ZmRuXoIkzEC
 3dIWzHRo3CA13/PtRurvux/i6kuxXoNNjfmrGXvxBf8KwUpzhDkJtOR6t8rWTQ0LHRFI
 yZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725035940; x=1725640740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
 b=UgJPN8JICyiNygdYkO7qeFLgRpVOuEkuLsdXuImg9EZWeCrRP8CEjvczCkzTJ3IRVT
 w5mqfOgIfgurLJOBFKboV2Ld7OK+Yo2UT2mp2hTKcXftCFQOAGiwXBpyqCvu4ZDd/czG
 4acypUPvWF/6QLYzIu3qtwIwx+fI4wVKe9QJlnlUGIOhrr1qt6uNx4Xp0NZ+iHQt5UMK
 JFxo5U9Rn3OJc0uFBJb8956N0QfM5wC/aZBCTrrLKfFaCp3QhcweqRFnGdVmLamA7D1o
 nl0RSNgwsI9uRv5snnuJQnFxftd+fXDC6m7WeQdlHuI6TH0S+ZIJ+gjHUhZKV0evKlIk
 6EWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpD+lznKJkXzlB6YqFq4N7rD7Rthzt+N2Y/5Tem+NERTcT0VPKcrLwF45ADX7wb3DhH8TS5IgFEKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOkejDTSXf+rODR/ZWh+HNXgseCEXdOuz8Mkp2IA5+OtnEg1V1
 hpD7DboIil0BWet/4JdHdGR0iQNUmsL1BlZyZHd26Oe0zcd0BorFB4Zag+GjAyY=
X-Google-Smtp-Source: AGHT+IGXlaawo+aNd8bvyU9hJTs0LcQHomL+gI7bfl9YYFu3/2gV7tZKCkjm/N27yB8W8cQUyGkfZg==
X-Received: by 2002:a2e:3213:0:b0:2f3:f6fa:cfd2 with SMTP id
 38308e7fff4ca-2f6106d6968mr40049701fa.25.1725035939563; 
 Fri, 30 Aug 2024 09:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f615194f19sm7176211fa.130.2024.08.30.09.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:38:58 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:38:57 +0300
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 02/21] drm: print clone mode status in atomic state
Message-ID: <e3moledbfob2xkgxpbta3onlzc5yi6u7cbsmuo5ao4qq7nyyhj@lr32vqnjzkbi>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:23PM GMT, Jessica Zhang wrote:
> Add clone mode status to the DRM atomic print state
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 07b4b394e3bf..145d6a758d4d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -455,6 +455,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>  	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
>  	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
> +	drm_printf(p, "\tin_clone_mode=%d\n", drm_crtc_in_clone_mode(crtc->state));

We have encoder_mask two lines above. What is the benefit of having the
separate in_clone_mode?

>  
>  	if (crtc->funcs->atomic_print_state)
>  		crtc->funcs->atomic_print_state(p, state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
