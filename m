Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDCAE1DD8
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 16:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CED10EB77;
	Fri, 20 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAJtHpAg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2410EB77
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8s12d013681
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=ZAJtHpAg5TytFv3W
 kvuEP7MlYXk08pMf7BPEgfge3rI6e1pJiKr99ASdea9Wguhu2WqaLVwo/hjsVtL6
 3dgUGZpz/CmqkHIg007vyaJ7HlUJ6R/Bo/Df7i0zzmZgjH2LHc8yzNCo+GdNTkny
 mn0iLXTk5buYeTmE5nZpfKBmadFdmNILbOOEp8XNX3eEEd1w64JjX5vndaZrlLlV
 UQInlFPbKPV1t+Nc2WT+3Dz7TAjHCoiZpzHzR1tTtT0xetNlcDAPOxVuQG2iJGyk
 RzcHwfFAGdEqnujpE0OrkBPgJQkxfSCd49PTSZwf0l6ZaXuDRJXwaqGntp6tRXIy
 igOgSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp6290x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d0a9d20c2eso34463185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750431161; x=1751035961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=;
 b=czKkYdEg9vI9LixD84RF1hvBcKOzbtCVSESsWn1msvhsjYraZvAxVmUvnXn8PfsRlW
 EsSrpxOBlGhboUHDGrPT17lzDfRWlL0mcoigqXGQcr4TPZHHcb9iN51jvRQ41DydWnKu
 Sckl2B1+YsjTkCfE1e8G4y56qN2MB0c8lRnyXg0M7YqTXg69JEQ/htKBRT1bHhmWZHJH
 jiFxCdrW6KW5JjDMhiGujoDSsY6ryzuMt9fmJu2AVSFMLnbP5Tr/CsDdd8l8sCkUep6H
 2ML3m2UvbZ3pYxhlN73TthmqvHWxWUDfuioousCvoYoCp+2csK3HFZlTHCYQu5gYvTNp
 HgAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVffYYR+xSJ5SeNWXdMvEoeJL5xxh98p04YZjxIfCKk3attswFWPRnPVBAsiPk9Nd/k+pk3pCCnHd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI5wvmv91OczxKp7jjYcK0EAqn6S+0vD0/L3EIquM7qGYE/Wjx
 zPPOEw9oOkyTkmPgBYaEFiONLu0VoJIjXZCpugaEi3Ghirw9u+25YGFOt5gNoGPClUOCiB/tT6l
 iwL0WLLEI3Tmwz4g+gBGKmEQsjoI4Bamik0gqROgWrQ5wlRwok4MNl3+7AOonmcQb4M0OPmU=
X-Gm-Gg: ASbGncuxGKE383bBBOFAKhYhMjjvfEmOUuYvbwsEnuWyd9BuEXMztFQjRSKawO+Hc8K
 uaggs05ud258JxUE7TBqjQD9IloHEFcdgKD15Up6PIIhEaSi0dmRUmZkBpE9VUA3hIkFvfR28W6
 j8GezgqgbBRSodb0+gxgK3xa+J86x7HEmhDDFmsxe8kn3p7vs0Cg+XUlIbOpVUF/NUr6rMoNwL3
 vqOi53TZt4+16xwwhBoi2uGPV20vz66K19e8pe4w/MEnuWT5ZojlJEC7EK47yKX3kLgYmEbG0ni
 X8ap/lJUFV//peA7G6VFPkvqCOy81XOmtjaoGAtCRj1ctMcTs2UVAgvXBmjxOXPhsRrjWIxuVXq
 rXGg=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id
 af79cd13be357-7d3f98d9073mr155714085a.4.1750431161614; 
 Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSbj3zLVYKtfz8K+lKDPK0MngK/y7uQ3TDDGuLOc5VoymNZIeGKtQmf1ZbkgF7OimM7IZMA==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id
 af79cd13be357-7d3f98d9073mr155710185a.4.1750431161098; 
 Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ccbsm173800966b.70.2025.06.20.07.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 07:52:40 -0700 (PDT)
Message-ID: <e1b552c1-de9e-4c6d-9340-232427442620@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 16:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SsTPY0_JrSbwDlG4S8RPxsrb6k1wGnGo
X-Proofpoint-ORIG-GUID: SsTPY0_JrSbwDlG4S8RPxsrb6k1wGnGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX6lPgeGtzKnLR
 bRgIUCXZwVi0ZgMDA54pLO3EaTmPsFDfFI6yl0s64fxqmcNmS2Zlm0R8dAdoACLv4izmUaW63PW
 tDCy6n8T58LxqfJBCPRTyUwOqp57K5iBYZVmhjeBWpSdKV1aPzq3xk+LBiELfjAuSv8MiarJL0N
 9o9EjiW2AEYkE/GqVdca1bh5OJ8AV8Nqx/2W97mVyt9blJ95lyI/Mi49CeElR7WJQMFLNwnQldv
 WKJKVV5fMCckcQYncavYsYi3DGJTFl4alKVP7Ybtwuy/l6t+MPbyTbouUT8aHbQ6gqCGqORiiI4
 Jcl5smZyrtLMlv30ILXLoMLyNIgTA7vPwkz7OtZmFvbQ2yVJd0XnqU6NwA+PtbDdnW6GB2kmeHH
 6xAx2JUU2Us79mO0viqpnttMV/BxKnM8tuwNHnwzSw013lMK7H2aZLcp3a3evaGSgivuOGdd
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685575ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=5RVeKMBEKdVlAG-YRsMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=779 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104
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

On 6/20/25 8:54 AM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
