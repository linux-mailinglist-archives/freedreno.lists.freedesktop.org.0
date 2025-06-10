Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E77AD3599
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 14:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E510E51A;
	Tue, 10 Jun 2025 12:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="amO1V1gH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA6D10E51A
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8pKH2017182
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=; b=amO1V1gH7PFHuoCg
 PIy261N1nNVAI06xgD6lL904AfXn2z8t98itSVilp3ZUAcLgd+4U8iBsvUWUWTRw
 vFrrq7Xs8k/p35IInSLr95jGmMqV8tLhlsy1pc9s+QlxlkoEU8R1TJyDyoypjKys
 N4WkjSoRjTEY1x939wiq7MmqoRTL1dd6Oq7vHLHmtt/N/rAy7vz+Tnp9CghF/sdI
 EAnLr+NYis2DZRmUTF8/vIWX70DYgdeO3YCv7R23Xr0ztmpXhXGDCEcrnDieeqlP
 LFzyqaigIeJMVVl/A+LCO/Onz4YieDZQp+fXgWSjnsCz91e0AbGd9JdtVTRwaDPc
 NM5Xxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj3ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso107138285a.2
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 05:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557277; x=1750162077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=;
 b=Z02qD0m738Ynse3OdaIz4uEHAchr9MaIW3Gg6JCDVLjNtazbfdNyD9vsYKT/960t2O
 YEj3+TkQcL05KsUQLksYnSJjsW9pCd8xciy8E3lVnnCmsoB5WW4wg0X2k6UzEtF9uihW
 IBgVOS5gYuESRxL0Z6SKY2NFb8XHlBLGYZg63qFMGaL3mW+Mfc3UwN/ajTjcnjSq657p
 xvAyQi2KEDxjctPaIfk0i0w7wNEj8BThjaHrgCjc4PmL/TB4J2olZE/7pQrUn2paqC/k
 lkbbt1/zPpZ1rjVVURF5OdYh+WKGKTQF1xT6COcIkW8JMKB72WX7ucMpst7fNPtVep7K
 7uCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqvOgu3yXRu0kEQhtyT5vttEdhgnBLVqvOoX0cTNa3dkxFraKyp0bYIAmA2e8ZCTxZQ3X2oRorYT0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhGoQl1eTo5dquBEWaJhbP+CmgkvA/w5wR5qe4Gykowm4Hfnvv
 0I5zN4wtDB7UyJDqCe7+0pSjeW3k8NZL17Tb5YGsmFob0u5UVEpCO2aoihSAfcXf06sUPou5TpL
 Ildd4Vr4qqfXC8igy0KZxW//Tm6zkGwbD+3ptBCnIwiqCxertCRGY1xqnVjmISIpOmiJV6ZM=
X-Gm-Gg: ASbGncvM68p5/MNtUPyMOw8ulLH2HdS87ngd7qebyaS1yTztBxy/up+MJsLUiYJtMQe
 ++h0abaAAH4WHzECvKAZ7OOKk08P5PvO7ZfB61rV97F44xTdBPTQXg+sflF9T+soS/ZFdnbygKP
 emGdQaCRtcP1KNXbSEYSGF6cJ3DG9mrRuXLgbDSQm7R6B2BxBJyjomSgmXlo7RCD/K6d/SBg6aU
 8cvIap5dZiyHgIIv4BH9JTHPm4zZzTovinmILWpWkVhuGsBQ5knMDiEm1AWvJ8t6UNLgM52TnJk
 rN5ubnK1s7XL6v3DbR8zENFiJ88ruaoatYZIn3RetZF710Ilrcj2TUH6zakEzhBDB95XpgWNd/g
 h
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id
 af79cd13be357-7d2299a7832mr858807285a.12.1749557276908; 
 Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj+6dwkCJ6DlfdzxdyTh4b2DegATq5bsF0PNFjB/y/RVLucqtJq25z1WxISrL3LqrFBiMsyA==
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id
 af79cd13be357-7d2299a7832mr858805285a.12.1749557276405; 
 Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db55ccdsm704778066b.44.2025.06.10.05.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:07:55 -0700 (PDT)
Message-ID: <c404b9e7-c942-4e3f-8dc6-f834f84b3160@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848201d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5MLFWNYx6_RBZuRIfkQUfcippPbdL4qi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfXznTEwPducIuH
 3e5RsW2dl9tNnCcyBoxu7T7RCoHln1RhzHBibLTk4xUSBM+x8idNJfKlZg1OWKRYPB/VfJsO9FK
 y33rCZkePmtyQ/HMx7LNIBvdpCOvpqGHh1v43kIkY70/AM125G0R3y9OC+7nFrmaRcq/RH4MwL0
 jVvVoucFeZvImQzmogshrg8CMNS/v8gbAm6r6aSr6cFIZVRUeN6Zhr2uy0FB8Erv6dZ6lm9BA2o
 KQRJpURThW00DhExP24eQN1IWWaxUEQ6D9SFeIsYAlgV+azCPnus7lVFR+fefEG2VECKlst0l5S
 AGsV/dwZlUUa5fFHSO6pDr9RixCgY9aCsvM2IcIgJlOyxdPUvEwesGWumeajp7IWc7uICFtC21V
 IrwJXsVS3M8+Oxl3U3+XzUUn97zH2ic5BSlMVWo7FmDzCtYpX9yY7cPZkDi7Ly9dB6eNd5P/
X-Proofpoint-GUID: 5MLFWNYx6_RBZuRIfkQUfcippPbdL4qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=793 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100094
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

On 6/9/25 8:24 PM, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
