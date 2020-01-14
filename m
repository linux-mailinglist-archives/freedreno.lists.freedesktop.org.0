Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CF13B00A
	for <lists+freedreno@lfdr.de>; Tue, 14 Jan 2020 17:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C306E421;
	Tue, 14 Jan 2020 16:52:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E46E428
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2020 16:52:55 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b10so14546659iof.11
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2020 08:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tvuqfPAmqeW5h6hFaCyRKpXD9b4Gjd3nwj+gcAvShZ0=;
 b=PE93tZWV+hg39DY1pUEJSq12EHHeocyMtfjbCr6ey/aNdjanGCOl24Wd3BFEcmEQet
 x8iyqIov7uNNXR1EI8XKsIR6DC8z8BpZIf2f4x55M6W21g94/Hmp1Hogt7ZOK3GXDqHv
 09vied9075nNzXfQBJu47599bfeJMHVmsOLbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tvuqfPAmqeW5h6hFaCyRKpXD9b4Gjd3nwj+gcAvShZ0=;
 b=hMCAM7TjniPhZYJVKl7bG1RxxsY9ooUND0EDY+bC9BG9w7cd3CGyfYbGgZkSNNk+Xj
 BUncp32Ejdyk5CVmhEFuEN0MpKBvlC8vEs1UlBuPmgtAuuosU0W9urb8GKaN+CRTJBsI
 KJf+BbL1o96dkPD4ZyYV1IxeGsV34I8ZVIo3pSmcJjAyYAS4POPGXK68vSbpJuHE+mNq
 YJWYlCYTXa1wZRn8Y1xvO/goM/c1Gp46JPb3T699iMw7+os4Z6Bpv0BZndZb1kr+cCCc
 Pa6ZSRwGNh0l/dGoSrI27Mkys9RsjjOAWl9abxTheo8TvRtnGpL0uQaTIpJz2WE4TIeR
 UUrw==
X-Gm-Message-State: APjAAAUW1oY59lN2PDBop5VY1/uD1Dkus5HsgaFgr3GUP1cKV35PWB33
 aAoWb6xKt5kRi4EuQDan9IDvsOSw7Z0rwGG1e87prw==
X-Google-Smtp-Source: APXvYqxxSfCxs2zloh33teGyEGvf4zfmbUq0cbRO0d/xAKS5BgM2oPkXId2AZGiWDUDB+p8gcRw82UZWfTwiar2I8kc=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr18407733ioc.204.1579020774522; 
 Tue, 14 Jan 2020 08:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 14 Jan 2020 08:52:43 -0800
Message-ID: <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
To: Brian Ho <brian@brkho.com>, freedreno <freedreno@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kristian Kristensen <hoegsberg@chromium.org>,
 Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > +
> > +     vaddr = base_vaddr + args->offset;
> > +
> > +     /* Assumes WC mapping */
> > +     ret = wait_event_interruptible_timeout(
> > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
>
> I feel like a barrier might be needed before checking *vaddr just in case you
> get the interrupt and wake up the queue before the write posts from the
> hardware.
>

if the gpu is doing posted (or cached) writes, I don't think there is
even a CPU side barrier primitive that could wait for that?  I think
we rely on the GPU not interrupting the CPU until the write is posted

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
