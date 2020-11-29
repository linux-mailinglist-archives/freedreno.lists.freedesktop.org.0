Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57E2C7AC6
	for <lists+freedreno@lfdr.de>; Sun, 29 Nov 2020 19:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DDC6E235;
	Sun, 29 Nov 2020 18:49:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4906E233;
 Sun, 29 Nov 2020 18:49:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 64so12234072wra.11;
 Sun, 29 Nov 2020 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=petcPUQfIRyJlrRZlAI0FgPTCAYAYb5D8vFYqV6fJS4=;
 b=ogjbEGaQGYFsXqlHh1P0WS0AU3ixlshfX58TVjLOx0LamwLoTVbtshlHNVbw88PewR
 0bo1cboPkh3dSl/fn9jmjTBz9LaQZjdaLHTb6cbkok4u8mhDRZil1RA9YnYq6fKGwLct
 fxy4OvmBZy/29dG2X2I8qT9qkAc+6B3rH6Gp4VhpWp5I72tTTPzcYjOfijM6ELMrHfV3
 sNPsjpFXVy/0FhUk4/iM4KGBQtbZcZq2KRcUWto/4ie4pvK9rcNCTi0TZ6wzq560OBcC
 ZBoc4nwXDh0jwmb/p/4n02rg0zg1YWwGU89FysHb08J1c9fYoan9VxoXZ29uTeU6927P
 HLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=petcPUQfIRyJlrRZlAI0FgPTCAYAYb5D8vFYqV6fJS4=;
 b=Hpg8/U6BGmZgjeFFaYCvsWgYxEe2ABvoc3PkJkmIBIr1xwRXJERnC7If/+aDzckMFj
 Fm6s2jniH66Xg5H9Zj/sBa5Gw2q3Z3rcBQ20UEHy7nSsduKAwCD6Leqvj+pzewFyzI5Q
 Laskp1yb2awI54XNwaA8csuZN372mdsUe5EzURwFHCJdtCha7O03FPq85jjgORNUdg7V
 TPWYb0f9ZElMYVmCSfOThAKvnaMSw9Qkt4HPfuZu/Az/kHhVDR4qvWe7F0YTBlk0Hl87
 BX7lhK0Dv2+/Yd8i3lwS7gKCXGN5f9Ks+C9/T4RflkRr1tV7XQ93UyUbxhl0OIcNBQvx
 wMVw==
X-Gm-Message-State: AOAM533Fm6ABFFUsjiVZQEqgocOUR/d27eR8Bn1c3F3+UgW6mztmTAmA
 wsmweyAUkK0ks4QO2egdOZqtnmx3jBeYbypSsCc=
X-Google-Smtp-Source: ABdhPJyOuT2gj5FAziXhvGtFCoN+ognobWPebwBRdsxnGLhMrvC+hM/WQ/37Typ/Qi4TI7PztNcR+hFxisQrw0A8pJI=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr24450474wrb.28.1606675757086; 
 Sun, 29 Nov 2020 10:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
 <20201116173346.GA24173@lst.de>
 <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
 <b798d954-d0b5-d968-f03c-b3fe9ffd08fc@marek.ca>
In-Reply-To: <b798d954-d0b5-d968-f03c-b3fe9ffd08fc@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 29 Nov 2020 10:51:08 -0800
Message-ID: <CAF6AEGs488Ju2jg6TpkkiH-7fBK8f-HgQ210jmGf-Oghb-Jv2g@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [RESEND PATCH v2 4/5] drm/msm: add
 DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
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
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 9:55 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 11/16/20 12:50 PM, Rob Clark wrote:
> > On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
> >>
> >> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
> >>> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
> >>> dma_sync_single_for_cpu() does deal in some way with the partial cache line
> >>> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
> >>
> >> No, it doesn't.  You need to ensure ownership is managed at
> >> dma_get_cache_alignment() granularity.
> >
> > my guess is nonCoherentAtomSize=1 only works in the case of cache
> > coherent buffers
> >
>
> nonCoherentAtomSize doesn't apply to coherent memory (as the name
> implies), I guess qcom's driver is just wrong about having
> nonCoherentAtomSize=1.
>
> Jordan just mentioned there is at least one conformance test for this, I
> wonder if it just doesn't test it well enough, or just doesn't test the
> non-coherent memory type?

I was *assuming* (but could be wrong) that Jordan was referring to an
opencl cts test?

At any rate, it is sounding like you should add a
`MSM_PARAM_CACHE_ALIGNMENT` type of param that returns
dma_get_cache_alignment(), and then properly implement offset/end

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
