Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C4B07251
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 11:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DA410E771;
	Wed, 16 Jul 2025 09:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD7TaINl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CEC10E269
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5QorG029553
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=; b=TD7TaINlKPIASE36
 u/IbN+GDCE0I8aXSUbZMgWJU5NLyxC3OiBPrp/w94eJ2CIRTzCtvErpjFnPBsIKY
 dEoPnit2bh26v+QbjDsA08VXCjUStPFtRonIes9qDcEcSPf1Rckx0ks9IgGr0Ulp
 /ZFd1CGsPFstiDMvrOhiTJ+CgMKmcQIGvXWRag6QCDVN7AqIXuLa09ElQm2W61WD
 uKJ0GCCuX6oqQhJhFdSaFr/LcQGPVOUHdiQvg7iD+itE+anVeK9B1Pra+Nj5ePtF
 RlFj1INTotKb96Um/t3VD+YR/PYkYlsdtQMWFKJERhJXZMf9bOiynuOEB3PG8/no
 JoW32Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb3gfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a58580a76eso2640381cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 02:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752659909; x=1753264709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=;
 b=b6TfOGfLqehGww6QoHgc9mGER9lFGHD90NckorUAyCj6G2qlfBLmY4TCOUkhAr2ffl
 JOE/+0KHiABMkONnqQI8wP+xnrtU+zg6vu3+WILzXiLpCaUlQvl1/AdAPFV88d53lirE
 7g9xIwMXMDUsK4KE73VXPkFbKQERDSHRAU0yC4EqQmPNTHP6SSm0WiI/PhPkutXe/tdS
 tGFNyhxcXO/sKiy8r49KoxIeDZBhnrKqooMBQ1MDb8HYOZEwMwddY+WegAbUazsPqg0k
 j9t5KDGxKZSPv6CS713dzCtic7B9YPkVajd4mC/5YDw2Oa/N6qXQE24agSuF3jzn6G5B
 YEyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTnVY06PjsSurXrAOC9+76YHU9bIUCEk6AP4HK0XbJ+RYgotBivtgQVkVnEBIUEAc2FmakVGwD2mg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpxko/No2xdb4PfW3l8h00trfFz4XAhMq99iChshjq1Ej3bwqT
 NqeCsQ5NpgMAZKMdgrzA1KzQ63zl3aj5/8pVTBodCBLgfVE7HQaHyyFlUn1XuiMg4j7INAWMXgR
 +twMY9tE5p2NQE4yEHmwbjY7tQBNK9aWdVp0w8Wzwu98V6xbUqHTd2t6s7wh2wmUMRPJcZn4=
X-Gm-Gg: ASbGncukowcE+O/4CduE6ri8leZLtoqq+MQ0CspR9cnuY/smUiCGn234Ntco7ZUL19e
 7wLDr9dHvf52pUw88huiEPOX3GcpFV/Rwg/QsBQriCcCXOiKzHLtxXiEfSwusRRestz6y4hG61L
 BeqTcUVkys4f9XxJ02ns4ly7uLD/2NsQvnoOigAcBV3kvhXhNtMunk9c1M1EGPgZjErSEDULKrM
 tRV550VnkmLOFIjNaGOENXsoBR7rQ4nX8sTluaB1iDq2semVEeq4VNFhZfwYVtYl8V70d0QpUye
 QeAUMpFmmvK8mx2/CiLNyh6CrP6qfkSMUiX8y4buxL4mLHHMZl1WtAaHSOpkcvO7IT+gA9TmyFr
 98x09nqvmDVZbtdODtNZH
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e342b37074mr137701185a.10.1752659909178; 
 Wed, 16 Jul 2025 02:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpnCpN/dC4tnBcVCDR8doy3/WCq6HZeBLkingkmeSVXbTv0Ng7Hs+rCJV4fx9aFN6b/RA0hQ==
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e342b37074mr137699885a.10.1752659908851; 
 Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82df2efsm1166796766b.151.2025.07.16.02.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Message-ID: <ad1afd1b-9cad-47d1-8dc9-0d62b25f502a@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/kms: move snapshot init earlier in KMS init
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b5tyhTvkx4DUXMRL_MXjUCNnmKlv9YLY
X-Proofpoint-ORIG-GUID: b5tyhTvkx4DUXMRL_MXjUCNnmKlv9YLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4OSBTYWx0ZWRfX/i5amwZRSg6k
 pghsF3eNUEDqdAKJtrIpbPzZ8Az4fbkzYPzFX2TkIhWBzY0O7NPSow8WCyYyf1iJySNLfGoK+TT
 ttErDCfZuP/OWcwttzRV7qEp69Ujk4c0dQ4rbuhil+qj59SwJaLZifqYlXC9rKKNlOXLULCkoUV
 ugIa8d/kcY08qe/VoMd1WgeFZZK6upFzcX+A3SlXFcZtg5lkxu7//DNJFCxaqzUHubTlp/GKi1V
 fONXTNxaAKfkEBpBDPUIYU+lqgKxBASYUu2+O+Na6e61LIKOFhQXZC+b4VhXj9dGmmD4NjEa4CX
 J7L+plvN8EcpCzy1tAMTF3pigTqK9GMBW5pg/Pq3SmeG4JErW0OmJei8+3H5nrQ0zaj5ZXs1GZG
 7PGpU+j0EH0tFmCA1dD5swUMDgRfNKsfi7YvWYiTI9tQCwFwsHy+FNE3KWNWT+uLvjziFS4C
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687777c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=qnTbvVf9oJKgxClKmkgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=984
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160089
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

On 7/15/25 5:50 PM, Dmitry Baryshkov wrote:
> Various parts of the display driver can be triggering the display
> snapshot (including the IOMMU fault handlers). Move the call to
> msm_disp_snapshot_init() before KMS initialization, otherwise it is
> possible to ocassionally trigger the kernel fault during init:

[...]

> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
