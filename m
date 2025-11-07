Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A707C3F07E
	for <lists+freedreno@lfdr.de>; Fri, 07 Nov 2025 09:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341210EA40;
	Fri,  7 Nov 2025 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoLrxx3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdQHSC03";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B7510EA40
 for <freedreno@lists.freedesktop.org>; Fri,  7 Nov 2025 08:52:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A757efb2273380
 for <freedreno@lists.freedesktop.org>; Fri, 7 Nov 2025 08:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=; b=eGoLrxx35ZUoDT9Z
 ojzyFKD3egXl3TYbOqb4VCjB3J5rna4/qatWTyyJvhBZdNYwu49xzA3H7IGfRU99
 4Au1rMkZyH6V3+gsUEUs/IgdbIkefAOznBM0eWlB9voKiDQSwHf2opkxtWtEAIy6
 5i70dPmGLLoeGLNn5IhsGllk4R0VvcxNoy2uvUd8HsyqcLButSzbnQsJwFUM3Yno
 Gkc2SIl+Q5chgk8GapalxY1FAKiaz0jovH8UsGCbIj6lP0cEZPFcRsiI4lYq3dUr
 XZcLK/GzFg1hjwaasZiLLTe3gwS4oluiLNmxTrNSHXkwpLLxFPYUzvj/agFM7mrb
 LokUKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9abmrkf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 07 Nov 2025 08:52:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8a35e1923so1640991cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Nov 2025 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762505540; x=1763110340;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
 b=UdQHSC03NhnqcJkun12LKEQYxggipUytGaslmR9GwERGK3xkAb9VCJgNrwlZpreODB
 gLBW2k7p6gvwwXaflwG5kePAgk9ksUXB5EmZdOpEW2ZOeCfvfShicBtwd1RatgCR4HoZ
 +yQn/Pk88tZsdwveiieG/D1i0GvI/bQzCiQTebnkEjNqdge7iZJUiabSw8Zkwhd8bKPZ
 worvmp0OvqH/n+dNik4Y3fcqwqf9yNZk3sHBOBoTGvjIQZIZKp5Iy0kQHrduLzPqqi47
 L1pA68g6yfrEfugEOLM9CXiO/+IlivxUYzUR6k4pvZuLicayD4aGDc7mOTucqP7yNWO0
 rYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762505540; x=1763110340;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
 b=w2qgH7YuC5Atf1cUE4Wccqx6JJ8eCgmGe/p4reMp/8k0VsMx6/x8AGZXLUvDUehada
 hftdUEEprNxTFvi7EIu1VmNzez7E80bdGkx/RgTnMo/J2IXsGBr+SxpTMdSwzIkq5gZP
 r8dY7PnQ/tFQ620TPBjKHdkHiGHlXeS2e7sRYagJeQEtyM2m0RPbVMQjFDUeuj1/TIRP
 JBGjNKvNFpO23rtyK/IOj2stP1/xt0cgGIpacU8sHAZxyaGS1JNzUuIClPKwsixy7hWZ
 GttEDOtTZj4JXE/DVVt2aSTedv7lF/iiitcQ7+GWQUy4gNEICX49GsCJjC+2RiOjQ3E1
 gUyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwBZQgCft4bL9qpEptIHlz5N5ojt3Sqfem7XOA0sCjfvQ5VSMF5gt3JaNFdyCNijTB3x9ARqM/AQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlD7tgn0iHhrxmk2h6MhYxfMBhv/DsHLJHPma1oeKI34rGeb01
 p6ppM6I9WWTgOlx3TZSP5hzHVkmS0q/8Qz2yADrA3+vpyde2Wmavw2cLWUopYLqptw4L/eyOeN5
 a11pTqii0Y/wJsfL1ZGJxkUN2EnPw+ic77ePUYOYNM1wMMQQ3UAp8BAt7KA+5gLYnJx763f4=
X-Gm-Gg: ASbGnct3TZKJxcCTmFjUjX2scIDt2TRmwoNsbrNDWjxyeeem71WCXMUwITPAiafwe+F
 fVBU+fQQNlC+ea3lH/4FQPNiuDNPx/GZPpj32nuqowpbOVohyVugGDvIItCVG1xLeNxOTpvc6wi
 Qt78/DgxIzpTs3rIOwNtUABLCDU8pomEuRKWOHr9VuHne+JjKnvuMp0Ph0RgisoIzbP7prwfk3Z
 7NKwemFyEGilf7E0k70OGbucl3WzvwOaGZkToikwahs0dUii0on+gW1HwqL+hbAPKDV0DIbjXde
 F26BtCk11PPTQBhoX04FVR6yvx/P1Qi1ySaIrCYv2XinRMCJ6BQbE51O0olAXHaBbnWG1sfk1g1
 10qGLhlmzwBMKfoSRNRLDBGCwpRBcZJgMjTweLs3DUPfmWxp4+L/D184q
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ed949f2c3fmr17320061cf.7.1762505540424; 
 Fri, 07 Nov 2025 00:52:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3kG67QsZQNvhXXJLPvhwblVTCY2za9wLcF0KdPzPtUN0EkUbjgVeOtcVYxRajcJ/PwybTKQ==
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ed949f2c3fmr17319881cf.7.1762505539996; 
 Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bd741sm177667766b.57.2025.11.07.00.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Message-ID: <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SuiwEtACYHv01DSipKaVDz0hfPG0cJjS
X-Proofpoint-ORIG-GUID: SuiwEtACYHv01DSipKaVDz0hfPG0cJjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MCBTYWx0ZWRfXxB0+qFYpLxoN
 A2UpE+AHw1Y4YY8pBnNYn8cipGhWOnyxGKK3+1XhDnUJkwPxjo4mufLbPZiSw5XjE3EMK4rYlv8
 HTNnFbDBYxy6e6wVBw6LaBpOIPE3JowS1u0timsiioyvgKzTUmTodHcN2bwaor4xUWVYlkguaLF
 xl+HESe415GdF4xRviCEmkjd+R07d153veOHEUC4QuCIuESxQl8OTULRNBRL/Ae8aVVuvIjHQ2L
 eGd1QrCsC8Je4NJUKDSJzZWFvK2Xxe4a5gEYEQtpdDcb8npEv0XL4iCHLWRao7Z23Ni992KplYB
 wb9vlDMrkGC8L5FQOegAR0HkrgseW/uNUZhoQfjbhQM9TdhV+CrMPDHG2hGfYPAR0R04TpSaI3r
 K8HqWL71GXs0QYadsS6Z89g4BhziBQ==
X-Authority-Analysis: v=2.4 cv=HPjO14tv c=1 sm=1 tr=0 ts=690db345 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=glulLz7CSyDjeoE76BMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070070
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

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.

[...]

> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)

The size stayed the same

Konrad
