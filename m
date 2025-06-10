Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E1AD3B42
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC54110E2FD;
	Tue, 10 Jun 2025 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn4SUFjE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C5610E2CA
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8ulVN025168
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=mn4SUFjE8MRlZ8ke
 th4z4VSdiSRULhatOTzsxH3y97c1zG7QDfIUZKTm/6V7IOw8NTJXEcce9bnlNkqa
 dCLMgWGT83cZ+cqcYHmJ1t0AOAJp+mIkzzFgGlxhI847Sosgzv6wmT3F56XbzxDq
 c2p2JWle1/byMaVeY9OiCTu06028CUH6HFQ+pJdZxVYxs7U4hnb9HtReEdkxIQvJ
 ENBqgx+f9YrdpNbPDQnELhIYRDkrzTeHi5MwIOiHy9tpTmTXvzOGgWQUSyyS6acy
 88+43FAPKs6bOFi2QEzWcinAkUqHruexI4hoD8Eo/hdnPfd8c3UxCNHFY/AjFLIe
 Rf/1+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d121vd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c76062c513so100338185a.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749566204; x=1750171004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=;
 b=va1MbcoEGIJRNAcWiC2d6NF/ZVl3N8K+vItKWWc1RZp/FXhbxskkwzmIYqG6LzRD80
 tm2fBbCkYc20SZvJWtMdxPlK3LxbEn2HvEf4UiLgIAkkdLeb2Y0c0mSx45mklFvNu2qK
 hP3zaZpKaRsVo0sHeZxs3NTjSSCXkLbSOyw69esbGDdyHBuBYOMXfN31/Y/OZ5FuiOZz
 EiGMg3XLN13irc5gHeB13oL2PjEQbhspq94Wce15idfDIEso1BPWlAT/YxfGTv07dGJz
 fPCTiS/Dl/d3GnE/1og+eatzgHSIwv7KbVUBcZTAB1OHpfJBi5bGAD1vXChcrsAkUUSs
 DQ9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJbJWyDIrmuRcpSYjotaDQMNN1eZkWWY/nuJE74cHn8RcsyLeu92mnIVsNUtWNZtYsYfsp4KE8GW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoxbq/KQE7Xr/IzCo7uFxnkxKCMkUF0VbTvOmns4DV28Tuynw6
 FxLknXy4eRzOqwArqpqVy14W7QH2Rsdx8iJ0WFMWOQMGoFRSWb1VYnRfblz/nU8bNUwCEGsRZKH
 vjTHRtM18u0VuP+dSMPLUAhoez9GbbFFFFWCjvCKPEq5tdGEG+iUakK3jQCp0ltw7CvcLbdU=
X-Gm-Gg: ASbGncs9ZmHFtngMPaGmT5CEBBhtyPk51kyWJoiaEgm8Hd+iDsDu/5Q/l7rFWM4ocZn
 +1LFDEz6234rBT+aIaIpavhrhUqmwyIvgF0Qkgim30KSnkpz5qaFXlWZvbR29DS/c4g+Vy7PWlb
 7eAvOGwcLJwbmuxc5KCafXnEFYdbWF9cIDBSq6YvjAutjN2HNQ+dmiKgFZqzQapnbI14sQqKc3r
 8JMh5QfCcFPaYO1/FnrMJn485wf9YsCuGCnSlKRHxoapR0TQaK2VIiTPzPy2l+33AgfGmgeowuG
 UwcEun/X9nPZ8ia92FK3CfFnUtTjQYFtmsRfnPqKrhnzs7P6D4EKMOzKJQGaSLUcaqXyBWO1cCg
 Y
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7d33ddf703amr932428185a.8.1749566203904; 
 Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBbQ7SHFJAIcnH7aGz2wAofoXXYsrztV5V109VXWdIgAcLNVnSvMvyMhOqmTXg8HcgDxWrxA==
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7d33ddf703amr932424885a.8.1749566203410; 
 Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d7542c8sm734986766b.21.2025.06.10.07.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:36:42 -0700 (PDT)
Message-ID: <33fe6caa-6720-4af2-a0d8-44b75b6792da@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B7DwUBljnVefWslEK8VItTuY43IlF-ER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX6TaDw7TLgvSg
 Fo7Ix/GTAyB8smrF1fy2FdZZhsVBGFyRnm6MBehMT3KbhzEmJryGRNwRW39GG6Wx4E9ux6UbbbV
 Kv7zoOHJsTxM2BGwUCVXmFZIrLXPuiR3wm+vo5ZXk38mLQ0fRt2JGyvjz1OURyBkK43SvM4gMXP
 dQT+1ZvlYUMOzBxXyP5uGAGz3COyM0HNxenEuCYXU9s9WLZecAK54yPwiZ5rdNXWQvMKjOdplU0
 85nl2w8MmPxAz8OrijMDCb7YIYajePw3gIomuLxDKFOU4XTSbYJhQ0v6tBPIohC7T9yJhOZtXVs
 aKtU5ODnokmYDD4GEkMSfTLTWE0+F/oq4+S/XGjdGKGcCzvS3QD9+Ct9/ZvItm8XCyNTBZbec6t
 iW0cA8WJHdZrRZQDMn2f0dg5GKzjPTJzBn9AsNfOGZC08jH3xsWRNEWaALvQO8DAApfOByg2
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684842fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtEEE0qNWcsMKkko6jcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: B7DwUBljnVefWslEK8VItTuY43IlF-ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=951 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Matches what I had running, I don't know the source for fuses but
I trust you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
