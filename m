Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0441BD1229F
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE410E0DE;
	Mon, 12 Jan 2026 11:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ECFRkf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVYCUkwG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250510E360
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C9F1fc1091976
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=A0ECFRkfnPl0dXD/
 5Ee5jZF6mLYqlKbtPDk/brg8Cfrf1nuCvdXom+4ieEfcwaL/XlTsA44i/rYUTKxH
 T3b8fzAjPG2wY9onrDFkz0uYHbByeMphgdQay1Aty7/Y5+5zB+qj8poPo5xRGkzZ
 /lNnpEuljiGIe9Zt7uc/063Ho6hsBMXjJmCMUcYDP3RKgUGcU/4zC2e1M4EDVXlP
 KaHOHNrQHDG7AaVdqve52k5sjHy4/xWkjef3HbveDEvqtQpBsLqZZb62fOmLgAAi
 14qVbUK1ZY3KQAmSG9jJ4hYCHqaR+Tcq9ZOJK+WXXb/U4AdTrepsc4x+2JWM1mO6
 RxFYEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmx5mgb45-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ffb8ac2cebso10738061cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216031; x=1768820831;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=DVYCUkwGUhEVDd+AnaIPmWSgBAV30/p5hS/pUqbiCFmEdPivvbfERWbX7BLp0Zt6P5
 smHr+9ud3FguL9s38/v8xbgWI/9CHAfbZD/DpniQjUaF7ZXhdNLigjDlJj2PBomfz+CV
 qkgSyLs+ChPuuK6XTAFIibCJvv/JYghVrEGNe2IMe2ZedyIi+DwkuFDCgNQkdooW755C
 og+06cBdwo/y3oOyxu3OK+HO4Djsx0TA3XYUqVdufJqIeg0qQkt/rtioUZqctsmRJnSc
 +neJNvKh6v6B3t1ifD1tZmGTkydWHJXFJz16DyiCxVxUl6ypCH9pa1mONpIK1QHU+vm6
 DfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216031; x=1768820831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=EQd+M855GMXO8RaN+l35DDAAh8r0eGmKckhr9He8GRVRQZzxtx3MyHzDu3xK6ulpiO
 B8x/aFdRBaRMh8nf11U69VSBfJeU6/ddJFspcfhicXvY9blEjj11A8RzqYA/bP5mN+UX
 tGQou9YxGpgAmND7vKi3QeBMF1D8vH39IFSbsH7tTBDqu1uE9eRjl3LzqCEv5aXW8ZnF
 vCO9SjpWOR9e9XEup2BJ9ONi96i1oGmPkNOY4idnZUSJ3LJkNmyJGzsUDfGUhXZhNAv1
 /t4bSjy34BGg8SEayMKv/ASDi+ATGTVT9NYYe/SGZ2kIMUkc3LGBq4AtIh4i1EMcdK7s
 e8fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFnP7oup6p3bZaI1CW4yDIEM75S/QBdKw5WXWZRldhpb/3aURUcevvRXH40vOVyZRX30oxJHJ+ucI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwldY4BH8tNs83Bf0KkSTz9Gbyiu0Lrk2dCLm5p/7p7p1krtVZy
 I0BSvbI0QI+2AnesCN1ZOVlYQyKGYzFiX0J6y6LwPPqNR5M0k1SkRfxKbbsP1uKrAtIdMtJC7YT
 tTdwIoacKEwgmxAF5dj95y6l5jqByRJ2FOhCOI7vU7bfGmTTY6uhF1AwYdL+Nx2V1Y7UFssw=
X-Gm-Gg: AY/fxX6dfse0WqUx4GQzU9fIUQlHmDUML24zCbeXb2XscRjeTQuhzmDomxVeANnTZ2b
 TznUsxE7cs7A0xAwTtA+6DrXGN+tp6KbX7I7gRuXD3vKd8nO2FiNJAndzB3h0wj757gNx8D+CPp
 uuVWY85Z2C2+PG48grQwSccTku08e+9A9fdFeKAgoFyO0LiBnkhehax8zuIL3wOP5g1KNBArHsY
 e3zBoEUwUomtn5FZocEVQe1eimUViL//2g11NW0s1c7/rs2LzjKNeJ69KTB1OLpoJSN62l2WEmu
 D1JR+sRQkYdBK4YodG8fG/YiID70U3BOylsowS5e6xc/uzSTqolDEQ7QdJ/HU1jmzHpvcqauOcX
 E1VjITW0HjsQ6lsEEjaC1R2ekct++TS/SDxq/8+4DgddHz3tZ7WDku1sPFkyEYn8E0eI=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id
 d75a77b69052e-4ffb490058amr190474171cf.5.1768216031387; 
 Mon, 12 Jan 2026 03:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8bZ9DLH4NWCdH7EePQEzlpw6QhI9kvYUV+M/ik2/g+M1Hc8pMsJCTVVcitzVSpTEcge8P7A==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id
 d75a77b69052e-4ffb490058amr190473951cf.5.1768216030771; 
 Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8706c2604bsm476444566b.16.2026.01.12.03.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Message-ID: <61ac4661-77ea-4696-bbc4-531f925d5fd3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
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
 <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX5+Q1b3nzrBRV
 8kCSrvqGYGi5vt+rGVP3+Po2iDMpBRS4V5kO8kcXCm5X/gN2FG8oQQvSdVdGPVoS+8GIo1b6Fs7
 hNKcVpl6mZ+e0WAazNLkvru++qfB7iU4kp2iAAhdEt1xRyR7yMKtzJGXBH1j5ik1c4G+IWIU8uo
 49goKZR9SUMbOVBEhs3Cmb01UdeNw+vZcufVJDKnPk4wftfLL+DexRMPPO4OchPJnhEc1hTkp2h
 2yCrTqhnu/nFGiO+UVR8putyIIxewGSRj7xKm7ooiSILKLgJ/jnmqb1gcBVpTQ5j9ZwyxRg3Wtt
 4LQHxZmpyzN5xBCeMPnqy1G97bSJFwP1Po3AbBL5+69OqHf80LKlFPXmL+inayzIH7VmIctT6aF
 zj4kgfYqahUjHq9wz251JudrlkjkSLg6uf3DghiWzMjr5gXKfxv1TTmi5dI78l44zmYZ7vY/PAP
 kB8IM3SHPjUmTZGCVfQ==
X-Proofpoint-ORIG-GUID: -sBndizIfpQHUv1Sm7fO9ld1hKE9a2rZ
X-Proofpoint-GUID: -sBndizIfpQHUv1Sm7fO9ld1hKE9a2rZ
X-Authority-Analysis: v=2.4 cv=Q8zfIo2a c=1 sm=1 tr=0 ts=6964d5e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

