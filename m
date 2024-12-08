Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB679E84C9
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 12:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3726910E32F;
	Sun,  8 Dec 2024 11:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQ9kPO/z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF5110E32D
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 11:50:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso1132075e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658646; x=1734263446; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
 b=LQ9kPO/zyeFiSJsp+Io88M4ANvO44JVF/+3KBVu1VWLr0A+lt7o6aFp45cCNtmhUeS
 OylMP3fWovtgj6U93JR4oDdhPYVGDtAIySTCkiQ4jphQUOZ9YNrVTywVS9X84WkCe6XK
 K4SjF07XPYgUr5H67XcZK0nvIdYoOxeW9vjsVOsgZxXEAVpigxCQ7QW0B/SAEhCwrJDn
 tR4BHFQLAKpe9CnLdnicDTpXIa5xdmtA7otVBiW5s2klE4iprgbXJjsv52M8fIB96eui
 S5K9mi6fAAw6vRASSlO2+lHDjaQsbMotUTI8ic4l4BMXdN/SxpqK3kx2BN4qiTa47A4H
 j+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658646; x=1734263446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
 b=dy0tc0tXnhLwWFX6AV556WTU0wInniGHIJPA/AXjPDHygrrdTFyItsldhTLiTmIFsD
 0j8SLzhTLi7a/bg41tU2RwtuT66gOQ15hnNp8FjJfFsIf+7lFFi5P5jhx8XH5bULoMpp
 G+cJXb+FWesjvIktVuBoIHkXpdU5+hdGl+2AsQAa/6ijzRjIz75MgcAF/VYf+/dIjUjh
 pHspfqi35lBn4JXbjAETJSei9PnWo7/+0i8k0NrA//uonvkBgba4RBsXR3/1c6FkaogZ
 V3PXd64wtX19A4m+SJDyFll59h8orbCA7AMxjyySWwat31wDwGR6f52PSqenRReGVKpm
 PNYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXARHc+mK7t3jG2YnHlUjG5FSFvjNX3M1kG3J9V8VSxDddpKnyaYdhGnHU0ZF2UOsvdZsdBkJvJUbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfBxIcgl4/ZZR7u941TZVwTK29lf9NLeMwlVK6//adbi08xz24
 SYC/Ed4+SCTAkjflPwYGhGnR03Xq8BUv4K+ubSYM9ZdePSjCGsByAHEil+tuz0g=
X-Gm-Gg: ASbGncuYq1jJRIz1mjv+7LFe2RQDogQyBupttQYiyO5qzMfO2EIKV2oAaD+gEbZ1Pql
 RWMad2nDFoRigu8G13vmkIHJWi4el1W8yEhSBWKat4LH++o7A0dlR4pAXQuhrJ7wpj1mRwDIA2I
 6AA2kqJuEVmYpoCBn9WNmmCQHYoNkbqvlaEpdbfEu1r+Z/FxKcFA2LZsEz7l7pwH3N5Qm3GCeJl
 TK1QNWeVX02wwuNWQZgK+Z8A8BFAUIhB8iNjLN07OI+ar9ygGGlPfATo2WaR3Yk7UfRxks6HmO4
 LoXzZ6nOFtsFuc8D9TsGhbYYixRMFQ==
X-Google-Smtp-Source: AGHT+IFON8ulrpLU68pOJOmwTjUY9DTeD7p4bAWPDsvZgnewDN7qknWszAcJ9yPWcxocxPPFC1T4OQ==
X-Received: by 2002:a05:6512:2245:b0:53e:389d:8ce6 with SMTP id
 2adb3069b0e04-53e389d8e61mr2465693e87.28.1733658646469; 
 Sun, 08 Dec 2024 03:50:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401b8f5842sm211406e87.130.2024.12.08.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:50:45 -0800 (PST)
Date: Sun, 8 Dec 2024 13:50:42 +0200
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
Subject: Re: [PATCH 26/45] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <7kok44t3q4dv7jsapvdq45t4lpoaxwkxe3f345ewpfyq3ndgoh@t532yskl2wys>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:57PM -0800, Abhinav Kumar wrote:
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.

Okay, this answers one of my previous questions. Swapping these two
patches might be beneficial.

For this patch: 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
>  3 files changed, 31 insertions(+), 16 deletions(-)
> 

-- 
With best wishes
Dmitry
