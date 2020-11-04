Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EA2A6F44
	for <lists+freedreno@lfdr.de>; Wed,  4 Nov 2020 21:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B636E4EA;
	Wed,  4 Nov 2020 20:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C96E4EA
 for <freedreno@lists.freedesktop.org>; Wed,  4 Nov 2020 20:56:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d142so3692882wmd.4
 for <freedreno@lists.freedesktop.org>; Wed, 04 Nov 2020 12:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
 b=SJZCCPmggjEI3WSwrNv12XAc3V0t974Tjot8SwxaA5JGO+QOStpAbOhFhtiOnvu3+b
 yDmvlIEjwUlHMqAk6tS7kx2Qn/mqVpTUdCuw5s3eGDyx7Vb24Qw2cFAfifbhXvThB0ZM
 BkWEexz8mfawPufJKrMmmu/9sSa/MRKxNzi89UxCf4muNRFC4TCnUGWO8tNRMdmsC8pg
 or8u3PCTPuOksBmF7KDKEUr48DlKDlLhC7Lh8g1wgErBO7P+nwB9Du48eX7kwvB8Xfmo
 vuVoztUap4U9Xp6HUDM0NntBsB2YTmI3MTxTeP6eeIIi68YzsWMwgNkaDJQqVN1B9jl2
 cznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
 b=ZOf9t1G0UYj+N5f9x4qlWReNW4jGuwpivXy8l3aosdmu8vzQ/fIzn/LA/r2VuVZHjV
 8goqbWftikue1WAQdZVrz+9euPoUTTWFNOJhLzU/fIIOVAdcrfaSdAAdWPWNil6iAmz1
 5jCpV0pzdpZ3wpRd9xRHkmV/amtYd6eR4KdUkBE7rKB0Nk96pZuTslHJKAB4ukofNY0p
 dqUekoDBT1VfU9Eui7IpETcYC5ng4VkSLSFOnYZPoJ2AlkIieih3AHcjghYZyv3bbKMH
 4NzCamvUhkCvuDyu9gG26/VM0ioMz5pgleEiV3bWP2jNx8osjmaEfEAg6nqRdMeyyN8p
 Dp9A==
X-Gm-Message-State: AOAM532kjjXpzXbyAtx6iP6M79Hlpzl9xyA3udgKio6OcawrPqsD2sW3
 391gcnswn5uFnjd+nf4kgIwiMOhlmuRAcbJuMxY=
X-Google-Smtp-Source: ABdhPJwZj9HwapeVTBuX6MbvmCI10ccxfb2V7iPfEujOr2zcUHGnUhcVOI4/pc/YpbPMBdEWvizQ7MVVagmsgcK7PJE=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2246798wmi.164.1604523387717; 
 Wed, 04 Nov 2020 12:56:27 -0800 (PST)
MIME-Version: 1.0
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
 <20201104200300.GA4036650@bogus>
In-Reply-To: <20201104200300.GA4036650@bogus>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Nov 2020 12:58:02 -0800
Message-ID: <CAF6AEGvj34MbnRS+A432AhOwMuL2BtTXJ+AD+zQ9w0_meV_-gw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [Freedreno] [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add
 cooling device support
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
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 12:03 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> > Add cooling device support to gpu. A cooling device is bound to a
> > thermal zone to allow thermal mitigation.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>


Thanks Rob

I've copied over your ack from the previous version.. but yes, it
definitely makes my life easier when patch senders do this for me ;-)

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
