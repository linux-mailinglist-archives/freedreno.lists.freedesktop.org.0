Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A07CD5A7
	for <lists+freedreno@lfdr.de>; Wed, 18 Oct 2023 09:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E620010E3B3;
	Wed, 18 Oct 2023 07:48:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9FC10E3B3
 for <freedreno@lists.freedesktop.org>; Wed, 18 Oct 2023 07:48:09 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a7fb84f6ceso79825777b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Oct 2023 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697615288; x=1698220088; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
 b=xnGtqkyrj492XOZfcK38YykO9f31ty9tTA6PWaNJ6nORerkZxLwAoot1DZ/2TPMroD
 MnJPTdwikL3XPTsoa7ifz+jIgl+It4OLv31FDmGUxaRrPjNDbuNIzfhP1bhlaFKflI8J
 NGWmXEhpK2a6ynXUoLE7PjRICWIqp1m1uBDYqQUSHcsFXIf3j69qjoPzp0+BtHJOJV1T
 Mv5T/p6XwYI1xYZPI8bmjrj/TQNvhGAqf+zLDFwDxZ5wOvsu8CEvaXrqJOStJPTEXW6G
 9UGSE/ZQ6omCEyuwDnpR7ixyPivrwYJMR2uoCYgHQT9V/6jUhA34g6HCBNn7X6M8g4IQ
 2V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697615288; x=1698220088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
 b=WJnmHS6n8rOy6Mw/up6Ogxi17o7T8cOURkgvVG+wbmdwhEtRh9iUtnHhe+IntuH+aO
 wBvE6VYRvnF3AI98rth7HXqY/OtDlOBtjWDuFC+T8vfSivUXgqmplOqV81a5JAPUNHvl
 CyJof6pkdcDn6rU1NQMV0AKFNBFruOsiKh7MRdITS/T7mkY7akRokXoTWNGZabRJNzoz
 oILRvGNWxqjJFeped+4EkG+1DY/bTcdxOOt3VYHyV24R4g9/KmhzSCsvaJi9ME8PaqMY
 2peZSF3F4enRrEBfr6xAK2f2FKT5MtkJiCLO9nSlKvy3nJaiXn4BDzP4PWWmMougqU1m
 CQzw==
X-Gm-Message-State: AOJu0YzDtwCr8IZ78RxCy/m8fEFIJHB5OzejXqWpoGLSbEWwKUqiP1y1
 7wh4RSGpX6f31/S4klB03jVwJdx0n/AzDN8boR325w==
X-Google-Smtp-Source: AGHT+IH8nl7SgUpvgBkgQixVGgpK0NMaVDkGMP6hZfYjxi25iLCtiD6oyBiVsBxjJWdcHsNr7ZkLItkk3bbAVEPUkas=
X-Received: by 2002:a0d:cccf:0:b0:5a7:fae6:1cc6 with SMTP id
 o198-20020a0dcccf000000b005a7fae61cc6mr5006410ywd.24.1697615288545; Wed, 18
 Oct 2023 00:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Oct 2023 10:47:57 +0300
Message-ID: <CAA8EJprdiac17UfMLg-1Kg2urd4PZOs=5DT_1YGrN7u1W0=Bbw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: attach the DP subconnector
 property
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 at 10:46, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.

[1] https://patchwork.freedesktop.org/patch/555530/

> Since the patch has not landed yet (and even was not reviewed)
> and since one of the bridges erroneously uses USB connector type instead
> of DP, attach the property directly from the MSM DP driver.
>
> This fixes the following oops on DP HPD event:
>
>  drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>  dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>  dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>  hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>  kthread (kernel/kthread.c:388)
>  ret_from_fork (arch/arm64/kernel/entry.S:858)


-- 
With best wishes
Dmitry
