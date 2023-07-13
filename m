Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF375275D
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 17:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1C10E6FC;
	Thu, 13 Jul 2023 15:37:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54710E6FC
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 15:37:07 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-392116ae103so683589b6e.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689262627; x=1691854627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=we2PYWjlXrhf7YA5e50pSB3r3uKJBwJBvyfkN3HQeHI=;
 b=jMNUKRnZu8Z9jSGLeckxay0T8TRTDjnZxzKefYi0imrqcnKVB3IhTK7zFuCr2uuEQ5
 jenRNsz1alc0k8aXcyY5Bs/btNLljJNoOVT84Gr0oPeMxSxh/HTFIsI9c/GeN8Cyx4UH
 vo3GFRDjiAt+ugCCt6dgTQ+Vcx4nuppHQlE8g7YPimWWFAlirtPvc05aRFKH45c6/sBv
 kQ3lyF7vt7epH7iWyFw7yRaNWH3jjwc+shRQXCjrYOBv/go4w6DuzpNGbygMFwSsByhW
 8oqvBhZdd8hv+S1z/PpM9UyxfF696BM/EhBJjdyoZ9Nxy2CaIH4vHoMwupbf8Llq1/HL
 79YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689262627; x=1691854627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=we2PYWjlXrhf7YA5e50pSB3r3uKJBwJBvyfkN3HQeHI=;
 b=bifPkOA2Y+lI9BoC4vSQucDwMgJOc9vaFXpbIBdvzB5N9gbkL+Gi8B7oYGcpXqaWM5
 Ustn4Tgnm9Zo+OkABDN8UbTkmFf4C901hWxfUo4Jik6GW7cpwcXV3iuI6iXT6FJ9V9zz
 Rsrj+G8lGV8tbSO1nNu6LzBjkNvMPINTkJ3wuLBESubV8FihO8aJXEPmn0okANCuOgJK
 Uc3ylhPX0jFLt5Zh42ahd6kwxvs5iJcFyY73zgQhhKytQuasHXJu3VwTUtOvpohuOTA4
 Xd23wCM853XtSOEhRuZ8u0qskl8/d7SiYLBfwFGhZojn4grIzN9LPKBdoJYRfYjxqXov
 5tjw==
X-Gm-Message-State: ABy/qLYTsEvX2lZN+jyQMb7UricJKMtoyAQH0NsySsMONj/QK9kGU5G6
 xqD3qYsLs59oIhT4qnG1N9+tY2pXOjE6QM0YAeRPSQ==
X-Google-Smtp-Source: APBJJlFupxhatozrXXQGBsLkH0UoI4gbrCdVoIWQ8DB4C6TFi0/i/sIdPC2//Y8yr4CidadlI0nBRPG6IdE52wzL9qk=
X-Received: by 2002:a05:6808:200f:b0:3a4:189b:53a9 with SMTP id
 q15-20020a056808200f00b003a4189b53a9mr2381742oiw.33.1689262626794; Thu, 13
 Jul 2023 08:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <c3ea2043-5d02-3a6f-ecb7-fb90d989bc6f@linaro.org>
In-Reply-To: <c3ea2043-5d02-3a6f-ecb7-fb90d989bc6f@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 13 Jul 2023 21:06:30 +0530
Message-ID: <CAMi1Hd1Z230Vmb1aDS4ns29y6q1c8ZmhWGHArBGJQDq6KSLoQg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 19:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/07/2023 15:02, Amit Pundir wrote:
> > Add and document the reserved memory region property
> > in the qcom,sdm845-mdss schema.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>
> Please keep consistent versioning, so this is new patch in v4.

ACK.

>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > index 6ecb00920d7f..3ea1dbd7e317 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > @@ -39,6 +39,11 @@ properties:
> >    interconnect-names:
> >      maxItems: 2
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a node describing a reserved memory region.
>
> Your description says nothing new. It's entirely redundant/obvious.
> Instead please describe what reserved memory is expected to be here.

On it. I'll update in v5. Thanks.

Regards,
Amit Pundir

>
>
> Best regards,
> Krzysztof
>
