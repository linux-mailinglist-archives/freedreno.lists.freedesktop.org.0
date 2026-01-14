Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A449ED1D9A1
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 10:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70D10E3AF;
	Wed, 14 Jan 2026 09:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLzesBQl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWRajWEU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081910E3AF
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7j8jA2497462
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=; b=JLzesBQlYUcf9Ggd
 pr7OxN+d21DBV4892AwsKQZ/j2eY7rkxmYgeEVwod0XuXJq/NTPnLsCcJaR+IRjV
 GGJ9Itb4jKAdpx8B2sEKaPrRIDFKvpkh0YQu6ns3mtQxuPngVNY20wmfYsDXwFKW
 Z7kL04sUU1Wv3uX7/aZLU3PQMjxtslYZ8eolgGgI7aQ/uVpOhZzbi1+3YU9VGq8k
 x9pma2MOwRi/KKL3UlBIO9MUUsGTbvzsdvImCaDokX080aRm+ZFUjlhZlUqMN9Bq
 4nkK3uiuRU2le7B7t88TMt4ZMOhnnQaSSSW41U2mIF0EuworIY3Id3XGL1IF37aB
 CfBwtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x1qf9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:38:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c522c44febso18942385a.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383535; x=1768988335;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
 b=CWRajWEUEFj2nbkE1p5iWbwHWnalLoHeiyq0QQzC0LJ72abo8KvNy00VzEPyHDxlK3
 /pAPpGlK56L1LBx9U+DY/OQ1VQwek9po+8K2hRRZ+F43egxwqfxTjs0QZH+d6cwSaVCy
 IJZJqmw8aXOEyP4bzkehFh3ExuOHk7xewPjy2/6QrXeOyQ9/cbKJAsTm0mueocnYpvUW
 7asiBbdZtGWDe+4PyY6Vy4t9kLx5ed5hR0gq2K32Xd5G36qu9RBKpPeFzQdkjnlXeUWu
 jlp99MoM3sOPNWhCokW7wvEkzCS+CIl70vElVNAbOIzk0wzQJiBma5GwVcsq7Vm1867k
 dkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383535; x=1768988335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
 b=apL6rsdqtgErojezJzkV9DRyBXfdZPDjktgaFHXIfd+a6uU0YUwKyUfgwhF1wBVAAp
 DFbgXzNcnv/xsBxCpuGxwAyXn3XTPqDD4mwbrSXwJj5RTnnGJKqPALjhc9EzLafpV0tl
 cRTQDC3MOgiKIoEMQDnHjLUxE1XOmsKIK7sW8GBO4uSWRG20hECT7rBhK5PYlEWJWtyb
 z7sfsx/CQ3K7RGW53egCoHNzHez7xUiBuyMvLVjqDmQ3HKmg4WcMgHPI3dorYVv7hJvL
 0/1ufNoI5jlYSzBL0Xv4rDIkoe5UV27lRDTXbj9M5X4mrPlQDHDzVOTmGSEgbXAjqrA0
 KNZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHfJQlipwFLmb0OI23X5b3sHIC+FW6PksImkgaTcjmrWvAqhiPyJZ2alcz0XkEZT2QdM7EWX2UcmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4PucTvbF+Sxl57Quo9tNLFWnmr9fQ43eenA+RDzrmD6HOuGaW
 y7f4ggTjlcZKYRGo7KioO+g0QJob/Qz5h5pZeEwz6LgcXjDSBonp/pQSsjXexEo1ZPQenLMMeQ6
 pODAd+lKcjWprc0zWLlBrXEylfEBgrKHGtIfeP9M9MuURaqSE8slT806kuAPeRAdrMlFvG20=
X-Gm-Gg: AY/fxX5UVYUWIAo/Q9nVznvmU9wPfERzB1S+75CRxPXnQruHSKWiy1h1kd8Oi3vY1HM
 CfF85316wdAXzjcAaW1rFHCEGOdyukouHSIC/JBWkxtRxhmXhsZGxfaQ5wVGC0ZXCymIk2Yu8iZ
 Rkeuec4RIZfj9ha9Y/o70aRh2CzQ6PSKxXovVujk6PLiCNIf9EeV2DMT0KRzZQjUH9zDjHtGwfV
 SDYg0xcr9GK+SXswvBRkHFezhVA52SuL8W9dpATiLqLCu93Al+99G/DhAuVuuWlNORYbUbowwKl
 FWmTPzgBqKa3fcGAp0ZE7HEVwBuw2YZhlhD19v+0O/h0WYKIHdg8GOlLxUWsfwftYKMDwaG07Wa
 ogQwlb/9lw73tRT1DbF5EMqZv4u1hpkN9rDjjj9Lk345O/uXiC3/LD5XYeTbwQaUgg6A=
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id
 af79cd13be357-8c52fb16342mr214671585a.3.1768383535320; 
 Wed, 14 Jan 2026 01:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id
 af79cd13be357-8c52fb16342mr214669185a.3.1768383534889; 
 Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4c15sm22444115a12.4.2026.01.14.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Message-ID: <87699223-c2ab-4aa8-821b-aefe7d2c6b29@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sXf8JwyNpHNbHuzwtjL0Ba8GSpTMQvaX
X-Proofpoint-ORIG-GUID: sXf8JwyNpHNbHuzwtjL0Ba8GSpTMQvaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX/ePW1MUWgxDj
 WHaslvfupTVmOtuFhNISHxcNdR4BG2KEC7xKlV64jDNjeDklKSh8SwYf3WUeHLIPWeW6hsqD/7F
 pOFrR62Q1KD+IpWo+4zjpzI9b1OMzGnOAkY8A0rVSxPzlyfACvVwrQbzTfHFIrIjaLBwHxegaFG
 5Xez48TM3y9ml09vNZvGBWizSnXIG72boWnCAhIghU/3qPXGvA3cROvQzK8BAZugtY6eokVisWt
 R1FDz+5VzPsVDZbzeWSzy/kXSRIz4VpSs2BLJKdbQ52NoyteV8yKkUbaMQCCz5q77cTy8odlu16
 hWPmXAQDi8gQuLKuLx4zzhi0e5nSLYwmTkana5qkcY6Rdscnvwd/2pgYzz+ng9PdFltGYz1Q9DT
 /QfNzAYtxKmHI3GK5ryUjakEPqSh/eGwEU/Y/eDEaS/wu7AKxCiT8KD7a1VaN1C/ldgf2PaqHEn
 C6RstjxLL8/Hza4K/ZQ==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=69676430 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cAxcSLUL-m0wKPm7p5wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

