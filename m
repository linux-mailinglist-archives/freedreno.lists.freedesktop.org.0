Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17A38B806
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 22:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9198E89885;
	Thu, 20 May 2021 20:03:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223E89274
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 20:03:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a4so18902902wrr.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FU0d7+kSraKdngkIyPIt5NSqznuzgSQmwjTFbIqh82I=;
 b=d3Hei2jwKc/C87+dDBawCoVOIy25i8qyEpyU173i9Pjbt5Y20BvdCZ8F2ElivH/0zu
 9AEo0+/d2oCPHGEXgs0wUj5fskkaNcF3sxm1lGfOnuv9EtgCvT7UuYR3GC3CDFtxqT1G
 yp94Q2YMApSmYgq4UPNNxJ7so1vlyBp14sZfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FU0d7+kSraKdngkIyPIt5NSqznuzgSQmwjTFbIqh82I=;
 b=S8qz/3/WSz3zrQiKA678u++H/NBW7BxWNMTRdQBrjMKlpROKEoKWB0UPOFPFXgjoIo
 aObpnG5zB0Xp1FCBDCcSx8kq8MSB7f43hu0OTl1s3iQFZ3qTHxFjvmhhXP3HCeO3UMcD
 cXG0PhxTRUCkUNsrnvNxA9T2OgMOcQWmy50lOlX+u6A7VeIWfYPKVKloIGswBoha4I/R
 svQlXS0Au8Dhgraj5tC2LdaCuzXZJpaqtY0vLcU7PxhhImqEk2QzRLjpLrqdtKWlKPtC
 cGWrm1s1JtJkV9+o77Z1DkkHGq8ZztVqg17w4CbDyyEkmFGpWMhv28m2h6ojsVCU3W+3
 mzDQ==
X-Gm-Message-State: AOAM5336T9j5qZLSXXXeBXbplZt1vi2J42cahS2ZFt4OmN3LFEIJqgkg
 yb1LOjCVJSwk/R4hKPqfMVikXg==
X-Google-Smtp-Source: ABdhPJz9rVlxy/Vj9yTBij7i/ZlVLzwSpGkTG/jrgEO2Fbi8ijXxMCLylcVrmu8o6ORVeKgxAsWApg==
X-Received: by 2002:adf:f751:: with SMTP id z17mr5877306wrp.150.1621540996980; 
 Thu, 20 May 2021 13:03:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c15sm4269990wro.21.2021.05.20.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 13:03:16 -0700 (PDT)
Date: Thu, 20 May 2021 22:03:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YKbAgipp/rmSjOXn@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
 <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 09:41:27PM -0400, Stephen Boyd wrote:
> Quoting Saravana Kannan (2021-05-19 18:27:50)
> > On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > This series is from discussion we had on reordering the device lists for
> > > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > > the aggregate device onto and then we probe the device once all the
> > > components are probed and call component_add(). The probe/remove hooks
> > > are where the bind/unbind calls go, and then a shutdown hook is added
> > > that can be used to shutdown the drm display pipeline at the right time.
> > >
> > > This works for me on my sc7180 board, but I'm currently struggling with
> > > the last patch where we migrate the msm driver. It runs into a runtime
> > > PM problem where the parent device isn't runtime PM enabled yet. I'm
> > > still trying to figure out a clean solution there. Moving runtime PM
> > > around breaks boot and I think that's because the power domain is off.
> > >
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > > Cc: Saravana Kannan <saravanak@google.com>
> > >
> > > [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
> > >
> >
> > I skimmed through the series and in general the idea is good, but I'm
> > not sure why each component user needs to be converted/"modern" before
> > it can make use of the benefits of this series. Why not just have
> > wrapper functions around the component ops that the new aggregate bus
> > driver can just call? That'll give all the existing component users
> > the new ability to use the new ops without having to have two
> > versions.
> 
> The existing users can only have one or the other. Either use the ops
> structure or use the struct aggregate_driver. What benefits of this
> series are they not gaining?
> 
> > That'll also allow us to do other improvements (I have some
> > in mind) that'll apply to all the component users instead of only the
> > converted ones.
> 
> What do you have in mind? I didn't want to convert drivers over to the
> new way of doing things without making them consciously change their
> code. Otherwise I worry it will break things in random, subtle ways. The
> last patch, as I mentioned above in the cover, causes warnings because
> the display driver is enabling runtime PM in an odd spot as part of the
> bind callback of the aggregate/master. That should move out of there and
> into the msm_pdev driver that registers the aggregate from what I can
> tell.

Hm yeah that's annoying. Another thing to check is that there's no locking
issues with lockdep enabled. But there's plenty of other places that
register/bind drivers within other drivers, so it should all work.

I think this is a good reason why more drivers should be converted (in
separate patches) so that we get a lot more testing and can find bugs in
the design.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
