Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11728C648DC
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 15:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2D10E39A;
	Mon, 17 Nov 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MS1vdrOy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3TUEf8G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D55710E39A
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBgopF2582066
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=; b=MS1vdrOy+Oy8cfz+
 4ZwEhGqMOTwdrAe5cxWzUtNCsTNKX1riWifIs6ssyofVIuMJo4Jt1EnM6NynNi0P
 ZPgH10fRFhFnzTVvml57WpBIOix/bYcQLPTqPjBt5AU+LsrabkfDORwaEtARWzEe
 kpA6rNV8Uyp7aNewdnthP/Yi659y5buh7LTpdSZJ20j7XkHtNcw2J2528/3QVLfx
 RnyeSXp4pu/weMDF9CpkXpelZqyXR/Cu2c5cqFOLGggAgqtshtWZXo9IcJPXANFE
 2nYLuhPHak5VbJ3KWxcKtaRuchxf+4KX0AZwXJbkuO4A2cMXuZ3Ly/up/cvxpGcl
 cRvowQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssfa0ty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:06:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dfb3407d2aso717407137.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388400; x=1763993200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
 b=M3TUEf8GHqWHRNhnOPG7hwxmwuRzpemJRUM97JHknSE1Xu4USJopqsEUEJndPfHYQQ
 JfVB6OfjNQKeWsItgQCLRbiep7tNeypXqcfnhMIqa38zxi+SHlU+z4EQbvsSyF43LNi+
 AjHhayx+q5sG294vX4uoh0SoK4CRusy7JS4jhgkKoUHJhMfoM+/NJPH2dU2D5Hy5a+rr
 nEmAR1BdhSGLnDAd4ezCVsImLr4lsGRhm1ws8+ZAScW8pMHq6SM6kbLIUWtQd++xRknd
 IhPDSQ+rEZnghRfgc1nvCaAYHxvCmHeq1Rk5thR07uZq0fHSUFR+8t5RIKJLcV9U/Nv4
 9h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388400; x=1763993200;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
 b=ZXcZGhkwnlUOikIIqZbJaPolKb0UX0Geaqvmp1XJXxUQdN3g3dY0y8UrXE6VDqWdqM
 TA7srrQJR/gg6M3tt/wnFdDoxkXJIuIDGkMM0edM7xM9xn5+EKQBo34vc8OpX0CumtSI
 ziSn+wXbtUdngOeGDfknufXzvAklZmbDaTrIAF0njRoec3rEiQSxOGknZ7VbnIQ5ihVP
 pUTmXH6NBFNLAKe4TxppYktyEt8WcGqxxBL9kvE6C+gHEENVMj0sTrxIRAKoaXtjKOaN
 stEtJZVgBxI0haYtDKOvQ50YWSeSACAvWvScc/O+ogYqiVts3gaykZNVa7ZpjOeoZRmg
 0S9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHFS6Axm0JAr1ELwtph9kWljW1SoyHvKJSQ2uXceygNaVHmT6DpnsFfHSj4DOCmaS6TSHfg2UD/jQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWVgg5HZbF6f8Sw6BFv9owxMAuaMeC2TrjkyjCg569CZVeUX/F
 36uRVCgzY1Od46Jv0Pq9wVL9haSwHYpOvuzpq3OzToepuvb697/eYuS9K3HLi1Tb18GjP2j0+HV
 CYChdV1BLlSFwA0OTYUJxxSNHq1UlKl+tbNqo5IXUf71BqSiQu88acRpSh64DMoSCDSCmjEY=
X-Gm-Gg: ASbGncuiw3wj7b/YBJLej4zXkHvx/ne35wQSjIi1pchD57TgPEjXe7Z4M+T8WUNqITM
 eGdk+nAsJ4dMUKIKnirCalh3gXV6FQhCWGT06ra70mOy3qg3K74G031LuXSqcYoUI7BI7LwBxPi
 uyWpkvSSumXrM+p07f6EYGEbIKv0yjhHtSh1iJKDXXg3LpR2fnfx8v6Gd+DTL1y+gzBkG/Uxxnu
 UKCJ5KziXeP225PfE5rV8AXznPVa0pQBnCTM1wyrt2OtGWpYio+INtcwMlCL4uCIet4+dSF2XRZ
 S0aCg3hlosl+tN/kpEYtQHUYQTOG4qkT/onfCHVaTO+hEJoQng/5gUIp/ScorW2VK5+A9tvAuYN
 x8c71Qm1n6bIi/KdgROYNenshmhbpzptJO251zKR2Xu5DsJGd2fxuRyyv
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id
 ada2fe7eead31-5dfc85e072emr1619623137.7.1763388399415; 
 Mon, 17 Nov 2025 06:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKNiYRBfXeh/2aXn0HQPLKudUqGsF5V2HxhMggV6/QVJT/a/O/XTnuPbHT42rAwrh0e9Rc+w==
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id
 ada2fe7eead31-5dfc85e072emr1619547137.7.1763388398836; 
 Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1079373866b.15.2025.11.17.06.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Message-ID: <60fb9b8c-86ac-4c4d-aebc-2c9c2f558fcb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eAUln5YMuqKM31V0Lts_Gu33iC-pIpNZ
X-Proofpoint-GUID: eAUln5YMuqKM31V0Lts_Gu33iC-pIpNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX1fCQFUDEcRBO
 +Y8AGiAqAAL/iZ6XXqv5ST0J8iksY+9BXgWLb+D2ryMdh2i8aPvx182bfh6d9QesA5/bPeQHlgE
 zTxMLqXl4LsNZ6LlbhJW1JHQLhLHMkf2tvQZtFIB85KaOIMNQ0gwCEINX63GqikIS0/9lMuUh7Z
 EO00dTwMJPw5O1L+hC3l+sqFSMQK8o1RRYLs+RFAOz0OS5XGhKv9dGWkhoOXLkHYC0pGsqjmJ8k
 pU5yB77X2t4fmoqnGE1qwaL+wbp1EtkyKBtHF9jHpD0zpVV+snQAmQaNZ8x1At2JMXliiBcac98
 a1oeE/KieyCbba3x+fXjhy0xiotRWocGJ1Wob+FGJU82KUPgyfbbZM+d5zLKRF+U4YVByhosKyP
 3jnbNsbQyEMZRNIaTydBLEzjNc2QYw==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691b2bf0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KNdfcIBsQoTh3yukQZwA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
