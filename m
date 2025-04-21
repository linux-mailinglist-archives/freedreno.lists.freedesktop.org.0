Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA141A94E0E
	for <lists+freedreno@lfdr.de>; Mon, 21 Apr 2025 10:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6010E24C;
	Mon, 21 Apr 2025 08:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YH1+Q21i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0410E24C
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:25:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLpTlT001092
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FRb6vmGaZWj66VKHke2gwyzE
 xYa6h3+rIt/MDpsOeAI=; b=YH1+Q21ixLsZoKOFBaFCve80V8EjcW9WBgn4y8X1
 CbKmC/skwooMzbudLcoFWR2xDA7v6/fhCvCYPkUa+d7POH29TIrCeNPF6O6dc+Dj
 SEAdWZXKV2a4+tes+UPcogaQgRrBrE+Ze3rmo3s2g6QgsoWSONjJ6kpdBJWBzR3K
 zQESnLM38pmIejBjxsDU1UyruF6FI4gRjF+c+l3CbjUJzz2XjNrqPamDiL6ldZpb
 d1xRgwfEaXroI8sYAevtIDQbD/a1xWyyVsmAnAWmb42VF7pov/oZFN9q2H/B2jat
 bQJEjy03rJ/SYqQBOJYwGSC7gqjsdN742sDtobFgh3qWPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9bj8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:25:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso70391026d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 01:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745223937; x=1745828737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRb6vmGaZWj66VKHke2gwyzExYa6h3+rIt/MDpsOeAI=;
 b=tJ1+RyIQNUaw7nL6Q95K3FZJvgoZ0xVjH/gQmcaz5fP4IsNHmTYSMqG2IUxmLv5djH
 YwbATW+hZjUi5d6FcLnkzECqUhCqk37BeKUfKnl4GFixGxeqftFPXL9BTKzFF22ljAdf
 NN8msLTsaLyTxT9mMZihk59x1fzv6AefJeLANE1J0d3xGUlmO+RW+u4TAjwTU5OMytMA
 RPdbPKMaUIFzZdHbHDT2zxMT5fj2Ax/4SD7uF4ndiCXYALPG/sowr0s7D2Zjj9VhFUiE
 F+bX9acnHFydVLCTNpKrGlSIfO0g5K/DVnpNHD98PrabqS/ivWCj4q9sgahhGU1GQWUz
 IBJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfTE8HO6Fcxp32R+eW/UTu0txlxZ0kVC5OfTT3WydMqYNo/S9B3W8FRKSZ8S6v5swilHX12ndeEcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqeLcdH8M8TIaa08aFI6Zsxe+/47ZIKxZXiKqcoXrRgTi3IDMR
 VXfEi1MzK0l9b+xVavW0hO7K3zkORfrYs5eVcGh5iH8wvGCKEdtLe2Us8RHapUSClfV1XSAsoVu
 dOBex/24NlAzkUrVGK/5mRIGQA+Z3/n5Sm6SLDi6JX7Jx+Q5/fAjDMJ2BuV05GKZXgWQ=
X-Gm-Gg: ASbGnctP0Bs5YG1vLxQcn6hp2/ng0SrrBODKJ+nSBf7/HE0Mxj1MmGltdZmu7GN39hh
 21dJphGq/eKQNsP6D4UCoy2VfUulo5tUXuzgQe4i0yAlfhcNgtKt0H0vAOe8kMpUchxa031Zbeq
 ZsRqDXD6OvqJ/xaexnIbcwIhPkjUEhc/nzMNg4ug+cVGV3kdNJdW3JLp/c7jlLCJ/gU/7I1LtDz
 tomf1hovSq6u/9cTP1dz39oazI4o+z5dS9lP51tS2HxZYtUEYabkDzb5zW2eC10OckEgCHJM7jN
 AVMaogyBLAQbI5oIdcrqLkdeAvmeXegAvdeCUblz9RRH1YhEXskPTUM10eTqBbYeuTXYH9XbSg4
 =
X-Received: by 2002:ad4:5965:0:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f2c4655860mr234166406d6.36.1745223937555; 
 Mon, 21 Apr 2025 01:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcwFV65OMdQz9ncrfoufy1rJ3V3naoM3eXJeqCGxfS+6c9u1tp+a8GZ25KDTC2huv5liCQYQ==
X-Received: by 2002:ad4:5965:0:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6f2c4655860mr234166086d6.36.1745223937199; 
 Mon, 21 Apr 2025 01:25:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109075e91bsm10810151fa.1.2025.04.21.01.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:25:36 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:25:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <fvi3cshu253kfxiwreny66g3niff6zjdpv2xwfr3644gbrj4et@ypzjy4naj55f>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
 <0cd538c0-7d1f-44a4-b89d-f285535c0fcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd538c0-7d1f-44a4-b89d-f285535c0fcb@quicinc.com>
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=68060108 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=DdzL4o_DZVg8PLORQZwA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z4BN4nQZ2hUJpoV0bccNTvarw5hrIo5w
X-Proofpoint-GUID: Z4BN4nQZ2hUJpoV0bccNTvarw5hrIo5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210065
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

On Sat, Apr 19, 2025 at 08:03:35PM +0530, Akhil P Oommen wrote:
> On 1/9/2025 2:10 AM, Akhil P Oommen wrote:
> > Add a new schema which extends opp-v2 to support a new vendor specific
> > property required for Adreno GPUs found in Qualcomm's SoCs. The new
> > property called "qcom,opp-acd-level" carries a u32 value recommended
> > for each opp needs to be shared to GMU during runtime.
> > 
> > Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
> > 
> > Cc: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 98 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> > new file mode 100644
> > index 000000000000..de1f7c6c4f0e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Adreno compatible OPP supply
> > +
> > +description:
> > +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> > +  ACD related information tailored for the specific chipset. This binding
> > +  provides the information needed to describe such a hardware value.
> > +
> > +maintainers:
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: opp-v2-base.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: operating-points-v2-adreno
> > +      - const: operating-points-v2
> 
> https://lore.kernel.org/all/173637143564.1057127.5997544431977689674.robh@kernel.org/
> 
> Krzysztof, sorry for the late response. I was checking further about the
> above bot error. AFAIU, we should not include "const:
> operating-points-v2" here, otherwise all opp tables compatible with
> "operating-points-v2" get matched with opp-v2-qcom-adreno.yaml during
> validation. So I am sending the v5 revision with the below fix:

This is not quite correct. The table is compatible with op-v2. Instead
you should add 'select:' clause which will limit the cases where this
schema gets selected.

> 
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -19,9 +19,8 @@ allOf:
> 
>  properties:
>    compatible:
> -    items:
> -      - const: operating-points-v2-adreno
> -      - const: operating-points-v2
> +    contains:
> +      const: operating-points-v2-adreno
> 
> -Akhil.
> 

-- 
With best wishes
Dmitry
