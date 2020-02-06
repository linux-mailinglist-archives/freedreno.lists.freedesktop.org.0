Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB7154BB1
	for <lists+freedreno@lfdr.de>; Thu,  6 Feb 2020 20:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60B66FB17;
	Thu,  6 Feb 2020 19:12:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635336FB17
 for <freedreno@lists.freedesktop.org>; Thu,  6 Feb 2020 19:12:38 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id n21so7446049ioo.10
 for <freedreno@lists.freedesktop.org>; Thu, 06 Feb 2020 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
 b=dOu8k7co1W3I1l1ud/O4tNq6yrR8hg9NmPtIwy/s1Z6lQY342ZljFEmid3M8nHnKoE
 o6EgzYmkeJe2Zuz2J3Vz99vNyFGmG5pEZQddN+ZtJBEGBSrIGW1REL64YKWw0eC4HOF2
 8IkPafFKv5Gs9Dp6vgisxTnweTLTpT+i5SCPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ru+inu1PmEIJ9vDnJLv1Qr4gQtvZqrjXnMpeSc0T07w=;
 b=V2w9SC5UrXTvMHUECf7+lkTGJt6zykpcOc0e0zKgpPtxZGomSN0+v+Nq+3bU7xhtAj
 J3+Ram1X//ECstpZPd2rlea4j4ngpCJra8GJhOyaV+dZJZ0sbWUmdx0Yq9BHPW6dX6Nw
 XBGRJx61J/BTVQrwPTYeL9EkC9zCeKWxTQDW9i3Nc5WfyetSxQWKVHIfk1ruB1zezSkd
 boSaFYYKWdaRCuh0+6NjUTjeTG+EBlDsyNa5TiS3ZqAz1agMlca8oAPG0xMOiLFxp5Dm
 r06elMsQhaWTe8K8CCAUUsUPRrRCUidzKPjV9gILUL1/yIoNtOU71FVlD7KtBE9PzVTW
 V9IQ==
X-Gm-Message-State: APjAAAXrE4Hn5GyAfC+GZ965/5tdXEOhIds7j8i9tqg/3+j3b0eP2Nyo
 /katvgWkXsbr6omDNyRkp8XqoSkeZZ4=
X-Google-Smtp-Source: APXvYqxnEuclFIeLdTpoa6CZ2gVY2MROe9cCI7pHteg8xnX0sALe9c7tt5bGBuTX8hn+FQddPenDUg==
X-Received: by 2002:a6b:db12:: with SMTP id t18mr32302268ioc.11.1581016357225; 
 Thu, 06 Feb 2020 11:12:37 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id r20sm120622ioc.35.2020.02.06.11.12.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 11:12:36 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id i7so6141630ilr.7
 for <freedreno@lists.freedesktop.org>; Thu, 06 Feb 2020 11:12:35 -0800 (PST)
X-Received: by 2002:a92:508:: with SMTP id q8mr5345001ile.187.1581016355450;
 Thu, 06 Feb 2020 11:12:35 -0800 (PST)
MIME-Version: 1.0
References: <1580935697-28195-1-git-send-email-jcrouse@codeaurora.org>
 <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
In-Reply-To: <CAF6AEGv9jVEO=QDY3DWts3w9aPxQ6fSBt2nydoqWdf5JenK=jA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2020 11:12:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
Message-ID: <CAD=FV=U7iWY1z5mwS0FyHyAA5EoFkAYzL-HKRaFMbRkMu6ffkg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Fix a6xx GMU shutdown sequence
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
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 5, 2020 at 1:00 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Feb 5, 2020 at 12:48 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> > updating the VBIF flush in a6xx_gmu_shutdown and instead
> > inserted the new sequence into a6xx_pm_suspend along with a redundant
> > GMU idle.
> >
> > Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> > the appropriate place in the shutdown routine and remove the redundant
> > idle call.
> >
> > v2: Remove newly unused variable that was triggering a warning
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Without this patch I'm seeing some really bad behavior where the whole
system will pause for a bit, especially if it has been idle.  After
this patch things are much better.  Thus:

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
