Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA669B09F48
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 11:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E9010E92E;
	Fri, 18 Jul 2025 09:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMa3nh+j";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A9110E92E
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6MeH9022439
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=; b=MMa3nh+jnbnhJj/n
 qLQLWRiB8S65cc2Ewc0lGtk7lveJn4/SBE3pbMdBizMtCXuUyixMc1OkNBN49KTg
 nZ2nREVccb8OVDQpqgK9wlOQzuN3Nf2BvQ0TRg0R2Rn2mBmRxSIcxhMhGzpisIjt
 nB7dKqeET01QFmvtrzYIznq9zZ9/ZCDczjvrnHLO++e8lONjZZP2sFNykCgKnMma
 Ixi2/NtSYvZAnKU14/XT7d6a7oQB+YWRG7OsJ+QTB8LVZC6euEmaZlwiWK1GiWc+
 mwLdpRPLgROVQm59wwns/lyozmb5pEi94KDrerDGy5uFiHm8xmxM5cuqN8dz7swz
 iY3WEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyaxac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab61b91608so5274601cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 02:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830599; x=1753435399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=;
 b=IQyJQMHrbQw3dTbmoZzSmjlqlPTwnnpBq6s/BQXWZzYQM0mvNA8i7xPOFfuTcQWBh/
 8O72CaPXIbkh/fqhrxpyF4mV6lYaRnl88DePpDyIm2Lq+geAxvZnPspl1WA51BwhMhY4
 3HCf2w7fFjF2Mr4FHbMUAUB9JxryIC9NJUMEbl9/7WayX7mgetsSS/tt7m5ThZzY7l9c
 dTT/pBwUiy/OHqFaya/82etyLXEiqR69XUUdmJluBYrtexlGLQEf26gIXpwIu3pJ5XOI
 Poh8RtrKq1BkLV8RMmfZfqtSMUsADNoWotceTGOAd9btCF3WwLwPFnzAQKWhttZijKnk
 Jdsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCL1obKcgVpw9EQtW6Dge5BQofPqectBf2EgPzuif5gPky5MW+K/Nb1GbeWYKNDHHbixGbuof2olQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1YZmZJxwrIsYDffJ96guBpbV5oJZf5ejgidwULQGUcvdn7hxV
 qGHjk+6eMHAdNhFe3dHE04iyKOTuM1Y2sDOz32QuCJNRixLkB4hAQIT720JVMJHPZ69PR3gOY7P
 zq/HV3xBa1+ihAhR1wZpkvOXP+DFGXSlZBYG8RHIR0d1J0WvzY9xtI7NLE1KfKRq7OK/O3dc=
X-Gm-Gg: ASbGnctzMBbvF1rp9Ai1p8B6cym138ji1zKXsjcwYx+KdorhqHwS1TsYkGzoinIqXE2
 Rz6dTi01fd2+5O0axLLqLaLklThv7oqExPlhbhnFbG4ZDJ69OEudv4hyz3N/aIPD6z6dQ/3OFCI
 JmAeNfwe5LlWSbuqvD8c198SSpgm+GNgiZwY6x9LzB6KZWGRViqq9qeAQ9OmSjWItxVJqVonXQl
 0CPtqRqI+g23eZ64giunFf9BMO8FPHIKnAA9qu93awW3mthZFV2bP480QAQtd3KqKxo0OiZyCQ3
 c0vZKw5yGPIy9unN715EaRy6SU7v9AWGRw7VIO5akx0YF0LvXf2noPN9R8YTMMJxkiFOOoVOYV+
 TY3EXerVxIhjYzTh+GS46
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id
 af79cd13be357-7e342aeef45mr582359485a.8.1752830599137; 
 Fri, 18 Jul 2025 02:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp5OpRRRlubBf4j3XB9hMRhuiSC9XEu5aCviHEU07bToJoCBMGtr/bqJyK9a710HZLckzjkg==
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id
 af79cd13be357-7e342aeef45mr582357585a.8.1752830598696; 
 Fri, 18 Jul 2025 02:23:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d9941sm87211666b.56.2025.07.18.02.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 02:23:17 -0700 (PDT)
Message-ID: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MyBTYWx0ZWRfX9MSaGbWOyARF
 Gl3zXdkXXrOF5uy6wy4g2Bf3GtR9oNCkSrK+wSYCjWimpT2M+hs9O9Sa3HJhl7j2a+lTmNNIPOb
 aj3fK5isxjqGSO6y50I0JxCUGfI5RI9L+beMz6pGTHVhTJ1nWEiESh+9fAhhGeah65bkzp4/mK+
 k59fGQqpKlDdqQH8fPIDVRxn7mbAMLU4+uxwvliuegtnXp+KtkOMpOjl4GibuYJsH9wG8Gu0MA0
 GH4SzQ5B2SZV8meI5I6HkAknvbL6cureqvUVfCJb1cdaUi81teQMAIuuoAEbQocZUzTDPBgeMRt
 V3pZijux6KvxFRdKBEY+WD2v2sDaTNGn+kTDrOa1BRhAssl+wMA7YuwJV0SBwcuPhmxAJ+RK+uK
 UVQCNnfFgQp9x7NXApYXq9rTmlnXYE+OjUvrY8T/6FMR/4IVY5hJYQysP52HRwpbSqNkO/4n
X-Proofpoint-GUID: 4LciForhNcpD_VC6YKjxIefUt1YQ51CY
X-Proofpoint-ORIG-GUID: 4LciForhNcpD_VC6YKjxIefUt1YQ51CY
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a1288 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=biz6BXDC6RXR6m6nPMoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=594 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180073
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

On 7/18/25 1:28 AM, Jessica Zhang wrote:
> The following chipsets support 2 total pixel streams:
>   - sa8775p (on mdss_dp1)
>   - sc8180x
>   - sc8280xp (mdss_dp0-2 only)
>   - sm8150
>   - sm8350

I think 8250 can do 2 streams too, no?

sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
necessarily mean they're consumed

Konrad
