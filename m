Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4C9ED83B
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 22:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573B10E630;
	Wed, 11 Dec 2024 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jKUR2A7x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5710E630
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 21:14:42 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3a1cfeb711so3724217276.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733951681; x=1734556481;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
 b=jKUR2A7xIZaeP2p1zdAXOmyfdjQvbZY5evnsOQecUzROuSkNrYK7feYOHbUxEaegzK
 Ia39wpAf9TNWJxzU+DxO021esHAT/u72Rbx7dhF3lCYnU7k1UEPZ4tGY7FoDhO/jfmAA
 NvGm82G7cUGJ/IiH4t1FkgPLqfgSfDkhmNDXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951681; x=1734556481;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezBwnwc54xrxIW8WnnX9hiVaqGX6VzJ/z+kaEQox7Lk=;
 b=w1XJEhj4OTWAczKs0Gx/TipuTpDH2d/XEOutSzVtk3XjZwTWD0owa7DDZSbKrDLmyS
 ZtMsQdQQcI1/wcH6qiwHYEqraNjV7IHaXGNpzrEjmPo5J1k3uEhXKF6hICGLkawDkZxe
 RkqarxX6dbuRWmsi5bX7OImx9ffXaEj+IddrLj3uLYyteHpekzAepok2mGlZQL0Lx52D
 zzpm6m7CqIOzHJf+0rsYshjjzM+s0e8HmgcdB9/CXtb8ZbW8R1ls43704R9LxUtIXY/2
 agUgrW6oYO9FLGfaul4r++5jspHjTDwmfMu+XS19/Br3NKg09UgmvbNwvwvjHpNpNuCf
 7t4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJkZ9belLGhjkjSWg3V5cdH4eXnSVkoNECLFzfFa/gwayvViBmcG5i8CTLw31yIFk6+0zvlFDdrdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW9pHpCwtfK3nAohRFbn0w3aOYsl3bJYSY2mlfdwc6O3VVg4II
 t7HBXALFVdD7VONHfXO7weNZM3i2jT9ul5GQog3DGZHSxuvCgAB70Y7S9w2gskoAdxOiLhBXH1/
 je+A6EQETUg1q1ojFXojxdblPfRxJ2ITwoQiO
X-Gm-Gg: ASbGnctnf81TlGFFVgc2xWWfM1eBuQZCT1eALO4zEzRiImYVSsjhMqJkNFuOoKTAFB9
 Ne1MIR9VsF/btqG0ADhjh4kiZDjsUVKmANUrXQl7EAwXhXhUCJKxqDyBw1f7WmsM=
X-Google-Smtp-Source: AGHT+IGVGcprZk95xhhOtOKM+7JPgPvLrPlsxoiz5xiivClwV1s7VtMi2gtLbOTTJ+cbuh16Xk9oGKjJ+Ksx04T7VN4=
X-Received: by 2002:a05:6902:1447:b0:e3a:5820:febb with SMTP id
 3f1490d57ef6-e3da1df70c1mr852810276.32.1733951681689; Wed, 11 Dec 2024
 13:14:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:14:41 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-6-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:14:41 -0800
Message-ID: <CAE-0n52+nKDyzUPzg_uFsLXRh4XQW+TngD6PyuvetTKXthi_tg@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] drm/msm/dp: move/inline AUX register functions
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:36)
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index bc8d46abfc619d669dce339477d58fb0c464a3ea..46e8a2e13ac1d1249fbad9b50a6d64c52d51cf38 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -45,6 +46,73 @@ struct msm_dp_aux_private {
>         struct drm_dp_aux msm_dp_aux;
>  };
>
> +static int msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)

Can you make this return void as well?

> +{
> +       struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
> +
> +       msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
> +       msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
> +
> +       return 0;
> +}
