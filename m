Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49C5E8EE5
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 19:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC68F10E637;
	Sat, 24 Sep 2022 17:23:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CB610E639
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 17:23:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id b24so3261260ljk.6
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=sslfC90ZklIf6wLnIhiCKVZK6GJGnQV2ng9fxAHP2yo=;
 b=PTAqd7crGxlL3Jt90Y0i9CPEnGUp9IKfpvAzbV7aEhFinW8Ah02LoOM+2L9CUF5t1W
 iDqJjgUYJiXivgwUwZ0CaNwE2bZ7WfEq5Kj6mQIk/ZRT8kgCHDAYofRTr2hNbDmB+bUs
 ujXM11D7UtxuwMGfabOWvI6jBmjoLB9TC5G/qVvCLQkL0Rqn7wr/3N17TzseCtd3FUP1
 8DtZsyDNkd1NDJLqjrRBzNYUY2MLsQmyLqUwsQpEFapaTb9MR/pq9ossiwmN5DKf3/oa
 1el6LxugZKGXQwYHYNCKlTX2eRDBM6ZQ3oqcUyqXIoBSuOiFAntQwUarXxH72RkTz4ST
 fs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=sslfC90ZklIf6wLnIhiCKVZK6GJGnQV2ng9fxAHP2yo=;
 b=ShR+a6Pb6eeCImYapv+bN3oXD7igRfmWlAGx7pdU2ZnWFbn+5VJvnVXbfX0QqSIJwS
 NDGCqoHZjQMKWYTDGHeHZ4EZQkQx8pgLCeydYrnUvu2LSR+5IAZZYubdy03LW5nomS9J
 1V5fbYk+uhDMszv7vn0chtXYW3Kw7u1QZz2I+VI1NXr6RWVFPofdBA46nqCO6OCAOiFY
 mD9+mVVBsPVED0bOP/HywMMwDdlZ6xtKjQXv8MyMKlg1FwTusIoz3QMEhuuJXfu8+qnW
 nzY6aXhHZcD+jpYsdwtnSYTtQadpOQQJBVQFwYBWke3JY6/v+JyZhF7LwDez9spEIHet
 PBTA==
X-Gm-Message-State: ACrzQf05csEG0mi0gRVYDGLpN2Voty8rBhNySDToSy3EdmpjT8yUS1dq
 UyOphFoDvh/LYiz1z08ajtGlPA==
X-Google-Smtp-Source: AMsMyM5ShCjydTQrfsrfhVOekorNsO14U4Ib+bJE7obr3yzLOM5vn9k/q7IIeT/kdYXHtzXBPUHgUw==
X-Received: by 2002:a2e:b016:0:b0:26b:f00b:a8cf with SMTP id
 y22-20020a2eb016000000b0026bf00ba8cfmr4719440ljk.24.1664040222285; 
 Sat, 24 Sep 2022 10:23:42 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a056512208300b00492e16b7ab3sm1955935lfr.94.2022.09.24.10.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 10:23:41 -0700 (PDT)
Date: Sat, 24 Sep 2022 19:23:39 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220924172339.bebekrawee4ubogv@krzk-bin>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v8 01/12] dt-bindings: display/msm: split
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
Cc: Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
>  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
>  2 files changed, 265 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1681881

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
