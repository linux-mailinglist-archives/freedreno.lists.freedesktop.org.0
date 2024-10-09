Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9176997851
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 00:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29CC10E820;
	Wed,  9 Oct 2024 22:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BgH2grxe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0110E81E
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 22:13:58 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e25d57072dcso225000276.0
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728512038; x=1729116838; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
 b=BgH2grxemHFA9VG+Y/aCLLVnR1of/LfNI3UKo7WpjCGS+/xeyKV5Kj82mN2BtUxbLQ
 cBIyOEihixCWbgARwB1xaRvReN0SqsQGI2HSYOkBuXkIi1mopNvYcuiM5YUtDZy1qP8g
 spYYuHv4vyFdpFqP7bEW66yDTE3xpwxzb4+cTNFQpVfPWTTnmRD09iEOjhORFP+yknuF
 kRqDinaGFyIqUbTXxBEsk7xYwNdqRXZXrrBBe+e0enz7yZjZ5tQst3sragbqC0lKPED2
 AFe0riLUg+DcYA2g/lN6jPj1DAU7GiPgWFWA9gON01sIZVRDDAHndTIv8m3UfYoy/3PR
 w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728512038; x=1729116838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
 b=sQXluPn0Cj9ZTEsCkr5632f9TekyvDtKhpEqZ11Dz0A0B3NRbDpT3yh/XSOFeE/QDG
 1oC9upsagOxknFvxAdrAnExNFJ0lvhFIslDnO2d6dHO8Ix44VQeXBAr4JeNdjkNmwMKz
 fLcTzKw4NfiUvoyJTQqock6/ofPoZa/7KPY7QsBtKrU4uyvkwLT8eexenbtN7SokPtKa
 ticX38RQlucTtJQ9SJCZr6qdeT3eA5qFQJw7abz6reRjMEEWBZ4BGWXjXAgzfkTXMoH6
 DrzWEG7EVl6bSO7aLJDPmN8Zm2epDAr55qdiePyA/79SWmhbENOrrrhbHRm/wPlotT6g
 GK4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+2bKuewuOFlgXvFjVTK/bt8uNJJM+3oqU7GE3w4RN0IRqiiAH3S3FgLGWKgJLTqfq5YSBHfReb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYMd46JzmKgpQUuQpchxGSbG+kQbY9APwfBR5/oIkB8i5rZG41
 vTy9k2c7oJf3w0pGnSSRgta5T3vGGN32g86k3SJFNKfQEUkVyK+UQojxULde2lWlezgaTn9pG4f
 Us7l8JQxWpng69SIZtZ/Dso0z86pLXgjqCdEbjw==
X-Google-Smtp-Source: AGHT+IE8N/AQRHVkfQpViJ7j87DJYPlLqudgKJPaHi0a2xWoaLY/SYqNoHWu/8CjFR85/GwjoCayPnP8Gpj2MkizG/U=
X-Received: by 2002:a05:690c:113:b0:6e3:ceb:ce2b with SMTP id
 00721157ae682-6e32250ade9mr39940947b3.44.1728512037720; Wed, 09 Oct 2024
 15:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 01:13:46 +0300
Message-ID: <CAA8EJpquGKn1kC1Z7dDgBd-ZXKO34ZFRPAHjYaAZQguUs6N__w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Wed, 9 Oct 2024 at 17:34, Mahadevan <quic_mahap@quicinc.com> wrote:
>
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
>
> ---
> In this series
> - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
>   binding documetion in this change:
>   https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
>   depends on the clock enablement change:
>   https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>
> ---
>
> [v4]
> - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
>   to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]

And this wasn't tested. Please test the bindings before posting.

>
> [v3]
> -Edited copyright for catalog changes. [Dmitry]
> -Fix dt_binding_check tool errors(update reg address as address-cells and
>  size-cells of root node one and maintain the same for child nodes of mdss,
>  added additionalProperties in schema).
>  [Rob, Bjorn, Krzysztof]
> -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
>  path in devicetree. [Dmitry]
> -Update commit subject and message for DT change. [Dmitry]
> -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
>
> [v2]
> - Updated cover letter subject and message. [Dmitry]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in the binding example, droping unused labels,
>   droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> - add reg_bus_bw in msm_mdss_data. [Dmitry]
> - Fix indentation in the devicetree. [Dmitry]
>
> --
> 2.34.1
>
> ---
> Mahadevan (5):
>       dt-bindings: display/msm: Document MDSS on SA8775P
>       dt-bindings: display/msm: Document the DPU for SA8775P
>       drm/msm: mdss: Add SA8775P support
>       drm/msm/dpu: Add SA8775P support
>       arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
>
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  8 files changed, 830 insertions(+)
> ---
> base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> change-id: 20240930-patchv3_1-600cbc1549e8
>
> Best regards,
> --
> Mahadevan <quic_mahap@quicinc.com>
>


-- 
With best wishes
Dmitry
