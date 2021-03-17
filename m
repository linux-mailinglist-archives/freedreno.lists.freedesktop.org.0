Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9833F9FD
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 21:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907FA6E02B;
	Wed, 17 Mar 2021 20:32:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1456E03C
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 20:32:50 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so3074058oto.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 13:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHCnunVxEHDcq+HTDx4ulePq7olKHfoa4KrEracuGEE=;
 b=F3jWDKeZzOEZZV+TtU/QAqYOuYjLzlwHXLJOUphmL/VTnC00lws/xyjCQFL1MFzEIq
 cOmU8WIgXcWr8H47lTCo4CJ6guTqcA2xR8IVXUiA4RT0KOFJNwKrTI7IziG13bdXuDmh
 1mV45jQA3sCOkiQ18AaiLVLPMdYLhTJRLR/3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHCnunVxEHDcq+HTDx4ulePq7olKHfoa4KrEracuGEE=;
 b=DrTaO8B3Ow3ba3s12Pr0cakMGmF3SxWkT877Pjy5LpFZAL5sEW6DXfEuv8i8CHmC1I
 bUs9iDtvPzsxpmzsyiPMuUmsQhnyT4Da3rhntwV0sSrcMpOxlezKqZqdrlfvN2030BJ4
 ZE5w/+O+V5J4MBXdl8wOg31qr1XQojmY8px6dqVD4yBiqPEskfC9srjMULjZeyvHHzwH
 l2Hc5CYnl5r9CLhWp+xuzxWkbySh0VydheSN1qRxTbcTu5LIXzcq1B9VX/mndOmK2+Xq
 kSXkSqc3f0YZqI98hHqpc6h4K0j2LC0HTOlKz33rLQfjuQo+LuCfvjxtzz36uzgbComt
 9pMw==
X-Gm-Message-State: AOAM533A12ZqLkazxopCRNb5c2Aq7hoiWsnvFSv5MiFPzBPpfpyHWMtX
 GsnKhuY6e1jsOODDo87+/eJFJP2JxVkWwmtlOL3AIQ==
X-Google-Smtp-Source: ABdhPJwpaKtWZD5ndm43ILhNLn5AjG91euFm+8cd3zhFc4Jg9VKRXCNzX5CQhv6Shjqegj6++qTq+qWnq/5dHW2jDuI=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr4590503otl.303.1616013169521; 
 Wed, 17 Mar 2021 13:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com> <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local> <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell>
In-Reply-To: <20210317081729.GH701493@dell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 17 Mar 2021 21:32:38 +0100
Message-ID: <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jeremy Kolb <jkolb@brandeis.edu>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 11 Mar 2021, Lee Jones wrote:
>
> > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> >
> > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > >
> > > > > The vmwgfx ones look all good to me, so for
> > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > That said, they were already signed off by Zack, so not sure what
> > > > > happened here.
> > > >
> > > > Yes, they were accepted at one point, then dropped without a reason.
> > > >
> > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > a previous one.
> > >
> > > They should show up in linux-next again. We merge patches for next merge
> > > window even during the current merge window, but need to make sure they
> > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > show up, and then get pulled again.
> > >
> > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > confusion here. But your patches should all be in linux-next again (they
> > > are queued up for 5.13 in drm-misc-next, I checked that).
> > >
> > > Sorry for the confusion here.
> >
> > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> >
> > Thanks for the explanation Daniel
>
> After rebasing today, all of my GPU patches have remained.  Would
> someone be kind enough to check that everything is still in order
> please?

It's still broken somehow. I've kiced Maxime and Maarten again,
they're also on this thread.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
