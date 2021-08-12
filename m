Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FC3EA964
	for <lists+freedreno@lfdr.de>; Thu, 12 Aug 2021 19:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1B6E43B;
	Thu, 12 Aug 2021 17:23:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F4B6E43B
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 17:23:30 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id f11so9419557ioj.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
 b=Bh074U0YkS72TlAp7BoXqHTJFFM+Kpvlod9cHdGDbEvZxvD/WDOg3Uc8bwHw0XuXHR
 gR6QY2KTEoTvpqCgEQpyiOdXq/Y0PNq6zEbZywP4dsfckhwXLli67gfBLkr1fxY8sSCu
 ZZY3+cfWMnUPqp74qIF2TVpKDoMx3ryHreSAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRwzKSay2n+yQfmhBPOFfDNxmLPMQg6PC0lXLvxAvL8=;
 b=gFUp4DIPHE6iPbdrBeGTtelkLTZWAZvNVM281XLUHSODLFClR2Y6MVtCfbqZ0OTT/0
 v0xT7rpkaKJ+jq4xwl8fXJPIuZEkaaulodFBnt+7TlmUjjLdxLMEcdrI7ZF5RIq9gkv+
 KGfAEJ4xMDW8AVvf7/dEmInFnZdJUMzI4uBQYXj/WD7xj0VLVqsbxWdJwNQm/x88zDcG
 xX1WixoG8Y2mvs7NZBiQQfzU2Cy+4fuNQjevxy1Z1hhOrFOS6axjKx9SIxeMlVxiFm5+
 humhuMgl/pBO1t/5t1e1+0qv7EYj1zt//TgHs0H1cDqzoMsxuEtxwhC5How+iUsP+eoe
 E4+A==
X-Gm-Message-State: AOAM531nIT1w4eiIrzV9QzOd3qWvSySMdkAz06P0cfm/m00OODWk0mVd
 AsbFszjaPu6NqQYrBP4aK+wTLMW3tUNUyw==
X-Google-Smtp-Source: ABdhPJzlruLX1YYq45migZ8ghCcMyTkd/YRvG/uSzmDvQyOcsGDCuPVfKETgl4Uz+0lUUn4JXC8DRw==
X-Received: by 2002:a02:90d0:: with SMTP id c16mr4730392jag.106.1628789008704; 
 Thu, 12 Aug 2021 10:23:28 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id f5sm1779533ilu.48.2021.08.12.10.23.27
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id v2so1604562ilg.12
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 10:23:27 -0700 (PDT)
X-Received: by 2002:a92:d84f:: with SMTP id h15mr3825806ilq.12.1628789006912; 
 Thu, 12 Aug 2021 10:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-4-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 10:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
Message-ID: <CAD=FV=U__Ge_6MkvxmcOQe49Q7NG94Bi3T2xNNiec-NF9J8tJg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
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

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> For the brave new world of bridges not creating their own connectors, we
> need to implement the max clock limitation via bridge->mode_valid()
> instead of connector->mode_valid().
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

This looks good to me. I'll plan to land this together with the next
patch into drm-misc-next sometime next week unless someone beats me to
it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
