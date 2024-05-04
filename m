Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF08BB894
	for <lists+freedreno@lfdr.de>; Sat,  4 May 2024 02:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E522510E780;
	Sat,  4 May 2024 00:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="So8NBTkl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164FE10EC97
 for <freedreno@lists.freedesktop.org>; Sat,  4 May 2024 00:02:45 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-62027fcf9b1so1891677b3.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714780964; x=1715385764; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
 b=So8NBTklqbGjlht7Yw/1K4RCAuGKoTiLq8ZOdfwfDwjToH+zzSdhK8dmhr1tVHlKMD
 zoCoOpUmNJQstoE+6fK0+jDLxBgv/aMayauRZpcTL9pJG9RHKwnq/BojCnd67/quV6dl
 LaSJzbNrK5O2kD3cuKeVerfwVYJCfOEdeowG6stsWB4mWfWpFfh+dRMlBsVZfd/lS/2c
 SnhOkaAnaX29FBu/kacBqLKU3WIJP967gLfFVP8NShGQcwO7tJpOuXZxfcaJ+0uRgEC4
 UjndyDygGRaNZ5BLEQqdJVKw0Z5v/D5jbjshCYppm/0FqX8kxPcjlvkwUttfrIjQ/Rlx
 SZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714780964; x=1715385764;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
 b=LZ4SQA7ukibBPDVQYNFXmL6+QdIhEzigvB8z613l4KvUaaX5f60SHhLjSJOBGqDVjI
 bb0L6bpKOkSOc+empHlgzh1xfWkd+XTWjjpEjnKLf7d4Yqer4GdbPDcNQLHGMpX9/QJ7
 MwlV3Nr/APU2TULaDv5ov3218c+3RldXYmRHGHLjJnE8r4LQto6kV79nsjAFgjrwQRfN
 z3n6yypbeG+eGLQQ/rspdefSfnjjVF949ZlnS/PjOcnPL9REiQeRTbQyv+grGKkRqVLZ
 tWkfoT9vX8sEimAMqQMResY8Pd8g5k269ulYPWxTkp/6BrIHH/U/e7iDVT2C0AF3V5ph
 up3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdf8lc9aotyxvHzYk/aSZRycnuUPYi4JTjrALP0zd/drKX/3fZ+N/brRReR0uGnBJ5p9paF2X4RoaUoTnuEtmu4CwFSsN7jmSFoQdVobgN
X-Gm-Message-State: AOJu0YzYtywBNZye0fXRn9cKET2v3PEpPoqCesJTtHrbMFANuuEc7vYF
 M3flXr5nHFivcDcECQKJRUTdZUdjf1rGMCzBFAXKoT3HHBAuQ26LBLbnV4huS/sTFd8lQh/OWl8
 U9dctOQA6hl8JSKmuBKybg8MiEIdO6LRg5VdjSQ==
X-Google-Smtp-Source: AGHT+IEymS5X5ig3FJMTRZ56tRBGiOhi2tDbas/Tb524ePf/hM4/Xj702HYCnq1FuYFayU9Ud8U1yzDouq4Mi2oXsKk=
X-Received: by 2002:a0d:ea54:0:b0:618:5c6e:9291 with SMTP id
 t81-20020a0dea54000000b006185c6e9291mr3221458ywe.17.1714780963901; Fri, 03
 May 2024 17:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
 <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
In-Reply-To: <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 May 2024 03:02:32 +0300
Message-ID: <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, 4 May 2024 at 01:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
> > On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> >>> In order to validate drm/msm register definition files against schema,
> >>> reuse the nodebugfs build step. The validation entry is guarded by
> >>> the EXPERT Kconfig option and we don't want to enable that option for
> >>> all the builds.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/ci/build.sh  | 3 +++
> >>>    drivers/gpu/drm/ci/build.yml | 1 +
> >>>    2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> >>> index 106f2d40d222..28a495c0c39c 100644
> >>> --- a/drivers/gpu/drm/ci/build.sh
> >>> +++ b/drivers/gpu/drm/ci/build.sh
> >>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >>>    apt-get update
> >>>    apt-get install -y libssl-dev
> >>>
> >>> +# for msm header validation
> >>> +apt-get install -y python3-lxml
> >>> +
> >>>    if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >>>        GCC_ARCH="aarch64-linux-gnu"
> >>>        DEBIAN_ARCH="arm64"
> >>> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> >>> index 17ab38304885..9c198239033d 100644
> >>> --- a/drivers/gpu/drm/ci/build.yml
> >>> +++ b/drivers/gpu/drm/ci/build.yml
> >>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >>>      extends: .build:arm64
> >>>      variables:
> >>>        DISABLE_KCONFIGS: "DEBUG_FS"
> >>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >>>
> >>
> >> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
> >>
> >> Cant we make this build rule msm specific?
> >
> > No need to. We just need to validate the files at least once during
> > the whole pipeline build.
> >
>
> ah okay, today the arm64 config anyway sets all arm64 vendor drm configs
> to y.
>
> A couple of more questions:
>
> 1) Why is this enabled only for no-debugfs option?
> 2) Will there be any concerns from other vendors to enable CONFIG_EXPERT
> in their CI runs as the arm64 config is shared across all arm64 vendors.

I don't get the second question. This option is only enabled for
no-debugfs, which isn't used for execution.

I didn't want to add an extra build stage, just for the sake of
validating regs against the schema, nor did I want EXPERT to find its
way into the actual running kernels.

-- 
With best wishes
Dmitry
