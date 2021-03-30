Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231834EBE1
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 17:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFFD6E917;
	Tue, 30 Mar 2021 15:15:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6A56E917
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 15:15:05 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id j7so12132360qtx.5
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJ+YJYx4OZR4pIjZNdx26kpeAL+vxeQN6P+Ncit8r0s=;
 b=GbCYv1WSjk/ew5BC7x/ek5Wk2nKYhMN1fPHHdbT0dXhA8sLDDAsvmkroYbEa1UY8pV
 t325S1USzc4yVtmH5R+gvgAKF4w2om2JhomKV4Iaf538mB2Gfj/Jm/mw8aG8EVfwF/SD
 ZZthbDH/iclBvd6Stp0tcsKmZ3GOpPd77CGCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJ+YJYx4OZR4pIjZNdx26kpeAL+vxeQN6P+Ncit8r0s=;
 b=oUe+TnzrvgissHoqxeScCq7J03Y2aPFucJAKwRrhDtQbdMu3mI0b2poxfMlXs4sH6h
 rMhY4AZ0irORIY9Yb1p0wguj2SIylZfoHxFSDEZT0pR56BOF8Iwh9zwAnChKJjK708CB
 2XC6fnoKu7x1uHob0WAR536/FWBPl+MRrfQEXEZjNlvmdCapLpIPuzy8dAYEaoKJSsGB
 C9L4xbZ/eBYdOuva47BfZvhuAk0oOfJFBoeKvl1SpeZJ10F3kNe6AiBsXLyaAbXKlWg6
 YtgQGO128BrR3KRFrwbe32UBcD3cFx6azh5jBIPJvIbXc6FSL2b0/SRXhENp172/u6gp
 lvQQ==
X-Gm-Message-State: AOAM532d17zmVu/0a91QGGZJR0dmFkrzNVkRabIEAktcfAivW0ZkAouN
 lcCzP5ilUJit61RasB5Xf4D1Y3Ad53vVOQ==
X-Google-Smtp-Source: ABdhPJw5AdufkypxPLRUDb6EZ3OC/d+1yaO6qPIk7ywDi1WL0JJTMAjfCysiiBzHT6pKda2f/uji7g==
X-Received: by 2002:ac8:7dc2:: with SMTP id c2mr27809341qte.341.1617117304056; 
 Tue, 30 Mar 2021 08:15:04 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id 18sm16689044qkr.90.2021.03.30.08.15.03
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:15:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id m132so17815199ybf.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 08:15:03 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id
 n140mr36653500yba.276.1617117302924; 
 Tue, 30 Mar 2021 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210330013408.2532048-1-john.stultz@linaro.org>
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Mar 2021 08:14:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbwNmmeoZOSso3Kz1mP40ONo0hDvn6KP8zZsdg9uPcNg@mail.gmail.com>
Message-ID: <CAD=FV=XbwNmmeoZOSso3Kz1mP40ONo0hDvn6KP8zZsdg9uPcNg@mail.gmail.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix removal of valid error case
 when checking speed_bin
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Eric Anholt <eric@anholt.net>, Rob Clark <robdclark@gmail.com>,
 YongQin Liu <yongqin.liu@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 29, 2021 at 6:34 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
>
> That change resulted in the db845c board display to fail to
> start, with the following error:
>
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
>
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: YongQin Liu <yongqin.liu@linaro.org>
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
