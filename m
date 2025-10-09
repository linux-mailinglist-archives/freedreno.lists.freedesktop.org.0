Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E00BC8356
	for <lists+freedreno@lfdr.de>; Thu, 09 Oct 2025 11:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A1510E98D;
	Thu,  9 Oct 2025 09:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4WQfNsp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03B410E98D
 for <freedreno@lists.freedesktop.org>; Thu,  9 Oct 2025 09:10:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHmu012280
 for <freedreno@lists.freedesktop.org>; Thu, 9 Oct 2025 09:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=; b=X4WQfNspdGcNJbZr
 DSXD7I7PL3YF1t3vwZYpAGpfgw+Mu1lbIA7nVDCrIFIm1E4oZLZ+1Iz4gfCl6qwR
 +XQQ2B+EuWj3+o4fEwHRRPKu3D5zusxKR8IeO3tyCmtcXBqKKNK4gWlxi1hNM5dl
 kD5fI0QVZxVlTpS6c8Oog0RfYtCkyqwImFsxGlnDBWumvZLtuPVJS4SItj1n//qL
 2ShnL2sun68DlebdMrRZLQw76EnwyaIhpKMdaVT5kQEeSfJpvJ2A26uEDxxi9iKp
 NMBmzzkvbl3d85tcfXYgNPsvk3nf6hOZrSqwgZ7ue+MConDu1ULj1wLbk8J0QUle
 RP9v5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kj6w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 09:10:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8703ba5a635so28092085a.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 02:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760001018; x=1760605818;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gLto9BCDROKFQE4dD3C8sxYVc2P8E3H62tB0Tiz5aY=;
 b=RPL4QxDpq5uVEJx8qtRB+38PHGZ6f7MvSse8TrS/dC7NC+J/O4tvSorcOKUgfujxDH
 orm6rWTVVJ+ZrdcuY+p4HZtWI+J1FhpmUdJOqaiysB5Q+Yl2p5DuypTqz/J8HKgL77z+
 WM+wVW8iXzA42XQdj6ldeOvIibKCghFLI2yAckTCAAO3CZ6HebfmCLgSoqw91fsVqP/9
 +XKJpYwfuQLKYfrFNt9v21sYPKHLop8irSxL7vHNh0pteQVQHqSjTe7z8u8qV1biy6rI
 hvgQC2cub8pE3QFtOTBdd8Leif1wxUY9c8DqgsO3hLfV6nHL6DtW8vN2olZCdj74IRIb
 u7wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+JVAUHVy1DcqxRGhlaPXKCRGaSdfMGsMVtcVbEY+cIOB2eDDOJ0Gfdrfc9L4m/Vw3oeTxmzVGHxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqsL6IMhUnTC4f79uvpv285id9v2KAishhPD7NJscnW8MvTzys
 Xq7LHvJW4hoei6kZKgmtoRyA14fauT3mlEUS5dbq5NwbMmmn0/EYSi+clx+v+alYGgKcSaPlvBd
 5Uef2Ua6AsvJs0C+4DH6l9BlEKda+BS1IbJb2+iZ9Mfh6eIr5Bwz02vFemHYhrrOGIhYvgP0=
X-Gm-Gg: ASbGncsqi6joi1FoBzcmJn7k3Y2OxKf8jf26rCRTsTanNoIFE+z1p7Zoii1xex6NQWS
 cRYcb5w4v0Iifk2mPFfpTc++g7Cvv/JkM34YI0o1kRQmI5lsJmaGHNYPGTxOr4QXQklwrA26PkC
 t7ORZCMI/be9At6bBg39194I4su0e3chnvicC1AR9BDXc9M6+7NdGD/+7vqco4h9qH8mRYf2/Co
 IT55xw19LPHTqYGeshn2RodXXs2EUFe/1UeQylX1Q2bmnKjmpbH1gSpjyz1nZKujcqlEQOItZyv
 0l4Nh/UJWAEIviogfIr+FeSm8e+ZVtXQM4grRo5RAzNvQxrhiTkVkJgwvn5CMt30Ws6a0SMQ2By
 EnTGn6ogp73aqiLj6iJNi0wGWcNA=
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id
 af79cd13be357-88353e1a4e2mr585135485a.9.1760001018067; 
 Thu, 09 Oct 2025 02:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MZb6QOnbhBTE/91nRDArgRgqRLTEI+IVWFn1NxgCnvCATzVRomE0Pl/cQ96//aeLXvp+jA==
X-Received: by 2002:a05:620a:7104:b0:835:e76b:ba25 with SMTP id
 af79cd13be357-88353e1a4e2mr585131285a.9.1760001017473; 
 Thu, 09 Oct 2025 02:10:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4c83adec08sm1153029466b.56.2025.10.09.02.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:10:16 -0700 (PDT)
Message-ID: <597ae997-37a4-447b-967c-8fd362098265@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add eDP reference clock voting support
To: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e77bfb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=rf8yBW790zp7CXIHNmUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3gN2jWejXCnESNRNQywX9qokq2pX8pu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0NFWL8iAoAo4
 sollww6hNy151I+6CajImt7fDeXmoeW6gNu+Gqs19iPExOCJlVBaxBfrDG/iZAqA4XeOzu2oYIr
 vcpPNKKJKSSlZIyucXwbCzdT/8uBOt/UGBiPCpL+v+Kmn6rHuUfTfgPg2kxZLymXlc8uwta2gqz
 rvrDXuD+zp6CCkQTmVM8POw99sZjvi7kRLBek85jLTri0ThCnA+dGoJhiSZ4/eFBe6p4C3j7SKN
 D8K61mONeCDHkcfNDPNq2/EBSAH9otQTFiwLbr/yyCU0vX7yC04Nm4EAGqNEF+acS9AXj0eTmy3
 F2eWjD3TocbVNfGwkz1fT1gLSMrBCwneu/nT0EKjuHJyx3u/gkIuhom44cxpiIimuZgvpRNg5m3
 Kq7y9L4pxqOSvqEmcPepmPdtFZaCvQ==
X-Proofpoint-ORIG-GUID: 3gN2jWejXCnESNRNQywX9qokq2pX8pu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/9/25 9:11 AM, Ritesh Kumar wrote:
> eDP reference clock is required to be enabled before eDP PHY
> initialization. On lemans chipset it is being voted from
> qmp ufs phy driver.

?????????????????????????????????????????????????????????

Konrad
