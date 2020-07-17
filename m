Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B582D224203
	for <lists+freedreno@lfdr.de>; Fri, 17 Jul 2020 19:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594E36EE20;
	Fri, 17 Jul 2020 17:39:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41686EE17
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 17:39:21 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id e10so2286443vkm.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
 b=h50OyDj1X58pC7yEJMwCHYam/5JpjacNj4lnzko/r7vN8UfLwGNHM+oCutt8YGlrWX
 sPZ3WG4CgGPiEsti7uJRLIjgLGclvu+gWYfbmNJlNQmexUpO+essviBd/mlHsE8bWYcQ
 XyzSByoFKpUZu/3vuZVc8VRbmooB91m5COMos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
 b=sRf63drsH2EZJRQk8GiiBqjWxIq/hRYAkJ6jU7xWOYNt/vUY794xrch6xGtYNiBucf
 KzDtnZPLuOzJA7ThWR7+YoC7B+8nazULZVcCtkTtNmHQQNKvFfHlXXfgCEOYur5rElza
 /yXYAQuqv7J7WS4yRdynxQx2vz7NLHcHtvytUu2Cvt6m61gE/XUGbAo5PqnK9n/8wMLF
 tSGmY5+tqniLGYfmNb1hvVTjx6cfiQuR1WxlO0dbckPgt0EhYgVvYebIjjNqKAK5P+6W
 whpwLhdl6go9KdoODePy7JsCO71SHOx4sg/pnSzeEtAm18Nr3yhLNFTTxDi2D4aoRMN+
 IJTg==
X-Gm-Message-State: AOAM532EDw2/IeohC1YsrlbPFotPjdPikih6Crqsbhq+wtykRYMUuG8u
 2Hp8nNboFJxqd3Tj4j35SsZs1KfWVNs=
X-Google-Smtp-Source: ABdhPJxm89GPCTV65+u+dAA1ThlNwHH9+dUeGM7kKWVjsnPkq3lB0xprncn7FEwTXspsO00p4nw+NA==
X-Received: by 2002:a1f:add8:: with SMTP id w207mr8305729vke.3.1595007560416; 
 Fri, 17 Jul 2020 10:39:20 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id s25sm1084839vsj.13.2020.07.17.10.39.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id j186so5253553vsd.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr8687935vsc.119.1595007558792; 
 Fri, 17 Jul 2020 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 10:39:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@freedesktop.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [Freedreno] [PATCH v2] drm: msm: a6xx: fix gpu failure after
 system resume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, move the refcount-get on GX PD before we
> > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > during GPU wake up during a system resume.
>
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> The Signed-off-by needs to be at the end but I think Rob can do that for you.

It does?  I've always been told that this is supposed to be roughly a
log of what happens.  In that sense you added your SoB before the
review/test happened so it should come before.  I know some
maintainers seem to do things differently but that seems to be the
most common.  In that sense, I think the order that Akhil has is
correct.  ...but, obviously, it's up to the maintainer.  ;-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
