Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330D5E8F54
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 20:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332BA10E07A;
	Sat, 24 Sep 2022 18:27:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE36D10E08B
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 18:27:22 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3487d84e477so30563957b3.6
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JxrzgfxApmWB8NBqb1wQvRFuNzvTICyUAKynMb46yI8=;
 b=g94fGvcEckzfyT/KF/vWdxoEhe0MKwlX+DUzNgYXklxi/UtSSVvcgPvXBkFLWZsu4U
 6GVTx4NdvHsyim/zVyJmRB27Y95Xa772Ej+njy5Dsoy6R6xpPiK7UGR+faCJSreOOrww
 gV9mz39X1ywE+O2SRGDGvJiHm+8TfoU220MT1dpUFQl0gbPAhLgOciNw7XHpqBSGFNaQ
 QHOfi7WQdCunK7YmByjVS6rksszxAQDYu0HuqAzRniHVidflSVo0NiyqVp1Jkbbxv6NC
 yfRZqdkq4pBkgCgU+tBj+2tZU/l4H0/LRMlbgN4bsdCipiFcH8SLwdp88pfCAZI2TOFG
 kyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JxrzgfxApmWB8NBqb1wQvRFuNzvTICyUAKynMb46yI8=;
 b=xIjXANKHXQ26uPonnGw8DlxvyuB85+DesqZQPrQ/ORskDlLcgt1S3I8Q6fGVBI4dHW
 pJ7Hmn9H73gh8ZBjwD04/KgBwOaboEJCDOvDx6D+K4gONtZ7d0F9jaaEx9geUg3Fakes
 TYkNHgsZUA6Y4aC6GU702OuOc/+jM85mg/e2lO+oQcDPp0IH0r0bYIBba/eMhCbU3YDu
 lma7ukfhnYgpOczOcgPnNAoQ3ZPiFoMF+9Kbc8fpLEFDJJ6zEVGAGBZmTgULI9zcSWZK
 x9Y2cBC9kpjhXFFpTcQnloSiYak41+lOeJOi3RyAX/xzWbH93IvU1WiuN7fC1aB/MTma
 BNkw==
X-Gm-Message-State: ACrzQf39eTA9OkwEjG+uRhwIqfqeRAEM672HuaXin4wo8EehhaUNZ4WH
 wX/Ig4Q2e5RrVI1UXs7sHGZyGs27uDrMMVkn+cyjZw==
X-Google-Smtp-Source: AMsMyM7v+tXK8lfQAiAaF9Qy6dCtG7stCIz1g+xy7jiiQaS0jaNh05vITohMH5ZizxvRVFIMPYCyl4HOeFlB13ny9ew=
X-Received: by 2002:a81:c45:0:b0:34d:21de:b794 with SMTP id
 66-20020a810c45000000b0034d21deb794mr14850122ywm.138.1664044041621; Sat, 24
 Sep 2022 11:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
 <20220924172339.bebekrawee4ubogv@krzk-bin>
In-Reply-To: <20220924172339.bebekrawee4ubogv@krzk-bin>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Sep 2022 21:27:10 +0300
Message-ID: <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> > Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> > yaml file. Changes to the existing (txt) schema:
> >  - Added optional "vbif_nrt_phys" region used by msm8996
> >  - Made "bus" and "vsync" clocks optional (they are not used by some
> >    platforms)
> >  - Added optional resets property referencing MDSS reset
> >  - Defined child nodes pointing to corresponding reference schema.
> >  - Dropped the "lut" clock. It was added to the schema by mistake (it is
> >    a part of mdp4 schema, not the mdss).
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
> >  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
> >  2 files changed, 265 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

These are the errors generated by the dsi@ node from the example. The
DSI schema is handled separately (by Bryan, added to the Cc list). Can
we have a lifter for this patch? Or I can revert to dropping the dsi@
part from the example.

>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1681881
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.



-- 
With best wishes
Dmitry
