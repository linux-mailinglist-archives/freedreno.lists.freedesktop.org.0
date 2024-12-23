Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2EE9FB066
	for <lists+freedreno@lfdr.de>; Mon, 23 Dec 2024 15:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC48310E324;
	Mon, 23 Dec 2024 14:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8e7QK1d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA68610E324
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCaoVW004205
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=; b=F8e7QK1dnVMk5SD9
 BBlhQLgeK+yp4+E3lygn5nCYDM6n16D9d7KnejaziWiIUl66uHrvjwhJ/nmXhkpr
 EkuyGTsUI3W9zGrtxEHPm3IqKJiOhwl1Xl/G5BLb8J1iaLCijeM+Aa7Us/WwTUKR
 wr0OuLkUCibzNJL6hQjKwa5rQBMDp8laTXKTQK3S/dLl8i94Pppije/a1P2H03tw
 cTdhOs+f1CY/ZXB1TOjkw42Dr84jI67FHkp+lHIU0AjrYyiwOnN5FlvsccYEkut1
 +tAor35CJuH0JCIc79tv6X4ydFxPDG3eO0+h9Rf7Yzfrgq87P7Q24fLC8tfL0vbv
 2iFOsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8168c66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d880eea0a1so15420036d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965657; x=1735570457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=;
 b=jTdLVlUJqp8/BsFTdRPCHyGmD4moBucggdhWY4j+UXtBDgnKi/WQvQWl0RxIsIQTxb
 CVMcHUAm7NOkTp6cg8QxU9XnJGeYDfdLIMu6u5bwZ0OWSQajr2z5q+xMauqLQ/sJ+MOV
 6c4+vBoROQRbjCbot2Q61rocxieKZzp/yv3HZzKvxaOwahcCr9Gt4YQKQJkk64ZRB1QL
 HkpQQczzKFkjob66JNfPnpu4CB7TyOODPDqX15NYUv7/nrVkrmTw5wi9+iOWE/+CGvHI
 mUHdcGBJhi/VLwjjHvFXudJ6K0op/qeNNTUUV0VE8sNOFLGFsuPZCrz4P8H0kuT29/dK
 SXwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfDgAxaqNkreq+9zr0pAMjPNoqKbYZBwOmOHTRAaJNkw0giD84/bV28oMHcUX8fsDpJapmWUDua8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB0uiIVzdr0i8Kv6nbFTi+8L8gI+fZ7yffND8X6VXuG0cOPhme
 cDaLoZqNk+QNfAX9GUol0F1wWntuRLlfVZTDVHUccSrgBd8IQLaYGxtNCuKECrdmSGYkC5VTV5n
 fdQenwcFWzQWRKO9vGeLXNINyoQU2iyoEfrbAeFk/NRnY1S8O0sidubUgEOYDauyb2zM=
X-Gm-Gg: ASbGncsdHgUNd3Wud5nsqvV88wKjoWP32MR8DeAx05eqq5HXJhvJWtXzH1c6Zb/uJVW
 679szQVx+/KbPWua8K6bUyV332MfOfRbhyUBQdhVjvKFI3ET+I33XnNSdL+t7B7SNLbuXxB+/wV
 1H2SlmZrJzzNXidFrdRL3LLEEqnAR2TyZqCnP3xIwX4+7svKAxSoE3N95vCGl1rhSKnDFJS+quK
 oxOEIwUMbKqPK27LYH3swI28MVwh7yc+z2QOv64vRy6sUkg17g2Us/y9MFfijUsV42hY7eA/xHY
 9WiqPO8iSuxTh1fEHSpbo/Oo1fjwhdNak94=
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id
 6a1803df08f44-6dd2339fa19mr73953596d6.8.1734965657238; 
 Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUHjlXPiR8tK/MMFoP6x2egq/NcpOXsphsui195pchWCXB8kVBb97e8UecvHXUqfznd9wX+A==
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id
 6a1803df08f44-6dd2339fa19mr73953456d6.8.1734965656891; 
 Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aae9a325afbsm311084866b.181.2024.12.23.06.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Message-ID: <5b1fa9a3-de58-4ad2-aaf4-f239f7c60ec8@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XDyvnve-UqvCPHDS-IDzA0sVNrOf0Jk6
X-Proofpoint-GUID: XDyvnve-UqvCPHDS-IDzA0sVNrOf0Jk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134
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

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the other side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the floor bandwidth against the maximum supported bandwidth.
> The AB vote will be calculated later when setting the frequency.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
