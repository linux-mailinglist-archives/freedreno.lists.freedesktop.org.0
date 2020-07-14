Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7D21F9A5
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 20:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA45F89AC0;
	Tue, 14 Jul 2020 18:41:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624A89AC0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 18:41:58 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a21so3617574ejj.10
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
 b=VejG7ns58/o56wE4RNCvWeVgjvU+LlSoJSfL5d4/jVqlOeuw9g5CUYQ50YHQsdFubO
 Ha/tpOyW5b8T/y1/g5j25Dy7Stl9LZry22xtj/m8/nOqMpc/fCk+1qjE7uVogVEwusDR
 MdrLTadVg8Tfor2CQMkYUPeF6CotVCOZnYDiYMxzpT5+FiGYsggCeOtJWuy50S8NnYeA
 RfW/LG7XaOHQ6LRT9d3xfBPJ70NeCSRtCGUFyCRQ9exbhAh59Bl0S0Hb7uNNsmQ8hc2i
 nO9UZMEvYBuewr/CkpT34nSSSPnXFAlfdo1tQfc/nxdNZYwWTNErlafBOzZK4GRqr5ub
 BHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
 b=t/WbuPj5yCSZ+2h8zpsqMw//irMGxFNBy7kB5VMsO94a2n+hdX0ofEEv0J56imvN/I
 04Loh0JW/SwRw7QRUY/QndAX3a1PrGgS7c/emE8iBODN0/9tJIdPIfI5QjEom15zUJZD
 BhYZseaiR96fktOxqoffCWwDZD8me7TiaoY9OMrruvCWkxCpLelHXW5UkFVPZAoyiNFP
 7rvn8l7IybuwlEfyUTyHMlmRZ/b8kKfpZnK5Vkb+6FQzLSUFdZkZpAMXV1M/oUISH82b
 NNjMGywp+XYLo/AkJ1hxKElmLf4RHaZDqXqvBBWN9owr/8X+S0OXhFmPx6Jva2qbcpnk
 Ltjg==
X-Gm-Message-State: AOAM533ZYce7DQFwb3v1cyBaS/xtJss/Fu6fuSclP1lGCq76FVsbQDjS
 0n5q7Y169vyhCHIMLkXP9JIgFEcx2rkJyCgxnTktbzNk
X-Google-Smtp-Source: ABdhPJx7APKDvb5pLdspcKbtqQHuogOBvlhkuNQrvEweAhJTwvPQg/Zo30df4jeOKEXwcHuWI25swo7X80ueqGE9D3w=
X-Received: by 2002:a17:906:4d4c:: with SMTP id
 b12mr5749555ejv.506.1594752117201; 
 Tue, 14 Jul 2020 11:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
 <20200714171036.GS3191083@google.com>
In-Reply-To: <20200714171036.GS3191083@google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Jul 2020 11:42:28 -0700
Message-ID: <CAF6AEGsvbnWiFXQUFR+k-CLJ2CsCEoiVVE8pGVq0X0=VHE3hHA@mail.gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix gpu failure after
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Jonathan <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 10:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, take a refcount on the GX PD on behalf of
> > GMU before we initialize it. This makes sure that nobody can collapse the
> > GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> > during GPU wake up during system resume.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>
> I went through a few dozen suspend/resume cycles on SC7180 and didn't run
> into the kernel panic that typically occurs after a few iterations without
> this patch.
>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> On which tree is this patch based on? I had to apply it manually because
> 'git am' is unhappy when I try to apply it:
>
>   error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
>   error: could not build fake ancestor
>
> Both upstream and drm-msm are in my remotes and synced, so I suspect it's
> some private tree. Please make sure to base patches on the corresponding
> maintainer tree or upstream, whichs makes life easier for maintainers,
> testers and reviewers.

I've run into the same issue frequently :-(

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
