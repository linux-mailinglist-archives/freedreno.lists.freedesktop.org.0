Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A5556AFC8
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 03:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEEE10EB08;
	Fri,  8 Jul 2022 01:33:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FB610EB08
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 01:33:49 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 n12-20020a9d64cc000000b00616ebd87fc4so15257815otl.7
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
 b=HPhW9RBebWqkQ9PrCQBGni3TYxxHU0PMMIzS+aI8g7tdTc/ktP9jChMXoLxyZLZzok
 6jJbBqFyVY98ivY+HhPAl1eSH/pKrNe+5DUTFW4SQ2V5tO+sIDjoHSgR24wBj+m1u0lf
 WaYaF42SUgX3aZq6FtJWxMtiennDcPDH2n2vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
 b=meN3DKKhHQ2DED53xw5uj3niAcisYFUtGd2vuU2cXRq/8VivutcYioYZ23q2YX9SPo
 Pvnj/cOplBKoLoze1kxhszg4RJQQqvIqGsC4JP7K97JWabBCbnVLW+nz0eXBlsLp0/w5
 Hi0kiui7XxZhIQUlMd/d5BGm6/oTJcgj61SpNR2yEwJgroqExeGJUhhDrP0Bc4y8h4ha
 o7fwJR17bHnFw0WL5rnC1+29INMTSCKJ3GIjQVLKj4Ws3AmUi8dCMtQAr2ANtS4ZZxVY
 kKWSwYdDpI8lM+G4NXucDhOwYzsXdiKEOWRPsZy6ze+GshfvXxGa3MMsbqGdRHzM5pWF
 BIaQ==
X-Gm-Message-State: AJIora/PuTpZdOKdEmfisFlyU5CvOYESE2dix82vusXRzeTbBwb0wAm4
 dVWqErIENEt7oBX8s5nMAAR//Su1efJ9QwzK+qVnpA==
X-Google-Smtp-Source: AGRyM1uyEcjzTSo/c6W2hKlHGeOkhVQpn/Aafq4q9l5KVnaNd85lX4vrq2pZIBrYfA8oXbPHME/u1frODdIdXteTN/I=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr474851otl.159.1657243968788; Thu, 07 Jul
 2022 18:32:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:32:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:32:48 -0700
Message-ID: <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 5/9] dt-bindings: msm/dp: account for clocks
 specific for qcom, sc7280-edp
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f00eae66196f..1ef845005b14 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -119,6 +111,50 @@ required:
>    - power-domains
>    - ports
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-edp
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: XO clock

What is this for? I would guess it's for the eDP phy, but that isn't
part of the eDP controller, so probably it can be removed.

> +            - description: eDP reference clock

Same for this one, looking at the binding for qcom,sc7280-edp-phy. Can
we simply remove these two clks from sc7280? I think it will be fine.
