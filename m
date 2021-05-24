Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD2E38E0C1
	for <lists+freedreno@lfdr.de>; Mon, 24 May 2021 08:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E456E0F0;
	Mon, 24 May 2021 06:01:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87E26E0F5
 for <freedreno@lists.freedesktop.org>; Mon, 24 May 2021 06:01:18 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso24238847ote.1
 for <freedreno@lists.freedesktop.org>; Sun, 23 May 2021 23:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
 b=kVwYjulbTpXvf8F/AH3Cn0+PqDxe6AsTYtT1ijwLpjc9Obx9CbTmoSemY8OjUw5tYq
 rghjvabI9aDAfy2KPMPOW60+THjy42P4Hk8yAjtHoNQ/Gt4be51wkQTQyQj5PlXT9Z8Q
 euKF6L1zMRk4m61B6LOZ8/zAZNWibeDQj15O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
 b=myAhx03tYv4/3KlxItkdjRJkUz7j/C3V+XgXfUyV5J9srZmlumCbReX36dhGyS6i5T
 hMWlTYq+bmmOO9Q+4Eghvp3cApTwvM7m0sbnUvJGxgCrzHle3apw7O6NjGR3GVUdaEqU
 JS+5c+KtkbxD4thnac/Czrp7Z3SBKV7I6Q2kzxoc5piEq0/9disbwQuVx6sPNCIFmSn3
 A9C2+moSNxJI5iBjStsD+7pLidddvNpQN8+gZtmQFVENGkLtPn1AgZT5TIJ+UnnOZrly
 2h6nbkS3RwNAcDGxWX8Y+y80+K7XprwzV4TLtMQxGaXcysRYKKnt8ia/UTLhttfFOaSI
 3c6g==
X-Gm-Message-State: AOAM532SHcs4Q0N4MPtumQWys8wvJPBvORCcUYQVgJ1z7a8I3cg9ruEO
 ieVCfJRqygm04onsAGP3W5YSNMGlRGY8O/gU5parFg==
X-Google-Smtp-Source: ABdhPJxUXFeT7fRAQnyP76eyIBN6bZDnvKj0MzPI3ELpSWl7G60SJAr6Ae5/UXm1yxBeM2GrXn7ehxeepjeJze0/e+U=
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr17357557otp.34.1621836078248; 
 Sun, 23 May 2021 23:01:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 23:01:17 -0700
MIME-Version: 1.0
In-Reply-To: <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <20210520002519.3538432-4-swboyd@chromium.org>
 <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sun, 23 May 2021 23:01:17 -0700
Message-ID: <CAE-0n518E_Yfy7-Au-pO40SQzZAn6NLr8u1pGyPMWWr0wRgpJA@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [Freedreno] [PATCH 3/7] component: Introduce struct
 aggregate_device
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

Quoting Saravana Kannan (2021-05-20 13:20:45)
> On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > -       master->parent = parent;
> > -       master->ops = ops;
> > -       master->match = match;
> > +       id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> > +       if (id < 0) {
> > +               kfree(adev);
> > +               return id;
> > +       }
> > +
> > +       adev->id = id;
> > +       adev->parent = parent;
> > +       adev->dev.parent = parent;
>
> Don't set adev->dev.parent. You are creating a functional 1-1
> dependency where none exists. The real dependencies are the 1-many
> dependencies between the aggregate and the components. Use device
> links to capture that and enforce proper suspend/resume and runtime PM
> ordering.
>

Ah ok. Yeah it seems like that was the thing causing me runtime PM
problems. I've removed the parent patch from this series now and I'll
look at working in the device links now.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
