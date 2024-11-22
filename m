Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1779D5CD6
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2024 11:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5922710EB31;
	Fri, 22 Nov 2024 10:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZEE53tjr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB910EB31
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 10:03:40 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53da22c5863so2279745e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732269819; x=1732874619; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
 b=ZEE53tjrixeCLndJUJ5rKvXbP2T62CasgH65NYW3B5CfNwNqoekF3kegDZAQByy3Fa
 pEFb3WgLxsg2Nyb5HXFU5JTv8rB9sT+2bVh8+KocYh+v9j/+XbJwSWpmyznReAzL0MLX
 LBlDpf/CXyNXcatsXsZ3E2F3np4hegrGXn+tkGQNynNZtt4c/QKbjuynuUOXtCZOHrJu
 oJbTnrkltjmuwX3CPXoaJJyc+3G8pLXUgw6bR4McNj5+/mN3BHHdb0L4Qhch4fwElO4F
 c5PuGsaCuo3kK9uYKe3oARufivG9t/Bx4HtYj9ic4NNK13QmrIH0SWbISkx6sv5IJFzK
 2ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732269819; x=1732874619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
 b=elcYkKLtay4h8spuuYaTt9I1yHUUU5YtWQEgm4Z9AVBa7zZt+SJ46iymGn98Vg5Ymg
 eph/aZmEaWpl+Hsynmppi0B4hA8P5NzCkEAqIXMQijuSjXLX2yUFnmlhxI4CykNFptPp
 TxTc1lYpxs/M1wS7Cf3kt+kPiUErLR7H24/2UYuP+mwpBpPFTdsJuL1SOuWycZ0DBpSU
 i+rta94j5kUPfQcPaUv5WZhcdw++0UxoDlvKCubu0vLxwXZMZsBRUHep+nteIGtAscz/
 Sl7NJfQJmcfWrUHkF1PthcXC8CEQf7iv96VJ4sa1W67LZ6rMWeioLM0vSHpaibzSUIA6
 kKWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaiQIoumvUtsrhQLbWPpaOzoi2ucZHZdod3w5hu2D/JLo9J/oL8kWCm3dI7xfeMfjHjskoHplg/LE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznmieMLYsFut9GlmUJziksqWgcwiYP4WoOKOE45icnUiN5/oAq
 ek0sjCbTZVWHua5NpLruRDAFf+O1rVPCcL3JdLmOU2Jwj0aCtCuz8G+4dX+7t08=
X-Gm-Gg: ASbGncvmuAAPoimt+eJ4gflVjs+EYcQ/le9/JiWsQHUW3WtE7oF9O3ovGtf9wi6/J2b
 W3HLPXRwoxxNorYMNO12/bAxbdbGvZfN2LfFg2uJe+RHx9Y6Ooqf1/M4ZGXWwDA1gxMN7GCthq6
 dF/a5nuPFiOczpZJm7Pj10VfEd6M6jiSeNHom1TQ64KCJ7w4esEHVXoHe+6vVSRnkYWAIEzIaQN
 f9eCHH9Dhi2lcuu8Wo2dkFkSCx2lsq3yGSW0xhBvhqLZxoKfzL0wCsXmTNJ8DGMV2bjUPa92bQE
 VgR1Ke/3x2+QVGax20o3bAB2qVzunA==
X-Google-Smtp-Source: AGHT+IE3PHq2qPNqY+QbYoKQGe6R086mqzI0wJSLMJ+g6h7CmPQMNZmjuqoEun+JNczYZAXDctuzeg==
X-Received: by 2002:a05:6512:2311:b0:539:ee0a:4f8f with SMTP id
 2adb3069b0e04-53dd39b2dbemr1081114e87.44.1732269818813; 
 Fri, 22 Nov 2024 02:03:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24517e8sm318249e87.91.2024.11.22.02.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:03:37 -0800 (PST)
Date: Fri, 22 Nov 2024 12:03:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] drm/msm: mdss: Add SM6150 support
Message-ID: <jquwvnj7s3n5ki63ooz52ys3cbenuedr7mkrdkdujrnza3ewa7@i4y2uhy63yvq>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:47PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for MDSS on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
