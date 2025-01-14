Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B1A1050C
	for <lists+freedreno@lfdr.de>; Tue, 14 Jan 2025 12:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406410E16D;
	Tue, 14 Jan 2025 11:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nURctGN1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA18210E13C
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 11:10:29 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53f757134cdso5334348e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jan 2025 03:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736852968; x=1737457768; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lSEEVDHkJF+59l08MDf/HdvOaR7SqGhIx6AtZQIytfk=;
 b=nURctGN1dT+Q82TkfjNxJf52oy1TEIKQajEIifENsy5Cwc8ecWI3e0g74F2iA1Sa/C
 kQ4qJF+dEclyHvl55GovtdalS18GN6daols6XVWpRsgQ9s6aWnhwYuYXUVfvloWVykel
 NR74ZKtgbzaVrHyEhctPjypvZS5JA0XM8a3t/bD8RBdiiTj+V+2nCgEozzp7Osi4z6Aa
 PHbpv5n27fRCO0NytYaRyaYh29PRIAYcZ2ciBpFnsnsmZCfb415aVYs0XQDCw660Ngfa
 34y5/On75y5wOkLieZ+LVnrBeZoPTqa3Jkkq5oeOW9fQJKuUMQJ/TAtZDjCkxKltpMix
 i4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736852968; x=1737457768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSEEVDHkJF+59l08MDf/HdvOaR7SqGhIx6AtZQIytfk=;
 b=FPPIOmdxO2Iq2eeVyKb75myJW36Ma1wc9V8Nq82QRCcP15LvfOJbXI6WhrC+pDJHbT
 FyLY+9WNA5jsE/mmI7Zy5PHI5lvXJgrU9mDd4GKRr53i5DftwjrJBYye77II2YX0EYCI
 XSNPPA+O4o6RF8ImEEB68RI3qZ4QftH5qU5Ji21EPmUmFsnpcRFrM2AwidIZMfosmZsd
 bjTT5UEGyRBFrZ2ng127aCPe1snKLQmy/uG5rz8S5YQWntW+e6h5Ibt61UYmshbml5AN
 iVDqcsNOdFnCT3S4DxtLItA27HWEdsrJCpZphGrZMPg9Fr4Q4lD2TYFmtSiVX07ipVSC
 YFUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtspoUsFaAlX49FCthapSeApzNUnqNmh5Na4Q7yidt/gulv4bAPr/Q8IjcfmB6BdF1vI6wT+osnM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2ryH26xK8mVoW818mIgy1m9pZsyAdX5CY/v4hu/6xmS4nI7gn
 nefN2TmjmQoZXsrmQrX0xf9ksB74qqJmMaiJqSYHVCmEbX0qGDLG/2M54+TZ1Z0=
X-Gm-Gg: ASbGncvGp68kvJLaC2GhIlyFHAnqix3jIJMl8kUxZVH1FbIfCDDb6zUaN7Zv1Hqljgc
 NXf1sqbFSqCPhV1ZCw/Q38Q+M6zoRSUeL9zYjohOI8DH/wLPdTf3t4GHO474WgLyqvQ8prGFjum
 wLneD7KNvH+2wqObtyOQShT8nj8JcQL8JkS3infVp3LLJirgwWP/k+pqmRl7o5FNY7mH1XAonka
 5Voqt1vK5FwcnDeHwfw5SWk/FwlVCAmgSq7MhElWOM9dVVsy7KtX7b7XQ93U74ZUP3RfdIBEZnf
 UvdGm02GppsaDyYLK7cggcmyixTbqsqoxYqU
X-Google-Smtp-Source: AGHT+IGsHdnrR/PD2l0aAbVi6WVa0Zza137alj0eWph9uI3wb2zRUaR8X1MT+Wuu41m9TUTAYoQAtw==
X-Received: by 2002:a05:6512:4024:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-542847f9ea2mr7548782e87.35.1736852967850; 
 Tue, 14 Jan 2025 03:09:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49943sm1652662e87.25.2025.01.14.03.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:09:27 -0800 (PST)
Date: Tue, 14 Jan 2025 13:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <rx5jyaehsgdw5cluyjtrn5yvxnd2uemdde5jbvq2dq3dirr2ak@hkegxop7tiew>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
 <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
 <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
 <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
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

On Tue, Jan 14, 2025 at 11:11:23AM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2025 11:00, Dmitry Baryshkov wrote:
> > On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> >>> +patternProperties:
> >>> +  "^display-controller@[0-9a-f]+$":
> >>> +    type: object
> >>> +    additionalProperties: true
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>> +          - const: qcom,qcs8300-dpu
> >>> +          - const: qcom,sa8775p-dpu
> >>> +
> >>> +  "^displayport-controller@[0-9a-f]+$":
> >>> +    type: object
> >>> +    additionalProperties: true
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>> +          - const: qcom,qcs8300-dp
> >>> +          - const: qcom,sm8650-dp
> >>
> >> Parts of qcs8300 display are compatible with sa8775p, other parts with
> >> sm8650. That's odd or even not correct. Assuming it is actually correct,
> >> it deserves explanation in commit msg.
> > 
> > It seems to be correct. These are two different IP blocks with
> > different modifications. QCS8300's DP configuration matches the SM8650
> > ([1]), though the DPU is the same as the one on the SA8775P platform.
> > 
> > [1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/
> 
> That's the driver, so you claim that qcs8300, which is a sa8775p, is not
> compatible with sa8775p because of current driver code? You see the
> contradiction? sa8775p is not compatible with sa8775p because of current
> driver patch?

I think you are slightly confused with different similar QCS SKUs here.
QCS9100 is sa8775p. QCS8300 is a lighter version of it.

> 
> I don't think it is correct, but let's repeat: if you think otherwise,
> this should be explain in commit msg.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
