Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281C9A4002A
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 20:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953A610E2EC;
	Fri, 21 Feb 2025 19:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IWfEhErS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090810E2EC
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 19:59:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-546202d633dso2648185e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 11:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740167940; x=1740772740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bnb83UtqsBWTiNAjltn4JLaoZM1hQGViXgrYc69juLI=;
 b=IWfEhErSeOwzPLVxru0vkBqBa7D0+5P3DHbR90eiyA4lgksA3Iiv62L7zmMN1bH1im
 4l6ZFg8PJkkEOpBetdclDY98EYjOHXYduATRN90SVDzDMVFIki5BJnMsO70yWFpheSoU
 wn//r6fc1FnKUvWJj5HI3q5JAHi4640LzSh5Z1PZhKyraBFHkUcUVYRI2exGYcllrk4a
 ixqo4DwNvkHknFkA+nLwrQpXLcyOM9m4O2evFZ1ktqZrOywhk8TxtDtd2jFPEHZzHdYR
 ZX1WMc+dXZdca5Ch8GCmo//WyDaC4Jasfzz35t+YV0/WXvOnm8zJdjEUZM75jQ07aPot
 q6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740167940; x=1740772740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnb83UtqsBWTiNAjltn4JLaoZM1hQGViXgrYc69juLI=;
 b=T9RKdtfHbNkiueX5MBW2SqYFnWvisUUA6tvVfIk+YH/89W2wsxNRZXSrrVtMV9YahH
 zoxUx4FE3gDyxOgBFYNPtm1ezOJhQNlCZx7JVSkekkvR5b09SXZpzqW1fhAmHxbXQIEF
 hDOphAI8MQ1+eqDKo8sBImJjE4qZrMMp9zqZ45rvxCqq2WPJieQYFsTZ3IuQjTx3tiSE
 CHI6RVDaqtbTsc3TQf+8hmw3iiF3ukRBgyFbrqUi5pjPHwGw8D4NRG2tprzHEAPkya1d
 RVydpi6Csa3S2JjgcdFaHfSxNYr5Kebz7Y1VD9n1CLL2yUh9lB5Up+nVMWN60U/mLnW+
 v6Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVacvDer2EP8h86Q81x7Vjy1ogB2j73qX0IX8gWMGSnpgwImM1EVs+JUjrfWOEf1GwgKaonDlQuUlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3rHXAGxvznyBBpT80pjvUCevElNWXO7YHkdvHmyJDaJRhuUDW
 cteG1Ib5/2vlwWibtJYbcGA2TgLjqFwJ22+WY5sJ1KWdMYjhwHke6vS9RnccNnU=
X-Gm-Gg: ASbGncuCssWxMottTz3iDSLWVPUAyAYq2OaJYqcYcG/JI0Y9js6pq50MR6sseOPY5WU
 mlYtZ6+f0jQbw7cy3xbtQ4JtasoKPJRE8x/A5CpfK1JsxF+jlkxpxX2L9wiRUhKX11wj52dn945
 txb4ENLlPLPbeYaIUFvdUTR8XRHkuHcfptQDKsdJDzt0N79515YF7T/DOgFdqem9rc9rPAfJUaf
 G+6V6wPOhY8Yc7RxDV37Unir87WTOPhIcE44xiLZMr3BdGsHNUctBqexeuUXjEZORPi/EFgX8n/
 Ji176z49qPRzefjRJeIoOlp08Vh8GTlKfSoRtMLYwBUDm+9g4012AWOyESRCYZCXAPoyaHzqF/W
 53GRVFQ==
X-Google-Smtp-Source: AGHT+IFrckxDnWKfgAPPHmHclcGmNelQ44VvTcHTs9NzEDZAkR9Zx5tMSuT7N+Xy/eOAfbNq+ITXqw==
X-Received: by 2002:a05:6512:3183:b0:545:10eb:1ab2 with SMTP id
 2adb3069b0e04-54838f5a39dmr2406233e87.33.1740167939939; 
 Fri, 21 Feb 2025 11:58:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530a91179sm2128132e87.33.2025.02.21.11.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 11:58:59 -0800 (PST)
Date: Fri, 21 Feb 2025 21:58:56 +0200
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
 freedreno@lists.freedesktop.org, 
 Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling
 and add support to msm driver
Message-ID: <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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

On Mon, Feb 03, 2025 at 12:57:55PM +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> Then, the msm DP driver is lacking any kind of support for LTTPR handling,
> so add it by reading the LTTPR caps for figuring out the number of LTTPRs
> found on plug detect and then do exactly what the i915 and nouveau drivers
> do with respect to toggling through operating modes, just like the
> up-mentioned section from DP spec describes.
> 
> At some point, link training per sub-segment will probably be needed, but
> for now, toggling the operating modes seems to be enough at least for the
> X Elite-based platforms that this patchset has been tested on.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

[...]
> 
> ---
> Abel Vesa (4):
>       drm/dp: Add helper to set LTTPRs in transparent mode
>       drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
>       drm/i915/dp: Use the generic helper to control LTTPR transparent mode

Lyude, Jani, what would be your preferred way of merging these patches?
Would you ack merging of those through drm-misc or would you prefer for
the first patch only to be landed to drm-misc, which you can then pull
into nouveau and i915 trees.

>       drm/msm/dp: Add support for LTTPR handling
> 
>  drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
>  drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
>  include/drm/display/drm_dp_helper.h                |  2 +
>  5 files changed, 85 insertions(+), 34 deletions(-)
> ---
> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
> change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
