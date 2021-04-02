Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F43530D9
	for <lists+freedreno@lfdr.de>; Fri,  2 Apr 2021 23:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336386E0CE;
	Fri,  2 Apr 2021 21:45:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44EB6E0CE
 for <freedreno@lists.freedesktop.org>; Fri,  2 Apr 2021 21:45:40 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id i9so6403558qka.2
 for <freedreno@lists.freedesktop.org>; Fri, 02 Apr 2021 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
 b=fR/uwETGDlv7x2KneEGWioUh5GnHXl6COTEbAPvUEKXqSO6DcbFhq6GmsakFHFfQb1
 wliBhr4E8MsNOCDNkBhlQKCaO4VIM69RBeM5lAhTDxR2PyRbPdXlccDmkWf3i+hZ36ZY
 wDCOxhUkM9o0Ddesn2NSw1F02JXvkyONIIoMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
 b=U4yMbCLlYHtLUhcbYUE07+ICQv2qoGf8sQg6hp8SimngEJ4rwK+XJwDam1sWpL2V95
 vC+25UxJ/Z6F9Q/yYRpAxJ55iohTC15iB1w+UtxkFxb1dG0ZsN7c2ZHggXG/9kax6p0i
 V5Ni46fQrJCWZTEj81sYUxyR94SqSJafGq4KkM/On+x4qaPIEwK45ZIp/sYKamQANR4l
 CTDKtXMyG4M41W2E56IVVb7rFP2sR9Cd3VhcykSgdcEFw5Im4Cfk71Qmh1YShWZY15ct
 EVyO9DUwnNsMhjf1uwlK4Coe8wpZoPbyRYLx13kCud/GT2i0Z68NWMPMl5K4dxszM33U
 ViYQ==
X-Gm-Message-State: AOAM5334U1BNAnKoiqLO7Vx1EOZwXaDsZ0AtKDAUXvaJF1wPjinUUYYf
 zkLHRXm+NlW10m9kzy68FiB2dA1cxsDEbA==
X-Google-Smtp-Source: ABdhPJwuf/Wu0Hy7TFJ5UiXjZ4HM1BLLFJYpMtY0UMznbk3Cwdls5hp3D7nWNS09Irm1Hwf0vL5WhQ==
X-Received: by 2002:a37:6c1:: with SMTP id 184mr14878918qkg.462.1617399939707; 
 Fri, 02 Apr 2021 14:45:39 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id e14sm7219723qte.78.2021.04.02.14.45.38
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 14:45:39 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id l187so107163ybl.4
 for <freedreno@lists.freedesktop.org>; Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr14891430ybl.79.1617399938583; 
 Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210402211226.875726-1-robdclark@gmail.com>
In-Reply-To: <20210402211226.875726-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Apr 2021 14:45:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Drop mm_lock in scan loop
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 2, 2021 at 2:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
> significantly (~350x lower waittime-max, and ~100x lower waittime-avg)
>
> [1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h          |  3 +-
>  drivers/gpu/drm/msm/msm_gem.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
>  3 files changed, 45 insertions(+), 8 deletions(-)

Looks good to me now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
