Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C739A804307
	for <lists+freedreno@lfdr.de>; Tue,  5 Dec 2023 01:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77D410E44B;
	Tue,  5 Dec 2023 00:02:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDF910E44E
 for <freedreno@lists.freedesktop.org>; Tue,  5 Dec 2023 00:02:19 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d7346442d4so24154267b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701734538; x=1702339338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
 b=dObhcTKtfZ3D+7jKSs+fkdkI5/iS067PqSCp4M38E42Z8hsAE0KZsgnhygMWHYm0/f
 f1vfdyMLCvrshO+TjgfDnZOFNk2wGAlgaW42OpZcuO2J3FHtWkAE5dTQN4rhfU8YMBUs
 0VZfRch1wJQo6AIQ2HyvvmwZKhS0bJc4EtvULK3d9jSjKV+PoyG+1Ga+P9MgJ5pE5gTi
 9yV3AWWI28xaYwvn8fhLAd6hi/ZP4SFeb/1p0ZdPXy5cb8KTnuMBlk1+TpfM3G0bxC1Z
 deykpMbC5GfwPHmjNluHAcOGts5TahZzLG131/jjGhY0UGN9FadvGK/q4OpBaamuRZeV
 dv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701734538; x=1702339338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
 b=pa1uSRYljUvE28X8N3tue8T36aUijwSKP2zzbEYVWGJywKtOh3GJQWAnknXc1m82fr
 Z5hviod2hVtp62teIGGcwJBFFVEvx8KnCisbYqft23Ako3Wp6u6ZB9CZIQ0kRJx5F12k
 3oBJTWIpM+zVgnG3gOffHf+hkcoa2ksnaNB5xPrc2EIoz4BzQdZMjovPvViYsnHh/rU5
 W6w104ASGYAegxw6fv3VST1uapo5FCCA6zvyPjyX9gZeDGguL7N2J0X3SVUyr6stkbyg
 frw3qjjalgJTbdYRnzNG0QhADvyD2T++tJYCfkhSqSq8RxkXtbl5M5nQVJkz9HeWKIwH
 9rIg==
X-Gm-Message-State: AOJu0YyeYK3z6pxLf99eGTBoI7GVwXPuu41gPHdlh6Lia/N90Q3e8jLy
 4ttMwt2mCMD936pLYqmFpjTe8vAIKwL7qipYXCK9+w==
X-Google-Smtp-Source: AGHT+IEOxPFF2KkSzJwDCbpCS7ZMeUuG+qV9rs6KCCZ8WFQySImhbc9P6KBg4Cq+5fa2Ay84+VlcJgXdf0LG8qDHprE=
X-Received: by 2002:a81:4328:0:b0:5d7:1941:355c with SMTP id
 q40-20020a814328000000b005d71941355cmr3549292ywa.67.1701734538332; Mon, 04
 Dec 2023 16:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-4-dmitry.baryshkov@linaro.org>
 <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
In-Reply-To: <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 02:02:07 +0200
Message-ID: <CAA8EJpp3NS605Sv65KH4WD_44sn8KG52depnAYDRjg2nT0NChQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RESEND v2 3/3] drm/msm/dpu: move encoder
 status to standard encoder debugfs dir
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2023 3:53 AM, Dmitry Baryshkov wrote:
> > Now as we have standard per-encoder debugfs directory, move DPU encoder
> > status file to that directory.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
> >   1 file changed, 6 insertions(+), 39 deletions(-)
> >
>
> For this change,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Looking more closely at other drivers, most of them (atleast what I
> checked) were doing the same functionality in drm_encoder's
> late_register / early_unregister as DPU.
>
> This can be a wider cleanup across the tree if needed or we can stop here.

Yes, that's why I thought that this is a good idea. I think I'll let
other driver maintainers rework their drivers.

-- 
With best wishes
Dmitry
