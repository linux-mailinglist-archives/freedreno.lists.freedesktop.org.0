Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBD9ED9E0
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1610E08C;
	Wed, 11 Dec 2024 22:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="V4ERCPNd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CA210E0AD
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:34:53 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6d8f75b31bfso41258216d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956493; x=1734561293;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
 b=V4ERCPNdHG7YaO6uFhX6vLkrGvhe/89vlRjX74hqW88LAEuzb4dlq0sGDl0gwJUqAO
 T4C6ox+P+r0DGEwJm1gqsK4tfUGJJuv6txyO6+ZFDLHxqBm0uwowJpPAIESzgmfvE8gA
 YaIdGcjPGqk8eBzKSM6CzQr4Ti5A/6Lq2YEa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956493; x=1734561293;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
 b=CofJYSLSK67QJonc3GTaeyVyY7iT8jx/8irPkn0HWRRLHuWsi2IQ1pyMUEFlyD9/o9
 o+/nGf2xvIsxZD4Z5CG7aDp1OAZ7LD416kycOoNCUKeKKqFXFE9d0yRCOiXLJsjUQuCJ
 UafiREclzKH4ixdP9tGNnVq+OLSjURTdLitnQRxp99R/k9JYKXUgkGadabc9fRPenbHy
 tQOcTvQzPKuZekeaWEDmFwsOWTmawDlarTwVQfBn7IVNtbCFLFc0FAMvruplx6zonXyZ
 b5ccQQnPawH1JVV4ArKh+kmpDab40qpy4G0fk4iWIVYd4S2cXV2IDturGXH2rnM8bbm0
 Vz7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvrbFhdHtehdMyBmU06JBarDElcJ+w5NRJkdg/BKXxMh3EnVRHpCgj1N75Gi4iztBFO4zHRASS1nM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVvULQ+2WvM8IOkPTN6tnVy52KHS2Z2o0zO9zxUYRh7zd/VqqP
 xMyr/EPdwfpVHwWxFaLCBcG2s49JbHxLjNdsuR2guZpqdzIjQ7WGFM0D33V+pdBqRLeJpUDQJwR
 27jqpb/2cZpYwX9v0yetAtuTgh5jsLbDbJVkH
X-Gm-Gg: ASbGnct8T4S5TDl4Rl31cIrhBz7+DnFoavCsktGVCJJY/aBB6pKWe6foBL0tYQYNGMf
 Dm1Rg2KikWhJGq43J6wOtFj6xuzcoNsGnPZm9IRvWC4BPi4HPUTQ6UER+NEfs3kg=
X-Google-Smtp-Source: AGHT+IEmNl1A02u+Et+QaYelQl7de4pzHAlegixn/lag8TVHIDn3QbqOGZ1uvtk5TAuOj8J/cuxjMvpZP+M69zQwnG4=
X-Received: by 2002:a05:6214:d83:b0:6d8:9c50:52be with SMTP id
 6a1803df08f44-6dae39a1d71mr15934046d6.44.1733956493056; Wed, 11 Dec 2024
 14:34:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:34:52 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:34:52 -0800
Message-ID: <CAE-0n50Ei+DodV6VRmm_aSEZ_DdeMZ_vMnK7Mq0=X441B+YreQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:39)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
[...]
> +               .HB0 = 0x00,
> +               .HB1 = 0x06,
> +               .HB2 = 0x0f,
> +               .HB3 = 0x00,
> +       };
> +       u32 header[2];
> +       u32 reg;
> +
> +       /* XXX: is it necessary to preserve this field? */

Maybe qcom can comment.

> +       reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> +       sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> +
> +       msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
