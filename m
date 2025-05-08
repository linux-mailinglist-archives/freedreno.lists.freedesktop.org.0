Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B152AAF1E4
	for <lists+freedreno@lfdr.de>; Thu,  8 May 2025 06:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2E10E0B7;
	Thu,  8 May 2025 04:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIr0Em04";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0210E1F2
 for <freedreno@lists.freedesktop.org>; Thu,  8 May 2025 04:03:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481M3uq014707
 for <freedreno@lists.freedesktop.org>; Thu, 8 May 2025 04:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WFGwx5PZ+G/9BxcVBebd00iL
 tXeXpkwlaZ/P+6/sls8=; b=lIr0Em04WtZl73eIUNkTUGI0JaqxYlvgs/JLqJlF
 OJhiYw3N9NXkePvJM+V/qosXsoViXifU83bw3AIlcsfYzv5h/XR6V+aA7ckOnLPJ
 qjcHtdVMCZsAsHltv5hCpRvjIxk1Yv1gzW9ILZQFAEAKq1QsnZjzrkt7xEIaLDOR
 5tGH9wJ7jz+Dpb/dKf4PhG1HRWcaQJDlCdxvWZLaHEb17IEB8I294Ub8XbDcJ61t
 6Cp/7TkAlYnHUxjg30Rnv3OCFnKGgHKHrQLSbZEagbeooCm3GylYAawzhQmMH0rv
 Iikx67Uy8lFxRjAJf1kWRMw9YvzAD95kbXTTKfGs53omiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g13vucj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 May 2025 04:03:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c95e424b62so284353885a.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 21:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746677002; x=1747281802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFGwx5PZ+G/9BxcVBebd00iLtXeXpkwlaZ/P+6/sls8=;
 b=UXDFkGd4i30ZTUnF+EU+JLjCIXfz64dflDSmmYpuxv2lD4fP0Ulzg3lP/BAY+snlkG
 WsH4JcyKx1U8UT7zLnCJr4epOldddBJ87vwGE8M6g1toOqVzbg22D/oHecBon4XbzXBh
 b4XjquUhM4cRd6zYnVoyypSSecU4UzA/jBqeTAguLn4jSznDpOYethLMc4f2Co5jRU9G
 DwGy8kSIjdHhC40lOSOp8gVnLUYo1BKfUt1uX9cbh2bNcTr+jp7G9ytwQ1ouKK0DUi9D
 o+9d2Z4OSrNadavyQ1hfEbE+XUx7KF3Z1hYm8xjbL0gWVRDrm8gpRWj0bEaWCGDJNtuo
 s+6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrHTm6scx7nB4YhvraeLeS8Ofj2hJMUCiFHNBPuwPtZjaL2BBw+AWNIW+nNhK+fZDYpvnQmscoi1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbu8uALkMVUDDHVOlG8R+MpsWM2i+Arj9Ed99gb1bZfg0hnUsu
 Z42oWrvizdF5k+EkW3phNpKwT4d/czLmpbwTjoxBr7JkPvqqSKyh2R0pTOAldGHuV7SZoGcAShB
 ydY73wUMhkLykUEjsXxqpE/fPueX+/lhj9Hu/yBSVpnTKBKXPu0S1leowE36PrXXF0UU=
X-Gm-Gg: ASbGncuvXy3OFY4jqmByc/gdEO2g7h/TjWsuPjEypzLEOGd1ckzoYjg8mmyVfcGdz8H
 ijmNxe9RzXzg02yqgqF14HuXNXBrzHcWJvd3CiGsaU8QY2fbh+oc2YX/hRtrETl9IsTDlhiyJ75
 VpPRSL5T6QKsNW1h6fh35gJjA7ZMTRaQ6Lk9n9isGNK+UM8a3YCDG925Zq6RAWUVNHeOAFn9fGi
 jkFvM0qJg4sqdevBDqA1WcV72cMOYGZbcKYXwEQS0e5HrU1w4xsEvr7wplxp5/qAaK4XvEWv1zU
 qxWQC7k9JjVBC9T1RXvIo+H+FgdGrZbUbDjJvN36yvS0D6+CTtSo5PEiOSLmXN1roKNkWuDjdJE
 =
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id
 af79cd13be357-7ccf995e1a1mr366748985a.7.1746677001621; 
 Wed, 07 May 2025 21:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCvb8VK0sMuvhaF34y+RLN/zFk90fkQ04v2q+mJ14cJV9oLuze4zWQomR2mbFMyLbVM3zhmg==
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id
 af79cd13be357-7ccf995e1a1mr366745985a.7.1746677001155; 
 Wed, 07 May 2025 21:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32028b38ef2sm23996481fa.23.2025.05.07.21.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 21:03:20 -0700 (PDT)
Date: Thu, 8 May 2025 07:03:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
References: <20250507215912.2748964-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
X-Proofpoint-GUID: BkXYdDmDoCvR7ggTsb7fpLqQMK_aySTY
X-Proofpoint-ORIG-GUID: BkXYdDmDoCvR7ggTsb7fpLqQMK_aySTY
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=681c2d0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LCLtBpLZ_J7SsqHOqrgA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzMiBTYWx0ZWRfXwUF1VSZw1Ntd
 7sjQXRPb6QiH2jkmw5DqML+lueQOPKhzDjtZbyVR7GU5RNtVhjs21meCgjYUpXVdFv17mDMBsTV
 ygDSPuGe/KnIHBI5kbtxl2v1z4WnphIl2GGf9KSaSKj3BmP9DF9u7Iri0oMrLuaSzMybAmbkpdT
 OXWK6JYr0ae5KOalsdlNXFAqwtdXhO89D36vPWINUZ8wZti2D1wH5l1AOw+st1qzV4iGhYtaPjV
 lg3d4+1HP6yY5irnmV/VPJ1IQPNa00UAIn3LfVY5dCD0uOmSklcWPQMCylnBuhcadQ0Vp7Yb5T1
 kGFXu3XtxK0yaKZp27cEARwMx5kr8FgYJlpJFBHS0Qr351ixU/7HUv9NUCpaNAsrLPBvgKC8cRT
 NgQ9OAqOOu8b1WNENd/0ihO9SzOewlAMROMJ5oG95qPV4jeIhSSyBydGtzZpLBPsCSsJfJ9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080032
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

On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I've verified, it applies on top of msm-next and produces no errors. I
don't see a meaningful error in the bot's message (Rob, is there a
chance to fix the bot?).

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index d4a2033afea8..099274d35680 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -89,12 +89,12 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Output endpoints of the controller.
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
