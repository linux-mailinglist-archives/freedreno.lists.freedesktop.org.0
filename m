Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28604BA5EF0
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 14:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001AA10E187;
	Sat, 27 Sep 2025 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtAHyxdA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7F110E187
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R4CRLi016632
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=; b=LtAHyxdAoERLVHjZ
 JbX115ejTnojvTKRZuUdPj0fYaO0C0eczNiv43mvnGuxSSJNaGnD1UyGLqOKGQZw
 G6Z8Q4wwd2Ef0gn5ZI/RYEX6KCE9ujwfgSiAauKN4FHhV1deKSpo5TxFND3UzPZe
 a/m22yMSkF1Y95uwOT82TntEsXDs0FDo4A7UtkQSo4Ffb/RAhRoAxf7UpC+Hejn9
 dBDqQ5oUq1zp2UGyeq8b/pdQaPlJDwifMdhRvfRmyj2zjLLzCq/bEqDqvYgL58gh
 0cxqGGcLeSDfy3a2BnH23sP6+bZyfHJCaPBgeMZiMsF9R+KK8+uRnuMOnBeresZY
 FVLe+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pd8msy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-819d2492a75so133570285a.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 05:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758975953; x=1759580753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=;
 b=b78ifyM/i9rLMM6TmQJn1XnhSVayGWt6yKYJClTr9g186MCrYh9FlIYlRcVew6ZqVn
 4H08i5rcGslkQE7rOdED5zAOK9rAiI9OAJ2LN9va5Jyz1dYXxKip+UA6XNHlM3KAhbVt
 ykP3DOqg9zD2LjVtUQwHKXAMcHDgZJZEBLyfEJoUzB6i7jRnLvTT+qlrormb52YjTgjB
 vW2LRwxDZvi8ne8lYn2p4rjnoFJYgqLM98rFeq2pNe5AB88qNSNZpkD/A9XwL/mGuEtR
 5qWAVo5dY2DZIhaQX95NyvY+uxnkkDsfE1DrNz2UZIiRXw9g3Rrn7JX54lMSqQRzAxR3
 sM7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTmF0ZhjBm+bZOC2h+tu6J7U1UmaS1C7OdEGsh9BmdZ3qlm19y+Fo/5QdA6rFwDCcv83AKKMdhzC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg3oTrhsmVxYe/ptTd95kq/py9Ro+MYCmNsxNw+xRnGEWHVBia
 WQk1FcOI6SVtZ953XLB2Aq1C9T1ml8Fv8okhlGuwfy4ZlBJBfB36o+A78I8af/ZaEgKbABJWSfV
 tli55LyjXD1wad5CuJV/dvjygThEgXa/laj29cHEzxPPGA01ZHNH4ElxpDyIvFkxwHP8LHWM=
X-Gm-Gg: ASbGnctwkwsh0rppESfg67NqX0M1F3sW/VFcDi1FgWVQ9hlMPipn0Lif7RCmwnzz4fR
 MTBnoQCoyw0tkd+H3siMnImZU4JWM0zT0IDMziU5JuKpnD5AC4KQif2k484iw/l7r1vQxukmtIS
 py3WX+sRrjR0hsxf+k3FksU4dkACC4eZhRLU9lKQ/QHZ1vfBf6AFNfKY3P1RcoPJEWhJ38+rR0g
 H/QfPYKqIz1agZ9vPTTZzSbdlA3sbYDwgGXlF+BWwtVWTvexsH1z5HMpHH9zcTfNK5DfPgcsgAZ
 tVdC9hxlp/6w6bEz2La2hgltX0nKDciZUY6C7PcfDGa4Ok0qyrjwzId8vg7m9iQJXkYoBcNcLVk
 BDFq+vtmjMl9Igcx+JKIkPw==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr926479485a.9.1758975953007; 
 Sat, 27 Sep 2025 05:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCG2e/ZW9GFpuGzcSJqt6X2AuHy0M9fiQ/EEgWD1R6USyO/kkVUy9LiI1L21B8ibFVZJ2N8g==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr926475985a.9.1758975952413; 
 Sat, 27 Sep 2025 05:25:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353fa65a62sm554412366b.47.2025.09.27.05.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Sep 2025 05:25:51 -0700 (PDT)
Message-ID: <7cfa782b-07a5-4f0e-9151-44a42c77badc@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 14:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xgr1hXOTvgmbMievhCRgK3xUF_XJ_I--
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68d7d7d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Xgr1hXOTvgmbMievhCRgK3xUF_XJ_I--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX9vTxIOtRjxuR
 yiZWNQBJ+UAUP+q2NAdinnA0+wG6isWPv+tdBzny8I5CdofkecsEzgy4fACAO0pXDTxex787E7w
 q/EbCHSEUN0EcMCUsmF9pDCjmiSVL2U9vYLjzXuMiDGTqb2QdBDAYNUV0/ycBMFm5I1hjLFJS1j
 IyjB9IpvusxhthmTKAlXIPZBUw9olryYIzG0ny10e1E0A8qm1oNHtASoaNCZWDIYySKqrmiMa6T
 9zQEJV5hcJpU1ZVG4rBWR6HtBJlcINIuclglkkyo0BMRjYgaDY2qH8Sjlx7ADSTQu45HxeTJKkj
 Inw1NAhW5nqz52qV4vdp8Vosrq+maIN4WVAy2Q5VPEcF1sdNLlJTmHMzxoypdjCAF1TpWoLfPVv
 rixR4I4H9qy1fDGbj2XjRAv2f4Qpmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On 9/26/25 9:25 AM, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
