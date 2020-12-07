Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B42D0A99
	for <lists+freedreno@lfdr.de>; Mon,  7 Dec 2020 07:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3801C89F01;
	Mon,  7 Dec 2020 06:17:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41F289FC3
 for <freedreno@lists.freedesktop.org>; Mon,  7 Dec 2020 06:16:58 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c12so1680600pfo.10
 for <freedreno@lists.freedesktop.org>; Sun, 06 Dec 2020 22:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UEC9Ey1YiH340yAKzQI3EtE+5vtsPcOD/FPejTWMx7w=;
 b=o2XJfSqzzn/rOiBwbGH3UlxuQOAZHr1UBqmeed/0e1fhHWgdPw6g+ghmTazVGrsStv
 xkevCH2AQ7+K/XZLzzcsjSvlO0O7DLennpdrtQrst0GNuG2SDEQzN8OagNsOcQ2iHC7V
 mJcdwfJfIDeOfJ21ncaNFhmUpNXUGGJvMjH00MOIjG1GofWmdRrnx3Q5MwsmYJ7/iY9V
 t7gJLYvSQdLwijIivyfKz2E+YVr2QP0DavK6leUlPvH5LydY+s2kK9SNDVC14Sx4+jja
 gJgaYojnzfDgCp9o7J8KP+Ip67NP1k/O7pj+e1AtktY7/ujymtidRkxNl2Y0sVymBZM/
 qMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UEC9Ey1YiH340yAKzQI3EtE+5vtsPcOD/FPejTWMx7w=;
 b=TzR/3E6yeoTSSwkf4GPasq1srrXJ97fk47omG4JVj42L0uF8UM+r6207y7Hinc8fmp
 Xg/gj9CiN7tpiM/MQrQ6xZAuU0cDxbdq70Q6NzcGwn/jvzL9btxPrATrS5c6Y7FZWXLe
 n6tf7LXqc117Gdqd8wPYFMBCT7IymFCE2BRjGyIrYaBbTXyiaCHPkX1GwSKwgVXAXraH
 eF+KCuR9aaEfb1x+0rNbMLRWD7NCm2jSc7RyJ5Wp9H6CUhHmdOeo3BPLzxvjkVXJQ5bY
 A0sqG9uBCb40uAf7hiRb9hK2nHAaIMhcMDxk/9R5/vwi9DpZWg3TE78W8cgCQJu+kxwR
 HMxw==
X-Gm-Message-State: AOAM5310PNcjD9hyhKaeRqTUAdIWYOPuLOiwHJZnDvCEyzOlAsIK5TXE
 PTONYiAdmN+UAwg24vZe9YYoYg==
X-Google-Smtp-Source: ABdhPJwdp0AMyfk/pmIqlkdR+aP4sWvB2SM7Y4KiUHk4mVRdafw8sT/5YRZ5fNVVa99pp8VKO1yWig==
X-Received: by 2002:a63:b910:: with SMTP id z16mr7549604pge.358.1607321818276; 
 Sun, 06 Dec 2020 22:16:58 -0800 (PST)
Received: from localhost ([122.172.136.109])
 by smtp.gmail.com with ESMTPSA id a12sm9089777pjm.44.2020.12.06.22.16.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 22:16:57 -0800 (PST)
Date: Mon, 7 Dec 2020 11:46:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201207061654.btlgobmsljdqbb2u@vireshk-i7>
References: <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
 <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
 <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119060528.qscedvc4jlmxakqo@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
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
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19-11-20, 11:35, Viresh Kumar wrote:
> On 18-11-20, 08:53, Rob Clark wrote:
> > On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 17-11-20, 09:02, Rob Clark wrote:
> > > > With that on top of the previous patch,
> > >
> > > Don't you still have this ? Which fixed the lockdep in the remove path.
> > >
> > > https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
> > >
> > > To make it clear you need these patches to fix the OPP stuff:
> > >
> > > //From 5.10-rc3 (the one from the above link).
> > > commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")
> 
> This fixes debugfs stuff while the OPP table is removed.
> 
> > > //Below two from linux-next
> > > commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> > > commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")
> 
> This fixes debugfs stuff while the OPP table is added.
> 
> > > This matches the diff I gave you earlier.
> > >
> > 
> > no, I did not have all three, only "opp: Allocate the OPP table
> > outside of opp_table_lock" plus the fixup.  But with all three:
> 
> And looking at the lockdep you gave now, it looks like we have a
> problem with OPP table's internal lock (opp_table->lock) as well apart
> from the global opp_table_lock.
> 
> I wish there was a way for me to reproduce the lockdep :(
> 
> I know this is exhausting for both of us and I really want to be over
> with it as soon as possible, this really should be the last patch
> here, please try this along with other two. This fixes the debugfs
> thing while the OPPs in the OPP table are removed (they are already
> added without a lock around debugfs stuff).
> 
> AFAIU, there is no further debugfs stuff that happens from within the
> locks and so this really should be the last patch unless I missed
> something.

Rob, were you able to test this patch ?

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
