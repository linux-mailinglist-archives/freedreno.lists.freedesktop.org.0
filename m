Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC193EA8D4
	for <lists+freedreno@lfdr.de>; Thu, 12 Aug 2021 18:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81916E436;
	Thu, 12 Aug 2021 16:55:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20856E436
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 16:55:11 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id b7so225265iob.4
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
 b=aSb8j96vLHuOXO0FBSyas19kl6IAsLIMwmg3ku9T8nvfjewVuGPM33mLbilyC6rB8B
 tiQN+uh+75AyIBwHMJ2HEFtzZMiOGvWBIbRJ+QNJD9JmeqfkQ2t6nCwa69MOyn7D28MT
 srIZF9FLnI3BIgjTludpaGZhO7pBF+Wbbl2uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
 b=TPFpwSvqJY1GRWOSPapzn22uhh3+sJV9+LR+zDbCKZqsJovI1tLqvix74EqFGYPIyP
 0x2wo93LMlbiuU99OBCK5gjQk0TiT1dljNDfqhzU9uvz9pVv+V8bATmEdGSnOmqsBIPv
 vo+wbWcrHNHHLqJ4V2ErbHxlH+9u6nv0EP8tZ6x6EGGLY+RRBItp8vjy6HoDROMMi/1V
 LzjtupMkCM4pDMIEppwqlaASZMBCCAkXz7dgiUK7MtUf0rCJoJ7kS0AUqRobSI9WBiIJ
 ACjaFlmtMgz7wKskqGAtMPUHfLNOWihVavMq+TpXHdX5+P6DMiPVkzdDKGXofmqIuVFs
 VWqg==
X-Gm-Message-State: AOAM533Bpxq9hb9Vh9P1kK68mdPiF3bkSuUBNGSQQtRJH+jYJ5r88GGa
 ZBowX8VBt8T3Y5agCq/Yp0ZmG7GPyERUNg==
X-Google-Smtp-Source: ABdhPJyHrJuXeVUYGIZVRV19VO8+iMe+JmSIjGW47QnzdZ/jYq7Pn5Zb4bl4jnJ2WTMnjyaPene+qQ==
X-Received: by 2002:a5d:9eda:: with SMTP id a26mr3778234ioe.166.1628787311211; 
 Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id h9sm1837279ilc.30.2021.08.12.09.55.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id j18so7676396ile.8
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 09:55:10 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr3510493ili.187.1628787310662; 
 Thu, 12 Aug 2021 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 09:54:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

I'm going to apply this one to drm-misc/drm-misc-next and push since
it's a fix and we're before -rc6, then I'll take a look at the later
patches in the series.

-Doug
