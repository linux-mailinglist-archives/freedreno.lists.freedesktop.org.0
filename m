Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DB24A4A3
	for <lists+freedreno@lfdr.de>; Wed, 19 Aug 2020 19:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770256E55C;
	Wed, 19 Aug 2020 17:10:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4FC6E55C
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 17:10:26 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k4so21650819oik.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktYpsCxiLWJOQgFpjU6rm698Y/qLm2dIO8jCJsadEOU=;
 b=Cf6w4ypyePA72N9OwZ/X/gIqgQ3/Z2O3rsVEAnbMsPXxSteDXfBbrAJ2YKaLKzi+2G
 eJlNvZyKM6mcCsbB8rTNwjE0zNlCUOU27vLJyO1vH/Kf6P5hVdc0XLNeLzE0ilaNzTIL
 c/q/2eCUoXXxQCiuP4bqs7wWJmNaxuO94MGUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktYpsCxiLWJOQgFpjU6rm698Y/qLm2dIO8jCJsadEOU=;
 b=Gj+4K9orDJ0Ez13AWvFtLbVvA/OZDMghsrnPFGKstj1lat09AULD4UUNeTSSxGemPn
 p/K8RHYrvzdenfPbq+yc088dARwtulVGRWiHJ2A0fR2YoEL2kxjV8Qr/nujWY03t8OlZ
 VLdeFIuRBxzu+D7BjjWX2MqTv1im/3BHW482jS716wJUddA3YGnWYoIE3b52tn62NNDf
 jychBIRi6mGk/o8DOqBywmRGLNiGjpebj1+/+gyh7e0+Rg3COhZE6wItnR1zTODJgtsv
 TvNKD0fcD2xCeJBvPq/5Mc0R/FV9iJ2c/TT2IPtPKPXUAqYikll5eN85P2Z81dqG8Fi7
 n9tg==
X-Gm-Message-State: AOAM532jOkhUIJmulE623RyJkkeaMszo+T4a+yf9mwFeUtyVind368qC
 aMouOMYotUn4iwOGYiz9nsbNFQ0Xn9l5kw==
X-Google-Smtp-Source: ABdhPJz4CkX2NvFhaF0yYL9VzaztxiR0tygxF78yE28XtyDqsuj4LOaSI4scf4WAUL2PRQ6Xt3PR3w==
X-Received: by 2002:aca:4d48:: with SMTP id a69mr3932452oib.39.1597857023643; 
 Wed, 19 Aug 2020 10:10:23 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id t21sm4490580ooc.43.2020.08.19.10.10.22
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 10:10:23 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id a65so19605573otc.8
 for <freedreno@lists.freedesktop.org>; Wed, 19 Aug 2020 10:10:22 -0700 (PDT)
X-Received: by 2002:a25:d802:: with SMTP id p2mr37420399ybg.446.1597856554388; 
 Wed, 19 Aug 2020 10:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200817220238.603465-11-robdclark@gmail.com>
In-Reply-To: <20200817220238.603465-11-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2020 10:02:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
Message-ID: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 10/20] dt-bindings: arm-smmu: Add compatible
 string for Adreno GPU SMMU
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Jordan Crouse <jcrouse@codeaurora.org>
>
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 503160a7b9a0..5ec5d0d691f6 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -40,6 +40,10 @@ properties:
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2

I know I'm kinda late to the game, but this seems weird to me,
especially given the later patches in the series like:

https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com

Specifically in that patch you can see that this IOMMU already had a
compatible string and we're changing it and throwing away the
model-specific string?  I'm guessing that you're just trying to make
it easier for code to identify the adreno iommu, but it seems like a
better way would have been to just add the adreno compatible in the
middle, like:

      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
        items:
          - enum:
              - qcom,msm8996-smmu-v2
              - qcom,msm8998-smmu-v2
              - qcom,sc7180-smmu-v2
              - qcom,sdm845-smmu-v2
        - const: qcom,adreno-smmu
        - const: qcom,smmu-v2

Then we still have the SoC-specific compatible string in case we need
it but we also have the generic one?  It also means that we're not
deleting the old compatible string...

-Doug


>        - description: Marvell SoCs implementing "arm,mmu-500"
>          items:
>            - const: marvell,ap806-smmu-500
> --
> 2.26.2
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
