Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97340342910
	for <lists+freedreno@lfdr.de>; Sat, 20 Mar 2021 00:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D836EB0D;
	Fri, 19 Mar 2021 23:11:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488A6EB0B
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 23:10:58 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id t16so5849736qvr.12
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 16:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
 b=TDSloJVVt/I8eDwWDYUXCksx1aBtsUfY+B1qBO9c6yy6IUkL+X3Vk8u3mQ25bRE0sL
 xftu+bGP8qFIT2FgoOfFfKm4dBELCuFE3xnYFkaZff2We+jAYkqFSF9ysPeZjggzset+
 ocPc11dxbFUhsI9gYwJdlvXRYazxvPEkGDaA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
 b=r0UcyeSuiZrLjZCjee+Z8c2w37vrV40K0bBp9VIh6P6OVZtG8AdbsjITi1S+NCi1QJ
 +vBtM39SlYB0k4Gt7PQ+aqeES9euHzQujtZCT1mApPboyiwmNu2n6V4RsMlOtngIElAX
 mUPac9kIatayiRKL9LhCDkOVUI7jsNcp/eg08Xb7Xu215eRVAgIs5/bT+UZ8NsViuu1p
 mY7Z8JZ8JkbyK23Ca0UDEKuuQ4Cxz2d16M4XuLsL5jOtn00VnekVMzrEFb+coPhcCeLr
 JEbbthb2YX1jCJmhwf/JrFy8d3TrjEgLhTviEuUTXTqXBTfKLoyo3sfxwF0OhmSlrX/q
 NbsQ==
X-Gm-Message-State: AOAM533aOt2Ixx63YOsmBA13nH7y3ayn1Kg0EJB0kmPDN+QApMZ4FvhC
 6sy/be66aIuki9j8hW/WVchSoYjgnCPJNA==
X-Google-Smtp-Source: ABdhPJxrJ3F8zi+N1Ou7mHyUYoX7Hrji6mJfD2gBVEbBJBtjqqEiPbF/gc/FkHVDEj6Cu0vnmhTV/g==
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr11562667qvo.7.1616195457154;
 Fri, 19 Mar 2021 16:10:57 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id n3sm4722077qtd.93.2021.03.19.16.10.56
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id v107so7125751ybi.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr10033101ybi.276.1616195455835; 
 Fri, 19 Mar 2021 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Mar 2021 16:10:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: fix display underruns
 during modeset.
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
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 19, 2021 at 5:54 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> During crtc disable, display perf structures are reset to 0
> which includes state varibles which are immutable. On crtc
> enable, we use the same structures and they don't refelect
> the actual values
>
> 1) Fix is to avoid updating the state structures during disable.
> 2) Reset the perf structures during atomic check when there is no
> modeset enable.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

I think Stephen was the one who originally noticed this and reported it, so:

Reported-by: Stephen Boyd <swboyd@chromium.org>

Seems to work for me. I got into the state where it was doing a
modeset at reboot (could see the underflow color for a period of time
when this happened). I added your patch and it looks better.

Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
