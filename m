Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791C808E1D
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 18:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10A10E149;
	Thu,  7 Dec 2023 17:03:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B06D10E149
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 17:03:07 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5cdc0b3526eso7739787b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701968586; x=1702573386; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
 b=csxMM7l47ljWqVxdS4Z4vO87cjyPAdpdH6/bTQsz+dhBNrZkbWvRNDl4QKhObhRdEj
 mNrGcPN8reG3exIQ8M6hMuW3KjTgohZKMeFwXcT7bDsRHZyCvSjczSaLEKoeXKdQ2IqD
 a6bdm5byjYSPlW/JsPyqyDn8+heUSOI0eu+hJuMhs+h/wrC97fyimH4L6FMWd9MZCpFo
 xZrcBXJdwEq9POdTIgcGfXTfwSVyEf9G3tgrY2yIpWkW12kRaQBek18mDx4rStuoP9u+
 CuQsjq3Tu1t2tRA9scmn/06idCDjyXzb+9OXuVDa/thLbkM9QvEOtvkPtlF/DbkCbizc
 80dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701968586; x=1702573386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
 b=ehfxdEGNbMl6A5fFAdunRgb5hLFxkA6KmEQcy1lfzPgiHwkIYvFzj1AGZZqTRUKFM3
 9Drcm6YLuoUo5UHc4Q1gDN7YRUeKcImltl07ZM5Ng4n5RXE78Yla0tP6OyYp/fnj8bWF
 tXXu9Cjm16vR6m2u0xEHzzsg0t94czu/dWYXZ900PCIgPmTgQgO2Tfal6BKWnpqePCng
 cqn+5JrKPtXhW5wp7LvzVMHbCGqgnOwE/MZvmdDl5kUF51sZ2sGK72UfFKISavWxnAXb
 +JHmXUp3jLbM8hc2OA0zLqnaxUAO9k54xA8pNHnWEoufx3Jeb7HHDOcQ4+pMr5mqfQVl
 5fOQ==
X-Gm-Message-State: AOJu0YwtJyM+gJJJgB/fQkryKlMiqAqNgaFaHgRTtygjc4LHVTfkGt0y
 3p9Mp8wXpPu/fnhgjF+HH5pTHT4+KQLsr4jGQHhVXw==
X-Google-Smtp-Source: AGHT+IFi1Lw+dYQG5rp3RmkzlgCLipb19CQiXyiuFQHGeZdsmEG6DXb3riJxACss4LeAc2sE3dJFU23/biQpd2Etzf8=
X-Received: by 2002:a05:690c:2b06:b0:5d3:b71b:4d30 with SMTP id
 em6-20020a05690c2b0600b005d3b71b4d30mr3163725ywb.17.1701968586143; Thu, 07
 Dec 2023 09:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 19:02:55 +0200
Message-ID: <CAA8EJprskAYWm6M_yOOmUEHdWV9Ot3_VBxo4MtPYDKBizPHyuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: Add DisplayPort controller for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 at 18:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The Qualcomm SM8650 platform comes with a DisplayPort controller
> with a different base offset than the previous SM8550 SoC,
> add support for this in the DisplayPort driver.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)

-- 
With best wishes
Dmitry
