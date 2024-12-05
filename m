Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861519E4C87
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 03:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FDF10E0D9;
	Thu,  5 Dec 2024 02:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pA7PS3Qk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFD210E0D9
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 02:57:18 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e3988fdb580so619531276.2
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 18:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733367437; x=1733972237; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQd1e2f/WCfmpKmc1IlGJVxFYqSHOSyCEpMUajBagog=;
 b=pA7PS3Qk4vnrYH7KyNL5SIWmrOU7t0ZUEV/76QjHd2tkr8fEgBqB9mHA+H5FxI7euo
 f3qyGd2KSrMkxaZGM2twwLGlaK1+WBiDxE/AEYcWSlPhwz/mWvVlaNQ2csb0vOJMDbo7
 O8x4EVU9s++9oGNsP4Xryt3AV7uBXWhfKQb+DKxcxPGckji29JzxirboJ5UwLJz5nObJ
 uY7/ap/qFkYUv5yNmJD1fa7m9da5KVvcB76DTdg31Zdh3Rb2NyOfBeLsZJUBXxM/KsGA
 RVzIsPcdSEuPtU/cjDwAVUAeaPA5lZLEWwey5vIMKQ9nyNaxjdDtSxL7pjZrElyHDrsz
 2apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733367437; x=1733972237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQd1e2f/WCfmpKmc1IlGJVxFYqSHOSyCEpMUajBagog=;
 b=Cfn9uZNypwMckMRvES/iZURMGGgRyD3Q90ilYgXTCDDy2shHKyCHaDdeaM/U2HOZ9o
 kcmtpypKJ21gY8K4tNTqZnS1f6UZtPugqcuhbJvoCJsEfvtLZcBB+C9xdoJIwFu7T9ju
 3BjxsKYTz2V7ZYhWh6nK+xsCdV7BNvE+jjiOOOyoh6UfCvxVipCfnkiEOms6dsrPyMca
 e8u2qwBGBPEIRWI6saQcTcy5A5cM+mDQiLeQPUllTym7xmWaGDdzmj7B2vbuZW6IYggb
 njeTombILqjEZm/kK9nRUbFtgsR1hEwjFZV3+ZQKyz4YbujFCxfonb2VD45j+UoYsQhA
 2CtA==
X-Gm-Message-State: AOJu0YxncpebmN4Pn1Eir2M6/q+zVscrDqw50BDGGRQeNPpEepnkiDvc
 UMyXVKsut5gkDNbjYWmBlrrbHHW0ngNXD8xBcWkECSDM/+DigvWfpt1xGusT1CkB+2VtsiI9BB1
 azmPiZikxakdgxgIvl3Fd55lOHag/4tiDATgt7g==
X-Gm-Gg: ASbGncswz1Y3w/CZpg3vBgtk/mvavuF4w8WabJx87nlcMfMdx6ZnmXrf8gW6sFAgF2P
 3w2is2432/vPEKI9RTIpcfMppick96g==
X-Google-Smtp-Source: AGHT+IHEYlvv9vh+VkVoPooKamhFKiQeFYVGWKv/auVil+dK+zgMsbz6JeMGPAxUsM/Qb5NegkJdFRL/z0S7RgGo8Os=
X-Received: by 2002:a05:6902:160f:b0:e38:920a:12ab with SMTP id
 3f1490d57ef6-e39d4390c60mr10339235276.49.1733367437466; Wed, 04 Dec 2024
 18:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
 <bzuzxddbxtlzeps7zfx33ghrfm7pbz64mynnnv6t4pznppxjyn@zhjpqwsliinu>
 <7538d45a-e1a6-42fa-93d3-69b6f394e450@quicinc.com>
 <CAA8EJpoRF+d5=gLxVpwB-AR9N3z_1PoG35eoDpckD8JHhn-=Fw@mail.gmail.com>
 <59ee46e6-53fc-4cfa-8bf5-ecd82c2eb55a@quicinc.com>
In-Reply-To: <59ee46e6-53fc-4cfa-8bf5-ecd82c2eb55a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 04:57:07 +0200
Message-ID: <CAA8EJpoTcdy666xpczhmS5RALG4CZ-4Zd-O=ApoO5m9OzRahAQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for QCS8300
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: freedreno@lists.freedesktop.org
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

On Thu, 5 Dec 2024 at 04:46, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>
>
>
> On 2024/11/29 21:44, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 11:51, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2024/11/27 21:56, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 27, 2024 at 03:05:02PM +0800, Yongxing Mou wrote:
> >>>> Document the DPU for Qualcomm QCS8300 platform.
> >>>>
> >>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >>>> index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
> >>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >>>> @@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
> >>>>    properties:
> >>>>      compatible:
> >>>>        enum:
> >>>> +      - qcom,qcs8300-dpu
> >>>
> >>> The DPU is the same as the one on SA8775P. Drop it completely.
> >> Thanks,got it.The DPU of qcs8300 and sa8775p are exactly the same, but
> >> sa8775p has two DPUs, while qcs8300 has only one DPU and has removed
> >> intf2, intf4, and intf8. That's their difference.Can qcs8300 reuse
> >> sa8775p's dpu driver? if we can reuse it,will drop this patch.
> >
> > Are INTF_n blocks implemented in silicon or not? What happens if one
> > reads one of INTF_2 or INTF_4 registers?
> > If they are actually RAZ or cause data aborts, you can not reuse
> > SA8775P catalog entry. Please add corresponding data structures to
> > dpu_8_4_sa8775p.h.
> Sorry for later reponse,i took some time to confirm the hardware
> details.For QCS8300,DP1 CTRL/INTF_n is present in silicon.Only DP1 phy
> is removed in silicon,it not available.so i think we can reuse the
> sa8775p dpu.

Sounds good, thanks for the confirmation

> >
> >>
> >>>
> >>>>          - qcom,sa8775p-dpu
> >>>>          - qcom,sm8650-dpu
> >>>>          - qcom,x1e80100-dpu
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >
> >
>


-- 
With best wishes
Dmitry
