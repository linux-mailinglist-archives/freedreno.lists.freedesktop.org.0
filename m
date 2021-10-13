Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E142CA67
	for <lists+freedreno@lfdr.de>; Wed, 13 Oct 2021 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217C66EA2C;
	Wed, 13 Oct 2021 19:49:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16B6E0A6
 for <freedreno@lists.freedesktop.org>; Wed, 13 Oct 2021 19:49:18 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v77so1022909oie.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
 b=GtN6f8PMidexfjnF/349pYjiZmXuf6rowzWXAw7EvtyJS68wcCRNFBO0ttVehwhlVh
 il/ckZ8S2Ye4H4vbo6TOFCgaFJAN1lTCglERo0fqfglSlD0AWLI9QAJRQMmSWnVyFHpO
 D4kmC6mAwQRLnVM1DUj8rY42VzjXPBOdS3izs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
 b=YRisrD24rk9V+CWmugLd/bK7YuYkfAMGvKkeFgqwmaf/OUHYbbS2tQ5zZFXg85fXex
 a219Q2hov/+qZj/Jy0DgEXa2A/8SoqODihfx9bobgtS80T9p9O2eo4EuAFhTE2UkqhIx
 qF74oPzvNrK6p+y8ocQsLQE89qBfpJnbRQwC/g9EIaYTATcCC3TuZI/IrewyPkncGi5W
 gwyAfUCVLnF1n3vqiF+TOZrsSY8d4BYGi/a96d6k5X2kknuFIfgRk0neDHE8rpJ+TNB8
 3ImLRUnPVwDuOYh66Rb5tawT21ZymkZc/GntfD2RtqW89yc6Lj0kObt5/sdiG2dq+Tdb
 rEzA==
X-Gm-Message-State: AOAM530F3L4phOGnSlBa5oAGhn19KSkTcdH0ptI2ViM/RTIC2W0vwowg
 rYKQ9/UXwof8cEumzC1ImF0ls6l3D0I1gEIaIIvCvw==
X-Google-Smtp-Source: ABdhPJxX7OwXr/yMPANG+HHhHuaY5istIek0XSOY4+ZivdVb8quhuZc49QWi/nEmYjVgcpXIEGjwzniAFVFFCF4sz7c=
X-Received: by 2002:aca:3306:: with SMTP id z6mr9586177oiz.164.1634154558286; 
 Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Oct 2021 14:49:17 -0500
MIME-Version: 1.0
In-Reply-To: <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-2-swboyd@chromium.org>
 <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 13 Oct 2021 14:49:17 -0500
Message-ID: <CAE-0n51FFUCb8C55bHSM0Fz16U65CvjGzVVe9CToqnFNZ6-bSQ@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 01/34] component: Introduce struct
 aggregate_device
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-10-13 05:22:23)
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
> >
> > The diff is large but that's because this is mostly a rename, where
> > sometimes 'master' is replaced with 'adev' and other times it is
> > replaced with 'parent' to indicate that the struct device that was being
> > used is actually the parent of the aggregate device and driver.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> This adds device model stuff, please cc Greg KH and ask him to review
> this. Maybe also an ack from Rafael would be good whether this makes
> sense.

I will explicitly Cc Greg on these component.c patches.

>
> Once we have that I think we can then go&collect acks/review for all the
> driver changes and get this sorted. Thanks a lot for pushing this forward.

I'll resend the series today. This one has some compilation problems
that I've fixed now.
