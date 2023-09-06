Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23A794568
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 23:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD0C10E70E;
	Wed,  6 Sep 2023 21:49:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8910E72A
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 21:49:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5007616b756so406485e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694036943; x=1694641743;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
 b=JSvFh1M+XCdJte7ze09ho7G9I3StqhkDKB7EgoD7ycOYufoY2qVmf2NVyTvqnIuVkf
 0xqa8rADtgL/yGss1EyQ1mhrPkoJBGJZuT9hY22S2pH3VXFacj4i5MoR+D01qN6liczF
 dpORPUm/utGKrax+4SJhqsjbI8HHBUH3aDcGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036943; x=1694641743;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
 b=WSowqqFq034mmzEM6nGwgVt56rQVKiPD4w3HcYpVJ2ieg2atuiMYVSuUs9oTX9P3aY
 ndPw7UaTT+sM9j17a0e1CILmfoETc5XGUkMFNr98z6TS1wpCdqcDPudjwRzLRqXOhEAs
 qilMbQLngzSidsQWd2+XxGOkGCjXCqAD54eG1/1UWuLBnMs9A3pTN8VJpZ0DVBXR3b82
 kOditVObW5wqDtBh4ilhDHT+Jj054hTJNRSRONpbgVtZKf8aYkxfUT0Aq74RHxJ6Khej
 B/aV6ZTn8pzgsz2zgQ72lUS/IPyvyDc9jZC18MpWAGYTEWPaexoUfN19Rm+hCm/m+TTN
 KE0Q==
X-Gm-Message-State: AOJu0YzvBgYcO03HF0XJ3frX9Bk2tBajvsvuRyVdu5y2mwfeYZI0/cu+
 R2QGLWC8MGzmYS/8M7pFmsndzOr2V6Q8V9/VjPEt/Q==
X-Google-Smtp-Source: AGHT+IEppiQEcjzv1kgekJwTQhO9E5ahaKHYtKaSUNZr55bKaMROTpPQkM9dHWVlUeNxngRoEUY4F5A8nlqEYK7E/PY=
X-Received: by 2002:ac2:5f9c:0:b0:4ff:a8c6:d1aa with SMTP id
 r28-20020ac25f9c000000b004ffa8c6d1aamr2949184lfe.48.1694036943232; Wed, 06
 Sep 2023 14:49:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:49:02 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:49:02 -0500
Message-ID: <CAE-0n52-eL=McFLPPSENFE_ziA6E2ghsdM3JrVdfS4jFXgJT8w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/8] drm/msm/dpu: inline
 _setup_pingpong_ops()
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:47)
> Inline the _setup_pingpong_ops() function, it makes it easier to handle
> different conditions involving PINGPONG configuration.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
