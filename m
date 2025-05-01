Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD0AA65C2
	for <lists+freedreno@lfdr.de>; Thu,  1 May 2025 23:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E0710E35C;
	Thu,  1 May 2025 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6vyi+7m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3064F10E35C
 for <freedreno@lists.freedesktop.org>; Thu,  1 May 2025 21:45:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D34sO008329
 for <freedreno@lists.freedesktop.org>; Thu, 1 May 2025 21:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZWvEe+y9fZ95LVZsDUiRwMr7
 gR6HVKRq8+OepTYfaZw=; b=K6vyi+7mToNIxjqq+Ofgd06E3o9S/X8ARJPRxMz6
 Unhkwgq3QdDdgB7/LoNv13RljEQ2wjstmw4D4y3PKkA7L+u6j2+3OBdSH0eklOdb
 trR54Z6tA+VB0OfEqSFs+thq2Yi/aStvjKUNbNSdbEJbaPV7bChyArEVh30sUFDx
 vr5NUHdJoS+pOtJbUDH9x/GWeF3PzTsOrp6tjU/Yh1ZR2BugoAqMJLO4qzW8WNR/
 spOs4ksP/c4jHEHpbSp+QCDAwjcKIS+x4n2rqgzYGJBU5vL6fM4nWtgbDF8cJUtk
 41i2MzIdzp/q9BCiI+Fv+N7hsX7bay5REUyT6LwjaAr+vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubpk2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 21:45:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2872e57so245152085a.0
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746135927; x=1746740727;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWvEe+y9fZ95LVZsDUiRwMr7gR6HVKRq8+OepTYfaZw=;
 b=D3OZm4jqXbimfVf0oSqcaXp7LbNTXTo19UPyoX5+TCJQnurLuM/ZHGVzWRSdz9VyN5
 r1I23teMrOw2OedpSBqVzm/ArxxmbnByiYUnNN+dU/zwefxeU1G5XeDsL66mVxCpHVqF
 laNl153ojJZQol0U7wwzp1LgptzFoWZ78Enjd2mKfYmm64AhSKrF1sBh0WkEgBalED/s
 aIa7uj66hkwTXljNzwQkWMG4L1PfKVnwDBOyPgb6yY28e28nlBobjbsgo6io05bsif7B
 ceiuK78cxwiRs1xX3Ely90Wg+gp3nSfQ9XH6x4t8wHIp1p3aAXuLZjkrX7fgV5tA/Dxm
 xkDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWric9/wIQ6kMhBuvnIo90QNSCk+3pD2ei88osdLiLchEhfgObE7Xal+WOIqZG0eJbR4AElLmV5wA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJCyQk8ZJWqofBdAw7a4x2/Set/gEzfoTHZQJ7RGWz6jQVjzSx
 ly1lnl7XVJRyhJa/QHmLF07ZP95BRfZZ89+pkbCWKOsSyvnMetoABmMKt6RG/FlxHZmYpcX2BwC
 NHDul3DVdR2uKQwQ80mFqxRbfnnBu/tmWLNgt2Si7LT8/6ykntv2Nnjop1DfpO3FMIOw=
X-Gm-Gg: ASbGnctXqUG9ar6/XWo1r4OgENTZoYb2ykCOCu7eXLQ8Aola4ugrRqgqZ6FUixtCh1X
 SAFP99AsQrzDHIACx6XFKHsEaYrktX4haa0gRPEovcwTuTZussz4dn1rMibDTu7A5N5S2Df8mmt
 ZAkRorHdqgVihzIlfVIgFLKMlmMDLuPKB7eKOxRs0ki0jajgcWrAFMH5409aHwN48nxFkf17aJi
 ExVO78cDfkYpaOvktbgB5v4RWBXpW0RJIBq/qsaW9DlP5W8tIMAYCNsP4AbaaP7v+X+2A1hgcGL
 SCdRrG68nGT7WwDCwTfECwpK5Mm8gCA+3InWcQoQ0luVHOO3UD8/+BvR73lv3d1kZ+rj7QmItVs
 =
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id
 af79cd13be357-7cad5b8e24dmr91838085a.37.1746135927313; 
 Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2T3LiQpLagEU33hPpPGBOSneQuetQ2NiGG7X9LR4oyqvviiI/t4vmBzHx93FvWEjq2NtFA==
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id
 af79cd13be357-7cad5b8e24dmr91832185a.37.1746135926940; 
 Thu, 01 May 2025 14:45:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202930c92esm1997371fa.54.2025.05.01.14.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 14:45:25 -0700 (PDT)
Date: Fri, 2 May 2025 00:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe
 the CPU-CFG icc path
Message-ID: <spvg6kmgzkmkknttwrzjonn3pshj3vvoqn2ffv7euucnkysbtc@vmiqfocytvar>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
X-Proofpoint-GUID: VKlOGz6egpKD-vaA8iuDn4N0vSDmj7DU
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6813eb78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EuULMs42TwgxzVLzQZQA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NCBTYWx0ZWRfX86bsXLsXHDu1
 MRvRpfq1WFZ2zS/jwKSISPHFCnT0hmAAJhTuAaNtJF2LjDYDP0ilYMhKcSfwrE0ruXKDG0zJAcd
 opZyIXSniTOyX0Hf7QCtwKqlxi6a4lLLdPGXXa9LWA995QTmktxckJK73K7zwZDPHOv8m7m4On6
 FZy3JQ3b8ADoIF5CcRwx2qFovI2LdclnBTX4MYrJZhad7hJaKM4XsEH2TSCiQPuXafBOv1MnivU
 cJKMnsfSAlxSLLtpGzngn9kBMskUqpkum0UE2IZeUjU9Ov7slzlGz91E0T7CxjBzZiS1n8v8yzY
 NkIeP8M8TV3s/YNef/krocezYFjcjIad1nqv55gwLiiChuJ6wcUyrejMmuPrTdbLRuQODDI2YMZ
 s47aAGQ9V80GZcfHunL6Ahip7SYBqmENb+oQd1MAI/qi2l9UbppU2d3GX28cj5BrayTXzc/p
X-Proofpoint-ORIG-GUID: VKlOGz6egpKD-vaA8iuDn4N0vSDmj7DU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=649
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010164
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

On Thu, Mar 06, 2025 at 07:11:14PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a separate path that allows register access from CPUSS.
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
