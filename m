Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EA9E1E0A
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E8310E45D;
	Tue,  3 Dec 2024 13:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VC5WjcCH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85A10E45D
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:45:38 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffe4569fbeso49179031fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233537; x=1733838337; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
 b=VC5WjcCH/F+Pk6mJqLOgZPDk999DSTVdb+LNP3l9YUACYWS1JjHsEbFMLPQAdcHv7z
 Ssdllwu4F+kNP56JueG8DH3i4zvw4sGnRrRn8dAibZPUyYAxJcdbMi6gwTy3ob00hkEr
 Yy67yriAxkSLnY78so+LS+WoIjFvsz+Zx18oFB3xIBwWWjqoKpnshuEd6ofmGl2ABDd5
 Mh25HYPomNDpt2UWtJRGnjd7uBBDceeI2kfoQtgUq32kCFASAck9ewxPYURKMpqdfCkK
 /Bv0V0aHgJN1NF0ogOG4kCRgynqTSKFsgaooM9Tu8cqv593UvFq252huKmdV7mD6blsB
 aNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233537; x=1733838337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7CuYR8KvWJReWOTnCLxKMKX9kriMN+zYqjEqTbxeIk=;
 b=A+ANyj9D0QS1d1a4j3AJZcOlmg06t4XkSxdUb1J3k63d4MgTMeMoYHWc6tx2TAqa8N
 koFbBbDf4TAytEUVhHt/sIzmAr2vcI0nwG7y/mVbqNjl+Wu3lHSxsz/0F1/vsgvxzjSr
 T3OAlR0sFCfedMofDXpKqLVUqrNtouFRmUFQJHV81pq8t98B3oNuLQkCaNoR44uzZu5h
 0azqLO58J8xkxRFBEIqlNyihvGScaCL6JIVYl9glpqJhAGymUF0CPSL2yAj8VA8yipt1
 LWZXLWcnrMa6Eg8OWKVrhxLEShjpAkkQjyODaVrfvWSXe2TSwcRuXIxiTzgO5n/RkF9v
 k8dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4/JN0I/8aw/U0zfZPVT2wDHYM1Wk1Frjyq8AEsvorgybWbzYcUOLYNNl66nSomyrRFyYFnWNyW04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjCw3xFexX/e+7djUX863q1zUBCsrUyBBG/QNRY0Vdvb+o1fpZ
 8azu83lTuRJTHtSKw59DZKXit2TIUttldO0x7SJaWBm2m/gFFcbjcWZOCMybrO0=
X-Gm-Gg: ASbGncvKNuXJX1Z+nhpRLH8CUtGlwA/woS+oSsXWVgV0wMv1ero3oTSIwxUf6wQ0a2X
 Z1/UFXzf0rp6C6bu4NI3xkoB4l3Aps3Cdh211RxnE8u/w76ACxVSv9CKC1WIslKEq4QG78qKX3a
 D1h9XecnXgjslJqzTANt/qZCYpwtKoS+orTIFIiGh+5i2cnIRFm8SNgN9Q8d6TlRH8EJ6RT14hw
 7hCVXKgUdObuWvQwFjUJuDk2Mp0EaD8WjmKDQL7WoiGWBq+MSVhTvMrwhT3sjmHek3G/0hks6p8
 pjAdehRVp4G7ye0C/WdzK9p/vpWNRw==
X-Google-Smtp-Source: AGHT+IEQO2NjaeNHOLixDzUv5WxZZEQUwkB4QYOykvSvxBbAYeu3SAKM3mDIg44l5ud5IGEEf6uCAA==
X-Received: by 2002:a05:651c:21a:b0:2ff:de64:c44f with SMTP id
 38308e7fff4ca-2ffde64c57emr59876511fa.1.1733233536627; 
 Tue, 03 Dec 2024 05:45:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30009665bf3sm2615041fa.113.2024.12.03.05.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:45:35 -0800 (PST)
Date: Tue, 3 Dec 2024 15:45:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Message-ID: <pzj44gbpadhmfbausv2swkzvh6fhbwxj5a6uw6f3orstjqcmnq@jpdhvdthfkju>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:38:59PM -0800, Abhinav Kumar wrote:
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
> 
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
> 
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
> 
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
> 
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.

Don't you also have an RB5 (for pmic-typec) and SM83(?)50-HDK for
pmic-glink?

What kind of userspace were you testing with? Have you tested pure fbcon
/ drm_client?

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in msm_dp_bridge_atomic_enable()
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-hpd_display_off-6051aa510f23
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
