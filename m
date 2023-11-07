Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004667E32B8
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 02:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4D510E49F;
	Tue,  7 Nov 2023 01:56:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2B10E49F
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 01:56:04 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a90d6ab962so60437157b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Nov 2023 17:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699322163; x=1699926963; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
 b=OfDkS1Ho9PH0GNUDy9h78W9zLWCOYAhE6BjdJsSsJsz8DUVfAa5Fqngz5C8v+VU/1S
 HL8S3FGdpB8xCBCkww8HM3i/eCbSUmSOIp8ugQwnORycxDRnT/bSYQ7/MQoAqduDhUKl
 HjEhuIqSctLwyvsVxd1UTW2FH4E5qqjwpO27YYk954sx4y7fbRdzVqRs0qkGKpELY0pq
 cUjKZ2XjUwydDz3eFp6ni+bQqylXsyn9Dx2xQwF/ao5z8/ogqsTX8qbW9GgIoeU3vytY
 +G8r385tIrQCaOOQyPkGhuWA4gVzOjSC0jCk6eaGMRZ06J7QmdS7ZW6WEh0htFOrrona
 /5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699322163; x=1699926963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
 b=vGkcMo3BaZP2/H+JgbEX/mz1T1n8+8AG1C9oIPj1OID7oHGDYrniu1srW2OVoAbuJJ
 vSCiH4I5XY9868nDWy01jnQcAaddtHjwKTZAm4EO7mnyY8S1FODf6bDZ2R4xQK6ww6nP
 sp7fVdqdpZRhkCl3hDk8biK5KmLZ6MKV+rxtkUyKLJw5zR0gzBM3Bv8KWXygPbR6/N4K
 /lwywCc8pw4vrUpGF5S7yQxwyJTrUJGDavKvfULmQ6sKQu3m0/xf/OewcQuS8p+QNyOs
 QAM7bVt1F2QZ3J8sxNqmu7S+ZJF+7bya7Et9ApduSc+9YMb/j9VIC62sZ5Fs8uGF55TS
 waMA==
X-Gm-Message-State: AOJu0YwqA7AQh48+u7gne8JopnLLUB6y1gAkxWCdkvX+SWfSfWmlQ5aV
 Y9rFu19S8aH8U7BXjChcpGA2hursvmUBGK7YQyg9zw==
X-Google-Smtp-Source: AGHT+IFtN3nj1SFB8choYmUK6+L0wPLOEXRz8UqI3Ocfv/fDkJmkQoE2qADkYCuPiioo32CihjU/UeJ2DjK7I3fYw4E=
X-Received: by 2002:a81:9a54:0:b0:5a7:fa8b:3fa6 with SMTP id
 r81-20020a819a54000000b005a7fa8b3fa6mr12601421ywg.9.1699322163303; Mon, 06
 Nov 2023 17:56:03 -0800 (PST)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 03:55:51 +0200
Message-ID: <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 0/7] incorporate pm runtime framework and
 eDP clean up
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.


With this patchset in place I can crash the board using the following
sequence (SM8350-HDK):

- plug the USBC DP dongle
- run modetest at any mode, don't press Enter yet
- unplug the dongle
- press Enter to stop modetest

=> the board resets to Sahara.

Please ping me if you need any additional information from my side.

-- 
With best wishes
Dmitry
