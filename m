Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234E38D05D
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 23:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6316E89B;
	Fri, 21 May 2021 21:57:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159F6E89B
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 21:57:12 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so8184268otk.5
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Pd7ky5cxDb+qxzJPiCzfS73ME9CuHoqRQM37v+k83B4=;
 b=hEWVM/nvf00TFCvYEtUvgRbGojwxiR3Xlb4OIR6nUJv/kcZu76ZTGZ7ogyUEeilbIC
 tZYDOwLEzD9l2dpBfqePGUkwUp2OYTw16Kip9gbdyR0H1OKM42auzXMCFM+47ulZUuph
 6Lym33huSHkbIkeNSWu3+jZgbAA1er/HDgAug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Pd7ky5cxDb+qxzJPiCzfS73ME9CuHoqRQM37v+k83B4=;
 b=M5G8XXKVy7Uo56fPiZzbw/1YIRQ9Z6JMpkGNY07B6cKzDTCITqHdDHivBNK6Anzdiy
 bwkoxW1sMFqJLR7W7hRD76gJ6l8oj3GjCpVGeIXRwAXSfWNXk8gm0FIz1Yz49OxHkxNP
 D7sesFg/xUJ3aqF7C5Am/UImCHvBXPteghtOeHtTi5jAuxXlEnp5TGnjdkzdy8nmjnmM
 qD/+kVdn8wZ0mxEi3zrHGDgFjDbSeQ5cbZOSBAbWddTVuzDvmtEJe3QoeJcpnQYtAS9R
 /vZ8LrQTec435CX2FiNdn0yjjWUGIa99GskBhOXsqys98vLuFD2HsS9se9pe26/CU58X
 My4Q==
X-Gm-Message-State: AOAM532ok+YnqyGIBLqEOzKyqDToror+4x8mwcltXW8/ZIpdRmKr1iD8
 iKG0LqusLsBxDWMV+LuD/dEAaUYkIZ7JO1OwXK/8sg==
X-Google-Smtp-Source: ABdhPJyjbsrGqouAWtP/zueb6T/6vS7R8/wyCxfqpPAl8atKW0srTtbu4Y125oTZNM8SGNMwKaikdSMQ7jjhuRI9rTw=
X-Received: by 2002:a05:6830:4a1:: with SMTP id
 l1mr10235034otd.25.1621634231832; 
 Fri, 21 May 2021 14:57:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 14:57:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 14:57:11 -0700
Message-ID: <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] drm/msm/dp: Simplify aux code
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2021-05-07 14:25:02)
> Here's a few patches that simplify the aux handling code and bubble up
> timeouts and nacks to the upper DRM layers. The goal is to get DRM to
> know that the other side isn't there or that there's been a timeout,
> instead of saying that everything is fine and putting some error message
> into the logs.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
>

Kuogee, have you had a change to review this series?

> Stephen Boyd (3):
>   drm/msm/dp: Simplify aux irq handling code
>   drm/msm/dp: Shrink locking area of dp_aux_transfer()
>   drm/msm/dp: Handle aux timeouts, nacks, defers
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 181 ++++++++++++----------------
>  drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
>  drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>  4 files changed, 80 insertions(+), 113 deletions(-)
>
>
> base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
> --
> https://chromeos.dev
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
