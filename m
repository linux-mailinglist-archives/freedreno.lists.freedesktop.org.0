Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE79E83B5
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 06:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5D410E427;
	Sun,  8 Dec 2024 05:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q2CbXtfy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A7110E427
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 05:45:40 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3003e203acaso10150941fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 07 Dec 2024 21:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733636738; x=1734241538; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1HYv1e1G167UjBW6qsx3MDds+0Rx8yGRk5hPMxbh1c=;
 b=q2CbXtfy1RbBsFx88pRt6z1Ua0Y7bBWfb5XrBf2ptgDkjJiZha0786gCse9q7A4MDZ
 fEkYmWEoP6QfEIHbqbmZPae6e0kl+m5Gt8eFkNcHhgPl9c3XsspAYEy/Z5imsroMBLsg
 TrXEn8b9NfFY3mbWsaCQbjAuhFmaLEPclm5JYclZxPnzWVUnKR2dqYnFKDYFP+/6yMxN
 g/h8DEYg2Om3hcljkkKR4/rGUIDOco9YbhqlBvyItvFut3jIlOTTi09oJCUJ0lG3meTp
 WNOPYlheyOT+/pP9mAiu9p8rm0WoVC2LV5+ffevWFhvWs1T7IUtA1KuclzsyIUzHylcW
 8QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733636738; x=1734241538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1HYv1e1G167UjBW6qsx3MDds+0Rx8yGRk5hPMxbh1c=;
 b=eLa9M0ZtZg/Xm0OXbI26MtEUPOYC6HbzwtHcduXAmBBTjz/r0Tp0LPZ9ENArXR7rRL
 kKLUm0doJn4x8uoSQNdUMXwMPlvNIIKE/PC/6dcBq5BVi0WkMpTV4XSTh/q3LyJuU8fS
 g31eeEftlxUmWCL/mDfmZiqk+a9gAjgR2pRsr6+gF48xoMtl8H9Jqm8kQflXn3clAwjy
 C4hmsHNmDDctG3dbmeozZ36gnhs9rKV8zgaqFo4T8TkvEtgaUW09HRuIfYEh3ukNLtid
 79ErTUeakZgdFYqLP8Q74c0LNtEEfQsUqPFpHKGr+SeYZ5hr32Nue8saxbXsTSJ7sReg
 F7qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCfIFmuIc9MXnx78WvtqmY8Ci+KSC6H8Phj3nPNE6K8jirp3p2GoDCdNwE5aru95LsujSyRf6UieU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC+gGRPF8umhZHxp0qT3zhxI7zm/BfRPo0s1dDMwRTxyGTDUbl
 ut2vk4IJMwbnhgcFOo6Q/2KCSoZfj+iO3vEc32w0alaNrUWcL589AllVLr8Ul6c=
X-Gm-Gg: ASbGncugROJaLgYN9oVJB99pL4mFZJyHL9PqQDLa0uuLmi7r9ZayDyPev72ju1e/t/x
 zyvYsOI95zaqJh3/lcw+DeVxRfZfW1FRVA/6hdLDQEkXhWeEBY/V6Y8VscwIvK0vMuMwMIO2PRQ
 CwHYkgXpfoXCrOUrESKt+fOC5jCrc2U/sQW5olub01uNruBmUd5Wo6dvc1797HdQanJdK2Nt0TV
 ZVcMUhOvFwUaLERv3L75q0Qg29sQu6k+KzjUi9YvmtzSsvjFS+4lZQvlLrVDr0mevYax8ournkd
 2xOYK6+490pdhgtaunuYDo06fdQykw==
X-Google-Smtp-Source: AGHT+IH1C2lNwnSo3DwPCOigAB6lGnv6/ya51zVyeab7Dq7ZnU+VYU4q8UWGtOmfbv3xMxYL+3XXBg==
X-Received: by 2002:a05:651c:507:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-3002fc92bb5mr23529331fa.26.1733636738247; 
 Sat, 07 Dec 2024 21:45:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3003162f64dsm6112391fa.97.2024.12.07.21.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 21:45:36 -0800 (PST)
Date: Sun, 8 Dec 2024 07:45:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 20/45] drm/msm/dp: no need to update tu calculation for mst
Message-ID: <ycu6maap7jonzybk4spyee5maq4if4eapzs3w4hhdmfzajjbst@5wiax7ve33oa>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-20-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-20-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:51PM -0800, Abhinav Kumar wrote:
> DP stream is transmitted in transfer units only for SST
> case there is no need to calculate and program TU parameters
> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
