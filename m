Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED42393905
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 01:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8A6E0F7;
	Thu, 27 May 2021 23:14:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581A6E2E6
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 23:14:31 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id ee9so1013932qvb.8
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
 b=ChVZOb7exsfcVgpIA48kpnMbJAqreH3Kr6NAAbL2WgkKUno/5lrDjOfss9Eox06/W7
 LM87HKJfFVcDtuZwpowGUsyjjZhnTpZEDp44jB8tdAJt25wDjckkAG8bZnG0fZs9HpaA
 BSTdfbWDFTdH+8lb8BDAXE8xF1696WkGaCu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
 b=F6wFpHVP4PMVNQP9Bdj7z/VSR0ZddfH1d+SwPj2O4oFNCQmbcN0kQpncvitmXuufWf
 M7b3DBRQ+oWtmVTWZzql37x4QSfR5SydMNpROQzNmvzR5Ff5Uow9NzaG/1J9g93CXR+g
 64Nysr5LomxpgADVXE8R5owy2eAMbORJPS6J98Y9Ma4eEP4gE9ZJDAWK/rZni3qC6byj
 X6EVne2OqscKo2X8zh/Im5fvWFjcp00gFv6pkGP1cNSpMlSlSDEFxfy6Y2gW6/yJEWXY
 rkVjMJBlPg0tq/R9DP4kqXpx8BDsY+IK+gJ2V9EjzX4PtjUZKlWfVphCgfPaoEW+LHW5
 FZ6Q==
X-Gm-Message-State: AOAM530B2iFVxxZd2l7bERtJUY580b71zNsW4wsq53Ra9wrkSICQjf/S
 DEyrmw1lgHhVsT+Y/xF1o2YADkKdBXo45w==
X-Google-Smtp-Source: ABdhPJy63N9Uzov1SLNPnAZwyK3DoTGWfod72d9XGH79M2z8oOyKFOCUIJBGmFb2UuauAPmb/y3umQ==
X-Received: by 2002:ad4:4dc1:: with SMTP id cw1mr907225qvb.15.1622157270395;
 Thu, 27 May 2021 16:14:30 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id h62sm2414181qkf.45.2021.05.27.16.14.29
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 16:14:29 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i4so3022388ybe.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 16:14:29 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr9231563ybj.32.1622157269138;
 Thu, 27 May 2021 16:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 May 2021 16:14:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: avoid perf update in frame
 done event
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 26, 2021 at 10:08 PM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> Crtc perf update from frame event work can result in
> wrong bandwidth and clock update from dpu if the work
> is scheduled after the swap state has happened.
>
> Avoid such issues by moving perf update to complete
> commit once the frame is accepted by the hardware.
>
> Fixes: a29c8c024165 ("drm/msm/disp/dpu1: fix display underruns during modeset")
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I don't know much about this code or any of the theory behind it, but
I can confirm that this fixes the hang I was seeing with the previous
patch. On sc7180-trogdor-lazor:

Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
