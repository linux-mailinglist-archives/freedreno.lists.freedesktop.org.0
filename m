Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57087389AE6
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 03:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244B6E5C5;
	Thu, 20 May 2021 01:28:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3886E5C5
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 01:28:27 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 191so14688482ybn.7
 for <freedreno@lists.freedesktop.org>; Wed, 19 May 2021 18:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LB+WBLKimq1VDsyQzzExbfrKHHTlBWjpszXjX8F1DeM=;
 b=MBDuHlJZI0Ib7Z6cFeiDt2vylSAMGrX+0yTM34V1TH+QSTXBxb/5XSWIxCDUB9lU6b
 BaEKzmET9CmlJu+hrVhZ+AUOcVni5/l4lfzEGclWYGY+V+8YMouqPGIyyDCjHCPASFtL
 zvCmSEpl3soEV+jKcvJcAqFR1NuRMtksFv1W02mHIgI7GuyWYBqA5/Ww7nW3KC6fRI8Q
 LafRfnY0PzMb5sdvIql/2E9coHuwTKJt2Vb44BOUzaOITFcLqLp7a+ugT7merMMksUaF
 DlBBTRH+602uP46bG1X1Hxsh1Owd7RYsOQ6T0eSaJRafQk9uwUpyHnvE26NeRwwiolBk
 7mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LB+WBLKimq1VDsyQzzExbfrKHHTlBWjpszXjX8F1DeM=;
 b=G71LhrM1Pndwnlwbp6G+Hy3OBXyWQuJ4LtTqfrVAI2lt2Fb3iDk4SUsbT4uXOuxoR5
 Q1WMfxad39OCgVfMvz9xXJ7NvAr+zlJKmZUQliQ/iElfwg/rSvoAySGS9jN/NRzovTRI
 UiLciIRhdXORR3tzdekzjJJVXbfmmlMF2I5nZ5jpiWudwAK4rZA/g5dcpm74q6MdpRvc
 BrTeEPoJhhWmBEccdkT0KT0JJRPExvaZyIBWtV1IGEAS9SGM9GZpw5KJmDrA2cQB5Yde
 pwN6+nLhBT94KRfee64JGd0IS9+HvehXwEeI7A04uGOSywe4uADEm5ep6Fq67vTW2Yg0
 y6iQ==
X-Gm-Message-State: AOAM531aAEjQ+ZrN57S9+o9m9Harru8YFl82PVD22qBeJmM3YmxIhXVY
 UWWQvTK947uKMzxzDg86fWIqzQgLFVi1BTGWwDrkrQ==
X-Google-Smtp-Source: ABdhPJwxpTpNXprxmoUNYJsGpxKte2oQd/4/taQ4JqcpXcoJ4h5SlYFKD0njXw5lTpWTElhjSVKgdZQrWjoxzRoStJY=
X-Received: by 2002:a25:2fca:: with SMTP id v193mr3641856ybv.412.1621474106099; 
 Wed, 19 May 2021 18:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210520002519.3538432-1-swboyd@chromium.org>
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 19 May 2021 18:27:50 -0700
Message-ID: <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH 0/7] component: Make into an aggregate bus
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This series is from discussion we had on reordering the device lists for
> drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> the aggregate device onto and then we probe the device once all the
> components are probed and call component_add(). The probe/remove hooks
> are where the bind/unbind calls go, and then a shutdown hook is added
> that can be used to shutdown the drm display pipeline at the right time.
>
> This works for me on my sc7180 board, but I'm currently struggling with
> the last patch where we migrate the msm driver. It runs into a runtime
> PM problem where the parent device isn't runtime PM enabled yet. I'm
> still trying to figure out a clean solution there. Moving runtime PM
> around breaks boot and I think that's because the power domain is off.
>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
>
> [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
>

I skimmed through the series and in general the idea is good, but I'm
not sure why each component user needs to be converted/"modern" before
it can make use of the benefits of this series. Why not just have
wrapper functions around the component ops that the new aggregate bus
driver can just call? That'll give all the existing component users
the new ability to use the new ops without having to have two
versions. That'll also allow us to do other improvements (I have some
in mind) that'll apply to all the component users instead of only the
converted ones.

-Saravana
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
