Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7026A98BEF
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 15:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C384A10E6AF;
	Wed, 23 Apr 2025 13:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeLymmwS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0668510E6AF
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBHVBX003738
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=; b=DeLymmwSMCbIy49E
 r5QVfafjNeO5exfLzXBvDczdCEQWbWvZ11WkESac/Rq0arZQLUSoJaELhn20+YIZ
 sC+UQfw+/VMJJgLlZanr2oEEhZqyDuTtnboBdB5iMjHldgpGT8ppytlhB/+pckxS
 5BGXW+ki9ikYF7VAuGSy94VON6HvUbcVQaS6BYicOMI+nz+/dPaqOIMt1DD66Uco
 /tJxpKHQvUikXqBi/4DOWR1wK5XlafuCwOIGZ0hRKMymFHxOmTLTnTlK3OsUYoxS
 0ckxiVqN9S7gSTClq+tP/+yjl/eoLxsYVYANw5DfUqrXoT7lVDMSr+/+5VG4KM1d
 7zRTeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy2a6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c76062c513so124702685a.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416453; x=1746021253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=;
 b=GzgyBstrWR9dS9UcqN5ut7Np8QWQyi683XoPMaYf2XQihqWUl5Kxfg7LibkQftyqI5
 jL122Q3lrHE9EkRSDwHIq/D3V4YPs0dGS65swsrBpR0DKae+e/kLPyvq5Os5nosiV2ba
 Q4jMzhJM+3O8McB89wFNfI52epiJIJVFkAS7nTX5Bk3svatP9q1piYkFtQsBGievr1uc
 M0sCfghVC2Sg+ORDfmsFZjpFIZBt0ViE7pxR0DRxrVXU3SkneI0yBW3It9QArXsVCsgr
 fWh981R2fE9pgMHWMBndFvcIbt52MOXecYDKOQAuMq60BeOJ5ww8jKqiV8OymUtDQvw2
 /StQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDEGfvMathN66QnoowTgGdKyuWqpaMgcH9hXMBQTRjse17saweo1BSld6HnyC+p+NLipfyIsmifFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzns3P/LVgWmKFJ20X+tUJx6B9qwIcMz0AlAKeqJbEg5rZcrj1d
 tzvOUxhXS7m1fRoIh3HmqYn/pEOmRIY2oVYtbghwYR/ZZ7EzSsxPOpZYxSCGStlwa8nwvxd1uqr
 /YD7iJsoqDN/QRgSVEwaAkToXAKEODrvV7r2Xp+AVsYezweGSDEzRqWCoBshkUgZXtHw=
X-Gm-Gg: ASbGncvGOhuWw3giHYWmuTjqZ3WY10jcQk2OIrwa0p6jvUIdXJD2eVcz5vJh1zBUUuG
 +MP3pqi4MkCbZd0bz/bSoR5DppBBTpOq+paq1DucjI/YL55pOZOxkBtea59gVezyUtZWEczDXkA
 4KgqNrPNfDKJcRF74mgJW5u2xes2y0hc/P66/P9yp4MVL6Ul9rZ570XFv+9E8AFXYOy8N1Zp8rQ
 b8Ovgpci37IAtHLEbEf/f1+pbvELbcZ9sQj6pDKbq25iIagEx84yhmXHGFJDlm42611U585DzjH
 0Ek3+943y6+r5oLvxUqHDFauPNvB3psbP+gYZpxRDloDTi5Gyk+T3B442CL17Cj34O8=
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id
 af79cd13be357-7c94d2cdeb6mr185089385a.12.1745416453364; 
 Wed, 23 Apr 2025 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GSKl5nOJGI1IDLlBzmI6OWMLujvoHpe4eYG3KxeTMc/rjtv7PPTjZDEBvTI5D7TyWEbafg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id
 af79cd13be357-7c94d2cdeb6mr185087885a.12.1745416452864; 
 Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acbbab86f15sm299799566b.76.2025.04.23.06.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <da5f63ad-3206-436f-9b0f-4e966b817fc3@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Xiaomi Redmi 3S
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NiBTYWx0ZWRfX45cmhQLHGDJA
 JVXcTofnIRc1I6s4OI6vC8KIK5FxzaWpXCpCxUIYQlfsPWxSqLSdUEusjNy2nmI8DoYezC1sXZ5
 nvTxBo05PQVgXfejD7+wqATixKCkDIpNcY62pd1i6vknfNNTr5lX89Y1IZ84tx+4KuHpvukwnru
 c5Xhg6S/eDmdA0cv0WfCUgGErhwvjDcq0QwzJaHPfQUk2IK0GxZNdbN6xUFXRZ6AOrWhOnuj6nE
 nwR0q0AqfBaJzO1vKbPjdKnAgutDRBgYlU1ePuHqQByH6IJT0ovvYTGtoTj0h06MPHrt62irQ52
 tJsJRDfE4wyI9LILiVGPhHsTH+IuCjWXg0sXXWib+s4RmiePxvd0p/yoBsygfrQxIL5zlhtE4CC
 dqRitNVmX1ltMp1zybmZeL09XcmXflMiP+bbLIxy32t2e7JtBkr/jIgD0v3dwyr6qm4TwG4k
X-Proofpoint-GUID: 9xktjqN5gU9qppBtbQRgtAuQYcetagHz
X-Proofpoint-ORIG-GUID: 9xktjqN5gU9qppBtbQRgtAuQYcetagHz
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808f106 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=VJhJOi4SVWMle1XIrLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=702 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230096
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

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
