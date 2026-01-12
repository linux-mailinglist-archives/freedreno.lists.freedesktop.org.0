Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9ED122B2
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094A710E363;
	Mon, 12 Jan 2026 11:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfx+xYZR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsbszmNM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D22A10E363
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7uDpF3232586
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=hfx+xYZRpVkUeymA
 3Ja8ykcT4C3u6CIn0RzQonqRYyirG5dg5XnSuc/yDv+Vg1LBqfWtUq4XP1mOw4pP
 uQsYZFtCHvsb8Z7/aN8c65lRxdsURNE7GJkf4hPPB9/9Cgq0GJFRpGvTpfajeJA1
 MbbsTBgSJK2OaNIEHHseiuXlksLMhLCUpCtk8efail104nbPJYyIxjW85JOQo+BZ
 E1B2O/J+m/pUlEpcsAqcswd3giu941S8lyLfk0N7vJFe9jF+C/zEvmkNhHo7wHF/
 wZpd+zeOkp1KdC2wX8b4HywuXpRqT3IhAhyHJufU7tLb+LSwT8K3XoV7Hm8xJeJx
 lX9ZsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4rdc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed83a05863so21754971cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216085; x=1768820885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=GsbszmNMkauvU6hIs6Yu+J0YXd6CjfsXbPBdXoC9IEyT220SC7THRPRSmhYuOzidD3
 m9lSA/EY8MBpAkERjlGpUJnDIFXylwS9rq63Qfob34wpR3OJGQXuKBdwVhMWA/KfjjMK
 Z1AU1Vp/VgOdSwfejawRdMqyw/Oq7KjHUAReqRS8w64lM/KH0uLO34t0A7isliH2ja6m
 vRE6KqK6VkZ7AYWQPxYJjnbfVyM8irTurlffg1Y2Ps5QKnyZui4TxCugtrtclBFzbWKJ
 +zfeg6bQl9kCzw3ITCGAesxFCBf9RHu4d5mKWtmX39uFbJ//veYC23oDaem6BgY9DnaC
 KE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216085; x=1768820885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=DHoZdUrp/FJksLlP2UD327PKE9k9CNa71mFGVPXGhwZFngnsU6ayUP+6nhifHuSRnB
 7583STqFTxPQDk8dwifcG9JhGWItiW2Etd8faTAsBZZwrXe4MfxJvIRNA2qwmiVv5LvY
 LHddXm3S0vE/438cpIP7buqM76cuMcCZ/MSOuuNkcZW5FH1lhEqZO+6c7GqO5txLrcZ8
 4FvKT7ypj8eVZ4cbmCeTH1JEjSbXN7BitBy2sw1AFkrX0JaL7I1+nr1q7oFuK5a1fnsb
 LZ4EdFTaGfEG9r99LKN9+4VtV2QBytTtnmN+Jn7Tz0F5PulMd76vbWXc1oAc9EZK5V2K
 ebFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVBEhQAlx7zK2VCdlj/MFjxbLdLv45fM+gEr2NNzjzmBaWG7+e7/6KxPIJYvTweONsUmVf/Tf1d4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4aZ+ba453fOBjxjEIUF2OJNObeL3P/eH0IhYAg23vSM7Lgqe7
 x7I0iaJwykz6X7gKMhtFoPBYjLWOzxPmq+EQXabumKGY2RXuU+atLqMIiAsWKg5Qi5SGHV6K+3M
 oymmjmAMuQd2ZQMImxyVPjxxqOuD/fyTRiptAME/pjOwjpAcMxAcXBYYGuXby4O/Rn8qaBPd/cz
 AIsGs=
X-Gm-Gg: AY/fxX4vW4OaGY5Jzzvv0j/borKMASY0eb489qn+U2RyHh6jSFD1Pz8KwCaeqYcEioA
 et+PCRY0SwyuDlZ8xFTRsmP8UCeNy15cHPZ2aehcKioW2wrCr5FUz/RYYAqvQUg+aa0HQPg3OLH
 FjFCYJkFQJaE0LHB1KOogKnBtyUzOn3nbbs+Mv7vOC9w1tgjS2ZbLid78wIElIUin+ovAO5h+M9
 h4TGCZxmkfG7sOoQbmY2HE3+vGlvR3CK/6KNn9cAZ0pZMrgL5OB4k4W+zOH4WMcMA05b3Hl8+OC
 jqOrjgDOE/6Czsz2jaGKaXNHyWw4zYzcpHrOOmEKmZxDJVx+iUeyIUz0AWLNEtRJqm/JJJLWm/A
 eiX1MZjqRFr3rtOCAATOUJcQoFIgSmuRq/qC7QmnV241pdLxPhQHtmvAJARCEcYMrqTw=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr183969431cf.11.1768216084926; 
 Mon, 12 Jan 2026 03:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMgyGfFYE6XaMmeLltZggmuQ6DITKn6VVK29vyczbb9806g1/vlY8V0ofwUK5H2Z36AvK6RQ==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr183969101cf.11.1768216084412; 
 Mon, 12 Jan 2026 03:08:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87124e1a1esm374226066b.48.2026.01.12.03.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:08:03 -0800 (PST)
Message-ID: <0630acb2-f18b-43de-81d5-4260b1add934@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
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
 <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kmFURgoKENe3kyluqRcgJTNO8HQb9L5N
X-Proofpoint-ORIG-GUID: kmFURgoKENe3kyluqRcgJTNO8HQb9L5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX99y0NbMqZAp2
 tOPUvtV6UaN3qBETL0YGrhRu2FhnHEybuv0PBN1krYWSpsg9qlJf5oPTMjPUxwXBGkz8HcJkZw6
 7A1ltr20Bfk3XAHjn8zn5XzaJp2AW2LYyfzb5996zKWX206YMDW9yFJKkGYMboJqs1LLxbKPGBt
 bnGA2UXlKLUCmoalU6IjWOVumYgxEvKi2uUkJvvlDdDlDuhoOj0mbbyE6DSxETHWX3S3RjzfeHT
 AwydXc7+5KhklGBUwYpfy0Fm/1oYFjwEG1NQmWfeHdv5vlN1A/RcSpsZltt6PzelF2OFf4qo4WI
 eF9HXs4bOHuV2yYQox4yynM/fP5FXU+gl57yt/p9ZoMtaO3k7GxovrnT4Zk/BR2Fo8VnftjDmal
 B+V5vnQA4HQFCn2/AhCk24Nsq/ip+1mw5CHBTRD90J9HhX2+dBYppQx+GbCH3D07qtLip+WlZ2R
 9capjNNMyL9dLzoc3zg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964d615 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088
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

