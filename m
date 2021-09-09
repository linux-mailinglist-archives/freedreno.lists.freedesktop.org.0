Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B302C405A1D
	for <lists+freedreno@lfdr.de>; Thu,  9 Sep 2021 17:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501D56E88C;
	Thu,  9 Sep 2021 15:21:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C376E88C;
 Thu,  9 Sep 2021 15:21:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n5so3083814wro.12;
 Thu, 09 Sep 2021 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvwve1JVv7qCtcua8E5GzDzzsYSmvS/kJBQKySmuWws=;
 b=NppwK7rUCgUe0chvs65SWbif95sBaqTzuKm3NJR4VG+y8fY2LrGNPEo2y49NP8WThD
 CeojhHJaiYraWKKswlUe03y65jSZEHcAQNSDM6RjaesHs0372O5jY/gZlkbuiIkK0fL+
 RyKuJ0X6YGfuOgsUJoPFIIhFHxAsL9sKRaKsMyIqI1rPqwQQbfcXcWdQyryC24VLBhEl
 KJXB5+F17qCWEqj8R4KeqXOQ1mxoXfPJHjRxAcjQlsTjrQtsPuipkVGdOhxYXQ3uRUQX
 2pi0OmeS7s+9AkEaH2/N0Fofq6bPldWph2yBE9Z8jnQBGWHPQkynwfi4Z4btMbdfhqxv
 1ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvwve1JVv7qCtcua8E5GzDzzsYSmvS/kJBQKySmuWws=;
 b=bQ95OQrSOPj40wC6YVIYdk3J/ilNo2Fj3Si7n2N1dFfoIRr5TGC9ukGCys9RK+AOz1
 TbxQe8Hp+eoI2a7gjwGwEtR/JH1QaRVpxnNmFrd2NZFnPV39aDlDuTSHU3GIP47L3HxW
 XkUqxviPdq7BkbdaV8hU/2U9NxNtDtRcG7VfN3y3NoRv3xFLerGJZCiHkcqhN1e1oDdF
 q5daBzJX4IgbFyRAIE+ZQA6JOzNEHC+Z6mfFKNcOF1ZlxB2S1r2OCxxs8SfrT38kKQO5
 O/QtJ/6bolDwl9P8824i60iIqTdn0v4lG6R/rdbk2F+suuhhjTUIuBMd7Abt303V9awC
 euow==
X-Gm-Message-State: AOAM531BhMw2T/5zh2vdnE1hppeb6LwkUcZ7Awdok77xzgSlxL267yhk
 7nE0bKbqlDtPyu+0Tn8IkL9CFgGYoPbQUCLd6Wc=
X-Google-Smtp-Source: ABdhPJztlwrv7ry+m1wiT/dRKecbPi6idR0Qddi85pJxJlf9bK8wOtbZGXS8VjHlLFucQa4yKPBfzIO2KHchZcutc24=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr4251841wrn.251.1631200865258; 
 Thu, 09 Sep 2021 08:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
 <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Sep 2021 08:25:32 -0700
Message-ID: <CAF6AEGv5gJrs8PX6tKg8uMxMmCTvVgTqSvqA0dWrFdm2nCwVRg@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH igt v3 0/3] Initial igt tests for drm/msm
 ioctls
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

On Wed, Sep 8, 2021 at 10:27 PM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Sep 08, 2021 at 11:02:42AM -0700, Rob Clark wrote:
> > On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> > > plenty more we can add, but need to start somewhere.
> > >
> > > Rob Clark (3):
> > >   drmtest: Add DRIVER_MSM support
> > >   msm: Add helper library
> > >   msm: Add submit ioctl tests
> >
> > If there are no more comments on this series, could somebody push it?
>
> Ah, I was expecting you to do it yourself. Merged now.
>

Thanks.. and actually now that I've checked, I realized I had
developer access to push.  Sorry, I didn't realize that before

BR,
-R
