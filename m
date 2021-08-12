Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042D3E9B98
	for <lists+freedreno@lfdr.de>; Thu, 12 Aug 2021 02:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39406E209;
	Thu, 12 Aug 2021 00:25:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A06E20E
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 00:25:12 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 z9-20020a9d62c90000b0290462f0ab0800so5563779otk.11
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
 b=h+56UWETmWksgXZ6odjCSUhkS60nq9twTFk5O3iDfPkw9SlJ2Q9MC4k1YZ13wA9QSI
 cz2Pc3wlRcNYEKwZ643eM+MtGzStloEbEFNy4YhjnGGkil5U0nH2pe9f1iubEMhKDwtU
 PwWNtWc+gGsmqzXBvFg2DTN9n6mT6P+9a9T3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
 b=CTHvSYru93glYjAj5cD1TcYdAMCP+3FYei+fGJTg3u2A/TaTpC4zAa8hZgekfUaMp1
 QAAnYUhvzecm9yWY/rFRIR3gWVnQkgHeotEnd2noRdX6vH2CeHRCbwFIZflhMFIm0msq
 djERjBQmrj0Ky8intFgcoKsVIUR9JlNBeZxqgKg929Po+EMd4Fg1wTVf9ZSk3N4Bjc2F
 q40KD4mlIj7ce1uKJXTVYUJT0OBggbhuh3vsukka7j2trVYW/vzEh+ArXwPlHKId5UUU
 /+uBSTrET5uHywD2+3Eyv8qphm8ARBnmH/7yRwfw653FyKzlZUUuwFgtejS+DvXF+GfL
 jrPg==
X-Gm-Message-State: AOAM532Adfe8ezWy9nNevLki3Vips7G1T7hk5DweUQ29EHipfaaaoLmq
 tJtsps+PmMEBUz9W3qH/U4wu5RX17Rg3yn0jSNiZyQ==
X-Google-Smtp-Source: ABdhPJx0FoYmfQ9zAKiWN4L09yMr9AcpGP2BwH3WsltDn0CSuMhuEFOx+zQVeSaXHI+pNsLrGV3maXsnDszKO/B14Ss=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1268834oti.25.1628727911938;
 Wed, 11 Aug 2021 17:25:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:25:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 17:25:11 -0700
Message-ID: <CAE-0n51mqTwUdT1cmL=ubcFppFZ8GwerPBWCJ2QsyRtzG9vkjw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid
 creating multiple connectors
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

Quoting Rob Clark (2021-08-11 16:52:47)
> From: Rob Clark <robdclark@chromium.org>
>
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
>
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Thanks for saving me the packaging effort.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
