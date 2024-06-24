Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4689151B0
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 17:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77BF10E49E;
	Mon, 24 Jun 2024 15:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b4My7k7l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEBF10E49E
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 15:13:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ce09b76e0so1456960e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719241985; x=1719846785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aa9CGWtyPEMf2n0NlgpWFkZxatDWsnV3NetNY1UfLKU=;
 b=b4My7k7l8+hlvRXCQ878UB1QncsINR4wNqceryCbiDjqBkUFU+z6iRP7xug7tnwD1m
 54z99GEHLtlvtL13XcUsedk/mpiDHs5RqlndutYfVnsOjh31pmXNqpA7wxoBGL5smva5
 /MTQ8AP0yP0T+T+lUOY917sJXaWpg/YP+66Qm7qPiwKp7mzgyy+R9/foAbEuw7Coffzt
 7NWcGsz3uOda48Gu6wEh0KgrmfCVIR388dUu48hdEEJ95NdfzT2pWjVqFlzcsW1kAQVE
 a9ofwRqolyVJ4/1XvqgXLvkAr/CeFweoDKsbFYHSRl4lSI0hNMj96zIIFO9WOybFAxF3
 g1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719241985; x=1719846785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aa9CGWtyPEMf2n0NlgpWFkZxatDWsnV3NetNY1UfLKU=;
 b=rMk8gbTsM7oacfHQHSRucJzdGkQoXWZM9BQ7msnMhwQ1YyeYOIe4OZhWOFOA5oqHbh
 YCxhVaSL4tp2WQlHVTwSUP6JYt0kK1dFo2zdzxNdpBId2pR3hw14nXkjUrhVGV9SHwT/
 HbzsVwpAQotN6asb60Dolq7i0aXpu795QScTtKm7DFoHk5oqKi/GMW0CIQUZik2TW/v5
 n6Xbi4DfnbGkMx931ERzqLyzPnJtOgUOyaQsNGnoVd++1o9HUovl+pFcTj27+H1z2dDE
 BgfMONnYP3SNQFe4bWn7rWcGBV3ApdxVREcIApQj/ow36tDbM69UWSEOPkFhhx5xpy/c
 XaFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUobnFrrxLlZuWGpuRr7utsW0MF9PoXbwUpn7rClgT0rXzb61udVINwNqR4jQIyp/obguerB4FYA7Qp/d0EixI3MUTcM25jCbNEWMHest2F
X-Gm-Message-State: AOJu0YyR78Z/p+qP8r+uGRBLnw1jfWEerL8iOVy+Z8icfgGIFe74UNhM
 xErAO4pgNO3kNNcSsKfUK4uAPWp02MrCbJj4mVNONN91ab3BT5gNSwQYZXBuQNk=
X-Google-Smtp-Source: AGHT+IFXLHxMYS+Mr7XUWKADI3In6X2GFA0kd96lhxIykKJO6jjnjmk+JT50Zk3RpsKGmfqjOZXfWQ==
X-Received: by 2002:a05:6512:358a:b0:52b:9223:be33 with SMTP id
 2adb3069b0e04-52cdf00d27bmr1693816e87.16.1719241985247; 
 Mon, 24 Jun 2024 08:13:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd76516f3sm963863e87.151.2024.06.24.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:13:03 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:13:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/adreno: allow headless setup on SM8150 MTP
Message-ID: <vlgeachxzzmxttqqhbbs5kk4g2mtgp237jccbceo242fvhxucx@hliztpfh7c5j>
References: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
 <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
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

On Mon, Jun 24, 2024 at 04:06:24PM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/23/24 21:34, Krzysztof Kozlowski wrote:
> > Commit f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes") re-used
> > amd,imageon compatible for the SM8150 just to enable headless mode due
> > to missing display controller nodes.  This work-around was later
> > narrowed to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts:
> > qcom: sm8150: Don't start Adreno in headless mode").
> > 
> > This was not a correct solution, because the Qualcomm SM8150 SoC does
> > not have an AMD GPU and the SM8150 MTP board does not have magically
> > different GPU than SM8150 SoC.
> > 
> > Rely on board compatible to achieve the same in a Devicetree-correct
> > way.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> 
> Let's just forget this exists, this was a hack from the start and not
> a very necessary one given display bringup followed soon..
> 
> This should be handled by a module parameter if anything

We discussed having a modparam for separate KMS and GPU msm drivers, but
I've never implemented it.

-- 
With best wishes
Dmitry
