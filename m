Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C799EFCAD
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 20:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0C710E146;
	Thu, 12 Dec 2024 19:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K1495VFm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840D10EE98
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 19:44:09 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7b6f0afda3fso99942485a.2
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734032649; x=1734637449;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
 b=K1495VFm6BpMTQrPAJs1LVhSDQkqiupFQodeu0UQ2gWU0a4CmcHXkfe4Pait7f02Zn
 KRPxXLHg7F+vMQupfpwuNDqmgrEqowL4ZcMrZa7KXU3p0bBK6G7cM5AgCbgvBo56Esm7
 vZBlFR0QOG+82e/AMWkjQKh/q/3SUTMug/QhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734032649; x=1734637449;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOwm6pPXwkM6tnMe7tNVUkQBZxbqhnbT7YBGfwH78PM=;
 b=StZocrl7gZmK/vYL2AwR+MgZ7SyPu11xI4QhckKUrBwCBdSpQMeSxVkqJ96IUqNDfr
 2ZLDgIA+mbiCqx6F+i4pw1TTiUErVk+yAcGZ0u+splFdDnHbVGKl8yA1g/CUjQJ3hPuC
 /GTcvu6dF7cZ4LqfKmwgSikZglPDZ/wQktdbPOhQls0gKK+QfomUFNyvLFqru4cKMLAq
 U6bQYLlSqZ9aUK+fbkj/elRSEYqZ5JSkgCgqvF4yL2mKcg/Tawb/SVpWvsBplQlGuXRl
 uOc8ttpNUFab0uQLTt0dPO+V0okiJlV1A/usPUnxz2C/2dvf407JY8ndOnRqSvPzUV8e
 m2Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPJCXrOHYQUvqnyvco8e39uCEtwl3w2fWRsFh8U7gLzoPWYccHmXC3RsOCvr5F7NYP603BKBIxljY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxiow1GfBxg6EwgDngrHNqKVEF8+otlKR6HjcrbR3SV7yE5hKIq
 qUx/FWY0ygF7K/yvX5oYD/y/syqjFnvo7KcQBoEfQk7oXJlu9fJWPy2vOk7OgwrrLqlF1+sVQMy
 9HA08GosxqASvVzpWtBKDsgznQleBt8tx26RD
X-Gm-Gg: ASbGncv2QiqNc+nm43lqEH4cXwOZV2kASTciLoLISpx15eO/EKmWc0g6zuCN4VSJkzu
 WPdGkJutXj7OnTr+YNkWcwINJ+tf9tL4Vdk9tZhojN1wtZov+0MzNH5syW4vSWEPpeg==
X-Google-Smtp-Source: AGHT+IHlXSEQ2wG5xyF2Aa1OBgLaNUi0yxcdOEzjtF/Id9mL9j+4TPLwCfOsk3qZGjqHtCyb1hPI6wo56A7bYwjCxyw=
X-Received: by 2002:ac8:7fc2:0:b0:467:81f0:6d63 with SMTP id
 d75a77b69052e-467a15c7a0bmr31511991cf.17.1734032648880; Thu, 12 Dec 2024
 11:44:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 14:44:08 -0500
MIME-Version: 1.0
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 14:44:08 -0500
Message-ID: <CAE-0n509akHPXM8t6QCTO1cydhJzv_Tu9xTtGze8=bY-rUN=oQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-12-11 11:50:26)
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
