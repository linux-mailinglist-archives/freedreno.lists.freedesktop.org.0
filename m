Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C255240AD
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 01:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA6B10E2A2;
	Wed, 11 May 2022 23:18:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AE210E26E
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 23:18:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s11so465353edy.6
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
 b=gygLmm76slBdVa2keLfFJYY7zR9gVLTrQN7Qeoxr8clFf1VZSLKxHawplwV3c1cvML
 3F2nc0icCJFSso3TejBkbD4mveFcMg9/XBRM8VeOaUhHfU6oraKEtgeiiRmY9Y3d2Ofe
 0e16IW4wgnUJtqxOljWBH6MhiRPRrpKM9eB3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
 b=VruYZm1z6X0FwPDP3kEnCmH7yTN4k6+BdUqCUIkOyvrG0MVVfcGMrTKOvxjpxZmXC7
 bj+bMkfwqOtiXTaqw+H5XO4z4bKOFOS1YVjOiuW0q4Rud75Hdkcu6wskj2tG3zgMgJe2
 U0Kb+VKPXEvTCmEWncghMH6rBSX4FM0dErxYnvAy0oKf7Orn2+AN5BKsY68KLBcSrovm
 bq37+mtw+IU54l5wz/KhPrjsHuY+hjfa0z+I/Ar6CckKcRH8CykBF4KO3rWXoxEvGfD2
 9E/2Uv7dm12rAmtEmeisTTJw8nk5zAB2jx1bKzaGYOLmNRP6ck/j274L6jx+5YxAm6XI
 tfpg==
X-Gm-Message-State: AOAM533k6ngBxMTs3ZAgLMW27bPzauZaWr4wS5VkPEYvQ3azJrIV9Eaz
 evM0AAsCTWlFAmpTBxhJWdrapbfIdhYCAlrO
X-Google-Smtp-Source: ABdhPJwjtPQYsXeBbeUYZuyTUZv+JIsWebviKfSPeem7+3Lj3QZo3O7zKe1eFgcHb/7rs0dZ28S/qA==
X-Received: by 2002:aa7:d651:0:b0:425:c3a4:2291 with SMTP id
 v17-20020aa7d651000000b00425c3a42291mr31634306edr.54.1652311112195; 
 Wed, 11 May 2022 16:18:32 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 p2-20020a170906614200b006f3ef214e41sm1462940ejl.167.2022.05.11.16.18.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 16:18:31 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id m62so2035597wme.5
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 16:18:31 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr7173683wmk.118.1652310807772; Wed, 11
 May 2022 16:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
In-Reply-To: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 16:13:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] Revert "FROMGIT: drm/msm/dsi: move DSI host
 powerup to modeset time"
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
Cc: Matt Turner <msturner@google.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 4:07 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit c7e4a2a72e696aa6aed2c8b651279f491bb096fe.
>
> The patch causes sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
>
> Let's revert to get these devices back to a working state. It seems
> like the DSI powerup problem is somewhat common and probably we should
> land something more general like Dave Stevenson's series [1] that
> would give more flexibility.
>
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
>
> Fixes: c7e4a2a72e69 ("FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 ++++++++-------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)

Well, that's embarrassing. I clearly reverted the wrong copy of this
patch. Sorry. v2 coming right up.
