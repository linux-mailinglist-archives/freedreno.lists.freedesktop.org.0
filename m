Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28E9ED661
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 20:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C610EC02;
	Wed, 11 Dec 2024 19:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0AeIbHI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE78410EC00
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 19:22:06 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30229d5b1caso31273021fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733944925; x=1734549725; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
 b=B0AeIbHIUSq607/t+edx4VpnmVxnTqcSM2ZAGouPVa7UiSTtwttVn/2baRFBp2ZYc9
 tvGE8mJOm+SZztkPHvaulvx4Md22eZhCHo2BnsuUxgMhrBED6d8qQeVTkEqQ60HuVn2g
 atM9j+3GiBJnoc4wRjRgSAINLLSrFP2a6ajW7BYgZ2nKiO0SUEmFLU5yqipNzxvolOuI
 ssBjQbpaX7tz//97szhwM7zDtv80Kdmrp9SJaHJSENn1Bj9e7COtqWDekdGpsyslAQMk
 kKYPQz+NFg/aEDl8bD8P/5FhqBWuOjgT0aQgtirioX9dQC9EE0p09mUFOu5C8F+JobIw
 B6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733944925; x=1734549725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
 b=kOZlzw2n1Sj2V0EcQh7jcpwzobwiPVVzThT4OAvB4uzkgVytIE6cRfR/h/6l5bIU6g
 R9TZEdcZqN8LaN6LthtW3FboDRnXX6ikIGGUMYY2JOpYHYo0vX1vK246e7+SWC4YMPkY
 GiA7ERxlY8qjOBPCZtpksJcIRdbBCwyjeSfoUrSZLoIbGYSzPWVxGuMpShPNeGbj5irB
 bojmq2ijftWjb7dRgF/HQfrx7q0WAdsUcNZDVPskGjSrhd4TswcupGlk1ao9qLuDqO0R
 6sHX0rhthLi77q94/elt9tM7PO9ziwRUtnI5x17Cx1zbZSJvUp1mif5pgiPs4rCmtbEk
 1JyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW083GObF0OHoCl2GYd08w7v0YZ17o7akGBm3IwmtwjFkO66cZoteqWr2r//Db/wR3ah99M5WphzpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjFKeuHNBjYav2LnxE8i0d3xjrZOaQY0M7jir3VN8KXkVnNC6l
 udYuIiCkLrg1AvH9YdrNPcWi6PMfADeCagZyA7T/rL3VGAHDVh8Oq1QrKQQvM9Y=
X-Gm-Gg: ASbGncvysjWuP6+u1VhIEku+bJGBI8f7XJ3qLTRJyeX0f1QaUKpodUvEIjEuJihghiI
 ZheYPc3EJtIMO+F6iPJbmfZpo4F8u1PiDZTuXE9QAiIrfYUVu8t4pJd74dBmZKQ7dcpJx4LqxsI
 T+DUz7dsmliNDEAowcmo847eL5mbHUWBHlbYU6p+tWlLK7hPCduOgaolGN+J7OUGW+FcSJyfnRc
 0SKp0qmO0m8rzguKKyL0hjVFnuU3JzQ/rz/rAItXuMCTFqMQ+lOg5nWp8P1qoYzJFPHTZUuSIuI
 GwXaRlG+l7/iIYYXrAnqQDWFPvLlkoyX6w==
X-Google-Smtp-Source: AGHT+IE7tOuuyi7X6war4XV8L7zXaUOuiy/zuezb7qOEEGBSx8kQ05R5q5SvNGFQfCAc2tJou2uPgw==
X-Received: by 2002:a19:8c1c:0:b0:540:2ff1:309d with SMTP id
 2adb3069b0e04-5402ff1319cmr40692e87.34.1733944924716; 
 Wed, 11 Dec 2024 11:22:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e38dcdd1esm1617171e87.124.2024.12.11.11.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:22:03 -0800 (PST)
Date: Wed, 11 Dec 2024 21:22:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
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

On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 52 insertions(+)
> 


> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);
> +
> +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> +		return 0;
> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> +	 * the number of LTTPRs is invalid
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);

This means that if lttpr_count < 0, then there will be two requests to
set LTTPRs to a transparent mode. Is that expected?

> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);
> +

-- 
With best wishes
Dmitry
