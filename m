Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18310C55912
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 04:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217EE10E1E4;
	Thu, 13 Nov 2025 03:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2ibn0Ny";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYxZn1Wl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A70F10E1E2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 03:39:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD11LqP2993478
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 03:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V6gfFLOMNYMkWUfdwrHHvmuf
 2M4FWVMTiIkqm7l+1fA=; b=E2ibn0NyZbA3Ts+3iEG8rYsonyqGqBzb7Ro76wZb
 zZI6L5WNFI2zNwHFMTt1D3mIn9JJkfiezHMBwBbUCufUcQ52HHeuYSd1IGIbgy0/
 i15vALVjKL7pBHbSItp4nT4HPtQPzOTuiTWmS2Hahj0/nmRjhSWHhrTIs6FDus2Q
 zUTOp36uw5ratHgr1ZWk47v6meB2RtMc4I6Cr2gKtG160X3rO12oU16zHLyahNMu
 gut8iqAP7KRZaFGftoPYKn9K58Li8a5M9ARctTc6gEhu6JIYX4PR2UfxXw21WY1y
 WnAKCz9A95GPo7BfBo3BIX+rps6T1yMgr1Y9Bf3lr0zBzw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jgm3a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 03:39:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8823a371984so9548016d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 19:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763005141; x=1763609941;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
 b=cYxZn1WlL1anwlPdo1DMAyeVF7rAobtamhHml9trwYhpVP+p7xRc8db99PEGDL1QIP
 D91WciONffnW3jZ3RzXvpO2EWK6yPAQ2yYZC7+EH5+hQSZMh90bS0RzGzUDitonCtLvv
 H/KxMo3nUVoLD+4BXjZy2HKLPOjEgHvUfvgW3miVwd0HHYRIDoRoZUOc6hvcWHlWDIc+
 HZsYA7EZJ+oHWmr+Cm4rINe4xlhyXGEYk2+qSaoYj8BG6Bft4prOShl5XMvhpgKerK8r
 JiYRVp57mUOU2lZvUgHstmkOOs1Q0jHRN+Ibt+ULtqWGUArjsVorezx/brpJsQREUIeq
 YSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763005141; x=1763609941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
 b=R+vKyqZTT1kUvRcX3cxCRyT6HHKUJgdPGpU6RRIgpmn40G0HzQzWP8vK/x6TF+0ug/
 CEfxMJBUkfUfTGv1AgVmWQpzK8S4RcFXH0v7HjDCQCdPC7W5xIL8l1IC/ZaaCpZQX3a5
 YWyliv9wVkv12maI38km9dF2DItp5JiCLTzo45Cs52odwV18by3sdOWgh2NMzFEgYi2y
 uLEN6gLIyVDlyizfEuqXhYs5UUaMVE2hYqPKf1y+ZvSCfe8u5GahwY6hSzhmJflscU+W
 T77rsA4JNIxVr1AxUGmGiVyihZDfc7IGrsIA1S13QkIX9fIM7qmK+3BEEKh8/RnQd+Tz
 A3Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNiq2KEeKgiqMUXqkOzdkKpil4+OHeepgPHqfSLUfzz0aaJDGoyGIEd+mX46F+QdhmGEj6DdixsDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFJvCKZ+n15iqIhuZV/mEkxdH5IfJB6cDadP1aqCk3fbGpF9zS
 GGmXyLVl70lcp5r+HxvqXIHGVri/LbmTQ9SncTBTtg0oJNCEaZHZ/V8gwcuhYaOh0IMa5jeXaCC
 epsQ9ANK+AwkHC3zZm7L/i/eTW5NQen+oY4erUEM2OS5W4dCu0gVmUlMqdTM0Ym2i/DGQdn4=
X-Gm-Gg: ASbGncvHUJkD0p3oScl1g/ta0XiMkXrOzqzsQrtLsGpa6USpri8j6HP3BCM1MBMyuaf
 mCaieSb/Q2D5lHlYEw18+oSK88Z9CnQ0nay1Xs7vwN23KQ3cp9OFYk7OxgzrPd0itSFHMHnOvNW
 PiBhF0ubtXwnTwVDaZAfKzddeAv+49rVQgjOyr5ccUlGpwgAWZM7bMU21t83GiTmZpHz+EoNHWR
 YReN/1QqFqD0zukcSvrTzCS/vDDEXXW72ppynzkJvZJH2c1Smnxf0gug/S5XHVK3cwZ4bxN0ak5
 wqg7m/36DA7dfeJ7ZRBJqajgynK4deC1/XiiJv+tHlc9OlZGlhW6TQ/uaO0pt/Kqkadt7yVx0+K
 frficJq2FLeZxCkDIJu39W3bjP35TO9BOpAxCjjmUuniKH73Zr4I+GtXseXgJmTRiumAYOBBjJX
 x3HdEDJolKOdiJ
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id
 6a1803df08f44-882718ce64cmr59684846d6.1.1763005140752; 
 Wed, 12 Nov 2025 19:39:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLs3C0c93KWlGhuQL2zqwisxhLVaS3eXXtyZ+U1XHiyIF0ajQExCpK2eFHj8X6rYEd79M4mA==
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id
 6a1803df08f44-882718ce64cmr59684426d6.1.1763005140130; 
 Wed, 12 Nov 2025 19:39:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804057b0sm118302e87.85.2025.11.12.19.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 19:38:58 -0800 (PST)
Date: Thu, 13 Nov 2025 05:38:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMiBTYWx0ZWRfX/r01GSFXbuFF
 s404Ct5Ym7OQ48z/goWMnyrDPFjAxq8FX6gPGEI6AaAUn9eNdNcmRBWanGzlhLf1McSanPBkqQI
 gpuCvccPiOoKiewL8N57ULSLsvLh1Niuuf+KdOqQ/+mvJQ15Zwjk9v7i9GSr0h9VaAwuScsifdX
 S49NPlL6xyK5w2hSQfIONbyopZcA6ravDS51/wixxWEfgnKNNN46hU2yorQZosYtxvLHKrQfo5p
 ViRiCGvxqnSIpwlT+D01z33L7PRzlyz9JZbsZF3pyEr654BQVmkYRo8/CGYCEHC2+KtV7ABZvGS
 cDDdg7On8Aq2OCWVon5BWKBHp49402fZwXVY+tglH4MK+9w4hQ97NQvO+UE6Xb6NtShv06/n/+t
 +FL4tLaOsdgORSRi9c1x8bc0TLt79A==
X-Proofpoint-GUID: TisSOgl7ON1K8PLMyj3J_H9rZOg-eXGX
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=691552d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CJ44idKeuHZi8Vt8iyEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: TisSOgl7ON1K8PLMyj3J_H9rZOg-eXGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130022
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

On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> > On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >> In A6x family (which is a pretty big one), there are separate
> >> adreno_func definitions for each sub-generations. To streamline the
> >> identification of the correct struct for a gpu, move it to the
> >> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > [...]
> > 
> > 
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 44df6410bce1..9007a0e82a59 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> > 
> > Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> 
> Could you point me to the holi's devicetree? Currently I see only a610
> (sm6115) and a702 (qcm2290) uses gmu_wrapper.

I don't think upstream was ported to SM4350. SM6375 should need the same
hook, but I don't know why Konrad didn't enable GPU on that platform.

> 
> In the driver, adreno_is_a619_holi() checks for both 619 rev id and the
> gmu_wrapper.
> 
> -Akhil
> 
> > instead
> > 
> > Konrad

-- 
With best wishes
Dmitry
