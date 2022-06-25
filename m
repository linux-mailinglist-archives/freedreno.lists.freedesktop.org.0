Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E015555A585
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5670610E344;
	Sat, 25 Jun 2022 00:29:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30DA10E377
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:29:44 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id i17so6854188qvo.13
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJj2jKLrKWKYCL3G0JVCzxE24zzw7IepY2Hipgb7xdU=;
 b=ItIXMMRXGzTB4SAjQ/ljwU3he2WFwrwfNYqNw6nx/LVB1pEkb5GqVhkJ0CGNJZSFh2
 9uvGcLACEQw+x0kHvxWYM5t5IhpCmS6jXGVatAX2Of0e5ohhlghwwgrOIFGZZ/UcmSXD
 Ii1eLOobes6KSm1te90jx4zGT+10O/yHwiFJuX+d2laYGZltRSvs0HilbQkhW/rgexcQ
 GNMwF5CiSGe/2jQMVJvrJXAHvkCluoUoJRperjbVF9eOIvetr30WEkpnV03Ierh+9i9E
 ONExAocAHSxDRAEKUHbd7I1K42nlVAxH2cYewU0r1qiuDVNSLz+G8Eaa8Hz2lBKLQ7Th
 BkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJj2jKLrKWKYCL3G0JVCzxE24zzw7IepY2Hipgb7xdU=;
 b=2rjoC2RevUihzpdXzYsAApdIiGdr6rzHNlBqOkmvJ6BNKib+wX0cNb1obinoLeNKrM
 /bjmopv7saSZmqqJ0vHXCHAeLx0TdLEsIx0EehOmZrwaQmENLL/pvP2TSNegM9bRnai5
 +z9uJrbObGjkNw/z9lUDYV4K1ajLd3dd13S/HinKY1QruuGUxVHcLjLWSwW9chaDX9W1
 4M8KiBBbHblkPdFtW+Zb08PbQD8/E4meZiEA5xze1ixlalk+gItUXNS8+/b2lqkkJaOE
 ucQXQj05rUJI+B83EtZH4tSm1MVAF6a8jWmL12aNb+OKMweVCKrmM1NG0cF6YRCYFW97
 9OHQ==
X-Gm-Message-State: AJIora+HR3qcrSzDK6EQDhvQsqe/TG3551mPKdXITUAm4EugEJX2zQ8r
 ffHLH0eddm05hN9kOdktWLd/Xo+YzkKhXXji99sEbw==
X-Google-Smtp-Source: AGRyM1t1LNe3ggUGTtV/WfBEzzJamFsd40RNO/gCCttMTGrOCrn1bQ/LPwHe0A/36/p2hLFpcB3urShWjF6qtQ+zjFY=
X-Received: by 2002:a05:622a:1351:b0:305:2e58:939 with SMTP id
 w17-20020a05622a135100b003052e580939mr1422121qtk.295.1656116983913; Fri, 24
 Jun 2022 17:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220625002811.3225344-1-swboyd@chromium.org>
In-Reply-To: <20220625002811.3225344-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:29:32 +0300
Message-ID: <CAA8EJprV_wqFrG6TVV0SAyxN9WHfC-vU-B_31toiWOYMqeNeUw@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Remove encoder pointer from
 struct msm_dp
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 03:28, Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to stash the encoder here. Instead we can simply pass it
> around as an argument.
>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>  drivers/gpu/drm/msm/dp/dp_display.h | 1 -
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_drm.h     | 2 +-
>  4 files changed, 6 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
