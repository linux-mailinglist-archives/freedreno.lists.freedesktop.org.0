Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAAE5E5CB0
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 09:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AF010EA67;
	Thu, 22 Sep 2022 07:53:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1E410EA67
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 07:53:51 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-345528ceb87so89773217b3.11
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3dhkt/pmaLP67fDV/pX1JEdiED5XsVvjRwmnhYIZRjA=;
 b=nINAGlslzDaXgZlJImYxvO5DqotqoytcUwTC4H1Nk9RYi9+lAAtHm7RDhZA0XYTtMi
 BaOfSKnLzWGRUtQvZSEpluxpjuz9LtNi7kZ372jAH74jk5kvPOeG79pCt70PQ8x9YO4A
 e/si6SDqlSozoATIhGdM7AK5OadzeokWp9OQeP6FWfjJiMEbPHMQQmIK0hv7xWYu/SJp
 K/2xMPZ4cIUkuyjWEnWcO1jWoY1o7xaki0HVL28dcPX4mMbP/BBG+Mf98QK94U0Sn4hC
 +kOxfIhK1sWQlb8CmVC9wlU0z9owG6fmiQC/tqwboE3iX497rdgn+wOZ87OePUhHaRYR
 HAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3dhkt/pmaLP67fDV/pX1JEdiED5XsVvjRwmnhYIZRjA=;
 b=EocqYGBX/y5ap5JbCKTKrs+MfeUTZECGHRvN/sWTqaG5Bn8KJdKSUi+pYNoRm/76Qo
 N32jIqRY/AUTxpzKvmDPphKbiTKyy4PwleLKAf/nL2LBabdjuwT2fV53JpCCJgLE3Xst
 xyUS5LDW3fRM3DFk0hGmTL5NHN0Vq9CrgAdK9SmBGwbbfH+fkVQPUC8ORtr3gfoN+GAG
 ohUrnMbcVQzrd9cgcmcQnl6RnJpqsGzV4PyTVUPfocBB8NtI/rTAdCciPbkixXEGb8RO
 Bvy8LohJNR5lyQthTkcCBopdwqcZ9YOmW2Kmozc3y+uEt+9mLxqS12LEBTRqMrRVlQVF
 hfDw==
X-Gm-Message-State: ACrzQf31bBmkN8iOiSkaq+dN4mYWVVLDgUCFV4LxxVpfVQughqt83rV2
 jNm71VJnCDUqcUepaqdnDB/pZg6UrEjmRwgEHAxHCA==
X-Google-Smtp-Source: AMsMyM6x4JzSE8q/cOklOZOtgnPdkRv92ZnB4KCKoosNrYmNyvMKit7J750moIvfUR7OhLAdqHEj2fOm+iETVoKZGe4=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr1905601ywe.188.1663833230340; Thu, 22
 Sep 2022 00:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
In-Reply-To: <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Sep 2022 10:53:39 +0300
Message-ID: <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 22 Sept 2022 at 10:05, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> > Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> >
> > This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> > will be added later, once msm8998 gains interconnect support.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
> >  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
> >  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
> >  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
> >  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
> >  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
> >  6 files changed, 111 insertions(+), 218 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> > index 200eeace1c71..67791dbc3b5d 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> > @@ -14,20 +14,13 @@ description: |
> >    sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> >    bindings of MDSS and DPU are mentioned for MSM8998 target.
> >
>
> missing allOf

Rob asked to remove this while reviewing v6 ([1]). And indeed the
allOf's around a single $ref do not seem to be necessary

>
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> >  properties:

[1] https://lore.kernel.org/dri-devel/20220907195904.GA98468-robh@kernel.org/

-- 
With best wishes
Dmitry
