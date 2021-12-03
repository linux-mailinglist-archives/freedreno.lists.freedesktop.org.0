Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3225466F44
	for <lists+freedreno@lfdr.de>; Fri,  3 Dec 2021 02:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D136E0CF;
	Fri,  3 Dec 2021 01:50:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9856E0CF
 for <freedreno@lists.freedesktop.org>; Fri,  3 Dec 2021 01:50:29 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id o4so2820079oia.10
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNwfOn9vmY3VbdnDca+JfZ16hyf72zuU1wTESMaGj7Y=;
 b=YAntr2tAT7sEIv605evLopqYP/xpOtx2dHSl2V0NHNjkGy8RR+F5tjXLmFQXIUVLX/
 HdFEhTBkzzIchrj3sZSsnqicRNOhNXrh0NXsuJeaIXDSQW9IAKOI0AfQNR6d/JNyu8/i
 QOk+EKYEzPP02uFhgkcLLjSph61McgnnSer5a7ApLRudN77ULzy5Uy4qnyetNDjH4ZgS
 gxA5TkDl0AF5WzZSyfV0lH/Hfws/VXLcCJzBL+bvt3YWkFXdg8wLseqHWubH7FWTJEWx
 k5j1rim5sGqc4f9C1kqnPBX7vHDHOPPJE/htVnD+KcxPYVMWvUKRhS/iv+1otnNgVyJz
 5JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNwfOn9vmY3VbdnDca+JfZ16hyf72zuU1wTESMaGj7Y=;
 b=0IYEPdb2iPQ3RxnfUcXVVAZs4pbAYofJy4WKiezbExRQy4aG709RanXEhsCyqNzlAy
 peWN3nWA5ayzCat9FQFltbRNho/p48I32RbPz3Mf2nuNsXWkCF92TgouYWAteR8UWaBn
 wN+yl2+QHbFvSWcCo4oCXJi+sLLQRSkLDfbACXI4W/kkUP4afgXjV1uNv3n9xb6rhEN/
 hpz7KSACdJbLumkwNT2CDn+8FZpDmzNefLWmQ8u46Ew2218VmIrebFwLXgUXH+ax7+0K
 nZ4j9p6lJr3ZKIhdEVWw1s2jHCLeC7Ye13+JCE95GbK+ZOLi9+5R8E0krcMiM47tCDx0
 1KeA==
X-Gm-Message-State: AOAM5329kJytzBjBZ6vJ8Rrm0Kuo8dcnE7VGf+mWpgKKHvN2ec4V0NHP
 rSblw2kBEdQZ4ue07VY/rNRQ7irufUxRn1G4M/JxPg==
X-Google-Smtp-Source: ABdhPJx7nuu2YlyCnPSegJgOpuOgC5CE+wFxLhOMv5rAZOIPRLBb6QItoG/svVYhG6+xrtvREGHlHYeZM0on16MQM/E=
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr7264529oih.162.1638496228531; 
 Thu, 02 Dec 2021 17:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-29-swboyd@chromium.org>
In-Reply-To: <20211202222732.2453851-29-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Dec 2021 02:50:16 +0100
Message-ID: <CACRpkdZs3cBT_SX3-qAUSmgCdFywJAxGDSCFjoG+FebEojYL6Q@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 28/34] power: supply: ab8500: Migrate to
 aggregate driver
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
Cc: Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Dec 2, 2021 at 11:27 PM Stephen Boyd <swboyd@chromium.org> wrote:

> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to all
> the component devices that make up the aggregate device.
>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: <linux-pm@vger.kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Pulled in that patches and tested. Works!
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
