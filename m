Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A185948A
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 05:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C8210E08A;
	Sun, 18 Feb 2024 04:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sV4zdIZo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5C210E08A
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 04:18:03 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-607eefeea90so20645177b3.1
 for <freedreno@lists.freedesktop.org>; Sat, 17 Feb 2024 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229882; x=1708834682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
 b=sV4zdIZolUU1Irtqv6S1d3Eg/OwTaoigYIgxYabHDh0DjLwoJaLNwLr8uJJgDxYm5p
 Cudcb6x4G1LMR/Le9KgQ84ZNyQFt2xvEEvOnkYiF+D8b+BsUiYPvDcbJ/MNmAwfRmdo7
 DGqiPDWzyYGVYePUYeQ7Ep75qjQJZ9p0PooKfqUJ4GrV7cRYWEf+udJA0dPJLKbv7RLm
 wLSwFMVMCWXQk570bWLcYcxTaiC8+eQAnfn7nMLhYVwuesTi7jU/WyLBd9qL9SiXlL4M
 bxJ7wSCvEF79UomChjP/3cZpWdJYPdliidBG9nVYz2UCnO07hIG6F5fw4QTQIEcLbl9x
 tSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229882; x=1708834682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzD4Pv6p9Be8l8eNEWsH1WgYTIMlRyAnHGABnOcxnhU=;
 b=M5oXMvFEMAYq8koQ6x9uq/fyScz5qpsE/Q3e/5R0l9N5ocMswX8CIB+4UXDtkCej8l
 8+Y4C40Zs5VfVl5CrKiS3Tbv/5os0cmSFrNqzK37Njmjz/YOXrPYce7n4BtvVWU0P0mO
 FNAYVP9Px945Tc8oloCP24LRQ/af9fFIOKrEqSxTVSSsmLeFvNcjzdBiy3yjZJjORUiB
 i5x/9dNgkT5iB/DW8zpmdra7U1JTwI8JqIICrtcJMKj/emUOdK35/sK3j0ooYtAGb2Nf
 G2eI3DRhXwYFSP82a4sae2gvlfQrpRhYUKSKHg4JdK/gwfYYtG02NzfpQrVcfoKXj0Qa
 AMEQ==
X-Gm-Message-State: AOJu0YwDmKsHIVUxOQwGCK96l9RAMw3AJju0LFw42V4sVvrfHpLW3Llw
 y2qEKjVB61naSsud3b0bX+o6EDOz1ITba8FldJwQCXIBKELwzBc9wYGn9L7f77mZlmAPiO3OTjU
 b0KmVKf0aVCYjIxskYqn53yqmBw7VDrW4yk/dPA==
X-Google-Smtp-Source: AGHT+IEpgMf3VvMWakVwv7fghI9Fa7G7wYfMJAdAyHJSmdQW1S3Ff0ESfxQKn12qZsKW7JtlMbzrJ7Lgo1P4FfdpkMU=
X-Received: by 2002:a05:690c:16:b0:608:b86:7c9f with SMTP id
 bc22-20020a05690c001600b006080b867c9fmr2610027ywb.7.1708229882487; Sat, 17
 Feb 2024 20:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-17-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 06:17:51 +0200
Message-ID: <CAA8EJpoVFEXRCnePop20cv7vy0+=gsZ_cgdgkLSoQ0QsHjNYdg@mail.gmail.com>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
>
> Changes in v4:
>         - Remove hw_cdm check in dpu_encoder_needs_periph_flush()
>         - Remove hw_cdm check when getting the fmt_fourcc in
>           dpu_encoder_phys_vid_enable()
>
> Changes in v2:
>         - Move timing engine programming to a separate patch from this
>           one
>         - Move update_pending_flush_periph() invocation completely to
>           this patch
>         - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>           calls drm_mode_is_420_only() instead of doing additional
>           unnecessary checks
>         - Create new functions msm_dp_needs_periph_flush() and it's
>           supporting function dpu_encoder_needs_periph_flush() to check
>           if the mode is YUV420 and VSC SDP is enabled before doing a
>           peripheral flush
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 16 +++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>  5 files changed, 98 insertions(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
