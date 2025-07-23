Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A162B0F3F0
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 15:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0488310E7D9;
	Wed, 23 Jul 2025 13:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSqeGXi1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398610E7DC
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9fJ7d024458
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=; b=YSqeGXi1Vz8lf0zh
 KGMJFUY0vfZUHkLHZsEdKCduYiDKKcc3syvCxisEs91VtIwfAgZ0oQlDtE7xIgAd
 /45XoR8/s5x/ehKlNCD+hiWsYmffeysN0+TxsTkKhVogfKarr08MXEpf4SPz9DNS
 j9k5DVKvivbzdKzYyS5YMeh70JkrOXQSCsPj20/YlsaDDZjxh3EibolI7fJlvCNc
 xV1O036CZJq3YdxSZt4AezOTC/5xi/Dm76HXR/34cPadz9AP7B3vxYkjCZjnEVgq
 DLxytAUt71JiwyqoZdQtBQ9/8Vh8X2tkbblBG25/kkitU9t1VbkFhJfPO8KMig1u
 bl0MSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6qf7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb030f541bso16138366d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 06:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277214; x=1753882014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=;
 b=UJewdroiMUB8fdly0GFXf71Fpazo2LxN4a+y1QwRCHDbZNLq5inrMrRyGibxeWTTF2
 o3ISopOKplRME6zMpqb3hDgJzpW/7xfUZSLytU2YUSjjbzfovTXiT0WOmXFTEgCETAJ+
 QJSoKWEmVrbAhlAaouDrL5YK8Jhc0mcytv8Bl2SRGSnWcOMJhRrq/b9ZvEUixCyG+uMx
 zYqkHPwuG9n+V6vQnNwOCNcY0Vq4fr89gP6yEZ6dZY7Aj7gI2yUcCZYGm0Hf6CNtTCgc
 QuZo/2EFGK7/sdWz4LckIMAiDFA+NXDAmtDAjOD+eLcJJV4n8uxSZxhwK/1zccVKG4yW
 ueAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkZ0G8gmb+nxVGxQaZ7R0QzS5gxThG1IL1OsJ5rKjm5WdOcruX7xF7/UX63bXaFjaB59zy/uxpzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAUdR/lqL6cmLB1v/WwpRE7ws/9xPWqwLR1JHgJFnrwTr6ZUh6
 M8D7Tiq6K1j8f1HwiOsZHllh1op3b1fzkU/3y8El8hxvgGBPHFXdu8n/E5yCXMYbMPCQsLNPi40
 KBgqUfDl5vz6Cgz0xJ33OtTcKURVGyg1TDF2GDIbOldNW7aWTM1K/Uat8jscJTTrM4MlDu4E=
X-Gm-Gg: ASbGnctymYHbZl3jFXsdDCm9b3RljhKMaT505cnTpdHIAMvgV3rQF0nSJbtfD+of/w1
 Le3XSVfq2sl4Gj6s6RYc/+JZrLnSJ1MMGhBXGTtEAuDJzzqQk1kmU7BBbpZVZ97muWkuh3UK9X5
 yrLFko5ktvMA7M5gvXnSNJqUoTwNMVdGURELqFUNVslPrNo30urOCmemOpedaBHG/J+lUTNMqKx
 +b8MhdgApXTilqqXNrZPNxgUOMZMM5k0LZKu4xQEl583BA5GlqWmc74YdtHY/5efuO78JDkAHQM
 vN2g1EC5WeiOBR/sHlFPed3b5RRUef5WAdLwivIpagdGjvqoltDhSq8BnWHfQzT1vxsnFE9b2T0
 CvEtr0UFl+3yj2JFlEA==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id
 6a1803df08f44-707006aa41fmr15997376d6.8.1753277214229; 
 Wed, 23 Jul 2025 06:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZJ8dwmCFipYmE82A1CvPITOOD58pCVlEI5f3YLgSgX6gVOcfR4jnt3jQebHNiXAgJLM3rdw==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id
 6a1803df08f44-707006aa41fmr15997086d6.8.1753277213600; 
 Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79a089sm1046197366b.20.2025.07.23.06.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Message-ID: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880e31f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: QGljcxaQpoEhBsxqU8BkLZXHVCO0zRw6
X-Proofpoint-GUID: QGljcxaQpoEhBsxqU8BkLZXHVCO0zRw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfX60CkHDLjW7J9
 piSxQIUCyOyV+6sVaggQ4ACqEXBBDKupRJXrrxw+CRVAJr68xNk7Iz/3HWCpUO35fMDh/T/P2Ig
 BDnpyE1dpP/tE2xqlPQ99Ti2EUd05df0OQDEXyWAb3/FAroenUsBbk7MqcI1CieOuIDtrdQ/Chz
 iWUKU0FnGDYAyzdu2RDs9Cn5R8J7u6XEVVszO2t66sjaebwUbO12chYbPNt8bECxfVaoFyM4CCW
 s4/ynplXp0fUiMvK+14Bg6L4KS0DtRft3+MO+x3d1nmRzCKRwkfUgX19ZETYMMSppGlGrCq4Vqs
 Q6MB6V4ZLf1WYDkBdLCGv0jygZtLEXd8pJj+ermY16WDBztyT/dg/g30zN/ZGRU8bJ0keyYk44m
 8CTaKn1C4yScNcUbBnuXbxd8J5+fTY9i2ruS/0JeDTARKdLZ20DNTGzJnwHYRtLF0wvlyMos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=755 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230115
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

On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
