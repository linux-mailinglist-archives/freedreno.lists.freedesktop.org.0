Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221695715F6
	for <lists+freedreno@lfdr.de>; Tue, 12 Jul 2022 11:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBDD112A72;
	Tue, 12 Jul 2022 09:43:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0B112A72
 for <freedreno@lists.freedesktop.org>; Tue, 12 Jul 2022 09:43:00 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id nd6so2174090qvb.6
 for <freedreno@lists.freedesktop.org>; Tue, 12 Jul 2022 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
 b=Mp56ho49ONCB9YdoaKjrcHN9VWBBj/JQHylIy8Y66ZDWzu6613aEVMlt4rXLr4xbnT
 /EAd5UzTDUYiryhZdDscI62gJ5lqGH6tOEoClYAJwYKjdWHqTtnEzRM7gY5AfpO6KvfJ
 IdcWdko+YQZQjfCIa7XmsgynjbgkayMyaVnVEybhLgR0nwoUN9uHpzAa61o2YvQAROu9
 9XKte3wpeBCxjHFQ+HRDKFbY2VKQMtC6xLwMlqGrDUVx79hrhUrjEhCjDMhlgFb5d3EE
 hPb+EZyqgDTxqoG8689V7XSNtZ2AbdDG+swssRacz8vsQ3qM+byfPSmjl+zwRPTsES5T
 C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoZBYZy41JFnQOGO3Hk17+jt5jdA+Ko/TmjpBwiSidA=;
 b=dX9Zb5mc0g1jz2jJOU31yOAow/ZRmnz5WInIjjMTMT16NUaJOClYAS1FgQSmrYxmlA
 W5P0WaFa/ReFmofOZLvchN6gvoXWLHSvOTgNzNx/Zimb6M6Rt94UQIgPa+18W9HFcIDK
 SusG7wCxBdvyAapMgt6ySdnJbj0bqyMgNJ6VxGY1os2q1qKJ7pSWxjANZmpK04doi/46
 gCJCcwxMGsLk7leueSLdhFrvXwCM8K87yamIKoaxIk0F8i9ywDeZqvKXswZe6EqnrfUt
 /XwBGRPdbYpSn1i2ex4Ql3fAEAlYP4XxBVPkuNDqOoC8LdoINT4MgylzJDJ1+vw0NNOS
 Kc9A==
X-Gm-Message-State: AJIora+uydJMLFx7xwjMtUV9aBjk0bTsPda+lE4txKDUqUb5hTLWcSSH
 iH7TR+O4Dvsbg4xH1nnt7lvnYwQsbaH7oqovxn5HuA==
X-Google-Smtp-Source: AGRyM1tHoH02JA0eu1BvlGmolAYocWBMRLvOM+ZDeFF0Ju9sWVnKd2I++G5vKn9D8D1RhgOguQYeeGDqDOcrYk768oM=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr16692462qvb.55.1657618979170; Tue, 12
 Jul 2022 02:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
In-Reply-To: <20220711231638.GA449827-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Jul 2022 12:42:48 +0300
Message-ID: <CAA8EJpoHKewcM3upa9GvNhUyKNC3sjqYa2rA-zQk5m1TpZmAtg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 8/9] dt-bindings: msm/dp: add missing
 properties
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Jul 2022 at 02:16, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
> > Document missing definitions for opp-table (DP controller OPPs), aux-bus
> > (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 391910d91e43..52cbf00df0ba 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -70,9 +70,21 @@ properties:
> >    operating-points-v2:
> >      maxItems: 1
> >
> > +  opp-table: true
> > +
> >    power-domains:
> >      maxItems: 1
> >
> > +  aux-bus:
> > +    $ref: /schemas/display/dp-aux-bus.yaml#
> > +
> > +  data-lanes:
>
> But this is the wrong location for 'data-lanes'. It belongs in an
> endpoint node.

Ack. Then I'll drop this for v3.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      maximum: 3
> > +
> >    "#sound-dai-cells":
> >      const: 0
> >
> > --
> > 2.35.1
> >
> >



-- 
With best wishes
Dmitry
