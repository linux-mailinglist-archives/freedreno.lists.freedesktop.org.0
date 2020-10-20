Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBB293A31
	for <lists+freedreno@lfdr.de>; Tue, 20 Oct 2020 13:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051266EC4E;
	Tue, 20 Oct 2020 11:42:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8D6EC4F
 for <freedreno@lists.freedesktop.org>; Tue, 20 Oct 2020 11:42:45 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id f2so376514ooj.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Oct 2020 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+o8387W9/ZCn4LvR5U6YDN3Hh+8V5WW6tTBimBSuj0=;
 b=H4if/7cPRAnox8YksApTgg0t73vJQHSJOOVU5OQ9YHMpaBkWSqFKfMKJIuEozOz6Iw
 EA784/M765Tisiz8tfO+LZAFAgoIf/Qj060xxXjk1c7gM+UjG2ajoZ9BOsz3gtn/dm+f
 F9tIxwT4zJSGligcusWCJUFCe68BT/mXcn8Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+o8387W9/ZCn4LvR5U6YDN3Hh+8V5WW6tTBimBSuj0=;
 b=IgFO6O8x9moW27HBy9mpoXqiHvEXj3zPALRw69hmOMG2qXR5676JTjXRkwQnwYISp2
 T2HRGRp4u08HEzt57PvtQHKL3JQW/L7Ku+SaXXYtQXdg/rk/newjmI91KRSDqL+tDI4s
 Ogs9Bv3y4YDgpVKvPKwK3UP/qeXbwCGj/4ds/3D4VpTDHTmTZr2REBbxywP4CorZIjD/
 IrLmTZ/oKwgPS2ymijeGIpDSmSjDAb2V2X71y4wl1zXwNYHAYpbsMr+ox/g6PwBfhgZv
 MnOIqVjJORhi7BZxD82PxmTaXe969VydChQZbC9K8GrWixz3JkwtuqE6qov/CyFDR4uX
 1MLQ==
X-Gm-Message-State: AOAM531A+3hlaQoewsvrkW18NjKXVfnJ7QYNAUOiRmsSttXUjCMS63I6
 1M3ng3rkbGaG6NEQ7rQjketZ1mtIjsZTElOsVrmfQQ==
X-Google-Smtp-Source: ABdhPJz5jqm21tJbsKMZknC7WQ/UHndcHNg9KDxpoJgyyMcRMTewgrvULjlJHVJu7koXNwvWpY6/fG5Eck9+CfXJUFA=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr1486690ooo.28.1603194164455;
 Tue, 20 Oct 2020 04:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
In-Reply-To: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Oct 2020 13:42:33 +0200
Message-ID: <CAKMK7uHYBCoBvTGyMHGMrt2YRrB7RFt+maWNRjApgz621hu8JA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 07/22] drm/msm: Do rpm get sooner in the
 submit path
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 1:24 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-10-20, 12:56, Daniel Vetter wrote:
> > Yeah that's bad practice. Generally you shouldn't need to hold locks
> > in setup/teardown code, since there's no other thread which can
> > possible hold a reference to anything your touching anymore. Ofc
> > excluding quickly grabbing/dropping a lock to insert/remove objects
> > into lists and stuff.
> >
> > The other reason is that especially with anything related to sysfs or
> > debugfs, the locking dependencies you're pulling in are enormous: vfs
> > locks pull in mm locks (due to mmap) and at that point there's pretty
> > much nothing left you're allowed to hold while acquiring such a lock.
> > For simple drivers this is no issue, but for fancy drivers (like gpu
> > drivers) which need to interact with core mm) this means your
> > subsystem is a major pain to use.
> >
> > Usually the correct fix is to only hold your subsystem locks in
> > setup/teardown when absolutely required, and fix any data
> > inconsistency issues by reordering your setup/teardown code: When you
> > register as the last step and unregister as the first step, there's no
> > need for any additional locking. And hence no need to call debugfs
> > functions while holding your subsystem locks.
> >
> > The catch phrase I use for this is "don't solve object lifetime issues
> > with locking". Instead use refcounting and careful ordering in
> > setup/teardown code.
>
> This is exactly what I have done in the OPP core, the locks were taken
> only when really necessary, though as we have seen now I have missed
> that at a single place and that should be fixed as well. Will do that,
> thanks.

Excellent. If the fix is small enough can you push it into 5.10? That
way drm/msm doesn't have to carry the temporary solution for 5.11 (the
issue only pops up with the locking rework, which teaches lockdep a
few more things about what's going on as a side effect).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
