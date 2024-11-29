Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30C9DE81B
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 14:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C4410E340;
	Fri, 29 Nov 2024 13:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NYcvBpp/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ECA10E33F
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 13:54:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5cfddb70965so2204151a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 05:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888451; x=1733493251; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
 b=NYcvBpp/RLuAA+VmzoCNj92QGrk69NTzc20G83p7vKzho/ohM6ijqN5evijktPM5A7
 e79AxpJcHajTH2Ze7N7+joZQprLAQDSpFOQqm0MOjliKANTNV6BgkVF2qhwqoQu/qeYJ
 p9C6PTsGe7xvXN0NNLKYYob2BnfX9+f9Lo1pRsG+cBw1aRBZqDaN9JDxRNi/Vzn73tnw
 lblRiDJszBKTa4l70A3E3B3btlPnVWwCytbY1Mxz4u+lACqCM4YFzNR/Q/s7Y3jhJXyO
 2xNNTZeAXy29rgI2Cw8EndQZC0BGlwoajiAqPCAvqS7GEi7IurdKCx9Ukwk4fJCaF1bQ
 LzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888451; x=1733493251;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
 b=kdGNbDqCOWY0JO5pLPyc5v2EeRyvlsCuKNXXr7alcLVK9OmnozRDjJEqR8myfJOqs1
 vQ4QBVtRFMItJoa4hluo1CPOtObKDwymXVEmkI8oBUHdpGGED27tCPksfludPqvI5pgu
 5KU2nE1S4LTsoWl0h9fmmrtJQNZ1HsnlskrnqdDpLFx+4pBbqf+DmFVXKk9S2wIb7t0p
 DhmE+iW9D1QCHKiSiD9Y9FsEft9p8kOBFGduqhNBb8rGDuOgCYpHV2aCs/HPwLkE6l3L
 DQsu4q8LR7FnDLc6mvGpruJrW/vfY2L9Ro+HZiQGqovSJo8BsPNb7/4Dz79zT4xspVxq
 lTGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ynBkSzP+fUz6dlfeU0ZykLFajnUeJYgvtrJwE/KYCei3NjEKJBakZbQKfrfZ69H+ct+n1+pTaTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHIUrgyiufl9TSfBSRM/lI+ZzKeXEQ8IpEZSe4zygywwzQXJrW
 Wdecq9c9FRqj0P4hDSsHhXiNgYSz02Gl/R6IHOAi3/qIbAfBPbZhKv0KDFz6GSHgSeiFptfmXAA
 no5vwXgPqta7+eOCE0iRb1+XpfEFBqnuP6sPzzg==
X-Gm-Gg: ASbGnctRk+TxfisszkVLJZBig4KSSXtGL6TQyC4Wa+xYNeluKQNCyzdNgSsmziv1QQt
 OEWMk92gswZ9ZklJxK+1T7h9KcSdj6PI=
X-Google-Smtp-Source: AGHT+IGaA6t4/2a/mNA1h9b1zR06PmCO6tMyJ5TuOWa0jZCc/O10Qzu+rMnQb6Tj6pv0TWbP4VGQEBjG3I0WDrceI+I=
X-Received: by 2002:aa7:d68d:0:b0:5d0:8676:3ed9 with SMTP id
 4fb4d7f45d1cf-5d08676410cmr7819763a12.8.1732888451493; Fri, 29 Nov 2024
 05:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:54:04 +0200
Message-ID: <CAA8EJpqDJm6xh2oCkED4FF+1j8qt=u7B=7XADtR9JOkZZxsDkg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/msm/dp: Add DisplayPort support for QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
> same base offset as sc7180. add support for this in DP driver.
>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
