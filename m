Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF022A2C6
	for <lists+freedreno@lfdr.de>; Thu, 23 Jul 2020 01:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026B96E214;
	Wed, 22 Jul 2020 23:01:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B706E214
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jul 2020 23:01:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c25so3041715otf.7
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jul 2020 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
 b=LDgxRU0PPlOqe+jIyOjiUKQdehMfoZWAjfvZ25p0KPl8vFDDdOtUj3vbuWcx1d2HiM
 bsCRH9MS1l8LDU98iOSE7GPEolaslu2fkxDb1T3PBTgCR24VzMdTGS6k/iPRG3QEztNe
 Em9GsZq+bVr765qjSjudsYKVBDe/BWvUycBl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
 b=UZlNAx5tepBZWdolLRy438d3LVPJvMO7NO3uOjBsQnt2zH6/evKjYl8Y9PVhf4X7nN
 NhYKcRfZX4ojcVBQ1rX5npcJmiUz9/1etB7UKJLo7PrXUvosLZ428fdu4GoLu5IPiJDE
 mNwkzxvfK3OjC69jpL2ld29POCnzIUfkeip0P1YgN8npEmzLAeFnRtwf8sStd4EwclQ9
 K7Obj5aP8hsKa3HExXvJRpkiFD/2cpJkZByhJy4okkVgiNZHHEzl4v3/83kUOiZk6tvP
 mZN70I2Shujp/ajdKm0vc/cMadCKCI5prTaTbyV0hT0YlCKuZWCbzgMSCG6iJN/rQs+S
 enDQ==
X-Gm-Message-State: AOAM532Wj8gqbLWnzX5jDAGLuhoIRK+SvTFppe67riykLQS9tZcys1PB
 rRLLwyz8dKCivSQS6HFtYK0LzQr6soC8EQidSK4E9Q==
X-Google-Smtp-Source: ABdhPJzMRGNhyEWDrKRLOE3infJnLErmNB6h5FHJQExFCTQdMa95a4Z/n+l6f4RR6YJ3xa3qMPCPWE5qcULyrQPYc4Y=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr2018905oti.281.1595458897417;
 Wed, 22 Jul 2020 16:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
In-Reply-To: <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 23 Jul 2020 01:01:25 +0200
Message-ID: <CAKMK7uF=vhzZSKuy6XV=R7roabxMt104Vg_w8axNmLi4EE6+0g@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v5 0/6] Add support for GPU DDR BW scaling
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, Viresh Kumar <viresh.kumar@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 5:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 21-07-20, 07:28, Rob Clark wrote:
> > > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > > tree and merge it via msm-next -> drm-next -> linus
> >
> > I wanted to send it via my tree, but its okay. Pick this patch from
> > linux-next and add my Ack, I will drop it after that.
> >
> > a8351c12c6c7 OPP: Add and export helper to set bandwidth
>
> Thanks, I'll do that
>
> >
> > > Otherwise I can send a second later pull req that adds the final patch
> > > after has rebased to 5.9-rc1 (by which point the opp next tree will
> > > have presumably been merged
> >
> > The PM stuff gets pushed fairly early and so I was asking you to
> > rebase just on my tree, so you could have sent the pull request right
> > after the PM tree landed there instead of waiting for rc1.
>
> I guess I should have explained that my tree gets pulled first into
> drm-next, which then gets pulled by Linus.

Yeah either topic tree or acks for merging in the other branch. No
rebasing in the middle of the merge window, that's rather uncool.
-Daniel

>
> BR,
> -R
>
> > But its fine now.
> >
> > --
> > viresh
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
