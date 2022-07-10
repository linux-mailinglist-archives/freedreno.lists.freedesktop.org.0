Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8056D038
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 18:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92E614B0E2;
	Sun, 10 Jul 2022 16:54:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6AE12A409;
 Sun, 10 Jul 2022 16:54:20 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id u6so2935498iop.5;
 Sun, 10 Jul 2022 09:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K1U98b2nQAOqyF/zWDcOQdXgcbNOU9fD4IHpPS4zIGU=;
 b=y6ghQWI1Zi97u96/TOSRd72leyOOpH1VEZio5+2fw+wWKEm/O7xJSMzaMXWLbURqAG
 neV9nqhicBsWcy5a2giLcjj27kniT7O+hrWOpLXRRrEkl2uZGKfYw+eRuyGFE8zkBVi/
 OjCXFKxXpA15Y+QJIYh9Hu5Ikg5cNzW1IQeD1qnmGhA70h5ZOPp1kZeDeKS6Yin2NfTU
 KvC/Kadj0mc4T9i5/6lu5UbZjUVZFS0oGCkueT8kdHEWVM3MCm3CQrfVDZXWo1rLbkXt
 jH3dKkXvI3OgI6hmZkbwNV8/vWw5jPCVX1l/svHIMq8l2HSJfc9QH42ciS8S1EG8jlv1
 NSag==
X-Gm-Message-State: AJIora8lpeiOmKEA8H+tFsF0p3mBEN50fHVqE3IMMi0u4hNIhZOMUszy
 xvp70ApIkAqKC4Hxc2DrOA==
X-Google-Smtp-Source: AGRyM1sA6wNkB+tjSCRg0xPTzMooxjxM/3jkVUsmV677/VUB10SU0wOJ/0vYKqwZxyIsK+4BV5XdIg==
X-Received: by 2002:a05:6638:264d:b0:33c:ba2d:72e6 with SMTP id
 n13-20020a056638264d00b0033cba2d72e6mr7725563jat.173.1657472060018; 
 Sun, 10 Jul 2022 09:54:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a02a046000000b00339eedc7840sm1953954jah.94.2022.07.10.09.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 09:54:19 -0700 (PDT)
Received: (nullmailer pid 1602130 invoked by uid 1000);
 Sun, 10 Jul 2022 16:54:16 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
Date: Sun, 10 Jul 2022 10:54:16 -0600
Message-Id: <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
Subject: Re: [Freedreno] [PATCH v2 04/11] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:33 +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
>  2 files changed, 162 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

