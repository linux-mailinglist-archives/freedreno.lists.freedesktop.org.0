Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F228E8ACCB3
	for <lists+freedreno@lfdr.de>; Mon, 22 Apr 2024 14:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DED410EC62;
	Mon, 22 Apr 2024 12:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qwvW0eIx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDAF10F59F
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 12:22:47 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso55040701fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713788565; x=1714393365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0N97Un7iKJy6ZaKa37UlkZBwuE/KTJjFA85IfE4WHbE=;
 b=qwvW0eIxyUhpJjyjqooR/nHc9pOCl9P+KOG0wdTLEzdGPWToj0LR+jEUuQCBeZZsJZ
 R9X2MiLtbbdki2O9au4zq9JDrc372U+231ZAO7jiL9VawY71JjjTR1H7YCG3+pWGhXmi
 pw5QazCVw6bR3c5K32ySnHe+r5KvAe14ulE4Z3SbRAeoqHvecFYoII2yVq8gVWIXjFK2
 JJ5iailw5eaMroevRfIwo3h3evQMaZB3DUez56UaLsgbMzdESdQgMp/hPyQScZHLSkRS
 +go+/g/rL1gE7ipKTatv+c1rxcQSBvk66l1hC/4Wc7grDadxshUZk9w4XU3Y/kiArn9f
 JBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713788565; x=1714393365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0N97Un7iKJy6ZaKa37UlkZBwuE/KTJjFA85IfE4WHbE=;
 b=EYu+sMYASe7c+8qESXVoktrLKUlEI4WDXBqywh+0+5J8Ga4OHyIr7IJbFLkQQFk+zR
 zW0hm/uf3zh/KZnw61OUplJyNP6yLW38tdCBkVN8AKiExQhXLkzjYztX4nammKIHTAYm
 3rgMms+odSrHkimAkq2H9HI5XSobuW6bp0wiJKUu+QiAtlfx4PJ2h6/H/tFCiUffG5SG
 FVFVBUuoWrPvVinhRRqWK2PC2iHbIUSGIDfrSRgXUktdCSkAMcu5023ei5ZwmwxI9ydB
 IAXK9XsMlDOegG29YWQXo/Ln6FKar1bp5ky26jPqItryR+PRHc9H7xXy27MEfWS2+LAa
 x8Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRObP5t3d18NiZvnhJwIJbaT3T07n3WPre9+6AQyHJqqZAjWHy+B+5pQMgYTAx9RD+i0dTvJ6nRPnmLsxLDDraUgeAxgMuLs6HmEhdPKO5
X-Gm-Message-State: AOJu0YzUbCqaqEme0Qkc0N6ebS5AH/JK6k1v668mtvwfcbOBJHCR4eVT
 4Sx5OSJuQbQG+AEuyzT5QuNac0tdF7GGwKgLwvFX81EXe6VGX0lqX//QL/HaH3Q=
X-Google-Smtp-Source: AGHT+IHEwl9kdeoIRBSg/s27Fmo9cBqQ8a+PpvHL/HWOE1hVoBjq2Q2cW4BifI+Wc2xbXVRZ04Q9xw==
X-Received: by 2002:a05:6512:104a:b0:519:5a60:5fe7 with SMTP id
 c10-20020a056512104a00b005195a605fe7mr9132480lfb.66.1713788565217; 
 Mon, 22 Apr 2024 05:22:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a056512104900b00516be0a0579sm1661591lfb.75.2024.04.22.05.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 05:22:44 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:22:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Message-ID: <7uqzoioa6enpxocrcsbykmdcucfgb4mglgep3k6b7strevs7cc@dqeyxrmieuvv>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
 <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
 <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>
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

On Fri, Apr 19, 2024 at 07:37:44PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 6:34 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > > > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > > > step, so that any issues with the FB layout can be reported as early as
> > > > possible.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> > > >    1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index d9631fe90228..a9de1fbd0df3 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
> > > >    		}
> > > >    	}
> > > > -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
> > > > -	if (ret) {
> > > > -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > >    	/* validate framebuffer layout before commit */
> > > >    	ret = dpu_format_populate_addrs(pstate->aspace,
> > > >    					new_state->fb,
> > > > @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >    		return -E2BIG;
> > > >    	}
> > > > +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
> > > > +	if (ret) {
> > > > +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > 
> > > I think we need another function to do the check. It seems incorrect to
> > > populate the layout to the plane state knowing it can potentially fail.
> > 
> > why? The state is interim object, which is subject to checks. In other
> > parts of the atomic_check we also fill parts of the state, perform
> > checks and then destroy it if the check fails.
> > 
> 
> Yes, the same thing you wrote.
> 
> I felt we can perform the validation and reject it before populating it in
> the state as it seems thats doable here rather than populating it without
> knowing whether it can be discarded.

But populate function does the check. It seems like an overkill to add
another function. Also I still don't see the point. It was fine to call
this function from .prepare_fb, but it's not fine to call it from
.atomic_check?

> 
> > Maybe I'm missing your point here. Could you please explain what is the
> > problem from your point of view?
> > 
> > > 
> > > Can we move the validation part of dpu_format_populate_plane_sizes() out to
> > > another helper dpu_format_validate_plane_sizes() and use that?
> > > 
> > > And then make the remaining dpu_format_populate_plane_sizes() just a void
> > > API to fill the layout?
> > 

-- 
With best wishes
Dmitry
