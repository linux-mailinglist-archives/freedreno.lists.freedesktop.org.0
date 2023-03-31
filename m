Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C716D2343
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 16:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F3E10F292;
	Fri, 31 Mar 2023 14:58:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41710F292
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 14:58:24 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id e65so27664304ybh.10
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
 b=RiEUbASd4Nv2bK5U0NfdCxz+zGU9jvca9t9L9dX8WOCA+TKl2+UavAzbHhwokVPtii
 Ns/nmgxsMfcFREXylGBnoQNH6yVWzO9I2/Lr3fBUhDBuQ1B02+IPW9wI7Go+UeQ767GJ
 EhsoUgCVLsyu3PM+cZRxuOjp9fXxG+208DkvZObKFf5+Y4mixJ7fwrqXVbbPt7cvcmzD
 GgRTzUc4OrI0bZSmug8TxFMTjUjrbMYcNWhYjrwVdDTxEPvyavmLqideHlzGIoFLPTw+
 WE795LitI1h0crKga2+zmrGOIs39+D7z1ih/3NIVqwwwnnbEjuSYrYJrTMzC7ozAKF+L
 5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
 b=OALFAltIihfSpWej091TFUjv87FSfIyF66dHsFGsudjCsT1i+d+TgvYuUMeZ/lmikT
 XWrPoZ1wV1tFrib9GeR1aDxbjratuDAI/SyW+V4HC97kuV4BvJYDGgJMsd4rcXspf9JC
 9S/aLDITqjSOD8C/bi+e3BocQnycBd8UZi5FH/gL/s+DKj9srEqdDHvQnhaAq4wK4/M5
 nIsxpEO1mQs82tjmBe8FpZuQybY2PCskOcqZcFKi/jm3EiyGtcdi3Mc6fYYW1EmSn7pG
 jucvGNGO3rb0Op9/G2I86eA1Zt/Y57j0ukur6nua+JhXJE6mOobDDq63KSzy1Gbx3WTq
 FKVA==
X-Gm-Message-State: AAQBX9dc1ODyDmcTd08coYxcA+XTI4yeOJwBwF1EWBntoYNeoyNR29ia
 G8MdE2FasaYv3oiZZaY8wiGFJhG85mGPOBI8ZEgvQw==
X-Google-Smtp-Source: AKy350asvDklS51ndeBMVx+J7/M6JaGcY9r/+cXahsDugorB/yziYIP20bAOPlDlUaFmd1YvBHiWeGw991/U9/QIB18=
X-Received: by 2002:a25:d747:0:b0:b82:410e:daae with SMTP id
 o68-20020a25d747000000b00b82410edaaemr211714ybg.9.1680274703429; Fri, 31 Mar
 2023 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 17:58:12 +0300
Message-ID: <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 3/3] msm: skip the atomic commit of self
 refresh while PSR running
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                         new_crtc_state->mode_changed = true;
>                         state->allow_modeset = true;
>                 }
> +
> +               if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +                       return -EINVAL;

EINVAL here means that atomic_check will fail if both old and new
states are in SR mode. For example, there might be a mode set for
another CRTC (while keeping this one in SR mode). I don't think this
is correct. We should skip/shortcut the commit, that's true. But I
doubt that returning an error here is a proper way to do this. Please
correct me if I'm wrong.

>         }
>
>         return drm_atomic_helper_check(dev, state);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
