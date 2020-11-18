Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF02B75DD
	for <lists+freedreno@lfdr.de>; Wed, 18 Nov 2020 06:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2F76E2E6;
	Wed, 18 Nov 2020 05:28:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31B06E2D8
 for <freedreno@lists.freedesktop.org>; Wed, 18 Nov 2020 05:28:32 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 35so356033ple.12
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 21:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
 b=HVHOpkt/qqNt9sE6chv3U7ohVXbszeie0CQi5JUw5PUCYb4Q8G/UdR3X+kkmQ45kKt
 Em/Cnv12xCd9dU5raew3gzyMlRZ1vSpv2v5EJ2ubv3k25i7cQWfuyJojAKDsfus2pQAw
 L07ZygsSRdwZthKV63A0oOgdzRd7y6vebdXXytZPb+YoVKKa/BR8DxngpQTYRcrGLqcm
 6e31dz04CuMnlD9QbqCaMqbWP3aACS5ya1bCz7VeFlQWY/w2/qJXSGX8O7PywPyTB63R
 iM/93VxE9HYXfTZvbaB+w4XthiYuzpDSk/lxJhpdZ/hCCVoxlEYIGf7DocxfiyqduRJI
 PDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
 b=CAZRaz0hIFTd+k9It9sOWkx1qhrpOHxpwN9VokT69WUFnJ8OMILdA6G/fYyW0Q7TmY
 s2t2r02C4fjpZl6F0TYj+ZbQWoV7uVdryVHMFRGoD+yin30Gq/nOlBtixE3Icm6LkV1q
 vangD0GOPi6Lx0a/d6PBGpYr2KIgEsV+3HMLodv24ityanXATNstrp3/lSDnxueVcxya
 4kml9BzxWvWI+iHLES7x6eDpQLgyv2jI8B/Wf1OYrY9zOZ4bi9wzQN/pqvjUe9QplvBO
 ECHYWAv2KgVt92hLB2wgR1tVvF5ciTlpi2afc10Zjo1rVUTSp/OX9jW5wnBIGBj02Xso
 4Dqw==
X-Gm-Message-State: AOAM5326K8Luem5ddD5igZSgwQOpI4jiCj77gQR+4byroDbjlUaM2ju8
 f7OZvXAmqx2irsc1s9Gk1ZIKtQ==
X-Google-Smtp-Source: ABdhPJwE3hBbeNtRV7Zgs+1PM2OnxpXYUaUyaPcW0+rjSjJgGdij1UAnuyebd9b/G+OtrU4TJCHdpA==
X-Received: by 2002:a17:902:8d82:b029:d8:c5e8:9785 with SMTP id
 v2-20020a1709028d82b02900d8c5e89785mr2704949plo.5.1605677312497; 
 Tue, 17 Nov 2020 21:28:32 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id w127sm23328945pfc.172.2020.11.17.21.28.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 21:28:31 -0800 (PST)
Date: Wed, 18 Nov 2020 10:58:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
References: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
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

On 17-11-20, 09:02, Rob Clark wrote:
> With that on top of the previous patch,

Don't you still have this ? Which fixed the lockdep in the remove path.

https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/

To make it clear you need these patches to fix the OPP stuff:

//From 5.10-rc3 (the one from the above link).
commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")

//Below two from linux-next
commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")

This matches the diff I gave you earlier.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
