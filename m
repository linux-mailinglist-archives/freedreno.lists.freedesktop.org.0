Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC8AFAE88
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 10:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5942510E2FA;
	Mon,  7 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4QqyX4Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FF910E279
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 08:24:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Mwhup024098
 for <freedreno@lists.freedesktop.org>; Mon, 7 Jul 2025 08:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=; b=i4QqyX4ZhQI6uWob
 /5qiPClMeuKoOkZlPichiL69OnNlj8hk6lULpnkN1J1VZo1mjErOEnbqc2wFahFt
 iNUSOt/kxErcAiLvl4mgN5oKSfJX90zPTo9Zip6pBuQw3WIkMPVFl//ZiksqlZNB
 /uT/Cs77uHam+gIKPG1kHUJNsG8knQoteP1R1iI6tCQYzqgxMICwn1jjvdt0BSb6
 OTUuuu7l4/uW1/SZz1zIFAIRDs/XY+HERQgR/F2aySgwXUdIChbHCwiXtP9msLUM
 3jDEWjhEIrf6hA8nXLQO7IuMBeUe2plDJRrw7nuSyrAKUtBWjBgLAqi0nv/9NvOU
 8MtIjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2audnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 08:24:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fd5e07066eso7688936d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 01:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751876669; x=1752481469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=;
 b=P4PGkepkS5FNW5zoTBUpvlph5J59yvM94JDUatGk+bGrclY8dETaPToGmn7MKOAFwx
 /rfFHfp20JEGfqEkRMVp5+5EI2hIs5tgIjRu7zK3WVw6Jcw7U846w1ErJCtBqLM1kBH5
 q+lp28jZVWiD2jl1cQrD/QiBt6sX0RAKSIGr4qAims7Y3NMloeEVzt1dlLfMDisj7Qox
 TbL3vsuQLiKLq1+SdVsuFk3/CHwjc72NBTbxhWeVXApkM03FofZNhs4t7P47KrLbtb9l
 EKto0WYaIjZ9nVNZrA5RZC71T5/adw6Pab4pv8sCUlGgqcJAcGoXWgspELDWgjb+wwaL
 ep5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJD8MQ/AIFuc9lKNCkwyBcszSna4AwHnJXkVCeRdrDFBXbL9sKXYfqXw2WX9kF8DfT6B/xcAb8IAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOR58StsYLN5jSG6/D3MlJHvQkulmBUESAgQqfDqZy4IhGZZ8a
 Ae0w8YjtV2ATkh7uibE5nOkw0JtthK7HnQLuK4ohoDz7NK7Dt2eyAcHoCtXQKH523N+dSMc9/ow
 hXsycG9LK1/ZK7HCkG+9JaPWUXOHwspTbKg7vCdNeIYw+EVD/HS1ItuEFVluvs28+j06pVs/2RI
 2DZNQ=
X-Gm-Gg: ASbGncsD0dKBL53os5NH+ju3uPufGbye8scY2u6JBPciPqadr8lfLm5Kk8Wc0c8Y7tA
 iqlxfwmU1JW8ZRCsby4XajdQWEV3VYfS0otUxKZpZvXibfcRdLp5LX/Uj0IpaJyRuBXhymNu6dJ
 MD7vn9xl+8axvR2MAZkbMWSz9dB7I+XqXrU57LBdISjczN/SoI56y9hoFLZQqsZ5Jqc+UoDvdx4
 GussvjkxcWn6TNWhhuih+5oPdMf3ClJonEYt2oTuBYGS9YQuYxu4zxggcqidc26zCzTZ0H1ubS9
 CrLv3A5n1Q8jCyFIRASAmBRSfZPqsT7mbkhwPrYkswna6VOQ8mBhytEIl3pMh+HwptlIvFjCk7L
 r0gI=
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id
 d75a77b69052e-4a9a2d2634cmr41323401cf.6.1751876669223; 
 Mon, 07 Jul 2025 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhUSYigL5oM1altpor3qk4P5f5OHAvNg9UYt6fOM60gyonRu+BrBPx55Xo/pckv1Ovocl8w==
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id
 d75a77b69052e-4a9a2d2634cmr41323171cf.6.1751876668843; 
 Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e8c31sm668150966b.18.2025.07.07.01.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Message-ID: <17aa8f1f-f293-4ba8-a947-08d9b3618f5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfXz64laT15nGcY
 aESDP9NqiLdDhHSwtl1BPVD096Zw2+t06Lezkon1HLRTbgjaNr8aFgHpWJ/fWFckFs+5rH/kuAV
 Xqn3RVRH/9ob9M48mS9QbkJB/xw5t0uAhEke8TrlAODFRbdUX5IJFTMYNUNJlBV/TQyaL0OKmqT
 IQqJnXxWrsbawy0QWeVn/tvXVEDIPoMvicI3lSBGSwwi7YbEaBKmQvkla1KSk1JIlUQz361WqT2
 dHgUind4TEnInbwbr4fJrFT1FddIODwQqXRvovl/St5IFGZkN3ZAJJeodbbJFMqTCFuLSV9lIhd
 T/f7kV57EN6kpseXK+KXj8PQPE0F65bZirthoU3BqH7v2iBnX5A1RNSd1qoLB0TSGXwGF7X/G4e
 Vph2CiHBav77aKUuEqGtX6TBuGYKp+dIt8yvc3mzoAkbWnMrL4H2CMqPkZU8JfUo38fFXD/G
X-Proofpoint-ORIG-GUID: iXmpq13iBwaQWnJjWXs1INgAoAghC9Y5
X-Proofpoint-GUID: iXmpq13iBwaQWnJjWXs1INgAoAghC9Y5
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686b843e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UvoLlU4ym182rRgf1HoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=928 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070047
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

On 7/4/25 6:31 PM, Dmitry Baryshkov wrote:
> Follow the lead of other platforms and update DT description of the MDSS
> device:
> 
> - Use generic node names (dislpay-subsystem, display-controller, phy)
>   instead of the platform-specific ones (mdss, mdp, dsi-phy)
> - Add platform-specific compatible string to DSI controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
