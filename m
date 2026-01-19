Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9AFD3A3D5
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 10:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DF10E3DA;
	Mon, 19 Jan 2026 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4EBeaFl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0WTzPyq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B33510E3DA
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91Nmb450866
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=; b=l4EBeaFlup0HfBh9
 aSoOiJ4C3/kuxhOtr45EEaeI83OptusrtXNq43ue2AlRmPhZhk3sHsWoqu98bFKh
 jrCCj7RzrvU2/aGGoVjQrOM42ruaAwYSFZDtfh7cPwRMgHrw9qILsIugG4WqmCcR
 aDwYmwPTNg9ffZJKS9NKxGazpNwABRy8qiATcPyFSMsoMqt6xn0dPMjul9I7rKIf
 zSwLMjLxvBFxiHjI2ZIWx3lJE/5fxoP3gzwdsHgWmiqWqog8nXox+zV++xzf1Myd
 xD0vyEi8uJ+gi6hGpi4PmJ2JTt6HRmJPIIX0e51+kzU0IPMv4QEdI8jrly35giO0
 c/cCrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7881mqn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c53892a195so107242885a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768816608; x=1769421408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
 b=C0WTzPyqLwHUtlRZcHrdykPA+z4N8ZEpUeaLam7KPU5WpNs7YWXTGoi3eF1J58067H
 ScCvIYp27tDiWayROPL5OBy5T+F/EX/UDSsBpk0epPcGCran1mlq9UTrDVZ4CBOQA4rS
 DkEYMYNxdhehGSWfJ4nYi/h6uO7xv1g9SVPIW6yO7pa/61B32xvwQW1FAJcKTgkOlBKs
 1Kig+c9+n5G6Ycch/f04CiEGnHaqCI/FKdAVKuApyQBy5QxDfoyqNPF44/uWwe6ulE2y
 S2ZYXrtIep6wVRPZH1eSFqNRer3m8PKopUiICUYMf6/Ff2B4OPoAWPxA2VWuNwFiRosq
 pPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768816608; x=1769421408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
 b=ZPUlAE5D//UyRRjPN9DwmEc4EM1ZasHm9dN/GWYxn+nuRQCuag7yqNl2IGUaZKNkdL
 IO6laoIMDBN9QdPZuKHzepdQjSfwI9PYuWPz+Z18d1/ooGNIwK9jQe1ZXfnXzfvRPkJO
 Oh7HZ4uFxytLjwD2Z1flpQ4knLLg2Di4yhVechJKLNwe6aOhsh0mUCYznAluQvPAfLoN
 e5x0eZAm9EdPQWHJ/+4ONPh335K8MLm54PfoQC5jzcyzUBb16DCc/n9QCofh30wN90nY
 G0a0r8OfTIhKuisCUkKZvUqeAbkur/eZ8E4eA1oMYBSPFLgvWnoUJ0cobzc4denW9qmy
 1M0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnSKz747n1ewjhlA04AyL4jArKVxAFsOhlwU1iUKZUShRV+Csy76hMbp4I/k+ZaszzCoakrgBcR70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5WHRiBmlm74kSXaHPUrFuHMMJDZ1sHzsfr0bS590HFVJUW3u1
 zJdotqezqsUuxMUtRpnLNEjE8rEggoiuMcxdCoGG5GhCja22MWHVyo+6hCV1llrocAh7HgLh86m
 yEURtf3Iv++OhNF5TERRJcYGYnKYdyvObP2FaRsAq0GED5vs00kBbA81xKR2mUJda+zDrZ2w=
X-Gm-Gg: AY/fxX7fmaR0ar9wNwTdY4iqjsLpUZmtfby5tMcTsLSVAXhGoxn94N38Vf4QGyqSJLl
 3YBE73XXgOg/X+KUTjFSj9wl4zbl9d02T8hHA4KWZSkSYqOQYQdc3UJYMNN6aMpsKTMCCKY/eN6
 616wlseizacJimV/oZMsWEPWtmpSg+kIo895AWA2edPcpmfe2nPluS01yMdJOkpO+S6mx4L0DbL
 u88Ra+s2xXimd625AdibdzHHqMsOv7UDXWFlNLLHYwk8tDTW47rkIuMEx7x+I/ObF+fTLHGWmHb
 Ii9S6NAcgZB5RzjuvcSICNCrZtTzOO5dHPCgE/s2jjYDxV565C95NlpbdOJTYhyPDrAjnuQq7bP
 rnPnn1yZMX58zg0mpSWgSOtFvOfom/V3rfcUax4pmGg7N/bbmisjC33hxiCba9wB3iJI=
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c6a66f26a9mr1202366585a.2.1768816608361; 
 Mon, 19 Jan 2026 01:56:48 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c6a66f26a9mr1202364585a.2.1768816607918; 
 Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959ca4casm1040662466b.34.2026.01.19.01.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Message-ID: <faa3cb6a-8cc4-42f2-a883-23f7d9b0816c@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696dffe1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aLeZyDyw9DXj8ur7rQ8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX8zGrtfuGxzxg
 kiNIjDeLxWKrPo8JIkL0BoyF5VQPRD1noMx+ROUbyWvHUQZ4daL5oBk62FVsZGBpXT9nMHG3Weu
 RxZlEpAblTYg5leKkWsldIdq2NLFddv3+2KYwqfe/BQAJdtKv5E3SyRSxBczxqvMzV9IIlgOami
 kb8rxXE1y+8WkY1nuR8WlvVIMWAP0CuP/VaCm4xPRCxgIB9Sexf6A7hTXlo57ZRB011199nBLY7
 0BQDRWph3kKXPgSD6vQ3P+JtT58fK5OnixLeeoSlJvZj/bnuHFbLQiYJMLSd6eHLtDKhhoNJ0Kb
 0iOtolnWc9kEXADtqL4GzdlthvAttG4cz6Lnc02dkVILjIUliC7ZGgQxhbo4id2OJVwz5skpawN
 g4gY9BMGM7+xuUj7N6f7yUPY1vwMNqGOu0LtXumUNmMnCDjHo5lEYRX6OSjWZtVCgLHSD9asB3A
 dwv6ZXkCyizZLvj2r8Q==
X-Proofpoint-GUID: jBX1DhLvux3O__WChP-xrZPPFohbYF67
X-Proofpoint-ORIG-GUID: jBX1DhLvux3O__WChP-xrZPPFohbYF67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079
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

On 1/19/26 9:14 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

