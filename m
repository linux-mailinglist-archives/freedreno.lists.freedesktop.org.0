Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35877700E8
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 15:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1C10E083;
	Fri,  4 Aug 2023 13:14:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3110E087
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 13:14:35 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d0a8ae5f8a6so2285632276.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691154874; x=1691759674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
 b=Mrg4Xr5v0lFTFocRyHHEc/zy5oeKvOxVeaf08lVJ7qOu9G25xP8Yl2opzmsjEGYjsW
 0Om3zPnCCY0EABOYWclpfzyb+ZiGjyUErocqO/LbH1SMmdC1cHvm0nefne0a4NwzTe3o
 ue082SJuCjExtQm7w3FilO5271WrroN8Tr/rEi0ohb4LtN6m69c3a2n96V8XNIyxBUx4
 tlauYnDu6Qi2QCQrDTUpc4Zi2ML5ZWE3rse4yDzvKi8Bn7tARoEZpjPHp9q1TR1d3WoE
 nkAXfDqMUV7FVUs6eeffv5TVKg9VO3vYmspm+FS25ZPGsZV5vLgpC6mPw4o9Th0llI1s
 HipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154874; x=1691759674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
 b=I8wzoMNWvqafH3SSdowXKFHlcvQi5eFZ1sjGeP04RpgRvD1PsAMBGTTEsEmKmvwCAm
 fpyxxsPZ3/J6RlvgDKUHcJkpySoCyK5DKoJNuAB/lsqrkJ1IftKgTr3cJpVmS7EXSm2/
 bcc8lo7VnEKvTi2PBQO8R5xunwbGCst957WYX4KgiXXuVcj03XQE7J5NmV8t6M5e9e1Y
 We48/GWu5gLHJKt/AxkFGoG6a6J68eyi1aiL9VouG2e1/eTm4Ii8XajM8UAErn0eCS8K
 0/9UegtDAhxor5IQYO9ESEqzcv8jXtSZmVSkky5VDY+0slQAe0Rv5Z9R1lNhKtV2x4zA
 m3xA==
X-Gm-Message-State: AOJu0YyWxt68F0PusmpXhEUJFjMllh5KyMAq4wmPyHqDj/JxRWz9s/Sk
 zXbQcTo0shF1skK8t9o/mGiG7ly+BHIW2uUGaQL64Q==
X-Google-Smtp-Source: AGHT+IG/YtX9++/di3aekXINcH9r4zmIZn1VPvqr+jVi9AWhqoV2uRrOWWP2zNSUOl6v7/OqmARiYdzthQYNo4Bm61c=
X-Received: by 2002:a25:29c2:0:b0:c62:2320:2598 with SMTP id
 p185-20020a2529c2000000b00c6223202598mr1173682ybp.62.1691154874341; Fri, 04
 Aug 2023 06:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
In-Reply-To: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 16:14:23 +0300
Message-ID: <CAA8EJpp6mijmo2A5xn2aG2PwsAh9mr0v3+ruDgoqLKTawme-xA@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 20:01, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> In addition drop the dpu_enc_ktime_template event class as it will be
> unused after the vsync_event handlers are dropped.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Dropped dpu_enc_early_kickoff event and dpu_enc_ktime_template event class
> - Link to v1: https://lore.kernel.org/r/20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 23 ----------
>  2 files changed, 1 insertion(+), 87 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
