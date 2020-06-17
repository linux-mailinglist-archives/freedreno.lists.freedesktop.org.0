Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E41FD624
	for <lists+freedreno@lfdr.de>; Wed, 17 Jun 2020 22:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24456E195;
	Wed, 17 Jun 2020 20:37:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7EF6E1B3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 20:37:19 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d7so2118153lfi.12
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 13:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KnLCZJwys+q4B3B05ok3TtEm9HWxcpRhuVgOFrlznhw=;
 b=NFZcC0HxLVeJtloucD6xkDEeP+TvW++GtU2PKmlM7Pm5PGuHk8vGkD4nuqJXeVe1kD
 QgPZd8MfuT69OaWTBim3SZi4PnPodruvNDFvFGkGgjPa3MHia3roD+LRImbpilOjbPGE
 ZzVtW9xZm5CbX8kX5zVUyYCKaCk9XCeyqW6hE//g8E6qJ09W4PLzfAY8BZNDX8d6qwIW
 1Qc4DTFOYCVWNqpinrn4k92Ax7orPareKeURiV+EcmQMCws9mV6qBAx/bdFaMw3AAaGn
 UqR2RZde2nOCN7LOw2hqRRTbNcQ4tJZcO8bFVaZ6LfEdkb1oam83UKvwzc2anAMDXPba
 ji+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnLCZJwys+q4B3B05ok3TtEm9HWxcpRhuVgOFrlznhw=;
 b=e7LRLaZp50emqwzrDWzbKWKffcgU3PxxCcM0bMEwRebbv2MZMfTINiDBb3B36R4gNF
 Cj9bqJvUJ6bM8SGPnJqa0QsaG2o9UuvH/biQe7IB0mmR7BzZ8lzQrHclDVdKL5IODJ/5
 dm/DAS7LGbaI8B/xMGFcLsMCGbMOXrZbw5AF5XG2biDig15MOit9JYRiFSTTa7JihOjA
 uxCF1k3WRHU5JHM6M0MXJGd758H3TQo2gXPIj99GLXcNmkygU0/OsYKnmEU5hapT0epV
 Bb5Rbk+QAkNvmtizKJXhvpFSf4k7ynFeuNukIRct3WdabDKtBc+diwRSjmt8XNmwjZSX
 U30w==
X-Gm-Message-State: AOAM531ROnxn57TcRKpFunNX9VE6aqUSxAUKgdl/toNCcs8xM2hEuFfL
 FZ3yNjR4YDLu/oRjMZpiKUHGhkmzVY+hdrONId1z9Q==
X-Google-Smtp-Source: ABdhPJy5tFufG+SBVUtax2Z87ERt62C9EUZ15mPz3fddCgc6sVOg4TRQp2GozJYEPiXj2lWl6HnY46NpoQCRpZl4fPs=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr402640lfa.60.1592426237348; 
 Wed, 17 Jun 2020 13:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200409233350.6343-1-jcrouse@codeaurora.org>
 <20200409233350.6343-5-jcrouse@codeaurora.org>
 <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
In-Reply-To: <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 17 Jun 2020 13:37:06 -0700
Message-ID: <CADaigPVvZrP_mOcB5f7w77t+4O1=Ya2VW8Ff96EzemO6swr_8Q@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v6 4/5] drm/msm: Refactor address space
 initialization
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, will@kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 iommu@lists.linux-foundation.org, tongtiangen <tongtiangen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Drew Davenport <ddavenport@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, freedreno@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 1:16 PM Eric Anholt <eric@anholt.net> wrote:
>
> On Thu, Apr 9, 2020 at 4:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Refactor how address space initialization works. Instead of having the
> > address space function create the MMU object (and thus require separate but
> > equal functions for gpummu and iommu) use a single function and pass the
> > MMU struct in. Make the generic code cleaner by using target specific
> > functions to create the address space so a2xx can do its own thing in its
> > own space.  For all the other targets use a generic helper to initialize
> > IOMMU but leave the door open for newer targets to use customization
> > if they need it.
>
> I'm seeing regressions in dEQP-VK.memory.allocation.random.* on cheza
> after this commit.   The symptom is that large allocations fail with
> -ENOSPC from MSM_GEM_INFO(IOVA).
>
> Possibly relevant change from having stuffed some debug info in:
>
> before:
> [    3.791436] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000000 + 0xfeffffff
> [    3.801672] platform 506a000.gmu: Adding to iommu group 6
> [    3.807359] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x0 + 0x7fffffff
> [    3.817140] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
> [    3.823212] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: vbif_nrt
> [    3.832429] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: regdma
> [    3.841478] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
> [    3.848193] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000 + 0xffffefff
>
> after:
>
> [    3.798707] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000000 + 0xfffffff
> [    3.808731] platform 506a000.gmu: Adding to iommu group 6
> [    3.814440] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x0 + 0x7fffffff
> [    3.820494] hub 2-1:1.0: USB hub found
> [    3.824108] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
> [    3.828554] hub 2-1:1.0: 4 ports detected
> [    3.833756] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: vbif_nrt
> [    3.847038] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: regdma
> [    3.856095] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
> [    3.862840] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000 + 0xfffffff
>
> 256MB for GMU address space?

Found the bug, fixes at the last 2 commits of
https://github.com/anholt/linux/tree/drm-msm-address-space

I'm going to try having another go at convincing gmail to let git
send-email through, but all the howtos in the world didn't work last
time (gsuite has different behavior from normal gmail).
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
