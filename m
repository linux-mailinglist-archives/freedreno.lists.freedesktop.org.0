Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F4522351
	for <lists+freedreno@lfdr.de>; Tue, 10 May 2022 20:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D487310EB6A;
	Tue, 10 May 2022 18:08:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5E10EB4C
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 18:08:03 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id i66so6854194oia.11
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PBkBGj9Wm+vqScoe3rXf56OJq4tLpJWe7pdFIsGR7f8=;
 b=m7/KE9hL4p0V34eJ5CG5gGQ7DBSHi8qVI0yoATdKhsJkfVe5nQTKMLYYHsuqRS/YRA
 5ea2LelxM0XZNjHjHHJfhc3mu4Rxb1PndcumidEOGMhdgylteyqyxUAMTwG/QDFXsEwY
 FbD95wZFveFO4CMVdlxSfo4qPwUHJCZ+n+IRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PBkBGj9Wm+vqScoe3rXf56OJq4tLpJWe7pdFIsGR7f8=;
 b=iL+z40ZXYmWZgK6ZDmiNFJHRBu+vNNnd0svumpYz4f1N1xZuiK3Ev/Z84wwOTszLhy
 5jp176q12YS/XVmjxGi7dliDpcBDc5coSTWr3BT+OH/nI33sCasNEqNor3RZSNKBpF0p
 spQVFkx/2Gx+uRb+rZsCuOpLWr5/3kMsqnAYo/fxYwFpR/5haKYy/BPnRnfbgAduUCzw
 HEH+rVnvgf3xgMtaU5cJKmPMk4MBSa+tIoylBCqi8U3vWalnr/UfqPEsVYbTh2j/D2rP
 BV9WpUc+YOceyI3gH5fkszeLIfbN3ptVw8o0xrFPrvENB/LRo4zGjQ7g1z76DO8G74vS
 r4/g==
X-Gm-Message-State: AOAM531kfdWXrOpCnrgz6b5YzPrm63XwGT/0yPjKHmUCEPoR2ipn5a2Y
 P+loppjQiJVI7Iq1KG+/d6ElfQY9Hi0C3wiVlY95/A==
X-Google-Smtp-Source: ABdhPJwDubvKYE7hKn9RJqYmmvSUB6eZFEeHBr9soKfiUdvHF1qRxJgLuav4mDD81e+i0CrUgZhvbbnCOoGW8sOaAaw=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr633893oiw.193.1652206082707; Tue, 10 May
 2022 11:08:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 11:08:02 -0700
MIME-Version: 1.0
In-Reply-To: <20220510165216.3577068-1-robdclark@gmail.com>
References: <20220510165216.3577068-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 10 May 2022 11:08:02 -0700
Message-ID: <CAE-0n52TCi-Vy8WUqCQdbcoqLCX6j4_mkM_1pBQC072DdqC-Wg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix fb plane offset calculation
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-05-10 09:52:16)
> From: Rob Clark <robdclark@chromium.org>
>
> The offset got dropped by accident.
>
> Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # CoachZ
