Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A5C51CE7
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 12:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3410E6EA;
	Wed, 12 Nov 2025 11:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWkNdcEX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLqB7yOp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C931410E6EA
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:00:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9fVio722118
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=; b=BWkNdcEXNbmvdMhA
 wpqPJkQIh0O7Alnurz09elQuFC8wHmaYte3OrEOvcuVvv0YZPVFbtFjqzJ8UkdeP
 r0G6J0q6z6O5tIE8eGuaJRg++Nzc7WFYSdyugY0BuMIkAQ6EAc99Aoyo5cbJZysH
 PiVwgKicNQgqwflDNDOU01bQjh4F/DKBHnuOO2pkjUP7BuvW16oh998Mg2Ub2usL
 wHIq4COTTLFZ0xtsyny0pPn5EUIsXc4Pc/JoBnVEs5QHUWC5VZVJfdOBP4ukokAE
 J76PP3DU1jQfLO3q5kzE/JWjklHmSVzA8xRomrLaZ0VpEWIix6ANU53NCDGKwsg5
 Vf0nRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1r8rv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:00:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b29f90f9fdso17203685a.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 03:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762945204; x=1763550004;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=;
 b=WLqB7yOpBX2wyzjSb6KlsAcgB7PpmWV1ObhhZd24zerULKSMxLJa0vcLJvbaNe7cMY
 OM90Sgv2HDZcrcSm65gUbLIEEKwHYnF7Q40HYtfIWurMAwpurNxpTmPOZF7vAnnO7x1g
 owtYCCXga06+wLICVvLLyQ74Q/3iKzXTOTEr/6RsbSXckbcuDRa8TRo2Y/253hcKfsQn
 dvMlEa1thKCvb3fcRP2hy1KAJQySShjlIkfiwFbpZnmIk0VPX1VoGNoLrrpJHG+quFSO
 82C5RSKbk7QPYq67zJEyx0hD46wGwAbpYC7WdpWVONdYLEnux1Q4+vdSRLPQTkkZh2bf
 wDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762945204; x=1763550004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=;
 b=le2Vi/iQ/61FjgIXcPOOt9uG1tjU/soFzXHVCrPwdAqJvzYgSEzYE1mZ3DC0MeZYyb
 Jue1QfBzGe/uBL1ngxK/NOatdb6PEzVEu8oRDOrYyx0LFiCyxGuZ4l/+pW2IrZSusHC0
 mZIHf5ieR6iX9Dz7BLrxiWzzJxu06hL6G8P9peinRRP5cm2brDJd8LK2QoDQF3DBrdVS
 hO3ykhQgtldf6/OKwNb4Zt/vOMMQHw6FCyCZKl58GbVoNAj+H+0lz69AttrcDh/IoS+9
 S0kG1vfEjuI+tZpMlSSuQhx8wWfMS/0eJtro8uE6sCAcriCl6shoK0ZlJ4i1vdSn41AR
 6+Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaZnwzl0zswH2yJ3/MdpjphgMt71hxQu3HS8TWpzRgh3lD03Ewyzblj2YpyVVn7vsQoacEc5Ld3uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF7YxoWGMISkhWnbgrkHY/52Doh8+4ObFlVRrSFhDvUMHQAW2s
 JjntEaJeYjgPcqm7jLJZsu8qiXOqqP/f3KxveuR/sO3OBT5ECfG0l0MFvtPVGVlOQbWPAzAsXm0
 W7x2Z6phyyjng9SgrmqEwBeJAndnWGvBGiCse5wtfIiaF15ZVQ4zqG9ZZtO1YMvnRL4SqBdQ=
X-Gm-Gg: ASbGnctfzJajabbB1N13FBx+nPfwNwh/VUoD1rx/z/z0tXyJAu336pFGQbNs6g3snQf
 WeaAcxVhOmzmnjF3wA56H+IFNXzTCWB+r3XlhCnIWM9xP8vTHjbscqGkrcg1TqsyqOM/zqu2EXG
 QzIZD7VbIGmuXzyPooQI8xxqVFsCd4XSQ/IpIHv5l+vZGnlnpsO7tL8EaB5TsNZlv8/G7dh6HxS
 n2CY+/+vEX7G6Rg55NiiicPUnsFKg57JHIGgO6C4hyEn40d9gK4s8yQHSIKDT8Y+40Rrx75Pp1z
 FczJDwjVQPaaIVpW2cxHRerpxs5b1+CzqiotMrUDoGUdN1qJLe6yqXmnXuwL7CNvHKFBpaZeWsI
 cYjEzi+8AbjR+5ECyz3H3aNZLipw6xCpV2LIofX/fExXNq9qskEoC1Kzz
X-Received: by 2002:a05:620a:2892:b0:8aa:8473:42cc with SMTP id
 af79cd13be357-8b29b8490a1mr202775585a.13.1762945204245; 
 Wed, 12 Nov 2025 03:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFICFl1Bei4gFTCtGVVbdiZWnf2m+A7V9QinbX3AbPXIfmcfEzvl/LVm4b+p5mwxeUaPgchNw==
X-Received: by 2002:a05:620a:2892:b0:8aa:8473:42cc with SMTP id
 af79cd13be357-8b29b8490a1mr202770885a.13.1762945203662; 
 Wed, 12 Nov 2025 03:00:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f713959sm15601265a12.5.2025.11.12.02.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:00:00 -0800 (PST)
Message-ID: <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
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
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8wKkQUpIsIEtkS6lUpUFybqiFHPo-asD
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=691468b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sL9_24WXM6ABxRF1V6wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8wKkQUpIsIEtkS6lUpUFybqiFHPo-asD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NyBTYWx0ZWRfXwjdDoaVgb2pn
 irTyFdvoF2br+H2LbRyS3xCu/YCwY232+Ieqrw0tlYEIITmYDC7ZvZuaXWdZJYoHod/L/dFtiFt
 g+5ABNS7wlNY9EETgGjAOv3YzEs/Au0k3nkanMlOeKjFdg+JsAX/qarDEfHoxcokMb/WLIdwQC6
 qGAO9r0J0XwlthNwM3EoGL7HXNzrVuTbbM8XENPRGR5lENQNyWS2peVkM3o6nryZhFb1/KX+sF4
 MD280pyLwTMSHN2xgj6wwYMp92w+E5r+e+Cy84pmiZ4dVYRRSxxIUiXd//fmOVEysZcMVSJ2Br2
 NqhFBbGGY0svzHDX50jyjjG/YXHEPfVlzUR1veSHN3TQjOep3wViDIIkMIuMjjyIil1mU5/o3Mu
 e3WjH4LrYXf1JX+CCKSzFE7lEgE2nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120087
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Current logic assumes that the voltage corners in both MxG and MxA are
> always same. This is not true for recent targets. So, rework the rpmh init
> sequence to probe and calculate the votes with the respective rails, ie,
> GX rails should use MxG as secondary rail and Cx rail should use MxA as
> the secondary rail.

Is GMU always on Mx*A* and never Mx*C*?

Konrad
