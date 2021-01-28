Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19058307E9B
	for <lists+freedreno@lfdr.de>; Thu, 28 Jan 2021 20:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF726E9CF;
	Thu, 28 Jan 2021 19:17:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4E26E8C3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jan 2021 19:17:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id w1so9410007ejf.11
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jan 2021 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vBlLsqLNkUpR+0kFKtDaYzD8qh6gqBF4/l+RbWGbI1g=;
 b=rMpUjADQ8XyHks7VPikWy0z20Wn35ZyhvSp7sB0PtetVbCKw+y0DBhWyM8iMdLFjzi
 2/ZCQppwfhCNhkMBAw7504NQg91ydUdX3yxfegSISvFPTQmSfTN3pc/PqkB+cvcE7+lg
 mzmZNlLsh8oh4K2HGEPwDCP+NYGbrW0kIwnFLT0Yr80xz/QvS7nLTt81bjaIssaE5NuN
 x6kMvnIq8EY2HqvUg86PdXGXWOnflPfbOzYkD9vuEXbU5tdRw5sqBfM0XE2Zs7U41yiw
 P1fJJKGvb6gN8/HzmAPCoRyX0gwSCIUqGnchnXlFBrSrXvkHaQTrMYqqSiSZE4WHZ01Z
 EZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vBlLsqLNkUpR+0kFKtDaYzD8qh6gqBF4/l+RbWGbI1g=;
 b=OKxMPlG+UJSyoIhj9xG1/1w2JFdNjgJFgMfj+ekqtvy/NvGl0+hScK8azEsGRJ//I/
 7E7I0pU4pftFuiJzXQ+4wRWStzvmcn0FFUYhNAJpypJv/JlKZ/XCNFOZzGfUB0nyTfeW
 pv+xGPIrz43gsnvO7/u1dOebnzt0Sf6u2oaB79Bs7aOhQZQGlyXdzqTVO/YvU3acGz7t
 xzUWysJcRKAqdE9VtwjmjZUa/tjpmJfRpi3PO+KeoI/K3T9aqfpAlbOqJzdxaFsl2Rvn
 CvE8IEr1hlQtuZrW0UJF7Fc6bVVsQ2VeHsO9YlWue3PoACl9LHQ0ypJmjQC7P+fZRvAN
 6x7A==
X-Gm-Message-State: AOAM530IvQN6xRqQzTLxh5t2dX/vhTZPO//RFtKqkRKf3n+ItnLEhpll
 Qy2BG3jJPnbNoKYeQThLuXUPGGCrCQqYXR3tBMu7kg==
X-Google-Smtp-Source: ABdhPJylhLH79XRqp3ubuYFwgvceaUjciBEqidoB3QEfdehv8e73FrLQPduYYbkQSR/8XQg8gdwQWoFiQVTseSaaSDE=
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr874420ejs.465.1611861447457; 
 Thu, 28 Jan 2021 11:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20210127233946.1286386-1-eric@anholt.net>
 <20210128184702.GB29306@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210128184702.GB29306@jcrouse1-lnx.qualcomm.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 28 Jan 2021 11:17:16 -0800
Message-ID: <CADaigPVF=Ti4tLYTUsK+0Gi6GbK9ADOuFf4tCYftmVZ96gJLxg@mail.gmail.com>
To: Eric Anholt <eric@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm: Fix race of GPU init vs
 timestamp power management.
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

On Thu, Jan 28, 2021 at 10:52 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, Jan 27, 2021 at 03:39:44PM -0800, Eric Anholt wrote:
> > We were using the same force-poweron bit in the two codepaths, so they
> > could race to have one of them lose GPU power early.
> >
> > Signed-off-by: Eric Anholt <eric@anholt.net>
> > Cc: stable@vger.kernel.org # v5.9
>
> You can add:
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
>
> Because that was my ugly.
>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

I only pointed it at 5.9 because it looked like it would probably
conflict against older branches.  I can add the fixes tag if you'd
like, though.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
