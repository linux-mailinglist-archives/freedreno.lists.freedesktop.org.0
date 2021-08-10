Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803623E503D
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 02:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76ED89C21;
	Tue, 10 Aug 2021 00:06:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F689C21
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 00:06:49 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 a7-20020a9d5c870000b029050333abe08aso6233833oti.13
 for <freedreno@lists.freedesktop.org>; Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
 b=YhtgTTL24J2Q901pxxraRzr2e6aEAsvLQkHaiYTevOHYcVNNb70cjDiaEwdsIq8BXN
 wpYvPIjDyag/iyLToGVOJkKLG7uJdWDBeQ0RrSjIpGoUS+WRXWr4Uuc+9lFlSBwQdix3
 ZJi1BJJhihwUbTrgXthbzJEm8hOQtXIW2ldEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
 b=S9HQB5yQwvgD9RUIJqJVjIu+NZcyCr5WKOl+y/rzpbJwcPkVrbu+RpP3gp0JbgjyGn
 frGcwyyR3ufnqaMBevx4yK67bmTXyFFvX5t803E8ttXm5hrGOxbtCFwVRCaZCIvH3o9v
 8J8jIj3l8lHheqR3w1XwWkkIFT4iLba/KaTw4DhGKH1WhEql967qAm9qtAVrytx2X7RY
 2GgxHkhH0wBfXrHhsEJXYxNBSAQiI6ljaX0Ed5bVYr1okM1+CBRfQdqUWBlIulmaSTaD
 oBnzYN805bWSM/pLRCuOV8QeqPjlrMOYJxTXIAJCweRI1/ZhpGp/WliAA0Ddoa2LNIiV
 Raqw==
X-Gm-Message-State: AOAM533ZV0h00x0auH8phBug6/ikIBXs5B8KDuhW5r2Sr2/UaUB3kWVH
 xIKxhmC/vhBI9LTjY1JuuA6e3y8wfjCzeU29YuwdSQ==
X-Google-Smtp-Source: ABdhPJyHxPiz+4jZdua08WndVHVUUZwOp93vnlfR/lihn4zZ0NeOwGKE8URDZ20NU/NwrBeRkck27YsGd7/EAhlLU98=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr18959569otq.233.1628554009313; 
 Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:06:48 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 9 Aug 2021 17:06:48 -0700
Message-ID: <CAE-0n52+DWvcO54WJEJUaFQ9y=4sb4SeuVzQ5LSXGm24bJ-16w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add drm debug logs to
 dp_pm_resume/suspend
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

Quoting Kuogee Hsieh (2021-08-09 14:58:57)
> Add drm debug logs to dp_pm_resume and dp_pm_suspend to help
> debug suspend/resume issues.
>
> Fixes: 355ab7428f09 ("drm/msm/dp: add debug logs to dp_pm_resume/suspend")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
