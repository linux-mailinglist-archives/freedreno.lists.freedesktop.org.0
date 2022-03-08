Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18F4D22B9
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E910E3EE;
	Tue,  8 Mar 2022 20:36:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FB810E3EE
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:36:08 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso404601ooe.6
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
 b=kilFiNI5uz22iSJPK1Gt8KB1l705LrDfOOJTBrWLBRjWLsOv9Vx0dmkSuJDHS8YUR4
 nj6Cgp99iN79rUXo3IbjsynDHsneQ2aM2fN8+C5qTK/Zxryr437+/N8aV9hz+KVWy5Ex
 dypcGDKJ1gAJcXM4b5HIFVedOF0n22V06x7BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
 b=AAOkmFAE8X9hqwad1SDdR+FcMCOsG/bA+w8seDmNicBt//pkFlSzdHotsxW2Rj7cBZ
 G4QJ7OyBB58zkU5hETKsaUrmp5KbCG3jw5MIgt7G+i29wggu/hi43YJpinUit36Tqq5+
 E+3hqWrYxeoo3cPrue51Tc37PDo1ncG+xlWy+beGOWyzp+qr1B+odLelrQV51ZCKiNoD
 F5N1nqNDxbqz40PzQIpc5gXjwftrsfSpuHveWrngdOf02uUnqsZKKIwyZ+topCus0jmb
 wyfq0gwLASVsR/FImvZs7BVSP8y87hkQgaKkcPsoqfIFYKb0qfI175Uc8S2bioti/Gbo
 DGwg==
X-Gm-Message-State: AOAM530n+YFVPLxyvdmMl/A09zuTYiC4VP5RYpnPypNK0+FIBOheEbme
 ykzn6Sq7FGhKZYpxRnke2v7pjkM8qdb8ouVRP0SN4Iz/Rok=
X-Google-Smtp-Source: ABdhPJxx/oEwjmfSR8atG/+Wq8RQXmGfnslvHo7Kqa54uPuTrLx6bcwyb6JqhK/QYSqu5rmC2ZrOkU7VXX3UHlgihBY=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3492462oac.193.1646771767902; Tue, 08
 Mar 2022 12:36:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:36:07 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:36:07 -0800
Message-ID: <CAE-0n50jrtvunQgj40nrwOjrZrsKunOixnHGjMCvu+wEHG2nLg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/5] drm/msm: allow compile time
 selection of driver components
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

Quoting Dmitry Baryshkov (2022-03-03 19:21:06)
> MSM DRM driver already allows one to compile out the DP or DSI support.
> Add support for disabling other features like MDP4/MDP5/DPU drivers or
> direct HDMI output support.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
