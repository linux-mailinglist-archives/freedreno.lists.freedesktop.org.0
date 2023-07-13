Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502B752788
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 17:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD7A10E700;
	Thu, 13 Jul 2023 15:43:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F77E10E703
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 15:43:19 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-c7a5600d04dso814026276.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689262998; x=1689867798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=91vNV3YrdzSjKOSREPIs1wSiF2NAZ5QLx0dAx8l+9Cs=;
 b=rDxvl6mZuriokxBHc27a1IvWgQXE5WtWQswiLsM4jHgQP7vkELi7SgUvleLqEdYIIi
 B9/qrxBoc+4j0fCZdTZIhjUHaRaf40Fse3iVbhOvpxTQxsHQgptK4AL7qbTv6mB/8g98
 4kd0ufDwOyI8auYr+orVFJKIBCOxqO2WwlCZwsEpqVtWc5lWRgcC3RRHlwfWeecgV38y
 nGBAe6NgwdEV6LivipYtblUKtzZmvJtqLRDZx3WnJBwQ1N1inP+HXpt4X1iLE6Vq6wY5
 G7s/7BE9oCLkKLnlY2c7E2dPVpBKOHQ2ES1DRWo6GHXAqteGNAQeb4eyzFFVI9vySks/
 cdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689262998; x=1689867798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=91vNV3YrdzSjKOSREPIs1wSiF2NAZ5QLx0dAx8l+9Cs=;
 b=IKNKobivu59jj8lESEAPuG6V6j9p25F6rmt2lcEaLxyI/bCd0qN3NmacNNZb7yKZMA
 /2yQqRcHv1/FhMde8urr1jWVOKl56MAOsQFpqPvd1kOVdGx06RprT20Q0jiVLTxzJ/Yn
 XO28+w2VtBEUOKmrYppMqf6H8cvUSlttY5Z2WLUD/63hUUhctgyC2Tl2FAKNcHeqoOlw
 KAcjllKc56xoVW2e6+dI37ejj3DMCduqQ5due2uKxt6oYm2ZZXbdhcUy+iZihuzr7pvr
 r3pQrIsEc0UYw+dkDP8Q/lptLtQraubNSf4lKLCVmuskuUXPxiq8XUiknS4lGyszugA/
 4lkw==
X-Gm-Message-State: ABy/qLaGeWdaqYHOGxyOoGqYlA+SyKkUhLASAN7I1HnZv1MXms0W4ylS
 8ZOwBvOJhfqsLyQBkZD0KekcXW3UZtTwPQmnJDvDxA==
X-Google-Smtp-Source: APBJJlEzqkIycBpd/dk78rxLiZ5DOQgoh2uewJ9I1h61UlwEZbrwkONkI8ayCwX25DFG4WRdWqcFsLGGtlya5l1nooE=
X-Received: by 2002:a25:c0c8:0:b0:c4f:43d7:7daf with SMTP id
 c191-20020a25c0c8000000b00c4f43d77dafmr1554760ybf.1.1689262997949; Thu, 13
 Jul 2023 08:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
 <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
In-Reply-To: <CAMi1Hd003r1kJ6e4r2urFtN1BEnCRatLcQ1Q7Eh5wBdj=2WDFA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jul 2023 18:43:06 +0300
Message-ID: <CAA8EJpp6yprRL3qzM9pHt2uJ6sb-nPhwas5qm9aDthegSaw7DQ@mail.gmail.com>
To: Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display/msm: qcom,
 sdm845-mdss: add memory-region property
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, dt <devicetree@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 18:34, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Wed, 12 Jul 2023 at 18:45, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 12/07/2023 16:02, Amit Pundir wrote:
> > > Add and document the reserved memory region property
> > > in the qcom,sdm845-mdss schema.
> > >
> > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > ---
> > >   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > index 6ecb00920d7f..3ea1dbd7e317 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > > @@ -39,6 +39,11 @@ properties:
> > >     interconnect-names:
> > >       maxItems: 2
> > >
> > > +  memory-region:
> > > +    maxItems: 1
> > > +    description:
> > > +      Phandle to a node describing a reserved memory region.
> > > +
> >
> > Please add it to mdss-common.yaml instead
>
> mdss-common.yaml didn't like this property at all and
> I ran into a lot of new dtbs_check warnings:
> https://www.irccloud.com/pastebin/raw/pEYAeaB1
>
> I need some help in decoding these please.

I'm not sure what happened there (and it's hard to understand without
seeing your patch). But after applying your patch to mdss-common.yaml,
`make dt_binding_check' passes:

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..924fe383e4a1 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,11 @@ properties:
     items:
       - description: MDSS_CORE reset

+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved memory region.
+
 required:
   - reg
   - reg-names


>
> Regards,
> Amit Pundir
>
> >
> > >   patternProperties:
> > >     "^display-controller@[0-9a-f]+$":
> > >       type: object
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
