Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F1D235EA
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76B110E70B;
	Thu, 15 Jan 2026 09:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSD0p/DI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOU3LWEz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8373F10E70D
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g4Ul1692806
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=; b=hSD0p/DIxfwxKHqq
 bX+EkklFL2pfEuZy5Yt7CIJLgqLv1+36Pmrau/LDtFSHDY5bil6swOF3rg4BAsK/
 IU6sAIaoHILDTZUaVFagwNxyPTZR1CJxn2kMAbIFRmhz/zC3Zol+MjXs4BukZI9q
 yV1vzrcxvH1FjKutF8wXYD3iCL2fDogyLwLJz4fWeQpPCLOqGgN35K6TCyNUbp5R
 eZJswStvVcMewZfgoSAxjzajqolT+R4PpyLgMo45W9HZaxPQF6bgdaJW4HbfGXw2
 xYOQu8dUcQBsXxqvQIBsy62Gigvyk+uUXv22Bwiy/8cKeM9B1eVJWM90Li01Q1KE
 tmOZqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931m1hh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a182d4e1so8462885a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768468369; x=1769073169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
 b=DOU3LWEzLai6XADO7+0JxA4stvMt3MZwlCVyy0swU0MJnPsOYoZ7JvUtqYUx2kQ7GJ
 TUIlCBA39honSwl1xKFuujSUbCa+MwYcNkACaCFBZ1WmrK6vznRA4kgGwLL3awlbeFdA
 3Ff1lMjFXp5jWUCx/4p8CNdB0rDXpjn69rZI52mx2khh8If/T0MFaTKHhPLMuDZa35Pp
 naHJT3YogXVLcIibrU/TOg4b5wChiYhm+OR0vcCDdlWA/pHBlyIzZJTWt9Q4xHX2QtGu
 0sBUjlkVlzQ8zDjwuNUY/9vNmoKXCcf1zOk99hjUXt7/1ALckHqYQYq167u3d6Lef+dO
 6UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468369; x=1769073169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
 b=S06BZvfYO1ob68A4sDXAv5A/GwzgZUmg5O0l6FIzCo5FCBy4IonqREe3MS8TUi77OQ
 xx541bKTziF+7UVdAwYy2puL6aWm4QAX4QZCNDjlYL6vD8wdUGg5C42vXfDZhfphz3qd
 wV4rN3Cf0uf0/XyvqxmhSaqSz0qJeD3ZJ6zwQXUctb+5Y9VFvi1OuctXjuGODr0Pbp7W
 X+yCbB3p56M4bDvSP6WQLJuYXQHcoe+U3EqVTQOrnJP2S/kND8X+lF3r6SjtU9Bdqy7W
 6RnkJEx/CR2ituV27M1dV7yNKaoYf5jY13Uoej/GzDDdoVwsHN3VPSuu6UfDjDzDhcDH
 pi3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRdoT5AJ2ysVIDAPBAWgC+Rw5rtNz/oq4CNePPzIVnQnt5vNzCbqJB0qcTIPVMJ+lQg8vEcMBdepQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVDQIR5bx//dOAl5W3SVTKHhelYLGA5v0fPvRgOUdA/MF+2Zce
 uPHmCEpTa1YaSdLmHRqzE2s89vcjAV6WZ5p6dUHOJ9UGKLmZLuGJT2P49Od7j9NgSrkLcMmQD+N
 Rp3Wgj/0F7Miv+Z+VjxpN5ciGFMT7IvWUtwbH68ulQFfEDoo4WGq5aY/YUYTXZ3l+lrBYGxQ=
X-Gm-Gg: AY/fxX4nYHGOxTBv/cA+EUuNB8+ITzBKDJ0n6tSXfN5fqRYYM5e2x9WKTYweWakrgc0
 l5LLYsF8u74AVzyxfKxA+itGuxaaoinZDpsaCcbncceGEl87vGzhLRJV6e7+/S2Xdz95BNpBAfu
 mv38x45oqOJGbi65p3O706xurmq01R27ZUTHNesD+G+XNcwB0ieJr6sWQMTeeGF67fw9I3YuDlO
 LgmNhy53lUV+0GA/B3p9Ae6c+/Hd1mgnQg2iFV95Pe6lR1GJOLEQAq67kDj3E4H42N0F4Z/vBCH
 3csRydCyQPFGWuMyDJnp/gegscdQtsdY6rl1rcn34yJ40pLq4c9mVH/sTkDpU331vFdiu4vKIul
 5evETIOha1wWcPQr0SuAJleGe30yBNIcEIU9vtndV6ZJji+HDWF/YKfn9k1LKT6fSXDg=
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id
 af79cd13be357-8c52fb74bd4mr593193085a.5.1768468369088; 
 Thu, 15 Jan 2026 01:12:49 -0800 (PST)
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id
 af79cd13be357-8c52fb74bd4mr593190885a.5.1768468368433; 
 Thu, 15 Jan 2026 01:12:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65411877707sm1893534a12.1.2026.01.15.01.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:12:47 -0800 (PST)
Message-ID: <c2d8ef54-069b-48cc-b6d2-642b357eaf5c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6968af92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 30DA21DwmNctVnBCFQ8j6pENLWDuc_QG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfXwXZn5FFaS8vi
 Vqx++EjNcQzMYwnRW17g3qHPk9uhCy34GIrXnQC6Q+oqpic2Y/nBTqH7G0Cne7R2eOeNChELMKu
 HJGRI90M6B3Z3wJcG1DTvcpTVu8ql9jX1ZgKokIKA0i2ge7fPoWoX44duvAyXUR3FeCp6/8mfs5
 gCtp5JkTnttN/ZSsFXUVToKV+eK3yDN2AgRzilZLUc2ozbo4wMK0ruhOtNLIHxV3TpsNnpfSAGH
 +13YYc1EwMwCzEkB53Kg1Ter3h9zAX7FyouqCEXpSlESx85nXUQdZmHl24Z8ughIOeSk4j1EuYz
 Gz8amOoTaC55iYneklqua0UgbmnKu4KPkRvgkjyS9AH49183GWLdwwWQDBw1GdhPOkFJxRtWrvI
 QrZw0iOcN8G6ysIf/0jjmNZqIdwlovsq2HORwB2oF14av+tIqhtfD7/5jZyU1gptYjN9N1j+t6B
 jq2GrhNjQED9aj6W9dQ==
X-Proofpoint-GUID: 30DA21DwmNctVnBCFQ8j6pENLWDuc_QG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150064
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

