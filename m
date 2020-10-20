Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF28293A01
	for <lists+freedreno@lfdr.de>; Tue, 20 Oct 2020 13:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3466E091;
	Tue, 20 Oct 2020 11:24:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419FD6E091
 for <freedreno@lists.freedesktop.org>; Tue, 20 Oct 2020 11:24:17 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id r10so871923plx.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Oct 2020 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
 b=lmdA0vZcj+gZ1N8Z10STVszxUkjLEFOgixTZSc1eGkqCzwK1uhJ84SarFjT733XzT1
 lRIYiuu6c2to5PmKYINoXAr3CZgaHbvvrViof7FKOZVXy16u4Op+zo0G8PQqXnAolNnQ
 Ez4ynljhCkVMP6Z9EgoZ13aV5pDmU8pPr28YUsh8PJDrrPb8sFHBtNuhCUW1Nt+vpTZg
 Avw7ELL7Mo6Nfrp0aTI1LXdUgnv1+p3hRndqOaYdnZ8MDh6xsDiorg6hokf1rGCM4cJh
 bQjjzse/pqj5beP5D0fgow0PbmGCnAekWihGbD/fXvXyjig6FI7LSnOR1SKmYp5b9UMc
 IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
 b=J/RhyxzEbz6Q6Mlgvj5PUrFmfOpKUkQNaqMEB0fls/kasTFrly0nhZ8pMGsv8PMKF7
 7A4O2vRXW3howNn3dGyhmw4CujzaSUQLGFUJEIIuNDcwq86f76n4GJd0EHbNzAlnBj3N
 GZdF+Q8tIogPmb1s1cuyyWpPD4KeCzF4N6p53O3uLcbdeBS2Um/JkAPOi6xlbgcf2Zft
 OmNkKLIuLSHo4+xZxhKox19GaM2NWfq1IcbBR9wqmkSOb7CmgAuJgAc5AMxOFHUrZxvn
 FMLkFSdboBOBx6yybCQ9VA1O9kKroQrJ/pWHp0amHsvrR9K9asZZOvTA7+XEkm6qrRpe
 jHtA==
X-Gm-Message-State: AOAM530I3pMxGFRm7jUO0LSaW20kkDRP9NA4PMs+ZUnMA9UUti3r2A/W
 2ju2a2Hblmhh5BdhWMIeYOzFnQ==
X-Google-Smtp-Source: ABdhPJxiKN8vYDR35svXlvXCDZWliSZkknnCW89y9BP+j1N1wNwI4v+gtfsW8+8fhi+ND0fGzlcE+A==
X-Received: by 2002:a17:902:ee8b:b029:d3:f156:eefc with SMTP id
 a11-20020a170902ee8bb02900d3f156eefcmr703577pld.19.1603193056837; 
 Tue, 20 Oct 2020 04:24:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id y4sm1714126pjc.53.2020.10.20.04.24.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 04:24:15 -0700 (PDT)
Date: Tue, 20 Oct 2020 16:54:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20-10-20, 12:56, Daniel Vetter wrote:
> Yeah that's bad practice. Generally you shouldn't need to hold locks
> in setup/teardown code, since there's no other thread which can
> possible hold a reference to anything your touching anymore. Ofc
> excluding quickly grabbing/dropping a lock to insert/remove objects
> into lists and stuff.
> 
> The other reason is that especially with anything related to sysfs or
> debugfs, the locking dependencies you're pulling in are enormous: vfs
> locks pull in mm locks (due to mmap) and at that point there's pretty
> much nothing left you're allowed to hold while acquiring such a lock.
> For simple drivers this is no issue, but for fancy drivers (like gpu
> drivers) which need to interact with core mm) this means your
> subsystem is a major pain to use.
> 
> Usually the correct fix is to only hold your subsystem locks in
> setup/teardown when absolutely required, and fix any data
> inconsistency issues by reordering your setup/teardown code: When you
> register as the last step and unregister as the first step, there's no
> need for any additional locking. And hence no need to call debugfs
> functions while holding your subsystem locks.
> 
> The catch phrase I use for this is "don't solve object lifetime issues
> with locking". Instead use refcounting and careful ordering in
> setup/teardown code.

This is exactly what I have done in the OPP core, the locks were taken
only when really necessary, though as we have seen now I have missed
that at a single place and that should be fixed as well. Will do that,
thanks.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
