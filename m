Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D883445CEF
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 01:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CB973B27;
	Fri,  5 Nov 2021 00:11:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4D73B25
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 00:11:16 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id d70so7971177iof.7
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 17:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
 b=nFhNJs/6zLfX/HDdX03yOBZsFn//RbfnTbfvj+8xfIcqZA01a8sEJdr7u7Hg2yFwIx
 UQ8Wr+wzrwqo1ljEOyT7Z0fOU4gCqarwPqUzj1f018BbkV8CPIPaNqLH+1IHHrzBv5SB
 u/PfIRUb4ABRnF3OXo6a4xpOLivk43cyxfPcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
 b=v0r76OC+7H20Y7lLsZtUUUl0YPZC1gKTocpSjQXyzwvHT9c2I3ptdW31cU0/Lah0C3
 NwQMrq7tkepN9zk5Xu0T5lLl6ePi1cMzA4N8woXgWs0inwuhkkvSOlXNC+//hNUojrVN
 U0Z+qbjlC+SWTercoxvRuykYTeVPyEKZgrLemWRJsFpTK2ZVhROM7KAiRhdPxuCRwtHp
 mTFVOE+E80MGsg7IAtCzpXsKMtXaRP6cyAkA9T1Yv+jFEAEwlwyrGhulHxUl63Lqzp6M
 5g0ojmGaD10oOG+M/TYssVjIeLvjk1Gm+pNQeBsWs4ct/rbg00YmTCQ2Qc3fUWonlm/G
 8aww==
X-Gm-Message-State: AOAM532DOxJdJOQR5KhV0H4Zn6zVr0TNowyv82cB4YkukqrCLPu6oC0v
 fkB58tOa5suSMiI1Yhd2H6lvK89yYJ9d1A==
X-Google-Smtp-Source: ABdhPJzO8vZMSe/Uu19AqTK+acKJCnsuPlSmBUXIYBuBuoGEZnKo3uom2q1olKJ9aHki5HPQVnMSKA==
X-Received: by 2002:a02:2b08:: with SMTP id h8mr6479032jaa.137.1636071074889; 
 Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id t10sm3305194ile.29.2021.11.04.17.11.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id l19so7981546ilk.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a85:: with SMTP id
 k5mr18841136ilv.27.1636071073597; 
 Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com>
In-Reply-To: <20211104222840.781314-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Nov 2021 17:11:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 4, 2021 at 3:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
