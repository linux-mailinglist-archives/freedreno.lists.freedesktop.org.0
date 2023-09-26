Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CF7AEA3C
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 12:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C90110E39C;
	Tue, 26 Sep 2023 10:21:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AA210E389
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 10:20:59 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-59f6041395dso63602547b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695723659; x=1696328459; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7cJFhOb7t5Ix8iaURWtIsSLoskJCiWsX4e1QNdB7IE=;
 b=ahZT8bYcer1BTlz9XvGlJqf3ymCD3MxohurH6ryDDnbWrG/RYEx/TsLsXKjESMgYEx
 YP8UWiXaO5TyKkELFujgJboi2AY1gFOW1YWBYQ5EbyeKFWJKF1rpP1U/y+K2MaxdkwZ8
 LdatbY9gzxZ+eZrh7FTTN0Qn9tDP/NezLYsUvthgx32moU4goe/VI6l3z+tCg+Ll4q7Z
 EN9oPlBwE9GbCgdkhBX9DkZIhANe0Fpxzr2bWeEmqtbnkjRb8WugD4Cj+7L4btZ5L44X
 jC0z9oZHk69GLUo/vNL+vBgyRVDdO+UUaU80sazAXdB04RAr6EdMI+hH6Dd4Q76Ybxcw
 OfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695723659; x=1696328459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7cJFhOb7t5Ix8iaURWtIsSLoskJCiWsX4e1QNdB7IE=;
 b=WDJcm7W0GcgA7l6zo5mcHgQiLXxlbfuzCfZHaMLQc+x+sxuGokBOkNKG8usy9G8wET
 4XYB0o0XcK10DtpuEw4Jovj6J6ahuk99+AXsIL3sinwkJ6zh2Hhy9ZMeghnzVp19/KZr
 9RhVYZlIGCrnj0XJdRZNv1u8hvSG+V7uUkCXPQqDAN0HM7GvVe2FU1K69ETBbOrxresn
 pjTuAbEAj/msUEp5JpJg5A4Q9eWJ4Rfj26lbR/HkMKrV3LBAJfkGDw9iddEdHnpxaZXj
 NUXXBRTwZdp3LHbM5rLXGe1nXJR832ERbdcDSt+gof2NFCVU/eqGgL9/XlzxAoWP0LbD
 Do/A==
X-Gm-Message-State: AOJu0YxLLwejJ2K0z+SAVxmG0w5zIqJm6Zr9A3kevWUxA7NMjHVGJNE6
 3Nk8RMTRWqoM1ORrJTsx5DOiWi+E9uZK7vzATbKsZQ==
X-Google-Smtp-Source: AGHT+IEWYOJ9taaGh0PkabxpCEUGNezaZuflzZehi3vKviCYxKZE7piisyJy7s6QgSXcRkCOW+2l/NpKDudM3y/juvU=
X-Received: by 2002:a0d:fb83:0:b0:592:9035:8356 with SMTP id
 l125-20020a0dfb83000000b0059290358356mr10373886ywf.26.1695723658832; Tue, 26
 Sep 2023 03:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
 <20230911221627.9569-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230911221627.9569-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Sep 2023 13:19:52 +0300
Message-ID: <CAA8EJpq+rDGoC43F=S6Xb=N-V0J-4xB8gdB+M+dpK=USoA8D8w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: try multirect based on
 mdp clock limits
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 nespera@igalia.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Sept 2023 at 01:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> It's certainly possible that for large resolutions a single DPU SSPP
> cannot process the image without exceeding the MDP clock limits but
> it can still process it in multirect mode because the source rectangles
> will get divided and can fall within the MDP clock limits.
>
> If the SSPP cannot process the image even in multirect mode, then it
> will be rejected in dpu_plane_atomic_check_pipe().
>
> Hence try using multirect for resolutions which cannot be processed
> by a single SSPP without exceeding the MDP clock limits.
>
> changes in v2:
>         - use crtc_state's adjusted_mode instead of mode
>         - fix the UBWC condition to check maxlinewidth
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
