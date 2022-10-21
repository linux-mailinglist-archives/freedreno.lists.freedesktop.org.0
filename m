Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9F608076
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 23:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC72610E16F;
	Fri, 21 Oct 2022 21:00:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED7F10E16F
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 21:00:29 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 z11-20020a05683020cb00b00661a95cf920so2541652otq.5
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 14:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jp5O+v/VR9Uxc6a9bxAqi2fjatkKvL4KNFA/YE6ATM4=;
 b=8Q3upa8Q5IVdkP4NIL6puaPH8uMmRr/k32JpbiXUiLptYEMTintxEloVH+BMXa8w9j
 o79EjhvXeg269v4glo3IycnO6Q7/0jUKSU7SCxF5NMYmkj6qsmXBdu1UNmZrXVGL2p08
 RuhIqR3qSuDnz67Re9kmpNx+z7lbLhqZTIybI3iGuvy0rD9Vp6aG8dEK1jTGHzZ7ZCdl
 qfXQoa4QdJONwLFsgmLb+qieIgMHmsj1FX5eRdQCnpaq/8JQl10mxfxoNo8o2kSdYrZM
 Ex5qjqNQAKxYNhCxgY3JlQjgU6lylJ7WON1mwkVEm93ji3y4klr7D3ygyBmEl0hul6Wo
 9zug==
X-Gm-Message-State: ACrzQf2Us2GInepuDqsBaTkvLge1dGXToQSakc3n9BecBgEOh8M5YH1M
 J0GZhTna7+/YFulu/QGL1A==
X-Google-Smtp-Source: AMsMyM7d4LB4l4q8le8x1CWXfY+uasId0M+kGCbSwVnvSjOkI5HsMNG3Eu8V1sORN0mJObk7QNOP2g==
X-Received: by 2002:a05:6830:440c:b0:661:e2ad:c599 with SMTP id
 q12-20020a056830440c00b00661e2adc599mr10066800otv.103.1666386028428; 
 Fri, 21 Oct 2022 14:00:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056830201200b00661ad8741b4sm1579722otp.24.2022.10.21.14.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 14:00:27 -0700 (PDT)
Received: (nullmailer pid 314789 invoked by uid 1000);
 Fri, 21 Oct 2022 21:00:25 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221021165534.2334329-3-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-3-dmitry.baryshkov@linaro.org>
Message-Id: <166638584258.307638.14223403470296832950.robh@kernel.org>
Date: Fri, 21 Oct 2022 16:00:25 -0500
Subject: Re: [Freedreno] [RFC PATCH 2/9] dt-bindings: arm-smmu: fix
 clocks/clock-names schema
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 19:55:27 +0300, Dmitry Baryshkov wrote:
> Rework clocks/clock-names properties schema to property describe
> possible usage cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
>  1 file changed, 121 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu.example.dtb: iommu@d00000: 'anyOf' conditional failed, one must be fixed:
	['bus', 'iface'] is too long
	['bus', 'iface'] is too short
	'iface' was expected
	'iface-mm' was expected
	'mem' was expected
	'iface-smmu' was expected
	[[4294967295, 123], [4294967295, 124]] is too long
	[[4294967295, 123], [4294967295, 124]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

