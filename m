Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F1188BF3
	for <lists+freedreno@lfdr.de>; Tue, 17 Mar 2020 18:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1256E5D2;
	Tue, 17 Mar 2020 17:27:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FC16E5CF
 for <freedreno@lists.freedesktop.org>; Tue, 17 Mar 2020 17:27:11 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id m9so14487050vso.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Mar 2020 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
 b=VWLDmipX7IFDQ/yHjCAzFxlk/+VluSSJwe4qv5jpHr4e6B0U7gp1YOW3C9Csk4kZHd
 NXgx0kZ6qhPzwcHQS3y9Qvp7AMowj6bjIngubmHTjWmVhTh0fc8O7LbAKQh0NHGA4pJV
 mU73ACIJwkVyGoLSZZRtAPc2yjx+8+foKjquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
 b=LBnp0wjWIk9bTDNJjWbvZiqB2nu+KyxwKloam0m5zQHmEPJaMb4VS0XwVtRqep3Wzh
 GpOYZ6m9nkEHCm4E5Rrtq3OU3+d7tsAN0NvYr8fS2XdY6JDfM/FW8tgT+AJfV6cQcIgI
 LF5R924Gqclrp3IQmyzg8pEqgMXnUIUGogBN3xkkuvjLcSWV0FZj+/HHgWmqMSJijbLs
 hub2iPrE4zR+crnsRqk8OCZARDKf6c4A2anyof0GZjEPcW8jmzdlxdjlxqUNiXPX7GF5
 whFE+PvNwgbvUZIqLV8VuiR+OAiEebjlodH0FQ2Fl0BqUZMh7EzAV6w91hUZGroarloI
 IMfQ==
X-Gm-Message-State: ANhLgQ2vc4g++SMaP7OKYVLGNjkq11XNByDCDVBBo2lb5ZBel6Zq5jMr
 F+RrFlUKumPX8pwWKsTVXaQsLqckIiw=
X-Google-Smtp-Source: ADFU+vt6pqAmUsvnjh1pb0MWql8N7PnncsBvOx1x1S+CpOUWJtnXRyIdsnz089+hm1n8ne/Ja9Y7Fw==
X-Received: by 2002:a67:e3c2:: with SMTP id k2mr4517735vsm.237.1584466029785; 
 Tue, 17 Mar 2020 10:27:09 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id h23sm1665586vkn.11.2020.03.17.10.27.07
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 10:27:08 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id y138so6669017vsy.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Mar 2020 10:27:07 -0700 (PDT)
X-Received: by 2002:a67:e951:: with SMTP id p17mr22233vso.106.1584466026884;
 Tue, 17 Mar 2020 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Mar 2020 10:26:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix an error handling path
 'msm_drm_init()'
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 15, 2020 at 12:42 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If this memory allocation fails, we have to go through the error handling
> path to perform some clean-up, as already done in other other paths of
> this function.
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This has already been posted as:

https://lore.kernel.org/r/20200309101410.GA18031@duo.ucw.cz
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
