Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9B84936E
	for <lists+freedreno@lfdr.de>; Mon,  5 Feb 2024 06:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710711238C;
	Mon,  5 Feb 2024 05:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lexUZnCf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049811238C
 for <freedreno@lists.freedesktop.org>; Mon,  5 Feb 2024 05:37:36 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso3957865276.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 Feb 2024 21:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707111456; x=1707716256; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wJjNw35YY1+xIX+ZjXNQI8+RD6p5g5mUPgiVQOnjdUA=;
 b=lexUZnCflUc9k8Y/iWKSchQ8Esn2DgYmLyx+I0NzJj4l47wDo8QFoW77SsfLQdZkRj
 zPRvAnfgEL36xDqsEmQq7bLFqheBxAfqWrFtH0dloo9QrYbCUti031JcAGw8/yQaHFcn
 +9vuMRmq/zV/T4rTvE5KelNSA0vAV/hD977/uzVr5h7Cg0t7d0PwNMiu9P3ef+8PHdsF
 ulFxSnwrFCSxdiDmDN9HB7m63UWcs924T4hNOGJaG4hSgWZzHKKEQn9oyN/5EDTsc4zm
 A9xEf8k/0wAdQrFThOenMrtuiMuf+DHNW06QkSNWy2hfAzjMOyKVV3OCh+wT3JYZsQOX
 FM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707111456; x=1707716256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJjNw35YY1+xIX+ZjXNQI8+RD6p5g5mUPgiVQOnjdUA=;
 b=PZc4x0Mi+S0Bg3olTjn4nEElO+K/i7qEqi3ksluJ9+m9a36eTjKBK9W+r5GMCZN33K
 INrmnyUH/bMopCA1jZie6R41I1Tz8MyaZaskgFd1HIfMHcht/KQ9W+Jo2MWf8RRBgkUw
 zYpEhetwjeuyme0dA7AF5500UAr4nNUVzD2dc0LsxFbiDl0OQC5bB5IaMKIkSpbTocG9
 WYlJjYJ988fnWb3BDtvxbtw5ji7Efx0V20Kk/7YO4XJzdxomychpI1TmC/dY0XxtcUtx
 KWD/51B9UQ2exYnbFJ6GJpftXC5TNdgLrHEQA+09xdFcdEprUMhOjxWT3NLi4I9kqVnd
 zehg==
X-Gm-Message-State: AOJu0Yx7R3/ICe7VxkcxvMA9N98S9rpkeNyBwjsSffjmui72pyxxyOVT
 zM4LS4+8Wq4pQKcb4DNBU7M7/NrnbFK++PiNkarHjsf0jY9a4r1j9yDbB4DGuWArYOgDtJ3xAv0
 QMuP40+C9O5OMZnXB0VQph4cjyBrOSTV0FEMEuA==
X-Google-Smtp-Source: AGHT+IH5h/GfScQ8uw8fhFGuFhxI9uT/VT10/zpE4KPupj/LoHJfbss5PCVGWktP+vBdNies+A9M979a/66kKLxePN8=
X-Received: by 2002:a25:2681:0:b0:dc6:c2b2:c039 with SMTP id
 m123-20020a252681000000b00dc6c2b2c039mr12445401ybm.41.1707111455954; Sun, 04
 Feb 2024 21:37:35 -0800 (PST)
MIME-Version: 1.0
References: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
In-Reply-To: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Feb 2024 06:37:25 +0100
Message-ID: <CAA8EJpqBJDQ=Yodw8mQF-M7UFVA9POokqgM2rmErTSOASyMo7g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge
 is enabled
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
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

On Sun, 4 Feb 2024 at 18:45, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When the topology calls for two interfaces on the current fixed topology
> of 2 DSC blocks, or uses 1 DSC block for a single interface (e.g. SC7280
> with only one DSC block), there should be no merging of DSC output.
>
> This is already represented by the return value of
> dpu_encoder_use_dsc_merge(), but not yet used to correctly configure
> this flag.
>
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that more changes are needed to properly support the proposed 2:2:2
> and 1:1:1 topology (in contrast to the already-supported 2:2:1 topology),
> but this could be a trivial patch to get going separately before all that
> extra work is done.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
