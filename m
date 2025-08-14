Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE3B260BC
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD810E078;
	Thu, 14 Aug 2025 09:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/UceC3B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F8710E078
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMoIZV027025
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cik/yynWNoCTrOCfvMEnMDYo2lqNO1rXkT0A2/bPuyc=; b=O/UceC3BqWpcIlyK
 Ml6jA34oMfkUkMHW1XTBrXLlFzP+ouX+jhGB7RduO0zDnIQlNhstNvOW6dTA9aFu
 WIuSfdmseuhnccOxi/JKsUNEf2U1N3CPhyEE2mrB9B/40KYcqbbTM/FVKWF4Y7/4
 enQ26G3D5Mh7YIRPNGL5/gTRB41q0mnDyKTJLF/m9s5JFoxRp3wL6LW9po/ie3ly
 TPsM+j3LkTSDCfxjrR+AEbnsQnikFSoonfFPRBAmf0kRS/Yh+3+S9+KX4BvfHt4c
 Um2jr60DBvFh/S6Zp8OijisKQ2pVZylZPB7iO+VAknTNpF0xxh6I2cboojSwfMsy
 pPAKXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gf25m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109be4724so2919311cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163470; x=1755768270;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cik/yynWNoCTrOCfvMEnMDYo2lqNO1rXkT0A2/bPuyc=;
 b=w0/yCpp9RzKJKH5tGYblyr5Mx1R3kNOJrn2xG5KbGbmPBEP/4qoKjZLDzDmo/xjdWu
 noCWKzRBLdY6DE4kvhCfYH3co6IJMab1KNK0aTO1s5HNaP0JPCcD1pffgQVRzVl8uaLx
 xO327A9/8RtMyn6QZbsgOd70fvksOcebFOLc/xoysu8t9Wqp0A86Tp1B/gAx0uM+pxRX
 TX2FqvYLDm3qREBp0Zzg4qOhKJKqaUgvM0M9AYeBlfilN4jxYRj340+fVybPUNFESOtb
 o1Tw4Y7rFGg5eY8pTRsy/nGQKZYmMwfspPMY5qNmfBOHQH6eBYgRSlF3E/48/4kFZAFt
 bZWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzRznOsbuWnP558Pz1yEAiMgLeupp7xvG9lN05Wl4jFGHsoaluDcvIfhndTKjIRdlFoyr14QEK94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIni+SsiEczKguZMvO0ijOOBqXDKz4SU0rWEOk/WhfHxbNobt9
 ALH/8VxKJaLpJVXwlng1V78rVb0vJN1FNS8yNFU6IJ/rDZk1Ro2AtHz8m9HeyiDziQEd7DpbSzX
 0uwciMQq6GfbW4XCZLJKrjX68TcOqZa+slBqnybOqFkyiipiVQbf5E8croOjfZamXbtTb9cM=
X-Gm-Gg: ASbGncvMZdXK5Nk2dXAf3t0GI/isMr1iFKFHk3s/2yClkoKftvOVKQgMr1Je6l7la9W
 60G8cH5W9xOQ9iR60p+7Di8uUG8zs1N+ZHYRltARwzHkRYBpV7QnNrSMFurpNd/31F+gt38/FdM
 TYilVv0gQU00zfFAtjuVeCenJVuBbcyzjzRxplt66yLrQSBjDvpz4KcF0Xp2Dlw+gEZWEP0WPaa
 EQNQ6kSTDIljfrMPV+oopsdPnTuJawKOOL4SmyQO2FpLyMnGthj0gWDMxFHo7PjvBcYpqkPhJHy
 cC9wjIiCuetoQ3V1iXBC/yis3O64NLQm2PuXKBfhUjGvnMi5/NxP9lZEr9HWX0Xmqrag36v7FVJ
 VXeud7xARfZEu5x7Umg==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id
 d75a77b69052e-4b0fc6cbd31mr38631711cf.4.1755163470586; 
 Thu, 14 Aug 2025 02:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNu4E16imK1oApBn97vhiibZw4d0qerBevQJrwiUss6ZWux0iiLHaeAGCcSK7HzskKOZmvLw==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id
 d75a77b69052e-4b0fc6cbd31mr38631581cf.4.1755163470184; 
 Thu, 14 Aug 2025 02:24:30 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm2544145066b.50.2025.08.14.02.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 02:24:29 -0700 (PDT)
Message-ID: <aecbe59b-6ae6-47da-bcc4-9a49cbdce591@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: ubwc: add more missing platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-2-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-2-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689dab50 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=B_kxR4TvTiZrqIWArvYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX/3K3SI9gaCkL
 R0nLQ1zX9hKodf9co51qHOdEcF5a96nPHsM/ftN5hkeEIkixi7QcuNbimYPqlPJcoaWo729IR98
 Iz5NkQHsoe8b6SCug7K6/Es/o6PGTndigrWakDBntuFrP/ER9GDM4DlblIcmNZr33uxIX3hIoID
 rnLxLQDw3ZcHssTakrUKa9h20b0lMd+LSQhQBztzjRlDth+pICkvdiZqGw3HD5FstCgW5OI2EyC
 JetiQq/DnX8XHJvvZ86qCWxIiDuHYpRJhfBTVWudn4erxnFImic1yH5PjIzrwtQYI/NBDcToeHn
 PKuHI9b3Ri85zErhIpuvbf/hyANAso5EW9drAfIgG95bOPXpfsvR6SvYkI+DBAXRs1I1TyocJT6
 2TvWAa1+
X-Proofpoint-GUID: o-xQEAoWrdk4krn7mcMeHchOH1Z8gl-8
X-Proofpoint-ORIG-GUID: o-xQEAoWrdk4krn7mcMeHchOH1Z8gl-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> Add UBWC configuration for SDA660 (modem-less variant of SDM660), SDM450
> (similar to MSM8953), SDM632 (similar to MSM8953) and SM7325 (similar to
> SC7280).
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

