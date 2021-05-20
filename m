Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391038B7A1
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 21:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B596F51B;
	Thu, 20 May 2021 19:31:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6D6F51D
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 19:30:46 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id n4so5885839ybf.5
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ar6byVVqK1lRvgLic9qsfKVrGRqd/nf6HO0KI5j0j7Y=;
 b=unZRQZQT4/xG3FpO3Qvabhk7GtClO/EQX8NrK+CX8mvFkiQa5TBKByzoSB9YvynKp3
 wA78WE5VlE1cFOyQDnI/mFxF/4vPge3E5maZKQwrxGPJ77DLmQPTTfnFSDYgz9h/dGk7
 9NGIJS0g0ARLDQIZw5T9Koi3k3mI8lRs9mg9FFhdCibrO5tH9jW6eMYopX9ZtNQjBNee
 IbUNtzyGCGGCoEWI3pfbj2D6gjdROJ2rsWg2Pn01Ty6hESjZajhVy7i7UBQIWPm/rJFA
 rVxU6dq0z0t+76SD7PsWv3X+0Q3J3SISwxcHy6bB9vMsPkhRDJ77JUbuTSD3BctDTtiG
 xb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ar6byVVqK1lRvgLic9qsfKVrGRqd/nf6HO0KI5j0j7Y=;
 b=T33WIrCpAmvUmvVz2nI3FPpqPLEbB+sMt3E78P3QMx7hvAHmskOaqyoUuwgB6cqSXV
 orp5/HrOIJ8Mfekz0yIXJq3u0V/V06LkMpC2WO/NFKyyi2QsAvAi+mbjyxG4T9d+Rb9s
 PMDlnG19dXwYSdJ0/7ndECHVRrG0V1wo5pSj1nM+vSYvmlLEdjHdNQXiWooUuXaqtqfG
 gUrj//oLFMAPofPb3O0akVz9yjqmAZ6uAdHQTvJr4P7HavhkAzQl+B6VgLOsJCNySZ3W
 VxLT7fGQCHJ+jRUab45UPdTYbGM7yvh0P3vccYkqb15mBq0kGddgTF3RZl6YSa4tkxzR
 EaUQ==
X-Gm-Message-State: AOAM533wpgAQyDFXP87xNn2R3EvOKeYM8Y1UPYqQuqX+ZHfzrDeWtizN
 xRjp18AgTdF39/wXbaVCcQCl3DqAB/sqZVBiGdcbMg==
X-Google-Smtp-Source: ABdhPJxpYOKGwUniY64mHhJrUUD46UWR7FL11JhqYySHKRMSD1AvlOq8F1sramRfgpdMzWznP9AXEMMiLxmDs65ILyA=
X-Received: by 2002:a25:2fca:: with SMTP id v193mr9594447ybv.412.1621539045424; 
 Thu, 20 May 2021 12:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
 <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
In-Reply-To: <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 20 May 2021 12:30:09 -0700
Message-ID: <CAGETcx-mRrqC_sGiBk+wx8RtwjJjXf0KJo+ejU6SweEBiATaLw@mail.gmail.com>
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

On Wed, May 19, 2021 at 6:41 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
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

As I mentioned earlier, if we add device links between the aggregate
device (consumer) and all the component devices (suppliers), it'll
take care of a lot of the ordering issues (probe, suspend, runtime PM)
and dependency issues (unbind the master device if a component driver
unbinds). It'll allow us to delete a lot of the code in the component
framework too. I can send the patch for the device links once your
series settles. So having two implementations comes in the way of a
clean up and code improvement because we'll have to keep a lot of the
component code for the purpose of the "legacy" ops.

> > That'll also allow us to do other improvements (I have some
> > in mind) that'll apply to all the component users instead of only the
> > converted ones.
>
> What do you have in mind? I didn't want to convert drivers over to the
> new way of doing things without making them consciously change their
> code.

What ordering/behavior would you be changing with the new ops? If the
new shutdown ops isn't used, it really shouldn't change anything. Put
another way, if we ignore your msm driver changes, we should be able
to switch to having a real device for the "master" without making any
functional change. If you are causing any functional change with the
new ops, maybe you can key it off a flag that needs to be set? That
way, we'll have one API/ops but still be backward compatible if you
are worried about breaking existing users?

> Otherwise I worry it will break things in random, subtle ways. The
> last patch, as I mentioned above in the cover, causes warnings because
> the display driver is enabling runtime PM in an odd spot as part of the
> bind callback of the aggregate/master. That should move out of there and
> into the msm_pdev driver that registers the aggregate from what I can
> tell.

Can you give more context? I think if you create device links with
RPM_ACTIVE and PM_RUNTIME flags, it should ensure runtime PM
correctness.

-Saravana
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
