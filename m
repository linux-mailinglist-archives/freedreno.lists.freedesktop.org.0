Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4F3373FB
	for <lists+freedreno@lfdr.de>; Thu, 11 Mar 2021 14:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E56EC7E;
	Thu, 11 Mar 2021 13:31:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05426EC7C
 for <freedreno@lists.freedesktop.org>; Thu, 11 Mar 2021 13:31:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f12so1875291wrx.8
 for <freedreno@lists.freedesktop.org>; Thu, 11 Mar 2021 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=CIIAC/BD4HiWZJv5qwhQ9qfLc69qrTy9QBuntzXqyQsbcdQGtlF0Uxjcy0ZFTg+b8P
 sfXuhYSDbtS+1H84ubJowHGoova+nTvdE4WmseXf7gU0a1+St18coJMHpU4NlUAqNlBn
 G6gVDx+Mqi73FbYtvA+zLBz4Tt2LtFMujxiCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KQEkpGkH8X9iAKDULksHIIQVGmHhnGVSrqpZ40dKqws=;
 b=APdKp/i2759iZfYCWTlqpGu6iQSLaBODJEtbraBJUUKVm8fVmIOziA7qsEvpd+VvzQ
 qFjRMJA664nbqYdpD2aQXSbDAyyFaPReLw6MDCoz9FIr88HDoPwEQdaUrN7bDcVlkaqd
 WN2zxGcJI/aH1/TqTrRqv0oj5K9fvEtcAoh3femEmLwAekdFaV+Puulen4M6e44cQ3Nj
 BdxkapNJTk36B7J0pXSqmGmkhbmolCLz8JlgbFnsSBOWi3fL1Gg8vSXdGaM3k55Q4/j4
 t716U9R4J7Ap/xXsA1Qg4eTehcLRHtKOg92ZYwT4i9EessSfJHKh/9XjIZK7d4o1F/c6
 hMOw==
X-Gm-Message-State: AOAM530GNSUBavuoSUmEA7FKBPXX/xwl0/g671vpYoXrptqkMO3rQOYD
 vBGEAZblNHAHWh565EZuc4xCg8PnQt5ZSvkZ
X-Google-Smtp-Source: ABdhPJxEmOy2Yvf9KHNGocEPM7wKMMIxgjmjn3qYWtNne7YIpJNNmJ0zRgu4I8/UJrCDTEqBBwHj5w==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr8924011wrv.348.1615469516566; 
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm3590049wml.42.2021.03.11.05.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:31:56 -0800 (PST)
Date: Thu, 11 Mar 2021 14:31:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308091932.GB4931@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> 
> > The vmwgfx ones look all good to me, so for
> > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > That said, they were already signed off by Zack, so not sure what
> > happened here.
> 
> Yes, they were accepted at one point, then dropped without a reason.
> 
> Since I rebased onto the latest -next, I had to pluck them back out of
> a previous one.

They should show up in linux-next again. We merge patches for next merge
window even during the current merge window, but need to make sure they
don't pollute linux-next. Occasionally the cut off is wrong so patches
show up, and then get pulled again.

Unfortunately especially the 5.12 merge cycle was very wobbly due to some
confusion here. But your patches should all be in linux-next again (they
are queued up for 5.13 in drm-misc-next, I checked that).

Sorry for the confusion here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
