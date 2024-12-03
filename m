Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9C9E2D7C
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 21:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7F210EB42;
	Tue,  3 Dec 2024 20:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgsHGZYl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837A210EB2F
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 20:46:39 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e396c98af45so5418221276.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 12:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733258798; x=1733863598; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
 b=FgsHGZYlS0P7rYG/6CLFjXWZaTxiqVUz4ObB8MCW53fMDyYFTGfQiou4wD6Fhimuus
 4cnnnrzBvVl0VlLaipcXrB3T4MIWDoV+z0vtN92Vnfc1KYx5bMXkrOP0PskEPjoaS1DQ
 +TCwTPPaEdNGUg1HP2AMsSFRRW/rrhKtZrj+xt1XbhkHyWcYH5L1NCW+6530VIfNNoIl
 QnXX/ljwYwTySyHZTvaqBxKsaL1BdAsCRnLeIdqDDRxEI+Cyz0aRkofmsxbgZjEJBLPY
 ZYNua711oZeJzuYPJEhhVV1Ln3KBazR8RpzxEn39z9naUC/CuH0UE8XXhuxjTZYziHNg
 P0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733258798; x=1733863598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
 b=GmYL+pceM04pUCUPzpWzCV3v99xPEr47Uo+CahtCgrW6XV51LPXlBl9pquJCKh524V
 xCOQ9/LzLj1A7yHEa8tYUJLJG8DYUwUJrBYnFSu9r2fuicNmkX6FCF5IX5yQT+spU4bW
 LqapYH7uSuIWoRkxxOqw9wicZyxd13Lh5ywQdNLSP12SOPCOZalYinvazMe7Pg16/FfD
 +zco17nZq9ZdF2jDSa9sZg8XF8YiS9zrtpepbeY0eOKSqqx1aDKHdvBiIBpBCOIsp6mQ
 jrMzROm6WDCt7l0IggfJws9CGgRQFlipIsfrJiWWgRM1e0bjc3Z4UbFoUCsuyQbuMHzh
 qWgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVytEgtpoKv16Z+u1UR5ylSYRchFEggVfhaBHI4H/erdhgAhMys/NwkA5iWrvXNowGmmrTw4kTz0r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhqXvQz8UuW1ryUjIFhHnHSwDxTLDNCqVfTApJkosQfzUQnpot
 A8c6twt24TzzlQ81AP0+XHOCxpOPaZixzMZ/x5msiPMjGIZO1GTEaAp4D/QFP1Bo/nKan7S65Rt
 ad2FJiuOx8op5AMZYCDuh1qW9OEBAGrLT1QIYSQ==
X-Gm-Gg: ASbGnct9K8/Go4zFlrZzdNOOO8BHOVpnpLZwh9mRI54hb+HLXPaS1t0YZIqo0jN2Iqy
 8/mddavSAe0x9uPBUlKdPO/81slJoyA==
X-Google-Smtp-Source: AGHT+IH8hrI8UpkvlEij0qypL74Pq/pAf4QOqyLjB1Y7xU/3KeHSuRxwQIYl7F2mGLf9kHagIekQ7TkNhcuk6salH9w=
X-Received: by 2002:a05:6902:1147:b0:e33:14fa:2273 with SMTP id
 3f1490d57ef6-e39d39ee50dmr4169526276.5.1733258798414; Tue, 03 Dec 2024
 12:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
 <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
In-Reply-To: <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 22:46:27 +0200
Message-ID: <CAA8EJpqmoOzwT5STjPggXi+hm3zwu=j=0xAxexHS477t_g9n6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 3 Dec 2024 at 21:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2024 6:31 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
> >> DP Test Patten Generator is a very useful tool to debug issues such
> >> as blank screen or corruption seen on the DP monitor by isolating it
> >> to whether the corruption is coming from further upstream such as DPU
> >> OR from the DP controller and below. It was noted in [1] that this API
> >> is unused. Rather than dropping the API, it should be fixed and used.
> >>
> >> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> >> it by adding a debugfs for it.
> >>
> >> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1
> >
> > I'd prefer for this to be rebased on top of [2]. The series has been
> > posted a month ago.
> >
> > [2] https://patchwork.freedesktop.org/series/141074/
> >
>
> Well, the review of that series which tried dropping the tpg led to this
> one really.
>
> I will review that one within a couple of days. Lets first agree on that
> series before deciding to rebase.

SGTM. Note, v2 kept the TPG in place, as you have asked.

>
> >>
> >> To: Rob Clark <robdclark@gmail.com>
> >> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> To: Sean Paul <sean@poorly.run>
> >> To: Marijn Suijten <marijn.suijten@somainline.org>
> >> To: David Airlie <airlied@gmail.com>
> >> To: Simona Vetter <simona@ffwll.ch>
> >> To: Stephen Boyd <swboyd@chromium.org>
> >> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >> Abhinav Kumar (3):
> >>        drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
> >>        drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
> >>        drm/msm/dp: add a debugfs node for using tpg
> >>
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
> >>   drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
> >>   3 files changed, 76 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> >> change-id: 20241202-tpg-3f7543c036ac
> >>
> >> Best regards,
> >> --
> >> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry
