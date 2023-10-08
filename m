Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85E7BCFF0
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 22:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4116910E068;
	Sun,  8 Oct 2023 20:00:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15D910E03B
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 20:00:03 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d862533ea85so4580492276.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696795202; x=1697400002; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2eWQS+wABqdAVoM6ZVRN79K1EujhH8FxWaSNWwoMdbY=;
 b=PzTem6P5rEPu/g32l8i6vtV5QDzUkg9NSBgZapO6LM9wcnKWbHs2iiutvW9xJe9BZU
 tk7A9qEbC7BrALp1KWoz6xmVKQy14WOfRoAPEzhFuJCF9/G6fNEf63LgGLn2OkahvHMV
 S2QmCvJt9yMgtqiL2CVhkq4YqLqKhxcsMTX6abs/v6hm0sWTyC9jzYJDSTc1rXcLkl1Q
 LyEUcFOrP/9kLHo4+FHdW19iLXQ4GkOGCFKbS3IExAfpqO8vb/4PWpGQdc5y9rvLRFgJ
 CshU4hb76Dc1Hf52Z4mRS2QOc5mIPujD/EHDzlECjqu4SSQH5n+9sjE/qpNLdfaqdNn0
 qQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696795202; x=1697400002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2eWQS+wABqdAVoM6ZVRN79K1EujhH8FxWaSNWwoMdbY=;
 b=ViAFphf6ngUdZ/qJmQsHY0AfB/Y4FsNXoMDammgJ4ZDK5jUnglEh5akrQPSFQqhWyH
 4YPFn1TXRRTKHrNB3xVDqokjPLw9ON724iVJxVndpxvVVawPDIlNIF6XdEzqqMQnWA29
 RBzip7CL+cN5H/wG/M/u6r4mY7G4QTcqbF8tKPFkUkWqZ9qzTWaRF3YfkfQJHt9D4aDe
 wp43YOISX2LAq7LjVSoSc09xdrEjwJ62MkRF1kpfQoi1K0zxVlM+U/p/aEDnJDb9vgCr
 OJbr/zl+TxfBDLN0QYvcMeSUPZ/33vc5FipAWW0CZtaNhmghnEcLt+HW4P2thO6ie+Lu
 eVdQ==
X-Gm-Message-State: AOJu0YyyNKHuTUdTJ3IH4bkxWFXfdipvAqVjJRo32/q5yhAcyRBLibsm
 BmG5hVwEtckIHV1zL8jyXK4YBPfJkU92V8/n1K3F4w==
X-Google-Smtp-Source: AGHT+IF5uHocDVEehYHwATnyUF2wBSy1xa65UxYQAxkUfPBXcnqMQFryQVME6DT00RvcJN2KycDZLyIzKS1iEqzbLvg=
X-Received: by 2002:a25:5503:0:b0:d91:c488:5b65 with SMTP id
 j3-20020a255503000000b00d91c4885b65mr8239359ybb.31.1696795201929; Sun, 08 Oct
 2023 13:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231008175615.413497-1-robdclark@gmail.com>
In-Reply-To: <20231008175615.413497-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 8 Oct 2023 22:59:50 +0300
Message-ID: <CAA8EJppgUmkLrhTw779tq5wkgXfu4sypGrQbJFYtrnCrbwa3=Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Use the encoder for default
 CRC source
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
 Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Helen Koike <helen.koike@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 8 Oct 2023 at 20:56, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> i-g-t expects the CRC to reflect any applied CTM.  But the layer mixer
> source is upstream of the DSPP, so it is before the CTM is applied.
>
> Switch the default source to 'encoder' instead so that the CRC is
> captured downstream of the DSPP.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt |  4 ----
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt |  5 -----
>  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt | 11 +----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  6 +++---

I'm not sure, if updating the CI skip list together with the
functional changs is a good idea, my preference would be towards two
separate patches.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  4 files changed, 4 insertions(+), 22 deletions(-)


-- 
With best wishes
Dmitry
