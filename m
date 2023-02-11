Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C92693124
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 13:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB510E171;
	Sat, 11 Feb 2023 12:58:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3732E10E171
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 12:58:52 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-4a263c4ddbaso105103177b3.0
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 04:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oxEd1K/3tH5d1vSYLhdbwVCPjkzBT7bQLdYVnXoZaA=;
 b=cBg27ycOOJeuWuoAVI1AJJzur8NoIRr6UwCnVVlmgeptv+Qv3TEv/fKqIBSqtgs04O
 MWHfhHp4h4F3EHjwpHG1d0qNc76RES8Nkqu22ZvdBTzWbDMK2l04Xfd+GvUhic6l/rGv
 PWNTwtiZLEtRIzLrUSR3NGMfvxQCTJU/k2htKE2afrt72+g77MemVbmfR1HSZlhwzjPN
 RXVujJr4ihmBRQqN3glS0Sztj+mL5lYEKQWGbdPjl9Y7aTi8mfC1hS/rIShKrHKDFwI6
 +Fh+0iNrBiGHfKpubSTo9Wifa/q0RMwL0UPM3L/hb/KHAMifn3YlsTyGsEZYH0dqDf/G
 ENFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7oxEd1K/3tH5d1vSYLhdbwVCPjkzBT7bQLdYVnXoZaA=;
 b=57kDJYaiW3YDpMmivG0KinKCm/aGMivT5YZ+2hFVtbdpuzVnkSvPgzsCcRwlynlZfz
 IfpjZuAIqVo57A/+c2bp5qefGZxTm+5aYbCAfn/VaToHpwl9PyXDbzpuGtLCBml/sG/k
 /syPrRN8qOOW7lKYFPdT2KXk1DsIIusiCWHd3WKvyBaAY5osp8PWcnvbnOpru/2QsfBZ
 ogWU/tZ/RgMD2g+9VzOCmpjdXHak6j66Bhktq0BEjegehI733V8SAjbahGk8R+aowiCk
 qTDw6Yh0Rw9d+wpit2EWLr1P2SXDDwaBvk6DSNAgphUek0oyouo2ZskCo1h6HKcs5521
 Ed1g==
X-Gm-Message-State: AO0yUKUYIzDftoHqEg1P1KCv3bLV9Sg3VvY50sbTJTgTBoJmjJCR19z8
 Dt01XglZgEuAMIY9jjyhf1h5I1552yCRhDZvh8iXxA==
X-Google-Smtp-Source: AK7set9yACRtdjGaGofhNB7gIyufNGuFMD4TJQRcDQBFzwgflNqKCO+F2eG8HZZXxgxpcL+efHGFEgZ9hlWpxj5dToU=
X-Received: by 2002:a81:71c5:0:b0:527:3e8:5a94 with SMTP id
 m188-20020a8171c5000000b0052703e85a94mr1761151ywc.68.1676120331277; Sat, 11
 Feb 2023 04:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-1-636ef9e99932@linaro.org>
 <226aeac5-d1b1-2a99-5c17-c26a8458c5ea@linaro.org>
 <b16921bb-409e-3591-d5fb-69212ef4e192@linaro.org>
 <bde0a2fd-b1e4-61bd-2cca-a1d1c60570bd@linaro.org>
In-Reply-To: <bde0a2fd-b1e4-61bd-2cca-a1d1c60570bd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 Feb 2023 14:58:40 +0200
Message-ID: <CAA8EJpo3HbuxeJjdWimwHwKwTsPnzKvm20yQE-8no4A3AqcmHg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v3 1/5] dt-bindings: display: msm:
 dp-controller: document SM8450 compatible
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
Cc: neil.armstrong@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, 11 Feb 2023 at 13:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/02/2023 16:27, Neil Armstrong wrote:
> > On 10/02/2023 16:16, Dmitry Baryshkov wrote:
> >> On 10/02/2023 16:44, Neil Armstrong wrote:
> >>> The SM8450 & SM350 shares the same DT TX IP version, use the
> >>> SM8350 compatible as fallback for SM8450.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>> ---
> >>>   .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++=
++---------
> >>>   1 file changed, 15 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-control=
ler.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index 0e8d8df686dc..f0c2237d5f82 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yam=
l
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yam=
l
> >>> @@ -15,16 +15,21 @@ description: |
> >>>   properties:
> >>>     compatible:
> >>> -    enum:
> >>> -      - qcom,sc7180-dp
> >>> -      - qcom,sc7280-dp
> >>> -      - qcom,sc7280-edp
> >>> -      - qcom,sc8180x-dp
> >>> -      - qcom,sc8180x-edp
> >>> -      - qcom,sc8280xp-dp
> >>> -      - qcom,sc8280xp-edp
> >>> -      - qcom,sdm845-dp
> >>> -      - qcom,sm8350-dp
> >>> +    oneOf:
> >>> +      - enum:
> >>> +          - qcom,sc7180-dp
> >>> +          - qcom,sc7280-dp
> >>> +          - qcom,sc7280-edp
> >>> +          - qcom,sc8180x-dp
> >>> +          - qcom,sc8180x-edp
> >>> +          - qcom,sc8280xp-dp
> >>> +          - qcom,sc8280xp-edp
> >>> +          - qcom,sdm845-dp
> >>> +          - qcom,sm8350-dp
> >>> +      - items:
> >>> +          - enum:
> >>> +              - qcom,sm8450-dp
> >>> +          - const: qcom,sm8350-dp
> >>
> >> Neil, Krzysztof, I'm not convinced that this is worth all the troubles=
. I think it would be easier to have a flat list of compatibles and handle =
all the differences inside the driver. For example, for sdm845 we simply re=
used sc7180 config internally, while keeping separate compatible strings.
> >
> > Sure, but the doc reports the SM8350, SM8450 and SM550 has the exact sa=
me IP version, isn't fallback for that cat ?
>
> Exactly.
>
> What's the trouble with the list Neil created?

No troubles. I felt that it fell out of the line, but no other issues.


--=20
With best wishes
Dmitry
