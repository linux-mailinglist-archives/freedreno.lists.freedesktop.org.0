Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE883E9BB
	for <lists+freedreno@lfdr.de>; Sat, 27 Jan 2024 03:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC7011218C;
	Sat, 27 Jan 2024 02:30:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079C11218D
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jan 2024 02:30:45 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5ff7a8b5e61so10151287b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706322585; x=1706927385; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wpsqw69PdTzTbpXVvFlS4sbbBUhS9ggqJuFkfLVYFbI=;
 b=Mx6B5J+sziZ3GvU/ZZ5lErca0vtnawgkhtO1cw/amfFtKlisExjbPjPzipcwI6udEv
 X4VEnooXWibPmh7MsFl46lXr2sVV7velxTFcxpS3JSFiSnMSGzrYJqXgTSEPkSvK/PVj
 QEXC+ucJakLvewtU2w8q3Rc7+OEIjYNzUYzbqLdgr20i0vNM4Lhqz3Tyh3WDuVqFcBjx
 aJxyFYHI9mBuaGe/OEmGgeD3rs3QdjAvYm+9pKjYHwolvz6xFu/b2RahFtAQaaAr/5nK
 aVQqTzTVQ4YyCv25EnGaFBKjrpjaD1r+c94xXbiHdd44P0QJwehEd/ZgE+IEDoEiI6LD
 ZykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706322585; x=1706927385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wpsqw69PdTzTbpXVvFlS4sbbBUhS9ggqJuFkfLVYFbI=;
 b=kXqi/wKsMIWmLFM7h6fzlAG8G6opTOm7oBpIe6U6TkCS9YSWJlpX33Hm8pO/5DC84y
 4N+PfILlV/lRLyNHIo0iCPBPM/0GB5iRz3aFPcw0mfTGD74cPz4Uvw/vEDhTHNVtVhWs
 X4RVV4bsrB1/1HakQdjUQev+alg/rz1T4fwYKkYAELAVjNad0AnWN1/TReXD/Ye7ZX9U
 2OpkLWh2vthCu1mR8LnVD9Osizb3DsREBUwAxlFEYKRDmKgiuUlvOmI66RWgeJQRFvZt
 TDa7ymfdKoLrSGd1Ys80EG9eAewlTy6EUBecQ9iRrJVCppAJkmFZLxxxFP4fiVwbBDA2
 ZSvQ==
X-Gm-Message-State: AOJu0YwS9XZC4Hlp2oxgGdDL5ixzLtoiLp3+7nNqCCA4TkvgIolQmvVZ
 z2it+nwqY2s8kaK4vs5Kuna1Vh4V7/9BUVyVRbS7NrQNj3dzG83uVusGVwOOdR6jgtU7yF/jsza
 yokfzILf6avkcLBvhQO1EsxJQmN4qoxw9gTwuLw==
X-Google-Smtp-Source: AGHT+IG2vGntEr90KPuH0Vnt8yyCvpdzPWEYqwk3E89bQCaR3ArjcaVx1rD0lHo909RHwhmoS2SrQlZi0lSmEfF0+40=
X-Received: by 2002:a05:690c:338f:b0:5ff:b07c:3b72 with SMTP id
 fl15-20020a05690c338f00b005ffb07c3b72mr844425ywb.62.1706322584299; Fri, 26
 Jan 2024 18:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-5-quic_parellan@quicinc.com>
 <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
 <332892f0-41a4-1110-a39a-2571a5f5704e@quicinc.com>
In-Reply-To: <332892f0-41a4-1110-a39a-2571a5f5704e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 04:29:33 +0200
Message-ID: <CAA8EJposAA0PdD8a4hc9Hr+Btb-eSMXX5+usnyPiVzg8Bmpa_g@mail.gmail.com>
Subject: Re: [PATCH 04/17] drm/msm/dp: store mode YUV420 information to be
 used by rest of DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 27 Jan 2024 at 02:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:20 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Wide bus is not supported when the mode is YUV420 in DP. In preparation
> >> for changing the DPU programming to reflect this, the value and
> >> assignment location of wide_bus_en for the DP submodules must be
> >> changed. Move it from boot time in dp_init_sub_modules() to run time in
> >> dp_display_mode_set.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>   2 files changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 9df2a8b21021e..ddac55f45a722 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -784,10 +784,6 @@ static int dp_init_sub_modules(struct
> >> dp_display_private *dp)
> >>           goto error_ctrl;
> >>       }
> >>   -    /* populate wide_bus_supported to different layers */
> >> -    dp->ctrl->wide_bus_en = dp->wide_bus_supported;
> >> -    dp->catalog->wide_bus_en = dp->wide_bus_supported;
> >> -
> >>       return rc;
> >>     error_ctrl:
> >> @@ -808,6 +804,7 @@ static int dp_display_set_mode(struct msm_dp
> >> *dp_display,
> >>       drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
> >>       dp->panel->dp_mode.bpp = mode->bpp;
> >>       dp->panel->dp_mode.capabilities = mode->capabilities;
> >> +    dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> >
> > Why do we need it in dp_panel too?
> Not sure if you saw in the other later patches, but I use the
> out_fmt_is_yuv_420 derived from dp_panel throughout dp_ctrl.c and dp_panel.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> >
> >> dp_panel_init_panel_info(dp->panel);
> >>       return 0;
> >>   }


-- 
With best wishes
Dmitry
