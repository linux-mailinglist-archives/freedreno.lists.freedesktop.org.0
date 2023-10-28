Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E2A7DA48C
	for <lists+freedreno@lfdr.de>; Sat, 28 Oct 2023 03:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB410EA9F;
	Sat, 28 Oct 2023 01:13:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D785B10EA92
 for <freedreno@lists.freedesktop.org>; Sat, 28 Oct 2023 01:13:41 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5afabb23900so10568237b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 27 Oct 2023 18:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698455620; x=1699060420; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
 b=xnQxJtPVQ6EV2L2Ly1WuuN3ymZT3YPR7SNgxRQsKsWOuTHkz99FOEAbOYrSXWw8ZA/
 oLXrCcimvpmQbjOLk233RXV/r5Ne3qNgviuw4Q4bpzGV027qWWT8FKle0raLpzvsDJli
 enkQdzl9hCer5WqUjPwMuy/4cJ6S4k0QyjycilsPl0jvcUvWx/uEVeHbA0Y12enF4ejq
 x7yFIGL9sCucfbQLOgXCmCl5HmA1GpUzBV5AapHkMmpdXZ0+GOMm6ExHePZvm0QlxKLY
 ZDgo1eIs2WB98F1CHfiazY0p98VtzwP5fcCN6j3f51SlAqKgsQtUkAF36VV0iffxu8UV
 eoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698455620; x=1699060420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
 b=IJHrZpwcfCfsZEc6I+VYuFA2SzeX1B98O+FFRbh0af+c2AO8jcsn0q8sXi+mzPgH53
 +FwQyTvn3kwNtUZznYgYnV5gVos0ChaUaeyrKYZE3LBOoNP+q0UpPBhBgfP/YLcM7FPw
 +Dnrq7fXkRcLCXOWJHAaBbKtkBqPkSMfBoN5Yst5cDLn1kZm9jNNbTyECyMgDeXZZ/0i
 2v+RIS3nbYyUkBEc6v8xnKIgEJC/eXdc2VxRaWA+vPXGcDXhkjbMi481btoLTP7z7rIC
 D7yohjW+KZ4fLcX7Lu4G1oRDVbu5RAcaSUFfqfDQ12/YUZ60G+kugHJAQhfcu2X9jQ9o
 y6iQ==
X-Gm-Message-State: AOJu0Ywhf2r1xOiUeZrIZkPz5MpWEpdrcbseI8McyoAgr1MoJozfAkXt
 ju2qiWlmRR6HD3Ah8QJuEqK3D+nN1uq0SKea8qNwWw==
X-Google-Smtp-Source: AGHT+IEy0Nnb+1iIU4oI3Q8xCZLvRP2lIn7t5+74WBEv7quxXECJcmd8oYpwPOO1jVQx7DtAIz3Thav+x0gjcAzTf2g=
X-Received: by 2002:a05:690c:fc2:b0:5a7:ab2f:ec43 with SMTP id
 dg2-20020a05690c0fc200b005a7ab2fec43mr4524761ywb.25.1698455620529; Fri, 27
 Oct 2023 18:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-4-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 04:13:29 +0300
Message-ID: <CAA8EJpoNZ93LJUZ=4FSD7YGR801-M++YLjNo9_opSW=VddJ9LQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm/gem: Don't queue job to sched
 in error cases
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We shouldn't be running the job in error cases.  This also avoids having
> to think too hard about where the objs get unpinned (and if necessary,
> the resv takes over tracking that the obj is busy).. ie. error cases it
> always happens synchronously, and normal cases it happens from scheduler
> job_run() callback.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 +++
>  1 file changed, 3 insertions(+)

-- 
With best wishes
Dmitry
