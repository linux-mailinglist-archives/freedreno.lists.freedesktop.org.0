Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA1722D59
	for <lists+freedreno@lfdr.de>; Mon,  5 Jun 2023 19:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5AC10E1CB;
	Mon,  5 Jun 2023 17:09:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335DA10E1CB
 for <freedreno@lists.freedesktop.org>; Mon,  5 Jun 2023 17:09:41 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-bad1ae90c2eso6049952276.2
 for <freedreno@lists.freedesktop.org>; Mon, 05 Jun 2023 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685984979; x=1688576979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4GWJEMZcMO5R6CDwitNhGNBkGuDXmhHZQItLXpH0uTo=;
 b=pdj/9TlRmRWlyOYd2VLiS64oTqpWOU5PMoiNL5+SGh4vpokaM+qFex8O9+ljopL6Ek
 HBHAvWJQ0M7e3j7sWibBIHzTbZ7f0rfjCT19VhAxApvCJvkBEPAgvtJD/iULeeRRvCsi
 K35kvKwzQOmmk0iNm9NTpfGFzEPZdQgW4GpiloBxi+Vz0V3YRJrdjU9HBlFfsBa4rHBZ
 AMMH3+pYaBrY1aT1mSRJiwNLndUGS6EZpe7XL9uEaZ5GKuZDs2fYRQG8OrwCZzXYkbDw
 +AMx1QTVgl/f3GRDvoqcC+bh1ZarvG2crDi3cMscnTGrZkgloX4ChOL359x5llIys0Fd
 qNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685984979; x=1688576979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4GWJEMZcMO5R6CDwitNhGNBkGuDXmhHZQItLXpH0uTo=;
 b=fgvSamyOe1yp38Nu7hI1N1wcsID5sjpeQCcImvF/FYfXE85lyElYBjKvQd/Y40Nbt/
 S/RRarrZB3Ywczpe9xdoiAcn4l3zQ99EseqH6iNb4/MMn2qQRF/EoSzNkOE7A6cSBdnm
 VeQlBq+iGlUGR4/RgKenDgfnEj0tct2+Gs95sd0PLeZBL6DtUO8Vs/kabvRNe9Hteq44
 1c+OdjnFPUG8H9haMcM0R7I5aiV2/1R1VO1/w+6El1+dB+udshaVd5ohMID7tiDnM4BO
 lcCGGPT/tU8RrGbU11HtmsrBU6U8sMyW8JI7qKNPhe9LKnMQs5y/7JO1KqRT3uWu5iDH
 izRQ==
X-Gm-Message-State: AC+VfDyDBJjdmM8pgyyJGOcw7VObbyVSjPwAvUZbUE/eSUKpduvWQQ7e
 Tg1Y4OLqXnq15U2vRdFW2FPmDIGQKqW+aM52icsYJA==
X-Google-Smtp-Source: ACHHUZ4p/Fv7/1YL5aK6ni9BSkRIpB2mD0PTUJxt1VEJdkmZiqICIOae+tEFI3eDyVtAjNHYulgKIeUo+lKq/F6nazA=
X-Received: by 2002:a25:ade5:0:b0:b9e:6d83:7bcf with SMTP id
 d37-20020a25ade5000000b00b9e6d837bcfmr12259782ybe.27.1685984979703; Mon, 05
 Jun 2023 10:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-5-998b4d2f7dd1@linaro.org>
 <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
 <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
In-Reply-To: <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Jun 2023 20:09:28 +0300
Message-ID: <CAA8EJprAiB8xrrx23fX95PnVockeH=6omppEwDJAxU6kGS5LwA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 05/12] dt-bindings: display/msm: Add
 SM6375 MDSS
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 5 Jun 2023 at 20:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4.06.2023 20:04, Krzysztof Kozlowski wrote:
> > On 23/05/2023 09:46, Konrad Dybcio wrote:
> >> Document the SM6375 MDSS.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
> >>  1 file changed, 216 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> >> new file mode 100644
> >> index 000000000000..3aa4f0470c95
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> >> @@ -0,0 +1,216 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6375-mdss.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm SM6375 Display MDSS
> >> +
> >> +maintainers:
> >> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> >> +
> >> +description:
> >> +  SM6375 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> >> +  like DPU display controller, DSI and DP interfaces etc.
> >> +
> >> +$ref: /schemas/display/msm/mdss-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: qcom,sm6375-mdss
> >> +
> >
> > Same as 6350 - drop items.
> Ack
>
> >
> > Similar concern about interconnects, although we don't have header file
> > for them, so I assume we will fill it up later.
> Yep, they'll come later and other SoCs may need a bump up for a third icc
> path soon..

4th ;-)

>
> Konrad
> >
> > Best regards,
> > Krzysztof
> >



-- 
With best wishes
Dmitry
