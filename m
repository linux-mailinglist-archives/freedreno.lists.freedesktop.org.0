Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BD9EDA64
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D0C10EC45;
	Wed, 11 Dec 2024 22:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VgaNfR3B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8960310EC3F
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:51:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so3514366e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957464; x=1734562264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
 b=VgaNfR3BM/vCpvo214nF9SkA8gu66dtskgJFcdP2WsMrz16PHjtNqBN7zY/y6Wkhgj
 6GagQ66YEvk40q2uKY6smWnMQ30xJY6uKyElnijhMVq1Rm+ZjvjqAvd/yuETqiv76XG2
 xXCnrTf6d9+gLkACo6Wf8BIMKrEs00ekpFrPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957464; x=1734562264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
 b=FfyD4+KvqYT7Aer3850D4rkkNalTEn+vQfIxkmwc9wg7U2PxN8ciys+HIjnnn0NQzB
 Fmk4Rk6JV9OGHRfQNbnJng5yZRKtimVJiq96oL5FhH/lG+wIh0skWWEoWrA3ucpV40rR
 zGuLZiA4dYyFXjttVXuWViwU94YkO5mxCNp730lnL/3eWpqfY42kcJMX+BLAzP6Fpr/s
 iPJABv1V3YpY/WC4j2gdhJpHYcC7jv7pHnqavL3PtA9bAsHTF5omYJ4pKzFjwIygPe2i
 q6viesHnCkSYJ3pF/bRUZI45fdLo7/T9RDMgHs9eS0u4NYsU7g5JsryLMQXaDfYy5ios
 8q8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsX/ETZGHYFyw8ZT8C9ILXpu9oyyxsvA2XduvmZEb0dGDcO6KP4cXJ2oKESyNrDJ33PdODkrRQycU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvgQCz0TRyD10gKx7kCDm5O3tsX8+FLxYLJVGkauiC4EGDRxTV
 AGc696Cy4d4K9iSENF18c6vf8m9vPPT90CwlIoR5pXA7mnIuwo0cwWPRg2arg6g6Brano6LX8iF
 PZeLb
X-Gm-Gg: ASbGnctk9lz/muM5VXHP8wF4aMK2uoWOnUe1pAEdNoDBDFQnM9W4jaNEBZcLvi5tE/+
 KlZDydvr/3SRIGDJ6gFrxdUsK+fE+DFum7GEjw2DAzCM6I7joOouw++/X1f6/jW6Sp91iQlMNm4
 TuYiu01VGguLTbpfNILJBZwSn6ejrastRNOWgKK2A+g2ZHeHYRlRPsKz+hwxGvzcTEwP6mtgMLL
 MrvGrf1v9hSvTJP1JCG0mQ05I9m5ztjf/OCCuBtnyY/WacVLqNDHLzb4ZobOmctruT4H31TpZeU
 LCCEpowZpZJ3PrfWlQ==
X-Google-Smtp-Source: AGHT+IFRUTKQbj7are6UO28Y+FZviuOYHr4k4CF1/hazYBW2AK1Gp4xxh0rjip2KBVlaOrB2AnTtyg==
X-Received: by 2002:a05:6512:3e10:b0:53e:335e:774d with SMTP id
 2adb3069b0e04-5402a605e24mr1360270e87.56.1733957464583; 
 Wed, 11 Dec 2024 14:51:04 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e39579e47sm1684708e87.30.2024.12.11.14.51.03
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 14:51:03 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so3514325e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVqGRydlBNhTJeQ7dey8kRfRoYpv2OnsqwaA3K+8k+yFQDpL6XCl3W6sqjGRzb9TFHVmmXAHy7tJhw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3d11:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5402a5e5682mr1002664e87.25.1733957462810; Wed, 11 Dec 2024
 14:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Dec 2024 14:50:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
X-Gm-Features: AZHOrDlpR97b9ybDcxqzZ165UcoKpL_oopMC2BgdmlXON_-hpEKkrEAlm1wccLg
Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Dec 11, 2024 at 11:51=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dp=
u_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-=
v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
