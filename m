Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8B76F445
	for <lists+freedreno@lfdr.de>; Thu,  3 Aug 2023 22:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC21310E225;
	Thu,  3 Aug 2023 20:53:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5E110E225
 for <freedreno@lists.freedesktop.org>; Thu,  3 Aug 2023 20:53:07 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-ca4a6e11f55so1517066276.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Aug 2023 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691095987; x=1691700787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+/rsOB7MMmBCNLpA1DSHrmhyVa9IiA1ZsxUc+a34xks=;
 b=RH84+1CJ4J7o12qkrpYNs8Bej9TkQF8S4TLX7oEr5N+h+z+fy0dhYSClNZzl/6m0Bv
 AZwljIAJxGYG45SiW/ZqKIpTufDlmnCsbNXoL2TRnFHhh48TpWoJFjU/FD/rM0pXx6v8
 +JK7XD1hHEcXMvM2ucGqwDEJ2IENdzJ1N2r9/cXMk0qXupEG25oXxPPMaW++Hz8R8JCq
 OGHH+CN4c97LNzGblfO0lsrdPe1Bc59CNMQDcMhEVzBoLanBki4WjWtqf+U1ZVZXuRuG
 vJfe8rdj/CJ3KZ8wk3sqceim/3qbCdR8E26QK2TNgV/01CQIsn8rs/9sPmpNCE5TmqNS
 TgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691095987; x=1691700787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/rsOB7MMmBCNLpA1DSHrmhyVa9IiA1ZsxUc+a34xks=;
 b=YuIOa6QPmiuWz34FiwoeLbuSB+8yoFCLkqKRTMea5l6ly3OYvFdRXzsnIRWnU+Tymg
 9LPyhZv/DLhhjeUZzB6u/X+BPMBLuopq4ryHSEeAcAiwdH16Z5VZ/T99YRv2b4Nd/9IA
 eL0MOHEPJtvJ7sTyd7lzCAdBj5B/NJcI8yaWVAwcni4ih1o5eA0a6oczUiPbjTwJIKik
 kZGeLwimKWqN2HCto0Y0KK6bSYKWjpihkCCfxN5iCgK9/v84uUPPn3/8sZKyHuA4xSUn
 Pv6QSaq+ygw+k/Am548YBeNyMvp6dVrZV0r/mXpyH+ndYTypdfqCNEETrGvL7sYUA4IC
 hQUw==
X-Gm-Message-State: ABy/qLaNiPxnx8f/buCqQKutDfPxAiIu6OwBLNlT4jk1yaN8Tm+7Ruex
 YkVo5rKt2ZE8Xoa6/9yRdr+M/D0z4VEmMBJhoRvbGbsbvNUgfyD27a4=
X-Google-Smtp-Source: APBJJlFCpGsVSdiQfwS0p+VQYoS4e9Qf1T09P86LKX7oHgpLrEC3CSHbMyEUBQ2rC/l5XoIxk//OPVDBmF7ryG8u4GM=
X-Received: by 2002:a25:360a:0:b0:c67:77be:9ad9 with SMTP id
 d10-20020a25360a000000b00c6777be9ad9mr16975325yba.30.1691095986858; Thu, 03
 Aug 2023 13:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230803194724.154591-1-danila@jiaxyga.com>
In-Reply-To: <20230803194724.154591-1-danila@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Aug 2023 23:52:56 +0300
Message-ID: <CAA8EJpoy4w6j3yZMqEhh9xJiZieZuqyw2tOBSbhT0uuqoEMU-A@mail.gmail.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 0/2] drm/msm/dpu: Add support for SM7150
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
Cc: quic_rmccann@quicinc.com, dri-devel@lists.freedesktop.org,
 liushixin2@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com, airlied@gmail.com,
 rfoss@kernel.org, davidwronek@gmail.com, quic_khsieh@quicinc.com,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robdclark@gmail.com,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 22:47, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> This series adds DPU support for Qualcomm SM7150 SoC.
>
> Danila Tikhonov (2):
>   dt-bindings: display/msm: document DPU on SM7150
>   drm/msm/dpu: Add SM7150 support
>
>  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 116 ++++++++
>  .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 277 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  5 files changed, 396 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

Could you please include MDSS bindings and msm_mdss.c patch into v2?

-- 
With best wishes
Dmitry
