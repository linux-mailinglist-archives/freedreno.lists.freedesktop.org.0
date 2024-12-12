Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE19EFD6E
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 21:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB3A10EE94;
	Thu, 12 Dec 2024 20:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dy7eb3eL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D8710EE97
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:27:54 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e3dace03a73so678312276.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 12:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734035273; x=1734640073;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
 b=Dy7eb3eLad+fd1kQYLI2vCFIve4xgH1FbubJrFrTvhZRUGLc1+abiGWEMFM1k9bqS8
 ALlLDBOaLTCLE2wvw84H39hFFJo2P6OLrKM6vcS/tM+Q2VfXz5MqrLV6qJ9bkfzNn7xT
 XhiwWDUhoLtx6cbKPd6InyykyTfR5ypsyb+jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035273; x=1734640073;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IyH3eYb6Cm9AtiFQGPmrG/m4h3r5bZXGHe1sNdWmzvY=;
 b=DT5EoPr/C98juUh0OYsPG65cGEF/9ef3UTpFqSbOM+EaHFiuMGXukTPvmtcKxeGpDD
 05ikP4g/hDV4XpGwUmrTnuLyiUA+n1NI8WgD/eLkvZCK9FxIR0ptarYqWWc/a8GsGQQV
 JW5Bm6fesXUjuoS+Q+wt1g42dMZUV2oo0uRVQHl77OwypERqGGCUArCA+RHOW9390UQ8
 kQTHhtqJ1SMK067li9vyU35gM5/BDzaIMsjiW5vW0Xn1pASKR/uthtI7qOmYrP+J+QZ/
 Y1tKOkRMOBbrly0PDjq1ZlanaVJos1HImn1/GXjNEjV5EBsIoVxmxTfD1GN+CgId6ay0
 nRCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBi+lGMeUnesowZjPxkmzNIwG8Ne7OkgTudQxeapd73p1OA7mAnaiRjkf7F+KgdahbsfnYfJMXli0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv/f2YFIE+QtSj75J5Bw/Mld5PbmR9GZVtcyzQDT1+gJtZm+3u
 KVRxwqZdTvdgURAqnP3SLcwBnIj9FEJIlGiSuT0F1Fe3wm9Ab4y7yLUu1zDhhmDVi3NVnMerQHU
 HlHG77b4Lj+aG3oVUm6vqYbk4wF+z2DZSRNb1
X-Gm-Gg: ASbGncviVoFxsuQyLCxhO5vIo6iLgo90nnD/hss72Apj4EfvnVIPkMoJHClkftuNoF9
 Sk2Z27dvMopEJhAuLZVJp3dRbwgLPM/VwceKYBAbpISAscShFlQEyQ9c37GZ5C6PMow==
X-Google-Smtp-Source: AGHT+IG3KC9ssh6ekayVwqUK7Km4JQfm8yz6hlNQTxOXGgPcqzMW7GAJJi4TlQ/fXN099DQlJcEjq7UgjR3xUuloAyA=
X-Received: by 2002:a05:6902:1b8e:b0:e3c:7fca:716e with SMTP id
 3f1490d57ef6-e43491ff2aamr112163276.6.1734035273092; Thu, 12 Dec 2024
 12:27:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:27:52 -0800
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:27:52 -0800
Message-ID: <CAE-0n526i3eZbSsoyLgO=MFPb1_mU_v9c-zgMrdQGWgUvj-+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] drm/msm/dp: perform misc cleanups
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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

Quoting Dmitry Baryshkov (2024-12-11 15:41:35)
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

For the series

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
