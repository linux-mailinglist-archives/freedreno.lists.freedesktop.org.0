Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72522452F
	for <lists+freedreno@lfdr.de>; Fri, 17 Jul 2020 22:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192F86E2F9;
	Fri, 17 Jul 2020 20:29:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A086E24B
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 20:29:32 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id q85so2393058vke.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
 b=QOcdUWmVYO1ruHidjb3BSZV+nTbElxTyRNbKn8qrlYGKW/hsoUgNhdQV35VwVKTeCK
 cLuBXa3aF18NO7qBg+2XtVH09Gnp+OP/6/WjY2PVwrY0zQuGLT6HFiEd6w2HW4jkN+kO
 uAGvcAq319nP7pcGzfoiqyaBryN0jxK7I9qTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
 b=lk6mCz2MyBkYTZ0Sf2MU8qP2PjUBAMIlmTxDuBMH5yTIiXWQV1B/2RswiMDzqPfFVB
 I7bTBWI7ipd3GtIf38o5C3b6W+Ryyd02+JgCmaqvmsOrbfN/ihjcfKwizWGNJoBSkrFG
 OoLr33sy/nXYBvBFaMAa9R0x63qpdHQxks8tHB+8ECvHVf0NtllUxjarGxpeLpAlpEBL
 IW7duT7L5cZdgEtwTydbVzupwvoLQXqzO+CscH/bCkofvbXbp8a9pTm+401dVnVs/bYp
 ojpAe5w1VQm1cF9uADHOOKhlRqWLRRqBQzAg7rKIrA2VS6kY7ln31xu/nhQCOndVkdlB
 dV+A==
X-Gm-Message-State: AOAM532KKWxS+xQCws5MI7MzVCvPVeO4+kkaquJ7esQzuZ1zXW9kEjmY
 G1mgZWTLxvM3TMmDKRYFXyWSAwbHDJE=
X-Google-Smtp-Source: ABdhPJwvBgm8FRJthrXucH5I0Ze8m68IT5p0txMd6P4q/lS5sAzD8Br6Krp8N3Mb35DiPHcQZG7yzg==
X-Received: by 2002:a1f:9dc7:: with SMTP id g190mr8748282vke.81.1595017771273; 
 Fri, 17 Jul 2020 13:29:31 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id v10sm1379155vkv.41.2020.07.17.13.29.30
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id g4so3258025uaq.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr8909789uan.121.1595017769995; 
 Fri, 17 Jul 2020 13:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
 <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
 <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
In-Reply-To: <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 13:29:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm: msm: a6xx: fix gpu failure after
 system resume
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,


On Fri, Jul 17, 2020 at 1:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jul 17, 2020 at 10:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > > > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > > > during its initialization. So, move the refcount-get on GX PD before we
> > > > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > > > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > > > during GPU wake up during a system resume.
> > >
> > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> > >
> > > The Signed-off-by needs to be at the end but I think Rob can do that for you.
> >
> > It does?  I've always been told that this is supposed to be roughly a
> > log of what happens.  In that sense you added your SoB before the
> > review/test happened so it should come before.  I know some
> > maintainers seem to do things differently but that seems to be the
> > most common.  In that sense, I think the order that Akhil has is
> > correct.  ...but, obviously, it's up to the maintainer.  ;-)
>
> yeah, I chronological order was my understanding too.. but presumably
> the Reported-by happened before the Signed-of-by (which is how I
> reordered things when applying the patch)

Doh!  Yeah, I somehow read that as Reviewed-by.  Thanks!  :-)

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
