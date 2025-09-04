Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B3B4327B
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 08:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56C10E979;
	Thu,  4 Sep 2025 06:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUBraTIi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464E010E977
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 06:36:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583N5i0V007669
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 06:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=; b=UUBraTIiFcKJ6O5N
 918tFPm4wsDxLklKZtmyxTos6whJ1M2uIltlFrYEOlQKn9p+tYRzNJ4Qy5LKIYUQ
 OOwaMHJIH2+ZEqTVRJtydZy8ifR/h+dRWXcIZ2bW8dshnckSC2gf6aAfvoRfpZnZ
 OLkVucATNaBNeSRfan/+aY8UUJSSWabrf6WOtHoxqAWYMSkzhobJ+E7lv+uXKih3
 Y6GGHc2l6bGbDwT7PhNO6ribX19Nq3teOnAhwWK/ilIdYiC0P8XeJqK9veAPeOcl
 eKfr6HcHe0DAGxARIgmhYFahTMTkiIGU8pDQtLoeHkQC2TizaCZNfHl4RM7TzKny
 9tjN5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyabtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 06:35:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-329e0a8337bso829427a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 23:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756967758; x=1757572558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=;
 b=Ju7N2Apfmake9GjSaR1hJG0gorg/HwisWqGXR+gF9pJIhVSSLoFpR/wxDRTlIIBJt1
 KM1VTWrSUlcFSq02/Bsk4Fmv3ThSDqwKU3R6jkniW8biAmwd29kruYs0Vw1WMkN1ZEJl
 MWohjQ1p9qU8sJLtlAcDsRpVVeZq0QefOEDNpLNKplmMpJTBTDpaGFiHVobC2PuswJiF
 p/uvv/tRLdJWU9fFLIun+pjbrzOiFCkY3b33rnQe2OBXDqE8vP/IdENSMimM74b78wCj
 bMfPPBoXmRED+jroX4UNOvD7bYSgRWzY6GVaDwI/pT8weR3JwED48VXBLjxZBrwFMqth
 AU5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4gO+7di1rl/CrB+6PHOWa4qpkwHk49K//+ZkwOObJ+cLEA4NO5r2uiz8j9/GmpQSypwTNSareRLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd+ets8oI4ru6GJQA/rNV96iiippSYegxLn1g3XnkNx0vUQ/eT
 uwk7qWIqaKnJ2aW8aNbIQeZdld74bfAeXaShyG+OjNqUdLtxqsnPbrEMbNTvlrfv0hYYcV8ZEsT
 3y6c6zjT/K6tvg+hwGFQLT/MeOkVDO66AdQrUGjgSPRZpYLjZVHn3wb8cSckTUz8mdFkKN2y3bc
 yc4kQ=
X-Gm-Gg: ASbGncs+ZIeeiEcjuu3VGcDSzR7vIs3Bd8sEKETnZzLq3f2KCGfl2nj8VW/4U+2V1IT
 /5X/emCdYBk7vacNtlkast+2wUT6z/Q2oLkhet9IHvJPLsFD+MiTF4r5QINvhqKISBb7Q3YeQME
 Hw0XlzI3PEbo/2mIALu/BL1wIQ3OR2SyX4G1PcX0RkIvuMIT1SYpr5GgzCfyUxmVjULpl/zR7Ms
 MFolYENvpETY1/nrjGtP52Llc28GVOTy560XrtZQ5HF6AdbWjDzgfGZtBuskOEAW0rsyEmRN8eP
 bQ4yKopdS0HECpFJBQyrwAghADq51YhyEPuappEOpQcnnGFaWTni/lHMuibbRgRGRA2Co891D+a
 LK7QFHAHaWzQD7zat2iI/HXko+gR+Hw==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id
 98e67ed59e1d1-32b90a5f1f2mr2536805a91.20.1756967757710; 
 Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0AZclcAiAIE/RLioDWTNitUCYKwiFoqEf+Fx+HDf/RA/CibTj/rrt4B/KuNcWo8T1gpG/rw==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id
 98e67ed59e1d1-32b90a5f1f2mr2536773a91.20.1756967757183; 
 Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4fa1f21415sm4007673a12.18.2025.09.03.23.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 23:35:56 -0700 (PDT)
Message-ID: <25379ac1-4559-4803-b03c-bd24355d3b4a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9334f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ik-895_utKsnK2WA_CQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BMxT6W15cbpBeFgoduBJ5tys__navsL_
X-Proofpoint-ORIG-GUID: BMxT6W15cbpBeFgoduBJ5tys__navsL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX7Ykc13VrC5VY
 iJlLzhvcyjEL6+FUnceS36Iuqq2Ot6TjPvsoHrQf/2Zf3NYAHACuftySRygfk6HbhKGSe/e30pC
 ufI7Wc4bWwa809PXm1bBrvznmTXAML/MLwZMGzXc2NhaCqD3C5clNXX7m5bxkCeVGyajHrrkKdj
 b+0V6IP2BvXsdaVjcgjoPP/6jaa8Odmv0D32GhBAtAkcNKEdnWKmkyPdJtgZBA59t/DF1e/9Gpb
 QpnntU1sUYK2OQEaHaH3zTuwfGZIt9Ej6y9mGpxZ0+8QBB0D3yVONkYa0m0dSStwCLQ0moneof/
 W0TM6P7xxsDkxyfx6G7Fzv3NzYfaJf5EP7IwlwmyFJA+p42GWDspHrqmkbldjgo5COc20TPZgTU
 SE4KNVgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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



On 9/4/2025 7:45 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> that supports 4 MST streams.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
> 
> I've picked up the last version of the DP MST patchset. Could you please
> rebase this patchset on top of it, hopefully making it finally
> mergeable.
> 
> 
Sure. will update it.

