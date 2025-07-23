Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A9B0EFE5
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C0410E7B2;
	Wed, 23 Jul 2025 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="juEiVFsh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC6110E7B2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9QQjD011723
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=; b=juEiVFshXtr5alAh
 zEPAuqMhwz6Gx+8/Jp6UxcR7ECKkzgj0/RkRb+2vu9dVetupFS5goFH6k79/7h4K
 rOHHbOVQOU0g4w6NNzqzvOPB8hUqOXrAOo1vjpBGi+nr5//v85r687se7u59aCWn
 E5AP7tc98QrK/9Uem5hA0WIbbnsQergWSsAamRdQ8Y6rP1LaJ44oB00HQIgtgRcK
 JpWR3dIfBsrIMgNwMJmjJj1jjp54fQ3ZVjcN3A6Sh56hJp8aUwIek3apFEW4jeh3
 Tv9DE0YOyGeMFerDSUVeWqUEpFT9PwdGgxDzRO7hmWjK3K8gMp7NqIowiWDlwe0J
 AGUB5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qct3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7df5870c8b1so87078185a.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266761; x=1753871561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=;
 b=VKVkkrtfYqv1sSMlrb1B8WK9cT+hB6EW8JBUkwpT2ay3swBmefLKHnRSlXgmhzYIFz
 J2IpWyM8u71/j4pywGLZ43EjVU25DN0rPqc+U3tI7sayg6I1Op9z5xsOIybD1wQYFXWW
 oMXYwZBFGF6aiwUsSTWM9nrbxiXmfBVkY5R/Y0NpXQm6NFObuMLbnXf6Qvc4FaryAc4c
 RBHZvolhEXf4bszSdDt+Y+ZAUtNunuQOCjSnUiu6OxuB6g2VUhY7M/kAX06/F1r2TrHN
 tTaoX/F9xrKZmOnV6AAEsWAvFewHF56drfiDb7ungFEaKiTFhkKQeQHezE1bWIiJXLro
 wfTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyVjr+CXO7kTMwwdNC6/tpgY5AP6VcwZhFyKs8PA5WBf7JbAaOm+OnepIKQb4SQyWlNGRNup9QBvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGoIFD15o5O4xHPK+CQscj5zGPOvlmbs1FXwNQxU14O0WsBHYE
 SVw+yipo2GaG+m4qTccaAlgVR23YiCz6xOkhxBvldr4rxVnOEhF93T0PnS4Ggorxox42LaRo3ap
 c0hDedWikD39u6YIpCdk9oPzRXoqUSpmK+aXxlL2jN1G60W0bLY0guZCl6LLfRRG6YsxEUSA=
X-Gm-Gg: ASbGncveqhYwyg18PXVdYnjPU9MoaljRJQJYIEU8qM1AgHotChmmxI5mq0o9fgrMCQk
 Hd3FBqyJd6ZDrboLaFLlMXJy1bm33wEPcl0TsIfTMwasd25h7evkOfV9SlQIhiRmDmjuQYD2sP3
 GePB2j44QfQ3dg37rbrCkhr/jhmPJXns1n74i5ipYC3YC6rThPvNsrZNtQZCJNhfbzD9iPzlXC2
 JJ52dIy9VqPWu+9MICJ8V+fvYCvrs5LMRTTHYrZ1V6Jb1DP4JLouKjOgNyebzOa2L1Hrd7n5ARq
 ft3hI2XU2gdj/Wt0M8l1Xq+xJhFvt0ypynQ4qQP7VhqhMQh5FQtkBAraHsZ4EQQWXDjBhmvz9Su
 am9WBBPQhekks4flJNQ==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id
 af79cd13be357-7e62a0c1597mr117641485a.5.1753266761463; 
 Wed, 23 Jul 2025 03:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMGR1PY3KATLtDKkVwck4PFmLv2ujqFi2Asp89UsFHT9277js6Trob/xsUiROpYbvGow0BQA==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id
 af79cd13be357-7e62a0c1597mr117639285a.5.1753266760933; 
 Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af3758ec76asm57350966b.121.2025.07.23.03.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Message-ID: <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfX+bwLV4CTPm45
 wNFQuuBWQLStYdR5bU5eFGmmBwknt/JiV76y0ShDK9l2Tn2XfbVKBECUn5RzPdXjgQjbx6XOg6R
 pUGGiA4W73WSpiSDWWDPd6W2F6lERbZiptXr05pm52C2jw6YVzE21N8E7CCdGu28qq/mdyyGlHM
 yBjpcYUzvrzwGqIUnZ3V1tWw6BeSmZk7xgE0Jn3AuasdsDaOUpj+O9sRV30MoBC0jBZNyM5aC3D
 k66sMUyNpV0md462sl0TDyb2hx2pMumdYI48Buug7up0hvHyD3C5N3JPIxmiqNVrUR81rfa/1Wn
 mFabi7KqiSOYZGSRrSNrddPjlGWTotcnZfOCS58OI5MuLqOKxvIh3Gt/k3TSojDy+U/M1QTWsVC
 44zliuG5sm76xmoh/nrDHkL9Gnf8Qqjf+VYhOvc3Ihm8dovlgaQQb3PPrvOnb6+9iAvxtQML
X-Proofpoint-ORIG-GUID: mtZAnjcteXf6FbOMmDrwedC7OO1EiiSX
X-Proofpoint-GUID: mtZAnjcteXf6FbOMmDrwedC7OO1EiiSX
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880ba4a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rrcyIi5yJUK-87isN-sA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=616 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230088
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
> add gx_is_on check before accessing any GX registers during crashstate
> capture and recovery.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
> +	 * without 'whereami' support
> +	 */

Firmware that old won't even be accepted by the driver, see the slightly
confusing logic in a6xx_ucode_check_version()

Konrad
