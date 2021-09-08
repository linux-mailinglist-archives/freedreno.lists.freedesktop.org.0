Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B8403EBE
	for <lists+freedreno@lfdr.de>; Wed,  8 Sep 2021 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2844F6E233;
	Wed,  8 Sep 2021 17:58:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8306E233;
 Wed,  8 Sep 2021 17:58:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n5so4497629wro.12;
 Wed, 08 Sep 2021 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZew05pny+AMfboX/VUE7XXgEcmZYj2JbeonnK41JqU=;
 b=XsBKI4xnbw1JaN17qWgkAV+dgpV+LjxEJti0B0aQ5lAEdApoPe9yCsXWZG4qlipwtW
 83Wm4+aTu1/vOhk4Ebsoo7qY9FJV7RvEIk1X+AxCeOonFg+JG3eZHVq2O31HYEXfwjL9
 cHx/q95tRwnLyJ0+Aaav/T7UVikaw4iK5Fm8R+Rq9DVtafjtdEIlcK0D2AjOKxemU6qt
 IjN0XXf5/ilGTNGTnj4hA9LLL3lQAWHbafzL7TfB7n3zWEVgMS2Ykyix6Ly4ANalVbCW
 GTzp/XTDG6957IkU/U/zuJYf/1UoGgbyejI50nuCJYdOAo4QWiz2jtXL+s1Un8E+10jn
 HGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZew05pny+AMfboX/VUE7XXgEcmZYj2JbeonnK41JqU=;
 b=s3H6OyHwrH9Q3XMjzuvkyzxYEKQd+2csCP+j5Mo8nbVpWhD2SmnxWHOKG3qqY9/bVq
 yTJGjJm4BGx6w54QgtU9HalBCmcFrk1L6pr2Az3A7pilJBaROtyulNZx8iX9WalhTycj
 8gX82u7hAfwNJK8y7YRyt4/g11NN95IIJe4SlE62JiCoKElAPOeuYb/1s10wPAeEH3nd
 p/bztR6GCwqogDyMvWVL29WwoSOexCue1en2vPEv7mAGYGYDWCitN2WtnBFKeepGjqy5
 I/PI5qAjdOI5qTYOdwS4tUAL8nKHVHdeaPh2Z2gp3vimU3uiJMXu5OaZGacKIpj86omc
 WqCg==
X-Gm-Message-State: AOAM5317DRFIf3pHzadhxFTlAwvFhQtxgqzENYfcZ+if15dFTWYgJ0O5
 MH7oF0Mkmf/oIV61BAUxn5k1QmLnpyKZRNjSTZL0P1Gp
X-Google-Smtp-Source: ABdhPJwR0XnAGdvJm2UDco4xrFhoLo/FMbzVajSjlTKKgNt/uALn1qi0Bu2E/97jYryZzVHPJeZ/couXWsea79ELYQY=
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr5314081wrg.151.1631123904218; 
 Wed, 08 Sep 2021 10:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210830162232.1328594-1-robdclark@gmail.com>
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Sep 2021 11:02:42 -0700
Message-ID: <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, 
 Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH igt v3 0/3] Initial igt tests for drm/msm
 ioctls
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

On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> plenty more we can add, but need to start somewhere.
>
> Rob Clark (3):
>   drmtest: Add DRIVER_MSM support
>   msm: Add helper library
>   msm: Add submit ioctl tests

If there are no more comments on this series, could somebody push it?

BR,
-R

>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/drmtest.c                                 |   3 +
>  lib/drmtest.h                                 |   1 +
>  lib/igt_msm.c                                 | 211 ++++++++++++++++++
>  lib/igt_msm.h                                 | 142 ++++++++++++
>  lib/meson.build                               |   1 +
>  tests/meson.build                             |   1 +
>  tests/msm_submit.c                            | 194 ++++++++++++++++
>  8 files changed, 554 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
>  create mode 100644 tests/msm_submit.c
>
> --
> 2.31.1
>
