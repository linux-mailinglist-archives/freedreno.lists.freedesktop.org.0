Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3BE486F1E
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90A10EAE5;
	Fri,  7 Jan 2022 00:53:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADE10EAE5
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:53:29 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so4949652otu.10
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
 b=FRUqR4QwchxI3llxfhdNdykMyi16FLkC3n7I1Ac516fAxo9xniQwI0Ms3jeeZ4WrD/
 dC3IvIuty6qVmiMqt2ICkeG2C/VHno2euq/A5tX9cSdCoSBx7r7AR72gbPVB3g4707Rh
 CzONEFsFX/tRLB1idnqT4QPEBEEtVLEuCmO2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
 b=7F0vU4iHNkxzqAwXmExUU1DUVndixUNCf0HqUj+7/INzpqjOVr1hmA8RvCAIyoKfoP
 CjDfAv4l6qtFJ80JKCJtQ/PApgd5ZlJWB9ODifmYhOGLC/dpp8Bub3XXbIVYR4zNaWfL
 0O628VSI/ZkbpYQabPX0/o3SvuIJUf42T4EW/K8h/FteVU9PHybLd3Xq76uDg8EJzeUV
 QGW/SKv6PymEGLyZ9kGzpz9G/dnlryOTn821A/bqFZLyv6nHA0f5qxsCuMheyPvidmUm
 vlg4cEpe14P0JffessI/InyIvw7zxrFEMluBipJn1xoXm6icvSVpIwnMNov+h7QQglSo
 o+qQ==
X-Gm-Message-State: AOAM531GIpo0BTYsomqB0c3NA5QcwSSEk+MW3ItBulKDsRyDylM28fph
 ByLsUx7td/t9lV/sQXS4CM3xTutUxOaCrI1n+xfILVOxVNk=
X-Google-Smtp-Source: ABdhPJwSKDzu+nMqGQvxjht/3U4F2wicx9+GJ22pBtNGUIRUIp5sFm092+riUAmgWDhW5NgpOHw37OdDP9M8PvRPzFU=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr753580otk.159.1641516808695; 
 Thu, 06 Jan 2022 16:53:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:53:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:53:28 -0800
Message-ID: <CAE-0n50ZOAzmNsjv9o1FtXW1rYLaKmd_UZwO1dMKTamdL9nFOA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/5] drm/msm/dpu: drop unused
 lm_max_width from RM
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:27)
> No code uses lm_max_width from resource manager, so drop it. Instead of
> calculating the lm_max_width, code can use max_mixer_width field from
> the hw catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
