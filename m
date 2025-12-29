Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7DCE6C3B
	for <lists+freedreno@lfdr.de>; Mon, 29 Dec 2025 13:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9510E451;
	Mon, 29 Dec 2025 12:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7HY5ZZc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTSq9Jhx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15710E44D
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTA8U8g3253861
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=; b=i7HY5ZZcTyXTIXKp
 k5rwtPoup9j3d7prC3HZI1RxqebGuUlfHSWPE+DpIrAuEoRvvL9eZs8Azku25N10
 kHIwt59ZYfSz3pldnjYZCgUAiwTMq5NIMQex2NZtqlKzI2n+sjl9VCZZcFy8J5u/
 4ifLZLnQb2hcUeN1zyFhzz9grMJm/BhSb9wYC3YhfJM2YDrGC3WoRndunEQBJIvD
 t38O6ytQhOGyDHKr+JwEoEbqkc+M0CHOdu7DlIdRlyFPxoObTwb/+7M5smj21Gz0
 zGfXjfltypW0kNPJxm87/q2WLA1L3+S9sMdoQd6oxD6Mp5nkeKtKiTb8ush05Zzx
 DMe+Ww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnvhv9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 12:47:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso36144571cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767012462; x=1767617262;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
 b=dTSq9JhxPtD0NzkjRXiW+2NUf+9tnAfMZPU/5wmFPrC5CQm78jp409dH7el3+O1ozn
 5ZFgj3hfaQzY0C8sZDG7/nniNB7h/OwP4EJMgXlDxycn69Dq8RhA8zzM/My6p7Vipk/N
 Rz77GRO2zc2dLhUheq+3M5UUoezqw8tTSy2EFVT32R7I1JPoU7OxXs32BPu2SgSOx0cM
 5sDI14Wi7rtW3tDJZTLSobtufGdH1ntJsHMlgOC0df6IjmwfxOJzLQ2cw+727V6BKlyI
 bVbBFySj96M0d6WqzVZlb2dvEZDG8GF8+WW7BaUSVgM90vcmcgmAhmHZ/QP274RjHnv/
 TyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767012462; x=1767617262;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTngEluiifgHJCxbZ4TtrQRAEGD6uxeXD9/zWx6/skk=;
 b=Rpnu6CCrlccbY+nxG9bce5OQJGkOnMfGmpJ9CJJGVAk3IeqERKyO9pmIKRyX9ZfL6r
 vKQPve0QUOKRcweXW4dLosHLrg0ahI9NaVYXYjU58Nnr63IgW7BKEsw0q6DTpDbNWJro
 UrGTCm8fEElLb8lHeov1bazUPAkFdxF4kXXM3i8UC9VwNR6AIMmMJxY8pAwMKFeBc1pJ
 U2CSf9N/oEBqvUTL8Pw1Wk7UuiGuWQTz9u1FJq2eLIxcbI9RTElX3fOnCmdemf5e2PS2
 tf7kYBYDRNBi7nv2EUHlX/Tpx75VkUTxHcjkg4pPqtTMGD0CwRkDYs7Tqj3xQxqKqz/I
 nICw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsZ9U6sa27XL1/lAVYND0XnX1QFltxLGHRcZwpwphEpdEbNdAAAMO99+rlchUxdRuyDi2HyWj10LU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwf1ajFlC03j8fLqZFc6ApUZCflZE9hXF7Y9Cm27h8eaEQzlZM
 Bn6y18u9Vg6KoyZfmAIgtv1fKpWpzEYzCpPwx9bQUZp/SbDl+7znJMZncuPc1W7sTYARDne0WRO
 Am85MThB585EOTNd9Zrm7BN0QIRMTYnpJNbXTgh66s+kkehw6dldoOtxl5AUJ/SUWI0rGOfQ=
X-Gm-Gg: AY/fxX4POd/r5QtPj2P6BDzAKxFqDOnUkEV4AcRN39ld5KKj8Nb3I9WLpjefdSUp+gH
 yIgAm4Vq05hGEjo2FV+8xsjO4W5YXGFDVwPHyFzcvnZWBVN/oy4NT3K8uwf3K0Hl68+VtJoNSch
 R+Vmr61Ohyw9DwJm1B8Z4Qbf7DtLYKC3cwwXSfc2DmnNOCHQsC8Oq1FQUf74sq5tC1qz7ntL6IU
 vg/viJdfzlOQ9pb6lTqOWUpHcnPV/bcKqJM0PQwWztcqw5c6VnI6i3j6ags5lG/3AiE5XLB1RIA
 Q4XBmIHmDHlI/zR2MgH/OCoasmT6rq+au9+Pe9Ars0JcEbEBX0nrCvJmk3otewjuJPCwXXYI7M9
 YXTZOW8T+zgnnk5tlyX9K4HBa9Agn5XkV3qjXsXZWc737c1c3OQ60m3Zr31WRfvS39A==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id
 d75a77b69052e-4f4b43e96d2mr289064571cf.6.1767012461702; 
 Mon, 29 Dec 2025 04:47:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7fDCqvroWd8Ztt8XruIl7fotzA85y+lW2vZ/2NRrAM1IGqRpECNpULXx3B51GqsYodvmMpg==
X-Received: by 2002:a05:622a:1907:b0:4ee:4214:3226 with SMTP id
 d75a77b69052e-4f4b43e96d2mr289064191cf.6.1767012461223; 
 Mon, 29 Dec 2025 04:47:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm3309954166b.24.2025.12.29.04.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 04:47:40 -0800 (PST)
Message-ID: <05f47e46-eee2-43e4-bc9b-4e3b3268dfb0@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
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
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6952786e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JdhzuzQUjDh6MeSUppIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XLniP5sDpabGrV0EKoaUSKZnAUdW9ldi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfX1BfvPr8uA3z1
 hiiM6W400ifL6nxoo7rhnret4bw95xZ306ApcwgIaqWvrL9kOeinYU4FmDKTASGTDPXCVIxhTc1
 n4vEW/gNq0r2KLIWJDwt3NEBs85SzRjuR/poFCLsow7/PAjfXr+mZt61e0xdpL/BH70jG0eYK6T
 CT+GbjbVHWHgOBhd5N5ZR1Ye1Iqb+eTaGpqO+5NX2fjsPcrz/oL+GlhoghhyoNsIK1CWnm7T6hr
 q9r+EowZ5KQhtL/byY36An49zVT+X2vMXwEC9RhumbyD5zjZHNQ579kbtJoH2K/FbucewzVUBI7
 3ABiycybGkFFDMxKA5qEawxqqJVh5Ugk7+J+lZ4HvDO16n4seFjdR25XEGRlnXrW3EHPcolZHQs
 Zn9RTpXhpbQzl/8LvS1xc4Uc/YtTbRtQG5yAQUZrMKwkQclV99F027ZwdU6qUUDhlSccBVD5O3n
 HDfXh27U/PAEGD0g6tA==
X-Proofpoint-ORIG-GUID: XLniP5sDpabGrV0EKoaUSKZnAUdW9ldi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290119
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

On 12/26/25 7:29 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for Talos chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
