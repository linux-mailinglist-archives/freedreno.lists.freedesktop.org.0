Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580F413D73
	for <lists+freedreno@lfdr.de>; Wed, 22 Sep 2021 00:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7FB6E88B;
	Tue, 21 Sep 2021 22:20:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D786E85A
 for <freedreno@lists.freedesktop.org>; Tue, 21 Sep 2021 22:20:02 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m4so479154ilj.9
 for <freedreno@lists.freedesktop.org>; Tue, 21 Sep 2021 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWLoAInOLCehVyUDdEFgyA0aq8c1810nqg999R8oxfU=;
 b=aj3QxekWfRi3uAdc5lpdDn6FoYAedJ8FsTjBDvBCDWRjEzt/JQ6p7imxAG/DApK+mF
 2gagVt3X8luIoitRLXSKRYVwLgSznNVpaZyG8m/4FCGZweCBBZsIAUvT7PdIPZbU8wN1
 mfAQEwrxhepXNPQuDT3ppCtjQk9jPR2TpYAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWLoAInOLCehVyUDdEFgyA0aq8c1810nqg999R8oxfU=;
 b=zUHCihwQDkwaK5qffTaO5HUDEk8I5L4w3kCpk2O3kWek8vmTz8xU4tAZZQ5nxoAQsn
 0uYO7uQShot7QyMMb9BIPpaI3wfBKaYZl/AFPXrZxCDWFwufZXQUA7cJCiXw2L8ARD0J
 +BSnHw3pTVoJz2PMrf6bYtiQx7KLYOtc2p/nAROg76y/PGtgYvRkV0vQxwWlecvngDwJ
 aOQVFLtgipLelRl0WNh2nFiyCfjsjuMWxfdQd7itjzJJcny8GneUwHzUUqeBebx+vpZz
 G8H+OhU4klwYa8N6LkD4IH56oea7XEeJWhTCDkLDKTNjjANCy2pKwYedTtnW2QT7f0zL
 gQkA==
X-Gm-Message-State: AOAM531ZWID8Hj0HOLj6qSURniV5VRXgioQGLH1jbqnOzH/AXfavQkTE
 DhgzAXOcxLO2JUJKKcjB9J65fXDMdADrLA==
X-Google-Smtp-Source: ABdhPJw0ZaxKxDzCs3VFPajwY1eAg3V8uhfPnxLt/bOMYedn+p5kbUnzGqIaOk4x0d3OKMR/8zmlgw==
X-Received: by 2002:a92:c56d:: with SMTP id b13mr12736469ilj.86.1632262801960; 
 Tue, 21 Sep 2021 15:20:01 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id d6sm105424ile.51.2021.09.21.15.20.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 15:20:00 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id q14so509136ils.5
 for <freedreno@lists.freedesktop.org>; Tue, 21 Sep 2021 15:20:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id
 i12mr20195314ilv.27.1632262799686; 
 Tue, 21 Sep 2021 15:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
In-Reply-To: <20210920225801.227211-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Sep 2021 15:19:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
Message-ID: <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add
 NO_CONNECTOR support
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

Hi,

On Mon, Sep 20, 2021 at 3:53 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>
> v2: Remove error return with NO_CONNECTOR flag
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 10 deletions(-)

This seems fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...if you would like me to apply patch #2 / #3 to drm-misc-next then
please yell.

-Doug
