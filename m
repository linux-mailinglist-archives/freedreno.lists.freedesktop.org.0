Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C73406AF
	for <lists+freedreno@lfdr.de>; Thu, 18 Mar 2021 14:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A586E904;
	Thu, 18 Mar 2021 13:18:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087846E905
 for <freedreno@lists.freedesktop.org>; Thu, 18 Mar 2021 13:18:37 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so5142512ote.6
 for <freedreno@lists.freedesktop.org>; Thu, 18 Mar 2021 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0u3U62VgqQ/5cx0dl1OlmbnmTob1+65hnEnMoAP8+g=;
 b=Wq2xIKdqjdfzxw2Myb5taaYoDXG0Mt5eTvw70t+Qfukgix/l82cWO0JuAAM9pp9Lr8
 iuztkE2RYqfAeHvp28wsWDJ+QoGaPWC+Rv09fwMM2iRu/K2UOyFvuXajEDVEVPCoATb4
 oF5XWjbtWmNZTiF6bVmPZ4xhDEvuykvOW88w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0u3U62VgqQ/5cx0dl1OlmbnmTob1+65hnEnMoAP8+g=;
 b=n+KlDEK8hTchsYn9C2K+ThGNFOpqqgwN6si/TaHX/6e0H2mhVKvWwkLFWH4hM5pEd8
 xKsO9Ue9u+7V6qIaW8/lNJGhc504rvHAlVZrLZtUOkSd1NheokOY3uHEP1wp9p6asg+G
 ORs7aI+zpzP9ZHu1v19iBp6pLQnzBjyh23i2eDHaxKfVWsBMxmoZBZ67EsIsLQ4lfbif
 7iOz3ygGlEZlnwZwOtWv2E/R4oOX7JvHqOaK6LD7YHXVZCKno9DuuiX1zAAz8alXEe1/
 sjxugQqR6CgmRevu+Na27Ov1gkiDdu68E+Zsx2HBG+DxYLNxd+tbtlkKgD9/s3EdMmrD
 s4ZA==
X-Gm-Message-State: AOAM533SHb0zQ4ohcuylWFadTm0m/HqxnNVQh01lAqik/raFr5uy86lF
 8Y1hWSqzAiZzG3T2064F4hXe5IpmhJXDWbTgolcWEA==
X-Google-Smtp-Source: ABdhPJys7CWu1QW7sqaGp8DPpYtt4z4UFBXzAiTSc52E6cJ3FtAgdwRl3llcaxjGyQonUci42YLrVhEplIIDHitKc+k=
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr7303358otl.188.1616073516410; 
 Thu, 18 Mar 2021 06:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com> <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local> <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
In-Reply-To: <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 18 Mar 2021 14:18:25 +0100
Message-ID: <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
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

On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 11 Mar 2021, Lee Jones wrote:
> >
> > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > >
> > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > >
> > > > > > The vmwgfx ones look all good to me, so for
> > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > happened here.
> > > > >
> > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > >
> > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > a previous one.
> > > >
> > > > They should show up in linux-next again. We merge patches for next merge
> > > > window even during the current merge window, but need to make sure they
> > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > show up, and then get pulled again.
> > > >
> > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > confusion here. But your patches should all be in linux-next again (they
> > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > >
> > > > Sorry for the confusion here.
> > >
> > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > >
> > > Thanks for the explanation Daniel
> >
> > After rebasing today, all of my GPU patches have remained.  Would
> > someone be kind enough to check that everything is still in order
> > please?
>
> It's still broken somehow. I've kiced Maxime and Maarten again,
> they're also on this thread.

You're patches have made it into drm-next meanwhile, so they should
show up in linux-next through that tree at least. Except if that one
also has some trouble.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
