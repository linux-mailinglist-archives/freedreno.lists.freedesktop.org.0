Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274E6D0081
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 12:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1510ED94;
	Thu, 30 Mar 2023 10:02:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178910ED94
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 10:02:00 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5456249756bso344621117b3.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
 b=VBUDvaY+gQMis+XrqLFcoRH9kL39smZkNiSqzBsf6noF9V3KOhTIHKgXpbkSBuk6e/
 Exemc3VKrlJFmzUriNDOL+l4iNhEPk92A5pJDPNJoPC6QtDrBua09JY6BN6WyrD3hl3Y
 cYVlJZd04rFvdBe5lCttihIXzt/il9BFiwl2Qcw804KmZGfwqtOSR0ox3PAtfph+7Q36
 FsVGVuJUEQ/weeOvJlbfd+rYLz0GzAL/zb/ysE8sThC99ioc4oBmHMB1yvl8bUFhEbv4
 JOqywAsh4E+UFMi65bJK9JXFuFOZHypMdSi48ruY6IV5TN3h29TC2v2G5hAc23oufQg8
 xXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
 b=QLTglZ4C+kKJ6IYvrW7V9JaqUKZJoacaRgP1IOJxbFZvcNGwhH4/sSSvhjBCAJY2rL
 YbOiNukSHn1NfcHGqYhv/6YV0EepOOhvoI/2m/hPO+Q26OO0jAAOAO1W/PAT4Smiv81Z
 c4aKnXyJU5NC28RfeMaPvjwsFRnIKaILUv04GJx5bf/lP4xhkyNLsOClBRcQ+ie711Er
 7XbyBN4FpnYEuoZz3iVDW3yvEtJFPR2atBN//nh0xxZLhACiPalJymsqi05E3H4O6lAS
 N+PBAyT6HSb8JHu0hx5MSxnd1johWioUgo2hDuPctthg6yC8ArxjvRLbKcF6YZkxztxD
 0HwQ==
X-Gm-Message-State: AAQBX9dMM3VRjEGDEnLu/h1UJrkXHR2rknH6xlAcm/97ZOj8FuM08Z3c
 /0rUSdwWQvBOBg6ApqdOH28veWrbcSvJdUkc+oDyBw==
X-Google-Smtp-Source: AKy350YsrGQ5f85kNh7qDhc8gU+uPe2w56kbUSbAgFRAHEIfvV4RYH3ZsM8gUtI2flmvhIgLAG6NcUHhA8RaF92lwu4=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr7079275ywk.5.1680170519380; Thu, 30 Mar
 2023 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-5-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-5-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 13:01:48 +0300
Message-ID: <CAA8EJpqpsoDDE2RvPHmQM=YDFFxHPW2YENNZzL8We78aQo_NPA@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/6] drm/msm: Remove fbdev from struct
 msm_drm_private
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, robdclark@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The DRM device stores a pointer to the fbdev helper. Remove struct
> msm_drm_private.fbdev, which contains the same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 5 ++---
>  drivers/gpu/drm/msm/msm_drv.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.h     | 2 --
>  drivers/gpu/drm/msm/msm_fbdev.c   | 8 ++------
>  4 files changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
