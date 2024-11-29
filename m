Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE79DE7E2
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 14:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8810E1AF;
	Fri, 29 Nov 2024 13:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PvbyHfo6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006D710E1AF
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 13:44:27 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e398823d6aaso525193276.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732887867; x=1733492667; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9FzSqCyT6ED4LwMS943kRoDEw/2qyqjJNe5mJ97Pz/I=;
 b=PvbyHfo6M8w7yW56JGutE8JFdgxR5KxoE2EUYCR9EQc38yM528Lg+if/0tRoC+yYcw
 dOkP/dpgIuVqWoQknE9t/O7eRUL9AYyPnzJO82p+pAQQPzknDATkM5GxCEhx6M4t43c7
 vQa04pqA9LGbvOkQojeDobiGGhQ+7tgsVL9EsPDJGAjyoUt8TMLKi8pASTwxMDvDlcUg
 pTksysf3hKupnEqWE47kItiHpToMyQdLA+pHT28yGIrhrOghFUpByps2ntOd53fNnWjd
 s+GG7pRmXOfLjEiJ5UNTDnl3zktloTnJGwTYPvENl2I4AShhkeuKOqcmUJ7krYiBlc79
 42bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732887867; x=1733492667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9FzSqCyT6ED4LwMS943kRoDEw/2qyqjJNe5mJ97Pz/I=;
 b=fOrHzc4GMZN0N6f1JRCs2ZLAM98nGEl41Da0T/J/vv/a8f9PGOsgXA8K7d5ZalbhqW
 3W9FVJMLK5lh7/KIKv8H+xNJr01PWSD92ThUF5pW56hTOSy+UMBsZRNwTGVyGZMYD3X4
 yOdFbmvxCCL1ZGCETklMILv4JNFQOQf7HCcvgGO3OQ93cH3Lvw79JzJxEitUf41so4oc
 1AtAT9OeYLWfM1vUHozDZbMBRh5zggDhTRfphQ7N0ix6sGFKRkJtK2zmlZnXWwetBk39
 Ao7XjcMyTa+92rUIotZm5zaSJ7tvz01kx6rVn7CzBJXTtl1H2b8jbOwb+FtTXP619Q2X
 XqLQ==
X-Gm-Message-State: AOJu0Yz9Fyjl04FDNGsoClT6scfvBT5Uuw00TQ2y4cXQOD2HA4EXi2+d
 0bpME1SZFWRlbCelzoh9SE65Y0a3aEcAKQPygSmio4v57+3jPkLHcOP74WLzmPlMT/Dc5S+FWlP
 9JCrnIj4OaLyQuD4bZjgCQS/xJ10SYGtjRFFISh+WzUchCh5p
X-Gm-Gg: ASbGncsdYURp/NvSUSnvGl9lgh/arXJMjpLF4lX8ftIPR+M0SIx/b2o12RlpOmBqdYk
 sz9qGlXA2VUR86ibFzaanvReLTOlYzgk=
X-Google-Smtp-Source: AGHT+IGRtsx3ySGeA06XeL4KfmMFOWFpVAI3lPsNOQ8Qb0P9PitLpPoB556rkuRQ5xor1ZiYMmrMB1R7Ox+7NZy7UVg=
X-Received: by 2002:a05:6902:1b91:b0:e28:e700:2821 with SMTP id
 3f1490d57ef6-e39719a4244mr5345637276.25.1732887867071; Fri, 29 Nov 2024
 05:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
 <bzuzxddbxtlzeps7zfx33ghrfm7pbz64mynnnv6t4pznppxjyn@zhjpqwsliinu>
 <7538d45a-e1a6-42fa-93d3-69b6f394e450@quicinc.com>
In-Reply-To: <7538d45a-e1a6-42fa-93d3-69b6f394e450@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:44:21 +0200
Message-ID: <CAA8EJpoRF+d5=gLxVpwB-AR9N3z_1PoG35eoDpckD8JHhn-=Fw@mail.gmail.com>
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

On Fri, 29 Nov 2024 at 11:51, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>
>
>
> On 2024/11/27 21:56, Dmitry Baryshkov wrote:
> > On Wed, Nov 27, 2024 at 03:05:02PM +0800, Yongxing Mou wrote:
> >> Document the DPU for Qualcomm QCS8300 platform.
> >>
> >> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >> index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> >> @@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
> >>   properties:
> >>     compatible:
> >>       enum:
> >> +      - qcom,qcs8300-dpu
> >
> > The DPU is the same as the one on SA8775P. Drop it completely.
> Thanks,got it.The DPU of qcs8300 and sa8775p are exactly the same, but
> sa8775p has two DPUs, while qcs8300 has only one DPU and has removed
> intf2, intf4, and intf8. That's their difference.Can qcs8300 reuse
> sa8775p's dpu driver? if we can reuse it,will drop this patch.

Are INTF_n blocks implemented in silicon or not? What happens if one
reads one of INTF_2 or INTF_4 registers?
If they are actually RAZ or cause data aborts, you can not reuse
SA8775P catalog entry. Please add corresponding data structures to
dpu_8_4_sa8775p.h.

>
> >
> >>         - qcom,sa8775p-dpu
> >>         - qcom,sm8650-dpu
> >>         - qcom,x1e80100-dpu
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry
