Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2E0A1038B
	for <lists+freedreno@lfdr.de>; Tue, 14 Jan 2025 11:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D210E05A;
	Tue, 14 Jan 2025 10:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XS/jC6bZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8B410E05A
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 10:01:54 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e549a71dd3dso9751597276.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736848853; x=1737453653; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
 b=XS/jC6bZL+M37kcJ7KVqPu3GeoOVKHZR3l7Oh3gsRUpePQJvHV4Zj9w8GrSWLEpBSe
 tJHQq/xn1bIwWGHn54io7p/2SkWOZGgeAdgCnQ/2ZxCYHVCFBvXpNPzs88oZmKZgx+J8
 oy73Tam/UFYow9hSJ3Dk/c2hymCsU0kaVGOC+lwKevgQTuv2Zc+Fz19pKJxJerAhxVzx
 YQmx8WjY4//f9xiyZnNrH4HrkkVcRweFPwGBfEt+otXQ0aerT/+XlZxBmqVM9tuSeJu3
 RqehHNF9/b4MXI/L8ZmdtpsFdzGDBGNN7hOP8cu08zjYW6l6mvk9xwgt6iTo8wcH/S8s
 DQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736848853; x=1737453653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
 b=UJ7xLwfzAkURk3v3g5iKzbYkoLGhJM9GZGzJCnS+00aPJb6BozcwuKS1FMK4w4b+c1
 ch4r7N/FmAsC0i/ryH3wNdFACyHdkEhQ6rjFJPrNsSIyIbPYUkLlAvvFC7brler58CUI
 VzK6loZU79k/W0M1iO21SkLpJ2Gfftf2glpUs62Sj/dTCnCpfUoUY3QwzTzcIwIyucpS
 OHtlEYduDhKPK1Z3riR+u1Xwl7lYq/BQ1fiqYubHfsVQimOLZDYNy8OWIyt749/7HHMA
 pAvdOStxiCWfPl2vXG8sF4w9AtqGuKuX5H910QCIzLlov2ApHQYf5fiNx4dn2+sqKkRM
 pEWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBjM/2y7trGY5Mxo4vis7JkoPuP7hedFJ7RpAlOV9b8oKBdk8EU5Cfq/Evgo95VZX0gCxMv8mD1ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5nXUV3unKEQpfmoTdmhmmrvJzOH7rSJtyxeloQwJG+HL1i+nl
 oEdep2IT/iZRY9HoyVubVrUSOOA+Y+X6OGqYDgIqPLDI3nVkn+FY0mfvONsDJR7YMw3a3OGsghC
 rdGKaK61TM443g4GbsvigeJfpBBgouoXN/GBflw==
X-Gm-Gg: ASbGncuPnpyKijdcIoIH8B0pzCmUlZ/8gE/aHz3pWoruj7uFxqs6WBIWrs32yGVVM8q
 Ypn/BAKXt5e6Cp2/Qk16nBmCEAfwg+X/p04bMqNAwTO3J0odabwB8/ZPevauikiESPX+F/A==
X-Google-Smtp-Source: AGHT+IF4wP/wzyfnOnwOTA26chuSzZpOuq04s/LPV2Ds23nxlvigRRrAhav3w7FnByCkwW8F4IVHPh28usUdiKj24SY=
X-Received: by 2002:a25:1ec4:0:b0:e38:a031:bbd3 with SMTP id
 3f1490d57ef6-e54ee212481mr14127208276.39.1736848853117; Tue, 14 Jan 2025
 02:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
 <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
In-Reply-To: <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 12:00:42 +0200
X-Gm-Features: AbW1kvbmJDFUCdKe5fDxImchUIrbs_EWdal_GJUHhskaFb5gnzYKEg5u3ybPka8
Message-ID: <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dpu
> > +          - const: qcom,sa8775p-dpu
> > +
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dp
> > +          - const: qcom,sm8650-dp
>
> Parts of qcs8300 display are compatible with sa8775p, other parts with
> sm8650. That's odd or even not correct. Assuming it is actually correct,
> it deserves explanation in commit msg.

It seems to be correct. These are two different IP blocks with
different modifications. QCS8300's DP configuration matches the SM8650
([1]), though the DPU is the same as the one on the SA8775P platform.

[1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/


-- 
With best wishes
Dmitry
