Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63658BF5791
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 11:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1882E10E0B7;
	Tue, 21 Oct 2025 09:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPEXYGax";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F81010E0B7
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8K485026889
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gtYgfBJiMiBp1ITu/OF7uYQwL1eNKdtPSXCX6k15khQ=; b=PPEXYGaxg6HgnYS4
 pID3Cvgf1vrHAo6whXQSqPz5HEYgczqmuNMybSojMbxt+dkucqgzJoodUEPOlL3s
 l4xoc7KNPWDo3VYnt+31ekIiDgoDWSiYvzgLo5P63VXkqC1l5fMPvlkgl4MxDBxi
 cNvZlhoDSaSWZowEbSlJMTLWXqf/gRmCz3amorDn1Vf/06fg1kPx+7SCP8CoZymH
 cs1QYfWEXUxbLPvpJju5LR62nXAhiAmvVsbcLZbhNoi2j665vhQUu9nQys4RA30E
 5nXrPO/7LLmt7dn8PXH/YivfNAJ8GnphdP9FyLr8u8LQfdUJlh82wWyRuwUDdUwV
 eJDRKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pgcsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-891d3eba6f8so185272785a.3
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 02:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761038514; x=1761643314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gtYgfBJiMiBp1ITu/OF7uYQwL1eNKdtPSXCX6k15khQ=;
 b=wrX2U24zWVoqDZ5m9bZsAAEHUyYSYxE/TsjanJFvaawJhU2mM0jstFnWHyFJXUomIC
 AY56jlTWMNglj+gm3oX7lbCoCmQqAb5lkOwxzJs/elecpnsh+Wls+tye1E7tjgm0ViWc
 3dnVLlQTG3TVhoX5TJ+OjwCrUj/ZNaHL9cji2gOUl+qXangUzlg8UINYYgmEPbtEldY9
 Z38NOzuJ4YWn4gSz3PEQpsFTh+XWsRzKcAhdUIJ5zaU78MK9TpUd3ijuD4N7zRMRkfCY
 ElMJa46O4yV1k+LBekEMS/AWnuKwg6tpF4beFqgIi/CsUkdWBTx8zD+PSRTEoUGV4apw
 1gAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQliKHtD33yAMWAaqba1np/0NOA9H30mVNDCCXc3P/K5+PLmlCB0X41S9/RRDTRpt6YFbpwyWtehI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHdfXYqmz8qnSfd5AZVf3ShRkrfybA0mmIvLXYVEC4ax3AbzCX
 PAORiqjSKcgik35d1hmckZf5DFnDWDU8KB/x70xDxtiQuSBPcWzLjg/63rcN5qPphiVENjXg0XQ
 12OBEHLRBJI7m3pXTf2NIXkUm7LVANK+zdOPFlOcenHJYj1Pwie7AbVnuTByLmPN/4KGotTM=
X-Gm-Gg: ASbGnctzi6Ue551+ssdXfMSQ4w1vxZLgiZHwRbaFqW7BU4O/sRubdDudgszjtcnXQXM
 3CfYb/oOzpXcTt+AFKmW6ylX0/h8CjS0qT4ymL7e8uWydk1jGpuNpLyMw8XDlzXkizdBHH/0JaM
 00dpt7PNHTZGREcVD1wdHfpxSnXeIrVD5gJVWGFquXaJM8lhXv74rJFgs3lbkra3JGKhirZtHsB
 bIYA1mKc7VsK+Yrh0Ep/NJcbMITbV9BbO0fg8IUwZ32R/7e4/QeceQy2cb8fJZ9OnKWBFKm4d0a
 DoB4lKnR5PfmkVLmdsN4rWWxU6CQhFbbipIx99NmEbxd1RQlwvJxxqcw1Hze4veNX1/wGrir9y5
 1uGMkEY+r/jJbGDcYaXGT/A9ouO1EC/MYFHQblGJ80YbV6OAGpJ3iupW+
X-Received: by 2002:a05:620a:4556:b0:862:bd48:923e with SMTP id
 af79cd13be357-896e1f22803mr204772585a.4.1761038513674; 
 Tue, 21 Oct 2025 02:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyRgyrhR42atC+DLLdSulKMeyUrebbaa2AH53YBYgQ1Ndfz9lEI8czuvc0fAlmCABfGCmvBg==
X-Received: by 2002:a05:620a:4556:b0:862:bd48:923e with SMTP id
 af79cd13be357-896e1f22803mr204770785a.4.1761038513109; 
 Tue, 21 Oct 2025 02:21:53 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8581780sm1010151266b.31.2025.10.21.02.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:21:52 -0700 (PDT)
Message-ID: <7bed8dcb-279d-4bc0-bc9c-706ab598bb2f@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-3-92f0f3bf469f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-3-92f0f3bf469f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3RJfOaWpIcwP
 Nu4SUXBr3EuEsg7XFfp7mZ+SuRoLi1STucy7SkHSfHXiYms8EgqlxNyne9f+BXkqsu24NKh/56m
 H8AiXeZcd2smle3PpY3S1tfsAtOtLPI9gdAv0RrMGoA3FL9/OLBxZ3xRswcPh1JRNSwGpK7WRa6
 dIyN3Loo5IbUVAwrQgq8TJYjbeTCgCudQbVmNiJXvlkiJm/lbNW1Soie0xmUWYdRTu6Ug6ryKtp
 /Ube0RuvFVtmyG5HEJHxHlRl/JMJI6GbEmogaPhwcNV9jcTQQ2KYEASrWk5xzEiEIVEXPJvoDf5
 0y6gp+64sBV/EXgtXdWZ9tfNqO6/5VQqPGlxMTXkRYpmfeYPKzW/dYBPAHCQQnOz6fLzYO3d7qM
 EX+aoZ6+gxvClTJmTQkrd4fof9oPEg==
X-Proofpoint-GUID: 40HcRXjxyf8XItcSI5_wthPbG-mXU7hl
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f750b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jvkLkXCew81jr3KDB_IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 40HcRXjxyf8XItcSI5_wthPbG-mXU7hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include PHY supply settings to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
