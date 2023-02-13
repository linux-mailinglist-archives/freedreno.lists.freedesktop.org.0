Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E14694EF1
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 19:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3E10E696;
	Mon, 13 Feb 2023 18:12:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F4510E680
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:12:01 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id f17so4142188vkm.2
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 10:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
 b=c2vB7YepOv3IasRmcEsYKNTFXbAREvzH2Jzz9ZqXKc9LKKJN4DwSMLQbFzMk6jRKf7
 wjyW1FMLu6kf+tpkMB4eYPphpxFII5HbWM9MaByn+UIe1U2O+SKvSJp3t7/IPuMpSF6F
 56ECThgLIUwn0lGSUzcCICY6TlEwwarijCqBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
 b=MTNrkM3u+IF84dOQJiZ4kOheLWOl4a4jOYSyAL6oWfQzgcNMlCPdLvKK0+aubh+qdp
 +ByUHtXy77yettvzQl2LrfcRtdjtrJbxaWrPMgQE/Bnln+S8A4x5JQ1O9FebN5RJAnfr
 Lqf5FYrm8oGgDw/R3/IYYCk5lYpVSpi7pcfVfsy390dUv58EfW6Q7xLyN9xPfZudLpW3
 5zrc1SM+d7Ed3mEgorCj8AujzyfyEmvOn3ALRn409dAqEz0Rq9tR/uxhj360dXe9wHJv
 boe/KXHacSztQKvxXxyJkqRUz0NooFxh2iOL5R0Pow6K6l1Megx0czgXqFWgsLjK8Tx5
 b9nQ==
X-Gm-Message-State: AO0yUKUOpc1HX3hC08yuqwKqVcYysX7bxi7FDnGoyqyNipX3QMZPtjou
 GC+7nrHbSePTOSX9UUtaNlo6rcfThOyu/M72
X-Google-Smtp-Source: AK7set/BP9Th/ByUuv+mkRWy/OnfAanKqfhXRBJaKknCIRIMs//9WaQs8vYryVMyqaXgUZbPyPUpXA==
X-Received: by 2002:a1f:2e49:0:b0:401:32f5:a867 with SMTP id
 u70-20020a1f2e49000000b0040132f5a867mr5388090vku.2.1676311920291; 
 Mon, 13 Feb 2023 10:12:00 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 p6-20020a1fa606000000b003e89155ef67sm976862vke.24.2023.02.13.10.11.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:11:58 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id cz15so13956544vsb.6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 10:11:57 -0800 (PST)
X-Received: by 2002:a05:6102:1590:b0:411:c7ae:5b47 with SMTP id
 g16-20020a056102159000b00411c7ae5b47mr2679338vsv.68.1676311917426; Mon, 13
 Feb 2023 10:11:57 -0800 (PST)
MIME-Version: 1.0
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Feb 2023 10:11:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 0/4] Reserve DSPPs based on user request
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 13, 2023 at 3:11 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> This series will enable color features on sc7280 target which has
> primary panel as eDP
>
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
>
> The series will release/reserve the dpu resources whenever there is
> a CTM enable/disable change so that DSPPs are allocated appropriately.
>
> Kalyan Thota (4):
>   drm/msm/dpu: clear DSPP reservations in rm release
>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
>   drm/msm/dpu: avoid unnecessary check in DPU reservations
>   drm/msm/dpu: manage DPU resources if CTM is requested
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 38 ++++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 ++
>  drivers/gpu/drm/msm/msm_atomic.c            | 18 ++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c               |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h               |  1 +
>  5 files changed, 38 insertions(+), 23 deletions(-)

For whatever reason when I use "b4 shazam" on your series it yells:

Patch failed at 0002 drm/msm/dpu: add DSPPs into reservation upon a CTM request
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:573
error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

...but then I can apply it with `git am --show-current-patch=diff |
patch -p1` and it just applies with fuzz. Presumably Abhniav / Dmitry
can do the same but it would be nice if your patch applied cleanly to
msm-next.

In any case, I tried this patch on both a herobrine (sc7280) and
trogdor (sc7180) based board running msm-next (including the sc7280
patch [1]). In both cases the night light on the internal display
worked fine when using ChromeOS. External night light didn't work on
either of them (as expected) because we don't have the compositor
support yet.

I'm happy enough with:

Tested-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/
