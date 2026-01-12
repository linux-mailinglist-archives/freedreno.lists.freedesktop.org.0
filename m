Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0FD121FD
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DF510E0DE;
	Mon, 12 Jan 2026 11:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK5wC/Hy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3GQK1Wk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909710E091
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C84PrF3353785
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=; b=dK5wC/Hy7eENKsMi
 yenfvHx2CpdMwHRLCf28CJSwSn8sUDCWIbQHtyE27k82cfXmZhfMTm4UKYFBEPKE
 UWhYHO89l07edcgiiMhUYFIJNmWjDfnbiJ7SA/cDTm2939VR/4HFxPTGuzqlG9qb
 zeHbPAn2VoAVFtWVPiBF9IcVsEWmNE4cTBRbny+1nmj9V792aP9jrUsN309FJJob
 L30nlXaU4EzHDy+BjLKwXJi2KztFIP69cvJUvX/EFjdiuMYArbRggvXalvcdw2dM
 dGNbktdTC++M7oSvLPR8rbAKvJ7DJpHPW9d2tyKqKofQXSLTMqNBS8YRZMVr+YzT
 uM/qZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4qup-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:02:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ffb8ac2cebso10728541cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215750; x=1768820550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
 b=Z3GQK1WkThDP7nWqSG2qPHEq+1XtOFP/zCFQLUOJAbgxJvzMgPSSUDF5jqn/kNmGmf
 zJNOnshTQvFad0kJvpF8Q/vpUGInHKRjiU3xNh53Fo5qL/lZdjuKiYRAP0vmWm7zGSvB
 It93tbmSfPpfOZ8o9Kq9xLg7gJL+lJjIJVErpkHnqAuJFTLGQjRSCw5QUBjSs01ui4aq
 5uvA1RecK+xJvs1kHozvjRjP9cPLJX8o7Zs5ayebZ0EanmKUjWstBXdg/OdxTNUchZ/R
 QklMFggAhh88+xruLqamNROvV7iaqbRbbsLFxwPNsws8/aVErLU600//S9bNxz38Nw1v
 uZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215750; x=1768820550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
 b=NgaAHJj9Ikb/SpfttdsXBPmuBnV8Wj0J3MauqZsKZ6G7IaAsN2MePgj3201NZapEAX
 SqB1j/gdKfmLQCFD3r9b+1DU1dFMCWpXC+uUly+GxT9NU4QP4hj2KudtE0Nq3PElrs4I
 GOF5f5IdNkSatoYngNC6tj2hB2/MWtjRp0OO8aumL8uOEyMQGZ4KqmmXHT6boV4FcZ1F
 UXuDwOoQSgOJpFC01inX0oE028nLNqa8ax002OfI5LuVCzItJn6g46B/VCqqAER7dEsq
 EUppA8RMRceXdX/fe4YU0D5phSYSaxDoyciNc6pm0nM5HGMB658zvMcCU2IBJ6P92lT6
 r+ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXnQoW9vjc6tFd/Ybthh/p3zQNVax02tR/YCbVdH4EjY+Mewr6RRRd67kR2w9OWkUCRpzRc5jwf2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhKC2nWkYsqnfnh1Dg/Xuphf1rmiCebkbFFZkaPqEDq7Nv/G21
 WXHw8id2uAeW0Ur9HyTiQic/0ePxDPAPFS+zf8aO5eYR2sGniFm+U04R+7S9+KKHhljU1wOcvqh
 FF4S5MAZNFrClX5M51sO4VC1payclRWiNWCUAkdOuL/1j5KnGky0DMHYvuyfl0YS941W8XMA=
X-Gm-Gg: AY/fxX7ZMBo0+V6aXBQNENNz2vG+8PattesESN3SNCSDNcOHsCtbaO1FYRJOJ5qyTpm
 pytsCVA3wb5Gvg6fQpgoTJWhdK/8VXPiHk0lqgQxXfLs3jxIM5VfaqV0x3bJJMWZ8KlFtf8tpll
 nF/pLl2b8uchj8xBrWo0XCSRPhSZKXtyBvYVEvRMfzuuWagXcv9athX4fTN31+TkuGVIHTL2Ag3
 wMkge/XAQVOZLncGQe/PNS9iJtM9ickVeu6guqkyT1gVmAJ361dKwvYKwCKOXT2522j9MvT0qkZ
 X//BGo8fIM7RDiLEZx8WZDYjY5ohw2xTTl5P3tueC1IEV5NYxHxd+TVQeqXIrVV04gnLo6QAncN
 Dqc4HLO6josXeRWIwbOVO/vBS4urMBYhnVvKs658OM08GrP25LkVjQMQdX9rv+ei85CU=
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id
 d75a77b69052e-4ffb4a68dc7mr189484201cf.10.1768215750233; 
 Mon, 12 Jan 2026 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmAI9yXYwAAD0iHcKhXVU23FUkawySDiFTgiByQEI1XgGg3bSuLF37l4LbUipeTxEIuhvlQQ==
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id
 d75a77b69052e-4ffb4a68dc7mr189483721cf.10.1768215749607; 
 Mon, 12 Jan 2026 03:02:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be65197sm17398854a12.19.2026.01.12.03.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:02:28 -0800 (PST)
Message-ID: <3ef982f8-0f0b-4775-b701-d45ac2c05728@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
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
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4saQQdncm7TCm40mTM-mJ1piiZbBL8jf
X-Proofpoint-ORIG-GUID: 4saQQdncm7TCm40mTM-mJ1piiZbBL8jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX6gjAf0FTEWIQ
 iEljx+o65HvdqQbFw0l3Z7cUWKxiTKtm4nwtHYLFP1IoJpq4ovzjZlOT5EE3jSnsv8RWkgE/5Sz
 iE34H1J9J9k8PdIfXEob38UdD4Bf6rUtQUsqoSwnlrCl6TLxJBR/c2bzWY2rc+UNmM6WN8y+LNW
 xzGG7SvR3j688CiDdMRrXHIUte1BNQL+pTuJiAGUJoLZaxvhx1fjLwPPOXHMc+NZXIErICaflon
 uyrm8B6ShI/F2we8TxFrKtm8yuyF5b45dBx7XqSDMnvTOukAqLybrqcGzafPLbODrD6AaRC/UXl
 lyCNCF3Fp0t6JLqFY6eYbpJ7BH0z293ABRV1A/2lAqBtbmvoo9/HdoEdnLiB8K6Cub8n76Eh0mv
 R7GsQz49g/3Hxcb1EzIC7Jl6KHA6sc9bOj9u2z+bQrh3qIfbN9/+EZxskWALs/lsw1kbm/oa9I9
 ew2EKT8QDuyrw2pK2iQ==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964d4c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120087
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

