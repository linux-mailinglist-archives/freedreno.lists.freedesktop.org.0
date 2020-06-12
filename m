Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C01F7FA7
	for <lists+freedreno@lfdr.de>; Sat, 13 Jun 2020 01:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE356E213;
	Fri, 12 Jun 2020 23:26:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB096E213
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jun 2020 23:26:47 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 10so5011856pfx.8
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jun 2020 16:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=cd8LTTDCxtDjnKjbsZ9jO43bYWe9oEBWpIizX4GQU0U=;
 b=Lw4T3E4ZIvoTyrIoTGXbuwzkYPKLdcRB67fh6nMYa158xML70GfkNouZD/EYE7TP8Y
 xNtj4cTC+2h6OZaQ1iXjCGAofdLANd7EOzdqX1xPjOVDOJR3pRYWFYyGnKF1YdcM4vzV
 vGArfAei+IpSal6g6kpNg91GqadqRzJGLTaTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=cd8LTTDCxtDjnKjbsZ9jO43bYWe9oEBWpIizX4GQU0U=;
 b=uZYwTNHxg9gqVgnIXkBbeeEe7J7Uwn8UwuWbK16tbsOz4DLaurNucMJqpYyPG8PRWS
 yfkmuVp/wb/9skjAlYALQjtEDKnonzSLQ558EW4sEL2qOS3vkyCwVqKhmwcTEEPeAgQx
 Jn1xsjVU1I2FuuzioWIoTnMtf4P5qhNEOUylw8P4215HS8XSGKRWQxbCWh6L+bgyh/1z
 qwzu3QQKkEyuelSECBdnM0YWcScGtx/rHvcvKXyT7Xmh4yKlAiBw9WSw8/TgzbHrS0SX
 0Xi8PSeRuRQKhsFjGupiQoyZ4NufSxIiWl+YFAZSVjyTL6sNl2WihPm0zqqrQBweHgcf
 HBUg==
X-Gm-Message-State: AOAM531kAMMC98KBLPskoA5kz7ixBuJ7GHESi+pxIC1b8qIU+C+zH9ni
 MO2i/JPX8eOXHhKVN4Onn9Fdbg==
X-Google-Smtp-Source: ABdhPJzK3Vh997LsBtVPHovSMTQbFpaNghRNnzPcII8FDjjXnQEctHlOWB1h2ubEGIERyr5pJ8Ulmg==
X-Received: by 2002:a63:9e02:: with SMTP id s2mr12540767pgd.170.1592004407192; 
 Fri, 12 Jun 2020 16:26:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i14sm6253209pju.24.2020.06.12.16.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 16:26:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200612015030.16072-1-tanmay@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, robh+dt@kernel.org, sam@ravnborg.org
Date: Fri, 12 Jun 2020 16:26:45 -0700
Message-ID: <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-11 18:50:25)
> These patches add support for Display-Port driver on SnapDragon
> hardware. It adds
> DP driver and DP PLL driver files along with the needed device-tree
> bindings.
> 
> The block diagram of DP driver is shown below:
> 
> 
>                  +-------------+
>                  |DRM FRAMEWORK|
>                  +------+------+
>                         |
>                    +----v----+
>                    | DP DRM  |
>                    +----+----+
>                         |
>                    +----v----+
>      +------------+|   DP    +----------++------+
>      +        +---+| DISPLAY |+---+      |      |
>      |        +    +-+-----+-+    |      |      |
>      |        |      |     |      |      |      |
>      |        |      |     |      |      |      |
>      |        |      |     |      |      |      |
>      v        v      v     v      v      v      v
>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>     |                              |     |
>  +--v---+                         +v-----v+
>  |DEVICE|                         |  DP   |
>  | TREE |                         |CATALOG|
>  +------+                         +---+---+
>                                       |
>                                   +---v----+
>                                   |CTRL/PHY|
>                                   |   HW   |
>                                   +--------+
> 

I've never seen a block diagram for a driver before...

> 
> These patches have dependency on clock driver changes mentioned below:
> https://patchwork.kernel.org/patch/11245895/
> https://patchwork.kernel.org/cover/11069083/

These are merged right? Don't need to include this if it's already
merged.

Can you include a changelog in the cover letter too so we know what has
changed between versions of the patchset?

> 
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
> 
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
> 
[...]
> 
> 
> base-commit: 48f99181fc118d82dc8bf6c7221ad1c654cb8bc2

What is this commit? I don't see it in linux-next.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
