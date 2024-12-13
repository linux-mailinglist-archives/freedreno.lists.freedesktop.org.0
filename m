Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F669F0A35
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 11:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49910EFC0;
	Fri, 13 Dec 2024 10:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG9tTFfm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2C10EFC0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD464Z7018025
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=; b=EG9tTFfm2TloFuR+
 3E01OEJ9VK1ZzJceSpF3cGNO5HdcGNeHBhrWFukSPpRM2uJfdmxyAz9oHcS3UlMB
 t45WovcXkChj2msq6YYuXdTNft7aPcHmOEqkhpjrUBLwUFzoB9AlsDAJ44jRcct2
 mdoHuRUhDLcUV2RIEn7ixNK0gKNQ5PDy+scUaVI7pxp/7S0IQem0JBLydCc4J7Yg
 DHtIRYkyAx56ZYeRkDzwLQawVflhKcHX0YoxSKTGIkHPrt4mxH597yZWOA8sa3qc
 wCyW2Rg6bsHtrdCOq5c7O9bR8A1u0TwZnwUL5AVU3kw1y3lEk+DNL+uSUENP2XXB
 8s8QBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn11pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d88fe63f21so4315086d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 02:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087501; x=1734692301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=;
 b=e78H4cf6JPgBas+fRlVVUSaJwPiBOnlp9jODum9RZ5dP6A8StHkuG06v29zMZNCju/
 T7RqE07LMWHtNKimKI6k2II7uHrl36tcnWbBn0W8sHgmFmp91JXtLHxlHxw7kUcndthA
 8IX2ncDkZSeWc2zKBgsg9Rqo9fpXhV45KltW6Jmdj5fSnN9OjzaXxD5nMeXMqMLqO+31
 GQHuqAnMorA/fDviT9vQB3y5RcFh5gSl+I8NqRlMoxHt4UQPWLtr7vx0LOZOIj1DvYmZ
 IMTQko43R1VsqOcUh+CRPym1dzOnzSxJtJDb4AN+6eywLhb1tY8tUvTHuPFZYd68m4XI
 ezqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7daQXERTRi6JTL1ULtrqZ5aq20nLEi3H/t2C5KFlRud7DVucoy4MySN43JOf4HomQHP1G0DNaV6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymw1VALad3zBbg49Kpmj5Znfz2OOfTeIWXsc1vjiMIqMRlyxGT
 4sUyoNHrCQ18XGmhOodi7jGwryO5fV8YU4YBYpbKuZbhnfVdMrqsE5gvupTJlqSGZX2CqUA9PLb
 cP76DG61CluvdFQX4cCzWOzTo2p+NI8CWcZe3cLhGVGXDwYrB+t9rNWqHQNTYChiMoa0=
X-Gm-Gg: ASbGnctLxAu5FA22B7SOG/drGSpGA+kCoOx+CAzTW1KGkra1FNQULpFNLPhoHSi8nDY
 F9DFN8hUpk4Y/YHWeA0+o+ebcfBw+c0BUIQtzS+XDJR5Yb4DUF41AmWGcQg+FEj1iEFlxHncCvE
 jgB9+Dj7fwRh6sokzTEPcn/X7MBjULs5ZwjfDrJbWqGWTp7Rbwjdb69H5BV2Yc0mxnKLMeJjx8I
 R9Lqi9sctMfBVIi/2X+8+LO1+fv2WmVCk5z4pUfoxHojzdL5a1b17kvTVkqQtJkDF7f4wvtB4AR
 z4bs7irOcgaFLQ+aJIuJWt3AatgbAux1RTkl
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id
 6a1803df08f44-6dc969a9b25mr11838756d6.9.1734087501508; 
 Fri, 13 Dec 2024 02:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsGI6dtYfqNBiF9YOclKzsnUndifeUSlM+bUU1xm7lXts86DjAKnT5BGz3KaXNPyr6IOpU9g==
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id
 6a1803df08f44-6dc969a9b25mr11838586d6.9.1734087501091; 
 Fri, 13 Dec 2024 02:58:21 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab897873d9sm23026666b.191.2024.12.13.02.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:58:19 -0800 (PST)
Message-ID: <0cc06b94-806d-4e63-ac57-9d9aed45a3e7@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
 20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
 20240924143958.25-2-quic_rlaggysh@quicinc.com,
 20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
 20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
 20241122074922.28153-1-quic_qqzhou@quicinc.com,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bazh2AoLFEa5Mx6m2hEXlLMkipmxjLw9
X-Proofpoint-ORIG-GUID: Bazh2AoLFEa5Mx6m2hEXlLMkipmxjLw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=727
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075
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

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
