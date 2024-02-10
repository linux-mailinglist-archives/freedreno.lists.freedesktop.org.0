Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0048503B4
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E818B10FF17;
	Sat, 10 Feb 2024 09:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T8Mia3aE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFEE10FF17
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:41:54 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso1643446276.0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558113; x=1708162913; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
 b=T8Mia3aEwI217R3xP8LKwN0v1suXM8t69O74K/XwHU+XNxm8HhW5YnY3Uor7no8Ik4
 YWiDFY+5htUbMz0iGojh6xD0qpVlPil5XrEiGU9aBmcGl4yHCwmET5DUB3JW9Gln/g6e
 szRpGLZk9Uwyvp/91pQmeALY6ItVqX8tm/HtDeHW3nckNuiVSTFeJ4m5GyFPSWGHQdgv
 GLDLwNaw1xlKXTIZ9N8NbAHsNcFnKqf9OROSrsIwAYrYuf2DWJh0oZIM4EMN/WBz6yjE
 PA1IqF9d/Nvk/ZuZEVFNeQmc39qHVnu4NBrX81s2AFtYnniw8M/xftm+TF0+eWfcXod3
 hhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558113; x=1708162913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
 b=IN5W7b52XIVzU8wsouanfj7JA07WWSaigDMJgTPHqmI6gcp54ySRqW1J2YXg9KS/cx
 fXtUsThI2m/Ywkg8v9MW5yW2bzQd8mDNJxSP2p/LvbV3DlsRsfNqK7sY3YdGhh47/b3S
 AOJXA1+xdKNRm6NT3aMt//j6GaGMENGcwhuPM5XuV1xEXq9CVhw7UrUyA83mplGrRZBr
 6IWQmhbLBJNWelEK22c4u5MiUG5sLhOVSUV8jh2c05dEtpiG3pWDu8/oVSBDbzCbUOXs
 +7kVXnI105IFFDmnYHgPJPY6Q1dLuy7z6dLb/kD6+JcBRNhWFCwN0YEtXBvk+W020kRh
 AXXw==
X-Gm-Message-State: AOJu0YyvppLxujVIAfoDSbnSCT/Vuv0IXDreDok0g+KO/NYpBDJSYccf
 UnSr5Sme8uKKzCMQnW2Gaypd+egxGcIqJmNbDfIXALfpw8nIEW8pfqmfSjGR+rNU0J0e297p88p
 t/17wIUnKz8sAoRCdSgtp3wchZKgIs0dWYzSdeQ==
X-Google-Smtp-Source: AGHT+IE54M281Vieh3wZ0YBgqDx/AuBch5Pznwg9hx0yJY6dS7xj/fAxE3wJf/efdw9syQBI4/GbJ8uHf0sc1c5S73U=
X-Received: by 2002:a05:6902:1b0b:b0:dc2:3237:ee61 with SMTP id
 eh11-20020a0569021b0b00b00dc23237ee61mr1873660ybb.53.1707558113541; Sat, 10
 Feb 2024 01:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-5-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-5-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:41:42 +0200
Message-ID: <CAA8EJprduMsCwuXBOR2rATKJp+2+1R-L8+xSL6yBRE9CmdZnzg@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>
> Changes in v2:
>         - Minor formatting changes
>         - Move the modification of the dimesions for CDM setup to a new
>           patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 27 ++++++++++---------
>  2 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
