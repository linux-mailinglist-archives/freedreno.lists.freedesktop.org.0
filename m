Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B614D2AE
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2020 22:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA356E04A;
	Wed, 29 Jan 2020 21:45:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6C66E04A
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2020 21:45:35 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k25so480223pgt.7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2020 13:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nclDQAc57fGVBDFTZcvntg/YEiVwsYbbmEE1VCKKHLg=;
 b=ZwMaTKzujzRvsoOYh4RoVaxZqJcaDKslwpdjnDms9u/KmNgAXwun1IqcFfAiO+gq1i
 mX9dIMgPRPLi/SsGh4rboYXE+P83RWPLszMjStuactkkeBOxADTViB237qKrw+zH1LqX
 ZwMJmGfgoTt1OXiQeWv1VcSSYlMYwCe9Ds5Un6Bl1gJzcZtXxnSR6twaVUzw9PBYsjKR
 J0Ptii7KP0h/aELgFOoCRE2Q/JOsK/obCwC3hOMvL7yGNDRrJKqSN4V2JaTAENG4/XKM
 jCta6txXwdOK1SaPsone8HpNOVpOj3cEL9sOPK7fXVejm+MnK1sACZmkS7sIDqOAR3O5
 Ec5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nclDQAc57fGVBDFTZcvntg/YEiVwsYbbmEE1VCKKHLg=;
 b=Gz/YOSJwZyWPzJXCFSrFTiF0XXnFpHyjZwqFDC2+KZ2LZEePSRk/u2KN05gJxJtlyL
 h3q2rlA0wswwPQEbLmV7hhQ96aK6t+olYtcX1FaBT4l/DlfF5Gmg+OUEgjxHzFH686ON
 fLzuUMy4fi76xhUyDpGhXAgtwrIlJt6jojrg46f/lX3OP3QqSIgz5QUSiugKYJ5V716J
 70F/eD2KFlWZvlgVAHCsBob+DAyYX9No0oCc3hMZGQVESnZnL9K1FrZyRqKKiZQp066s
 nTEWdOf4WxW7jzLxGr4m9oJpESaIDekn9RHAhssN6ZzUs0lR8PJXfApuPciGQT5ObJQD
 Tz2g==
X-Gm-Message-State: APjAAAXgbh5cBTAuDSzk7rEJHGbkossgYnCq/9KKu5HhL94cu/eUwg1B
 X11X/71CNAi8cDFJI45vc86dWfywM7MfdydGDAmrGA==
X-Google-Smtp-Source: APXvYqzIW92YmXpOGHWgyhnVOCnqTnMqWsQFTenOWcSvmwUlWqxTwRcCT7ZYdui69Mp9XEVYFxK5oXQGEWYB53kahxk=
X-Received: by 2002:a62:38c9:: with SMTP id f192mr1625175pfa.165.1580334334643; 
 Wed, 29 Jan 2020 13:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20200129201244.65261-1-john.stultz@linaro.org>
In-Reply-To: <20200129201244.65261-1-john.stultz@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Jan 2020 13:45:23 -0800
Message-ID: <CAKwvOd=EvaSJFcpjh6gSRMrb=D5hwJHNR3wz6uEg3fmqmoGqfg@mail.gmail.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm: msm: Fix return type of
 dsi_mgr_connector_mode_valid for kCFI
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
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 freedreno@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rob Clark <robdclark@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 12:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> I was hitting kCFI crashes when building with clang, and after
> some digging finally narrowed it down to the
> dsi_mgr_connector_mode_valid() function being implemented as
> returning an int, instead of an enum drm_mode_status.
>
> This patch fixes it, and appeases the opaque word of the kCFI
> gods (seriously, clang inlining everything makes the kCFI
> backtraces only really rough estimates of where things went
> wrong).
>
> Thanks as always to Sami for his help narrowing this down.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Alistair Delva <adelva@google.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: freedreno@lists.freedesktop.org
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: John Stultz <john.stultz@linaro.org>

John, thanks for fixing this. Our inliner is a point of pride
(inlining indirect function calls; you're welcome). ;)
Indeed, the function pointer member `mode_valid` in `struct
drm_connector_helper_funcs` in
include/drm/drm_modeset_helper_vtables.h returns an `enum
drm_mode_status`.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 271aa7bbca925..355a60b4a536f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -336,7 +336,7 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
>         return num;
>  }
>
> -static int dsi_mgr_connector_mode_valid(struct drm_connector *connector,
> +static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
>                                 struct drm_display_mode *mode)
>  {
>         int id = dsi_mgr_connector_get_id(connector);
> --

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
