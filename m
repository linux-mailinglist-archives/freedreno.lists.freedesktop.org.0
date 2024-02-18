Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086085970A
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 14:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B690110E0E9;
	Sun, 18 Feb 2024 13:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZaUXZMs6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02BF10E0E7
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 13:06:57 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-608342633b8so907137b3.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 05:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708261616; x=1708866416; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
 b=ZaUXZMs6OrmEXaNW0qlNtp5XhjrBixfHeFeQMu4S0EzF4WbkpEtNAdgrp62b7odS7j
 oW3CB0uyondGrP/UbZhMuJ13U55jUvKLpE1w8L/2FE1VsikbZyPllEkDFo0hGP099EPt
 ueqZ+YKBLxg+ozVVzPwqE7sHaF7oCNOMRvzBt3DFp9dEzQqE1J7dTzfDvQdyDPJ8bpHa
 cMAciKqwwF2kGHeADuBDDGHZ7yAabVHy3nm1XKWoUZ92gsd9OljZE6F9pMhCcd/bZbeM
 j/CRKeczlKVlkGW8QA1rSaKhQI16wHqfsVVYJjl1F2Ik2yeZMUIzifqfEmKxNscy8vWD
 Q6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708261616; x=1708866416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
 b=SBTo2q1UcAqO+LEINVLDFk7cIn/3DTFZLABjDQJAuv8dLBkTNvZH6e/lK5Bomfkqjb
 BTFDf2B+axPif7c8w70SAEuNkr6WSaNVUQp83z1ndk+HNWvU/kvX0u721UTTh3ZES1UM
 3MPi4+4L79V1fPwvahEvMZRkfFXdvBQKNbdOAoKdlCwSMUsz4Lrg8dPyDUP6iPGEuKSP
 UjOFQyCNtGfKTVvw96on5f/tQdHK7nP4QpKF7Ge9dOsNCvWl1L8H2HZwm3jBo+Z2DuEh
 rCHME2lygL1wdAmjwBf8I701gC/ZRAE5uff/mHFzgOYr318W+IAwdvvc//lCQ06/1C1U
 fXQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5rv+vPxAU1tTdTOBoTYtly6nducZ1XEHpDS6MXfgETAgIENJUZCQRm579DkNizKKzv+Iu2FQLortsC0w+ptc3D/xjtiHvxyNSrIGE6tzn
X-Gm-Message-State: AOJu0Ywy7+qVDGdbnRjQDYxmiZ4WNIw1wnKB0LoPfuAPZHovkN986nTF
 QYI6IQ+IUTztcMxZZMdJfMwFTGKdT87gXl0xFyJNWkXi/L1AIvj7Rsd7x9JH8fJlYnt6/0pW2T1
 Ylm/w4D8YSuadoGlUjv+EbNgoZdsCKwMoT0Gd3Q==
X-Google-Smtp-Source: AGHT+IFwAgLxBZXblOBulsbnsc4LQ+Pe2xER0SSlfwoxqWLXlBGUgn+4tkOT1j2KFCAC8mjhS4ohhc82TcyeI7dNm+U=
X-Received: by 2002:a0d:e2d6:0:b0:607:8c84:d474 with SMTP id
 l205-20020a0de2d6000000b006078c84d474mr9844866ywe.31.1708261616529; Sun, 18
 Feb 2024 05:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
 <20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org>
 <170810832158.3497594.1997532394027797497.robh@kernel.org>
 <ZdCbAjnga8HCMdYf@linaro.org>
In-Reply-To: <ZdCbAjnga8HCMdYf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:06:45 +0200
Message-ID: <CAA8EJpqCKWih1OeMsynMHkS6CAoDTsgRXcv5YAPZNvLT3MfA8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Sat, 17 Feb 2024 at 13:39, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-16 12:32:02, Rob Herring wrote:
> >
> > On Fri, 16 Feb 2024 19:01:06 +0200, Abel Vesa wrote:
> > > Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 +++++++++++++++++++++
> > >  1 file changed, 253 insertions(+)
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,x1e80100-dispcc.h: No such file or directory
> >    24 |         #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
>
> These bindings headers are already in -next.

However they are not a part of the drm/msm branch. We can probably
merge the rest of the patches from the series (once patch 1, DPU
bindings, gets reviewed) and merge this one in the next cycle. Does
that sound suitable?

-- 
With best wishes
Dmitry
